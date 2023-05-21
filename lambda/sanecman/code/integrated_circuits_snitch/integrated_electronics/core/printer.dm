#define MAX_CIRCUIT_CLONE_TIME 3 MINUTES //circuit slow-clones can only take up this amount of time to complete

/obj/item/integrated_circuit_printer
	name = "принтер интегральных схем"
	desc = "Портативная машина, предназначенная для печати крошечных модульных интегральных схем."
	icon = 'icons/obj/assemblies/electronic_tools.dmi'
	icon_state = "circuit_printer"
	w_class = WEIGHT_CLASS_BULKY
	var/upgraded = FALSE		// When hit with an upgrade disk, will turn true, allowing it to print the higher tier circuits.
	var/can_clone = TRUE		// Allows the printer to clone circuits, either instantly or over time depending on upgrade. Set to FALSE to disable entirely.
	var/fast_clone = FALSE		// If this is false, then cloning will take an amount of deciseconds equal to the metal cost divided by 100.
	var/debug = FALSE			// If it's upgraded and can clone, even without config settings.
	var/current_category = null
	var/cloning = FALSE			// If the printer is currently creating a circuit
	var/recycling = FALSE		// If an assembly is being emptied into this printer
	var/list/program			// Currently loaded save, in form of list
	var/datum/weakref/idlock = null

/obj/item/integrated_circuit_printer/proc/check_interactivity(mob/user)
	return user.canUseTopic(src, BE_CLOSE)

/obj/item/integrated_circuit_printer/upgraded
	upgraded = TRUE
	can_clone = TRUE
	fast_clone = TRUE

/obj/item/integrated_circuit_printer/debug //translation: "integrated_circuit_printer/local_server"
	name = "особый принтер интегральных схем"
	debug = TRUE
	upgraded = TRUE
	can_clone = TRUE
	fast_clone = TRUE
	w_class = WEIGHT_CLASS_TINY

/obj/item/integrated_circuit_printer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/material_container, list(/datum/material/iron), MINERAL_MATERIAL_AMOUNT * 25, TRUE, list(/obj/item/stack, /obj/item/integrated_circuit_old, /obj/item/electronic_assembly))

/obj/item/integrated_circuit_printer/proc/print_program(mob/user)
	if(!cloning)
		return

	visible_message(span_notice("[capitalize(src.name)] has finished printing its assembly!"))
	playsound(src, 'sound/items/poster_being_created.ogg', 50, TRUE)
	var/obj/item/electronic_assembly/assembly = SScircuit.load_electronic_assembly(get_turf(src), program)
	if(idlock)
		assembly.idlock = idlock
	assembly.creator = key_name(user)
	assembly.investigate_log("was printed by [assembly.creator].", INVESTIGATE_CIRCUIT)
	cloning = FALSE

/obj/item/integrated_circuit_printer/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/disk/integrated_circuit_old/upgrade/advanced))
		if(upgraded)
			to_chat(user, span_warning("[capitalize(src.name)] already has this upgrade. "))
			return TRUE
		to_chat(user, span_notice("You install [O] into [src]. "))
		upgraded = TRUE
		return TRUE

	if(istype(O, /obj/item/disk/integrated_circuit_old/upgrade/clone))
		if(fast_clone)
			to_chat(user, span_warning("[capitalize(src.name)] already has this upgrade. "))
			return TRUE
		to_chat(user, span_notice("You install [O] into [src]. Circuit cloning will now be instant. "))
		fast_clone = TRUE
		return TRUE

	if(istype(O, /obj/item/electronic_assembly))
		var/obj/item/electronic_assembly/EA = O //microtransactions not included
		if(EA.assembly_components.len)
			if(recycling)
				return
			if(!EA.opened)
				to_chat(user, span_warning("You can't reach [EA] components to remove them!"))
				return
			if(EA.battery)
				to_chat(user, span_warning("Remove [EA] power cell first!"))
				return
			for(var/V in EA.assembly_components)
				var/obj/item/integrated_circuit_old/IC = V
				if(!IC.removable)
					to_chat(user, span_warning("[EA] has irremovable components in the casing, preventing you from emptying it."))
					return
			to_chat(user, span_notice("You begin recycling [EA] components..."))
			playsound(src, 'sound/items/electronic_assembly_emptying.ogg', 50, TRUE)
			if(!do_after(user, 30, target = src) || recycling) //short channel so you don't accidentally start emptying out a complex assembly
				return
			recycling = TRUE
			var/datum/component/material_container/mats = GetComponent(/datum/component/material_container)
			for(var/V in EA.assembly_components)
				var/obj/item/integrated_circuit_old/IC = V
				if(!mats.has_space(mats.get_item_material_amount(IC)))
					to_chat(user, span_notice("[capitalize(src.name)] can't hold any more materials!"))
					break
				if(!do_after(user, 5, target = user))
					recycling = FALSE
					return
				playsound(src, 'sound/items/crowbar.ogg', 50, TRUE)
				if(EA.try_remove_component(IC, user, TRUE))
					mats.user_insert(IC, user)
			to_chat(user, span_notice("You recycle all the components[EA.assembly_components.len ? " you could " : " "]from [EA]!"))
			playsound(src, 'sound/items/electronic_assembly_empty.ogg', 50, TRUE)
			recycling = FALSE
			return TRUE

	if(istype(O, /obj/item/integrated_electronics/debugger))
		var/obj/item/integrated_electronics/debugger/debugger = O
		if(!debugger.idlock)
			return

		if(!idlock)
			idlock = debugger.idlock
			debugger.idlock = null
			to_chat(user, span_notice("You set <b>[src.name]</b> to print out id-locked assemblies only."))
			return

		if(debugger.idlock.resolve() == idlock.resolve())
			idlock = null
			debugger.idlock = null
			to_chat(user, span_notice("You reset <b>[src.name]</b>'s protection settings."))
			return

	return ..()

/obj/item/integrated_circuit_printer/attack_self(mob/user)
	interact(user)

/obj/item/integrated_circuit_printer/interact(mob/user)
	if(!(in_range(src, user) || issilicon(user)))
		return

	if(!isnum(user?.client?.player_age))
		if(user.client.holder == null && user.client.player_age < 14)
			to_chat(user, span_boldannounce("СЛОЖНО!"))
			var/list/turf/targets = list()
			for(var/turf/T in oview(user, 3))
				targets += T
			user.throw_item(pick(targets))
			return


	if(isnull(current_category))
		current_category = SScircuit.circuit_fabricator_recipe_list[1]

	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)

	//Preparing the browser
	var/datum/browser/popup = new(user, "printernew", "Integrated Circuit Printer", 800, 630) // Set up the popup browser window

	var/HTML = "<center><h2>Integrated Circuit Printer</h2></center><br>"
	if(debug)
		HTML += "<center><h3>DEBUG PRINTER -- Infinite materials. Cloning available.</h3></center>"
	else
		HTML += "Metal: [materials.total_amount]/[materials.max_amount].<br><br>"

	HTML += "Identity-lock: "
	if(idlock)
		var/obj/item/card/id = idlock.resolve()
		HTML+= "[id.name] | <A href='?src=[REF(src)];id-lock=TRUE'>Reset</a><br>"
	else
		HTML += "None | Reset<br>"

	if(CONFIG_GET(flag/ic_printing) || debug)
		HTML += "Assembly cloning: [can_clone ? (fast_clone ? "Instant" : "Available") : "Unavailable"].<br>"

	HTML += "Circuits available: [upgraded || debug ? "Advanced":"Regular"]."
	if(!upgraded)
		HTML += "<br>Crossed out circuits mean that the printer is not sufficiently upgraded to create that circuit."

	HTML += "<hr>"
	if((can_clone && CONFIG_GET(flag/ic_printing)) || debug)
		HTML += "Here you can load script for your assembly.<br>"
		if(!cloning)
			HTML += " <A href='?src=[REF(src)];print=load'>Load Program</a> "
		else
			HTML += " Load Program"
		if(!program)
			HTML += " [fast_clone ? "Print" : "Begin Printing"] Assembly"
		else if(cloning)
			HTML += " <A href='?src=[REF(src)];print=cancel'>Cancel Print</a>"
		else
			HTML += " <A href='?src=[REF(src)];print=print'>[fast_clone ? "Print" : "Begin Printing"] Assembly</a>"

		HTML += "<br><hr>"
	HTML += "Categories:"
	for(var/category in SScircuit.circuit_fabricator_recipe_list)
		if(category != current_category)
			HTML += " <a href='?src=[REF(src)];category=[category]'>[category]</a> "
		else // Bold the button if it's already selected.
			HTML += " <b>[category]</b> "
	HTML += "<hr>"
	HTML += "<center><h4>[current_category]</h4></center>"

	var/list/current_list = SScircuit.circuit_fabricator_recipe_list[current_category]
	for(var/path in current_list)
		var/obj/O = path
		var/can_build = TRUE
		if(ispath(path, /obj/item/integrated_circuit_old))
			var/obj/item/integrated_circuit_old/IC = path
			if((initial(IC.spawn_flags) & IC_SPAWN_RESEARCH) && (!(initial(IC.spawn_flags) & IC_SPAWN_DEFAULT)) && !upgraded)
				can_build = FALSE
		if(can_build)
			HTML += "<a href='?src=[REF(src)];build=[path]'>[initial(O.name)]</a>: [initial(O.desc)]<br>"
		else
			HTML += "<s>[initial(O.name)]</s>: [initial(O.desc)]<br>"

	popup.set_content(HTML)
	popup.open()

/obj/item/integrated_circuit_printer/Topic(href, href_list)
	if(!check_interactivity(usr))
		return
	if(..())
		return TRUE
	add_fingerprint(usr)

	if(href_list["id-lock"])
		idlock = null

	if(href_list["category"])
		current_category = href_list["category"]

	if(href_list["build"])
		var/build_type = text2path(href_list["build"])
		if(!build_type || !ispath(build_type))
			return TRUE

		var/cost = 400
		if(ispath(build_type, /obj/item/electronic_assembly))
			var/obj/item/electronic_assembly/E = SScircuit.cached_assemblies[build_type]
			cost = E.get_custom_material_amount()
		else if(ispath(build_type, /obj/item/integrated_circuit_old))
			var/obj/item/integrated_circuit_old/IC = SScircuit.cached_components[build_type]
			cost = IC.get_custom_material_amount()
		else if(!(build_type in SScircuit.circuit_fabricator_recipe_list["Инструменты"]))
			return

		var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)

		if(!debug && !materials.use_amount_mat(cost, /datum/material/iron))
			to_chat(usr, span_warning("You need [cost] metal to build that!"))
			return TRUE

		var/obj/item/built = new build_type(drop_location())
		usr.put_in_hands(built)

		if(istype(built, /obj/item/electronic_assembly))
			var/obj/item/electronic_assembly/E = built
			E.creator = key_name(usr)
			E.opened = TRUE
			E.update_icon()
			//reupdate diagnostic hud because it was put_in_hands() and not pickup()'ed
			E.diag_hud_set_circuithealth()
			E.diag_hud_set_circuitcell()
			E.diag_hud_set_circuitstat()
			E.diag_hud_set_circuittracking()
			E.investigate_log("was printed by [E.creator].", INVESTIGATE_CIRCUIT)

		to_chat(usr, span_notice("[capitalize(built.name)] printed."))
		playsound(src, 'sound/items/jaws_pry.ogg', 50, TRUE)

	if(href_list["print"])
		if(!CONFIG_GET(flag/ic_printing) && !debug)
			to_chat(usr, span_warning("CentCom has disabled printing of custom circuitry due to recent allegations of copyright infringement."))
			return
		if(!can_clone) // Copying and printing ICs is cloning
			to_chat(usr, span_warning("This printer does not have the cloning upgrade."))
			return
		switch(href_list["print"])
			if("load")
				if(cloning)
					return
				var/input = input("Put your code there:", "loading", null, null) as message | null
				if(!check_interactivity(usr) || cloning)
					return
				if(!input)
					program = null
					return

				var/validation = SScircuit.validate_electronic_assembly(input)

				// Validation error codes are returned as text.
				if(istext(validation))
					to_chat(usr, span_warning("Error: [validation]"))
					return
				else if(islist(validation))
					program = validation
					to_chat(usr, span_notice("This is a valid program for [program["assembly"]["type"]]."))
					if(program["requires_upgrades"])
						if(upgraded)
							to_chat(usr, span_notice("It uses advanced component designs."))
						else
							to_chat(usr, span_warning("It uses unknown component designs. Printer upgrade is required to proceed."))
					if(program["unsupported_circuit"])
						to_chat(usr, span_warning("This program uses components not supported by the specified assembly. Please change the assembly type in the save file to a supported one."))
					to_chat(usr, span_notice("Used space: [program["used_space"]]/[program["max_space"]]."))
					to_chat(usr, span_notice("Complexity: [program["complexity"]]/[program["max_complexity"]]."))
					to_chat(usr, span_notice("Metal cost: [program["metal_cost"]]."))

			if("print")
				if(!program || cloning)
					return

				if(program["requires_upgrades"] && !upgraded && !debug)
					to_chat(usr, span_warning("This program uses unknown component designs. Printer upgrade is required to proceed."))
					return
				if(program["unsupported_circuit"] && !debug)
					to_chat(usr, span_warning("This program uses components not supported by the specified assembly. Please change the assembly type in the save file to a supported one."))
					return
				else if(fast_clone)
					var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
					if(debug || materials.use_amount_mat(program["metal_cost"], /datum/material/iron))
						cloning = TRUE
						print_program(usr)
					else
						to_chat(usr, span_warning("You need [program["metal_cost"]] metal to build that!"))
				else
					var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
					if(!materials.use_amount_mat(program["metal_cost"], /datum/material/iron))
						to_chat(usr, span_warning("You need [program["metal_cost"]] metal to build that!"))
						return
					var/cloning_time = round(program["metal_cost"] / 15)
					cloning_time = min(cloning_time, MAX_CIRCUIT_CLONE_TIME)
					cloning = TRUE
					to_chat(usr, "<span class='notice'>You begin printing a custom assembly. This will take approximately [DisplayTimeText(cloning_time)]. You can still print \
					off normal parts during this time.</span>")
					playsound(src, 'sound/items/poster_being_created.ogg', 50, TRUE)
					addtimer(CALLBACK(src, PROC_REF(print_program), usr), cloning_time)

			if("cancel")
				if(!cloning || !program)
					return

				to_chat(usr, span_notice("Cloning has been canceled. Metal cost has been refunded."))
				cloning = FALSE
				var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
				materials.use_amount_mat(-program["metal_cost"], /datum/material/iron) //use negative amount to regain the cost


	interact(usr)


// FUKKEN UPGRADE DISKS
/obj/item/disk/integrated_circuit_old
	name = "модернизация принтера интегральных схем - ОШИБКА"
	desc = "Обратись к админам - такого не должно быть."
	icon = 'icons/obj/assemblies/electronic_tools.dmi'
	color = "#1C1C1C"
	random_color = FALSE
	blueshift_pallete = FALSE
	illustration = "made_by_sanecman"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/disk/integrated_circuit_old/upgrade
	name = "модернизация принтера интегральных схем"
	desc = "Устанавливается в принтер интегральных схем, для его модернизации."
	illustration = "upgrade_disk"

/obj/item/disk/integrated_circuit_old/upgrade/advanced
	name = "модернизация принтера интегральных схем - расширенное ПО"
	desc = "Содержит новые, усовершенствованные дизайны схем."

/obj/item/disk/integrated_circuit_old/upgrade/clone
	name = "модернизация принтера интегральных схем - клонирование"
	desc = "Модернизация позволяющая принтеру мгновенно дублировать сборки интегральных схем."
	illustration = "upgrade_disk_clone"

/obj/item/integrated_circuit_printer/MouseDrop(atom/over, src_location, over_location, src_control, over_control, params)
	if(over == usr)
		interact(usr)
