/obj/machinery/mecha_part_fabricator
	icon = 'icons/obj/robotics.dmi'
	icon_state = "fab-idle"
	name = "exosuit fabricator"
	desc = "Nothing is being built."
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 20
	active_power_usage = 5000
	req_access = list(ACCESS_ROBOTICS)
	circuit = /obj/item/circuitboard/machine/mechfab
	var/time_coeff = 1
	var/component_coeff = 1
	var/datum/techweb/specialized/autounlocking/exofab/stored_research
	var/sync = 0
	var/part_set
	var/datum/design/being_built
	var/list/queue = list()
	var/list/datum/design/matching_designs
	var/processing_queue = 0
	var/screen = "main"
	var/link_on_init = TRUE
	var/temp
	var/datum/component/remote_materials/rmat
	var/list/part_sets = list(
								"Cyborg",
								"Ripley",
								"Firefighter",
								"Odysseus",
								"Gygax",
								"Durand",
								"H.O.N.K",
								"Phazon",
								"Exosuit Equipment",
								"Exosuit Ammunition",
								"Cyborg Upgrade Modules",
								"MODsuit Chassis",
								"MODsuit Modules",
								"IPC components",
								"Misc"
								)

/obj/machinery/mecha_part_fabricator/Initialize(mapload)
	stored_research = new
	matching_designs = list()
	rmat = AddComponent(/datum/component/remote_materials, "mechfab", mapload && link_on_init)
	RefreshParts() //Recalculating local material sizes if the fab isn't linked
	return ..()

/obj/machinery/mecha_part_fabricator/RefreshParts()
	var/T = 0

	//maximum stocking amount (default 300000, 600000 at T4)
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		T += M.rating
	rmat.set_local_size((200000 + (T*50000)))

	//resources adjustment coefficient (1 -> 0.85 -> 0.7 -> 0.55)
	T = 1.15
	for(var/obj/item/stock_parts/micro_laser/Ma in component_parts)
		T -= Ma.rating*0.15
	component_coeff = T

	//building time adjustment coefficient (1 -> 0.8 -> 0.6)
	T = -1
	for(var/obj/item/stock_parts/manipulator/Ml in component_parts)
		T += Ml.rating
	time_coeff = round(initial(time_coeff) - (initial(time_coeff)*(T))/5,0.01)

/obj/machinery/mecha_part_fabricator/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += "<span class='notice'>The status display reads: Storing up to <b>[rmat.local_size]</b> material units.<br>Material consumption at <b>[component_coeff*100]%</b>.<br>Build time reduced by <b>[100-time_coeff*100]%</b>.</span>"

/obj/machinery/mecha_part_fabricator/emag_act()
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	req_access = list()
	say("DB error \[Code 0x00F1\]")
	sleep(10)
	say("Attempting auto-repair...")
	sleep(15)
	say("User DB corrupted \[Code 0x00FA\]. Truncating data structure...")
	sleep(30)
	say("User DB truncated. Please contact your Nanotrasen system operator for future assistance.")

/obj/machinery/mecha_part_fabricator/proc/output_parts_list(set_name)
	var/output = ""
	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		if(D.build_type & MECHFAB)
			if(!(set_name in D.category))
				continue
			output += "<div class='part'>[output_part_info(D)]<br>"
			if(check_resources(D))
				output += "<a href='?src=[REF(src)];part=[D.id]'>Build</a> | "
			output += "<a href='?src=[REF(src)];add_to_queue=[D.id]'>Add to queue</a><a href='?src=[REF(src)];part_desc=[D.id]'>?</a></div>"
	return output

/obj/machinery/mecha_part_fabricator/proc/output_part_info(datum/design/D)
	var/output = "[initial(D.name)] (Cost: [output_part_cost(D)]) [get_construction_time_w_coeff(D)/10]sec"
	return output

/obj/machinery/mecha_part_fabricator/proc/output_part_cost(datum/design/D)
	var/i = 0
	var/output
	for(var/c in D.materials)
		var/datum/material/M = c
		output += "[i?" | ":null][get_resource_cost_w_coeff(D, M)] [M.name]"
		i++
	return output

/obj/machinery/mecha_part_fabricator/proc/output_ui_header()
	var/output
	output += "<div class='statusDisplay'><b>Mecha Fabricator</b><br>"
	output += "Security protocols: [(obj_flags & EMAGGED)? "<font color='red'>Disabled</font>" : "<font color='green'>Enabled</font>"]<br>"
	if (rmat.mat_container)
		output += "<a href='?src=[REF(src)];screen=resources'><B>Material Amount:</B> [rmat.format_amount()]</A>"
	else
		output += "<font color='red'>No material storage connected, please contact the quartermaster.</font>"
	output += "<br><a href='?src=[REF(src)];sync=1'>Sync with R&D servers</a><br>"
	output += "<a href='?src=[REF(src)];screen=main'>Main Screen</a>"
	output += "</div>"
	output += "<form name='search' action='?src=[REF(src)]'>\
	<input type='hidden' name='src' value='[REF(src)]'>\
	<input type='hidden' name='search' value='to_search'>\
	<input type='text' name='to_search'>\
	<input type='submit' value='Search'>\
	</form><HR>"
	return output

/obj/machinery/mecha_part_fabricator/proc/get_resources_w_coeff(datum/design/D)
	var/list/resources = list()
	for(var/R in D.materials)
		var/datum/material/M = R
		resources[M] = get_resource_cost_w_coeff(D, M)
	return resources

/obj/machinery/mecha_part_fabricator/proc/check_resources(datum/design/D)
	if(D.reagents_list.len) // No reagents storage - no reagent designs.
		return FALSE
	var/datum/component/material_container/materials = rmat.mat_container
	if(materials.has_materials(get_resources_w_coeff(D)))
		return TRUE
	return FALSE

/obj/machinery/mecha_part_fabricator/proc/output_ui_materials()
	var/output
	output += "<div class='statusDisplay'><h3>Material Storage:</h3>"
	for(var/mat_id in rmat.mat_container.materials)
		var/datum/material/M = mat_id
		var/amount = rmat.mat_container.materials[mat_id]
		var/ref = REF(M)
		output += "* [amount] of [M.name]: "
		if(amount >= MINERAL_MATERIAL_AMOUNT) output += "<A href='?src=[REF(src)];remove_mat=1;material=[ref]'>Eject</A>"
		if(amount >= MINERAL_MATERIAL_AMOUNT*5) output += "<A href='?src=[REF(src)];remove_mat=5;material=[ref]'>5x</A>"
		if(amount >= MINERAL_MATERIAL_AMOUNT) output += "<A href='?src=[REF(src)];remove_mat=50;material=[ref]'>All</A>"
		output += "<br>"
	output += "</div>"
	return output

/obj/machinery/mecha_part_fabricator/proc/search(string)
	matching_designs.Cut()
	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		if(!(D.build_type & MECHFAB))
			continue
		if(findtext(D.name,string))
			matching_designs.Add(D)

/obj/machinery/mecha_part_fabricator/proc/output_ui_search()
	var/output
	output += "<h2>Search Results:</h2>"
	for(var/datum/design/D in matching_designs)
		output += "<div class='part'>[output_part_info(D)]<br>"
		if(check_resources(D))
			output += "<a href='?src=[REF(src)];part=[D.id]'>Build</a> | "
		output += "<a href='?src=[REF(src)];add_to_queue=[D.id]'>Add to queue</a><a href='?src=[REF(src)];part_desc=[D.id]'>?</a></div>"
	return output

/obj/machinery/mecha_part_fabricator/proc/build_part(datum/design/D)
	var/list/res_coef = get_resources_w_coeff(D)

	var/datum/component/material_container/materials = rmat.mat_container
	if (!materials)
		say("No access to material storage, please contact the quartermaster.")
		return FALSE
	if (rmat.on_hold())
		say("Mineral access is on hold, please contact the quartermaster.")
		return FALSE
	if(!check_resources(D))
		say("Not enough resources. Queue processing stopped.")
		return FALSE
	being_built = D
	desc = "It's building \a [initial(D.name)]."
	materials.use_materials(res_coef)
	rmat.silo_log(src, "built", -1, "[D.name]", res_coef)

	add_overlay("fab-active")
	use_power = ACTIVE_POWER_USE
	updateUsrDialog()
	sleep(get_construction_time_w_coeff(D))
	use_power = IDLE_POWER_USE
	cut_overlay("fab-active")
	desc = initial(desc)

	var/location = get_step(src,(dir))
	var/obj/item/I = new D.build_path(location)
	I.material_flags |= MATERIAL_NO_EFFECTS //Find a better way to do this.
	I.set_custom_materials(res_coef)
	say("\The [I] is complete.")
	being_built = null

	updateUsrDialog()
	return TRUE

/obj/machinery/mecha_part_fabricator/proc/update_queue_on_page()
	send_byjax(usr,"mecha_fabricator.browser","queue",list_queue())
	return

/obj/machinery/mecha_part_fabricator/proc/add_part_set_to_queue(set_name)
	if(set_name in part_sets)
		for(var/v in stored_research.researched_designs)
			var/datum/design/D = SSresearch.techweb_design_by_id(v)
			if(D.build_type & MECHFAB)
				if(set_name in D.category)
					add_to_queue(D)

/obj/machinery/mecha_part_fabricator/proc/add_to_queue(D)
	if(!istype(queue))
		queue = list()
	if(D)
		queue[++queue.len] = D
	return queue.len

/obj/machinery/mecha_part_fabricator/proc/remove_from_queue(index)
	if(!isnum(index) || !ISINTEGER(index) || !istype(queue) || (index<1 || index>queue.len))
		return FALSE
	queue.Cut(index,++index)
	return TRUE

/obj/machinery/mecha_part_fabricator/proc/process_queue()
	var/datum/design/D = queue[1]
	if(!D)
		remove_from_queue(1)
		if(queue.len)
			return process_queue()
		else
			return
	temp = null
	while(D)
		if(machine_stat&(NOPOWER|BROKEN))
			return FALSE
		if(build_part(D))
			remove_from_queue(1)
		else
			return FALSE
		D = LAZYACCESS(queue, 1)
	say("Queue processing finished successfully.")

/obj/machinery/mecha_part_fabricator/proc/list_queue()
	var/output = "<b>Queue contains:</b>"
	if(!istype(queue) || !queue.len)
		output += "<br>Nothing"
	else
		output += "<ol>"
		var/i = 0
		for(var/datum/design/D in queue)
			i++
			var/obj/part = D.build_path
			output += "<li[!check_resources(D)?" style='color: #f00;'":null]>"
			output += initial(part.name) + " - "
			output += "[i>1?"<a href='?src=[REF(src)];queue_move=-1;index=[i]' class='arrow'>&uarr;</a>":null] "
			output += "[i<queue.len?"<a href='?src=[REF(src)];queue_move=+1;index=[i]' class='arrow'>&darr;</a>":null] "
			output += "<a href='?src=[REF(src)];remove_from_queue=[i]'>Remove</a></li>"

		output += "</ol>"
		output += "<a href='?src=[REF(src)];process_queue=1'>Process queue</a> | <a href='?src=[REF(src)];clear_queue=1'>Clear queue</a>"
	return output

/obj/machinery/mecha_part_fabricator/proc/sync()
	for(var/obj/machinery/computer/rdconsole/RDC in oview(7,src))
		RDC.stored_research.copy_research_to(stored_research)
		updateUsrDialog()
		say("Successfully synchronized with R&D server.")
		return

	temp = "Unable to connect to local R&D Database.<br>Please check your connections and try again.<br><a href='?src=[REF(src)];clear_temp=1'>Return</a>"
	updateUsrDialog()
	return

/obj/machinery/mecha_part_fabricator/proc/get_resource_cost_w_coeff(datum/design/D, datum/material/resource, roundto = 1)
	return round(D.materials[resource]*component_coeff, roundto)

/obj/machinery/mecha_part_fabricator/proc/get_construction_time_w_coeff(datum/design/D, roundto = 1) //aran
	return round(initial(D.construction_time)*time_coeff, roundto)

/obj/machinery/mecha_part_fabricator/ui_interact(mob/user)
	. = ..()
	var/dat, left_part
	user.set_machine(src)
	var/turf/exit = get_step(src,(dir))
	if(exit.density)
		say("Error! Part outlet is obstructed.")
		return
	if(temp)
		left_part = temp
	else if(being_built)
		var/obj/I = being_built.build_path
		left_part = {"<div class='statusDisplay'>Building [initial(I.name)].<BR>
							Please wait until completion...</div>"}
	else
		left_part = output_ui_header()
		switch(screen)
			if("main")
				for(var/part_set in part_sets)
					left_part += "<a href='?src=[REF(src)];part_set=[part_set]'>[part_set]</a> - <a href='?src=[REF(src)];partset_to_queue=[part_set]'>Add all parts to queue</a><br>"
			if("parts")
				left_part += output_parts_list(part_set)
			if("resources")
				left_part += output_ui_materials()
			if("search")
				left_part += output_ui_search()
	dat = {"<html>
			<head>
			<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
			<title>[name]</title>
				<style>
				.res_name {font-weight: bold; text-transform: capitalize;}
				.red {color: #f00;}
				.part {margin-bottom: 10px;}
				.arrow {text-decoration: none; font-size: 10px;}
				body, table {height: 100%;}
				td {vertical-align: top; padding: 5px;}
				html, body {padding: 0px; margin: 0px;}
				h1 {font-size: 18px; margin: 5px 0px;}
				</style>
				<script language='javascript' type='text/javascript'>
				[js_byjax]
				</script>
				</head><body>
				<body>
				<table style='width: 100%;'>
				<tr>
				<td style='width: 65%; padding-right: 10px; margin: 3px 0;'>
				[left_part]
				</td>
				<td style='width: 35%; background: #000000; border: 1px solid #40628a;	padding: 4px; margin: 3px 0;' id='queue'>
				[list_queue()]
				</td>
				<tr>
				</table>
				</body>
				</html>"}

	var/datum/browser/popup = new(user, "mecha_fabricator", name, 1000, 430)
	popup.set_content(dat)
	popup.open()
	//user << browse(dat, "window=mecha_fabricator;size=1000x430")
	//onclose(user, "mecha_fabricator")
	return

/obj/machinery/mecha_part_fabricator/Topic(href, href_list)
	if(..())
		return
	if(href_list["part_set"])
		var/tpart_set = href_list["part_set"]
		if(tpart_set)
			if(tpart_set=="clear")
				part_set = null
			else
				part_set = tpart_set
				screen = "parts"
	if(href_list["part"])
		var/T = href_list["part"]
		for(var/v in stored_research.researched_designs)
			var/datum/design/D = SSresearch.techweb_design_by_id(v)
			if(D.build_type & MECHFAB)
				if(D.id == T)
					if(!processing_queue)
						build_part(D)
					else
						add_to_queue(D)
					break
	if(href_list["add_to_queue"])
		var/T = href_list["add_to_queue"]
		for(var/v in stored_research.researched_designs)
			var/datum/design/D = SSresearch.techweb_design_by_id(v)
			if(D.build_type & MECHFAB)
				if(D.id == T)
					add_to_queue(D)
					break
		return update_queue_on_page()
	if(href_list["remove_from_queue"])
		remove_from_queue(text2num(href_list["remove_from_queue"]))
		return update_queue_on_page()
	if(href_list["partset_to_queue"])
		add_part_set_to_queue(href_list["partset_to_queue"])
		return update_queue_on_page()
	if(href_list["process_queue"])
		INVOKE_ASYNC(src, .proc/do_process_queue)
	if(href_list["clear_temp"])
		temp = null
	if(href_list["screen"])
		screen = href_list["screen"]
	if(href_list["queue_move"] && href_list["index"])
		var/index = text2num(href_list["index"])
		var/new_index = index + text2num(href_list["queue_move"])
		if(isnum(index) && isnum(new_index) && ISINTEGER(index) && ISINTEGER(new_index))
			if(ISINRANGE(new_index,1,queue.len))
				queue.Swap(index,new_index)
		return update_queue_on_page()
	if(href_list["clear_queue"])
		queue = list()
		return update_queue_on_page()
	if(href_list["sync"])
		sync()
	if(href_list["part_desc"])
		var/T = href_list["part_desc"]
		for(var/v in stored_research.researched_designs)
			var/datum/design/D = SSresearch.techweb_design_by_id(v)
			if(D.build_type & MECHFAB)
				if(D.id == T)
					var/obj/part = D.build_path
					temp = {"<h1>[initial(part.name)] description:</h1>
								[initial(part.desc)]<br>
								<a href='?src=[REF(src)];clear_temp=1'>Return</a>
								"}
					break
	if(href_list["search"]) //Search for designs with name matching pattern
		search(href_list["to_search"])
		screen = "search"

	if(href_list["remove_mat"] && href_list["material"])
		var/datum/material/Mat = locate(href_list["material"])
		eject_sheets(Mat, text2num(href_list["remove_mat"]))

	updateUsrDialog()
	return

/obj/machinery/mecha_part_fabricator/proc/do_process_queue()
	if(processing_queue || being_built)
		return FALSE
	processing_queue = 1
	process_queue()
	processing_queue = 0

/obj/machinery/mecha_part_fabricator/proc/eject_sheets(eject_sheet, eject_amt)
	var/datum/component/material_container/mat_container = rmat.mat_container
	if (!mat_container)
		say("No access to material storage, please contact the quartermaster.")
		return 0
	if (rmat.on_hold())
		say("Mineral access is on hold, please contact the quartermaster.")
		return 0
	var/count = mat_container.retrieve_sheets(text2num(eject_amt), eject_sheet, drop_location())
	var/list/matlist = list()
	matlist[eject_sheet] = text2num(eject_amt)
	rmat.silo_log(src, "ejected", -count, "sheets", matlist)
	return count

/obj/machinery/mecha_part_fabricator/proc/AfterMaterialInsert(item_inserted, id_inserted, amount_inserted)
	var/datum/material/M = id_inserted
	add_overlay("fab-load-[M.name]")
	addtimer(CALLBACK(src, /atom/proc/cut_overlay, "fab-load-[M.name]"), 10)
	updateUsrDialog()

/obj/machinery/mecha_part_fabricator/attackby(obj/item/W, mob/user, params)
	if(default_deconstruction_screwdriver(user, "fab-o", "fab-idle", W))
		return TRUE

	if(default_deconstruction_crowbar(W))
		return TRUE

	return ..()


/obj/machinery/mecha_part_fabricator/proc/is_insertion_ready(mob/user)
	if(panel_open)
		to_chat(user, "<span class='warning'>You can't load [src] while it's opened!</span>")
		return FALSE
	if(being_built)
		to_chat(user, "<span class='warning'>\The [src] is currently processing! Please wait until completion.</span>")
		return FALSE

	return TRUE

/obj/machinery/mecha_part_fabricator/maint
	link_on_init = FALSE

/*
/obj/machinery/mecha_part_fabricator
	icon = 'icons/obj/robotics.dmi'
	icon_state = "fab-idle"
	name = "фабрикатор экзоскелетов"
	desc = "Ничего не создаётся."
	density = TRUE
	req_access = list(ACCESS_ROBOTICS)
	circuit = /obj/item/circuitboard/machine/mechfab
	processing_flags = START_PROCESSING_MANUALLY

	subsystem_type = /datum/controller/subsystem/processing/fastprocess

	/// Флаг куда будут сбрасываться предметы: TRUE - на клетку ниже, FALSE - на клетку фабрикатора
	var/drop_zone = TRUE

	/// Current items in the build queue.
	var/list/queue = list()
	/// Whether or not the machine is building the entire queue automagically.
	var/process_queue = FALSE

	idle_power_usage = 20
	active_power_usage = 5000

	/// The current design datum that the machine is building.
	var/datum/design/being_built
	/// World time when the build will finish.
	var/build_finish = 0
	/// World time when the build started.
	var/build_start = 0
	/// Reference to all materials used in the creation of the item being_built.
	var/list/build_materials
	/// Part currently stored in the Exofab.
	var/obj/item/stored_part

	/// Coefficient for the speed of item building. Based on the installed parts.
	var/time_coeff = 1
	/// Coefficient for the efficiency of material usage in item building. Based on the installed parts.
	var/component_coeff = 1

	/// Reference to the techweb.
	var/datum/techweb/stored_research

	/// Whether the Exofab links to the ore silo on init. Special derelict or maintanance variants should set this to FALSE.
	var/link_on_init = TRUE

	/// Reference to a remote material inventory, such as an ore silo.
	var/datum/component/remote_materials/rmat

	/// A list of categories that valid MECHFAB design datums will broadly categorise themselves under.
	var/list/part_sets = list(
		"Киборги",
		"Модули киборгов",
		"Рипли",
		"Одиссей",
		"Кларк",
		"Гигакс",
		"Дюранд",
		"Х.О.Н.К",
		"Фазон",
		"Саванна-Иванов",
		"Модули экзокостюмов",
		"Орудийные модули",
		"Управление",
		"Кибернетика",
		"Импланты",
		"Создание МОД",
		"Модули МОД",
		"Батареи и прочее"
	)

/obj/machinery/mecha_part_fabricator/Initialize(mapload)
	stored_research = new
	rmat = AddComponent(/datum/component/remote_materials, "mechfab", mapload && link_on_init)
	RefreshParts() //Recalculating local material sizes if the fab isn't linked
	return ..()

/obj/machinery/mecha_part_fabricator/RefreshParts()
	. = ..()
	var/T = 0

	//maximum stocking amount (default 300000, 600000 at T4)
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		T += M.rating
	rmat.set_local_size((200000 + (T*50000)))

	//Затрачиваемые ресурсы (1 -> 0.75 -> 0.50 -> 0.25 -> 0.1)
	T = 1.25
	for(var/obj/item/stock_parts/micro_laser/Ma in component_parts)
		T -= Ma.rating*0.25
	if(T<=0.1)
		T = 0.1				//минимальный порог при Т5
	component_coeff = T

	//Скорость работы (1 -> 0.75 -> 0.50 -> 0.25 -> 0.1)
	T = -1
	for(var/obj/item/stock_parts/manipulator/Ml in component_parts)
		T += Ml.rating
	time_coeff = round(initial(time_coeff) - (initial(time_coeff)*(T))/4,0.01)
	if(time_coeff<=0.1)
		time_coeff = 0.1	//минимальный порог при Т5

	// Adjust the build time of any item currently being built.
	if(being_built)
		var/last_const_time = build_finish - build_start
		var/new_const_time = get_construction_time_w_coeff(initial(being_built.construction_time))
		var/const_time_left = build_finish - world.time
		var/new_build_time = (new_const_time / last_const_time) * const_time_left
		build_finish = world.time + new_build_time

	update_static_data(usr)

/obj/machinery/mecha_part_fabricator/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += "<hr><span class='notice'>Дисплей: хранение <b>[rmat.local_size]</b> материальных единиц.<br>Экономия ресурсов <b>[100-component_coeff*100]%</b>.<br>Время создания уменьшено на <b>[100-time_coeff*100]%</b>.</span>"

/**
 * Generates an info list for a given part.
 *
 * Returns a list of part information.
 * * D - Design datum to get information on.
 * * categories - Boolean, whether or not to parse snowflake categories into the part information list.
 */
/obj/machinery/mecha_part_fabricator/proc/output_part_info(datum/design/D, categories = FALSE)
	var/cost = list()
	for(var/c in D.materials)
		var/datum/material/M = c
		cost[M.name] = get_resource_cost_w_coeff(D, M)

	var/list/category_override = null

	if(istype(D, /datum/design/module))
		var/datum/design/module/module_design = D
		D.sub_category = list(module_design.department_type)

	var/list/part = list(
		"name" = D.name,
		"desc" = D.get_description(),
		"printTime" = get_construction_time_w_coeff(initial(D.construction_time))/10,
		"cost" = cost,
		"id" = D.id,
		"subCategory" = D.sub_category,
		"categoryOverride" = category_override,
		"searchMeta" = D.search_metadata
	)

	return part

/**
 * Intended to be called when an item starts printing.
 *
 * Adds the overlay to show the fab working and sets active power usage settings.
 */
/obj/machinery/mecha_part_fabricator/proc/on_start_printing()
	add_overlay("fab-active")
	use_power = ACTIVE_POWER_USE

/**
 * Intended to be called when the exofab has stopped working and is no longer printing items.
 *
 * Removes the overlay to show the fab working and sets idle power usage settings. Additionally resets the description and turns off queue processing.
 */
/obj/machinery/mecha_part_fabricator/proc/on_finish_printing()
	cut_overlay("fab-active")
	use_power = IDLE_POWER_USE
	desc = initial(desc)
	process_queue = FALSE

/**
 * Calculates resource/material costs for printing an item based on the machine's resource coefficient.
 *
 * Returns a list of k,v resources with their amounts.
 * * D - Design datum to calculate the modified resource cost of.
 */
/obj/machinery/mecha_part_fabricator/proc/get_resources_w_coeff(datum/design/D)
	var/list/resources = list()
	for(var/R in D.materials)
		var/datum/material/M = R
		resources[M] = get_resource_cost_w_coeff(D, M)
	return resources

/**
 * Checks if the Exofab has enough resources to print a given item.
 *
 * Returns FALSE if the design has no reagents used in its construction (?) or if there are insufficient resources.
 * Returns TRUE if there are sufficient resources to print the item.
 * * D - Design datum to calculate the modified resource cost of.
 */
/obj/machinery/mecha_part_fabricator/proc/check_resources(datum/design/D)
	if(length(D.reagents_list)) // No reagents storage - no reagent designs.
		return FALSE
	var/datum/component/material_container/materials = rmat.mat_container
	if(materials.has_materials(get_resources_w_coeff(D)))
		return TRUE
	return FALSE

/**
 * Attempts to build the next item in the build queue.
 *
 * Returns FALSE if either there are no more parts to build or the next part is not buildable.
 * Returns TRUE if the next part has started building.
 * * verbose - Whether the machine should use say() procs. Set to FALSE to disable the machine saying reasons for failure to build.
 */
/obj/machinery/mecha_part_fabricator/proc/build_next_in_queue(verbose = TRUE)
	if(!length(queue))
		return FALSE

	var/datum/design/D = queue[1]
	if(build_part(D, verbose))
		remove_from_queue(1)
		return TRUE

	return FALSE

/**
 * Starts the build process for a given design datum.
 *
 * Returns FALSE if the procedure fails. Returns TRUE when being_built is set.
 * Uses materials.
 * * D - Design datum to attempt to print.
 * * verbose - Whether the machine should use say() procs. Set to FALSE to disable the machine saying reasons for failure to build.
 */
/obj/machinery/mecha_part_fabricator/proc/build_part(datum/design/D, verbose = TRUE)
	if(!D)
		return FALSE

	var/datum/component/material_container/materials = rmat.mat_container
	if (!materials)
		if(verbose)
			//playsound(src, 'white/valtos/sounds/error1.ogg', 20, TRUE)
			say("Нет доступа к хранилищу материалов, свяжитесь с завхозом.")
		return FALSE
	if (rmat.on_hold())
		if(verbose)
			//playsound(src, 'white/valtos/sounds/error1.ogg', 20, TRUE)
			say("Запрещено использование материалов из хранилища, свяжитесь с завхозом.")
		return FALSE
	if(!check_resources(D))
		if(verbose)
			//playsound(src, 'white/valtos/sounds/error1.ogg', 20, TRUE)
			say("Недостаточно ресурсов. Остановка.")
		return FALSE

	build_materials = get_resources_w_coeff(D)

	materials.use_materials(build_materials)
	being_built = D
	build_finish = world.time + get_construction_time_w_coeff(initial(D.construction_time))
	build_start = world.time
	desc = "Создаёт [D.name]."

	playsound(get_turf(src), "production", 75, TRUE)

	rmat.silo_log(src, "built", -1, "[D.name]", build_materials)

	return TRUE

/obj/machinery/mecha_part_fabricator/process()
	// If there's a stored part to dispense due to an obstruction, try to dispense it.
	if(stored_part)
		var/turf/exit = get_step(src,(dir))
		if(exit.density)
			return TRUE

		say("Препятствие убрано. Деталь [stored_part] готова.")
		stored_part.forceMove(exit)
		stored_part = null

	// If there's nothing being built, try to build something
	if(!being_built)
		// If we're not processing the queue anymore or there's nothing to build, end processing.
		if(!process_queue || !build_next_in_queue())
			on_finish_printing()
			end_processing()
			return TRUE
		on_start_printing()

	// If there's an item being built, check if it is complete.
	if(being_built && (build_finish < world.time))
		// Then attempt to dispense it and if appropriate build the next item.
		dispense_built_part(being_built)
		if(process_queue)
			build_next_in_queue(FALSE)
		return TRUE

/**
 * Dispenses a part to the tile infront of the Exosuit Fab.
 *
 * Returns FALSE is the machine cannot dispense the part on the appropriate turf.
 * Return TRUE if the part was successfully dispensed.
 * * D - Design datum to attempt to dispense.
 */
/obj/machinery/mecha_part_fabricator/proc/dispense_built_part(datum/design/D)
	var/obj/item/I = new D.build_path(src)
	I.material_flags |= MATERIAL_NO_EFFECTS //Find a better way to do this.
	I.set_custom_materials(build_materials)

	being_built = null
	var/drop_location = drop_location()
	var/turf/exit = get_step(src,(dir))
	if(drop_zone)
		if(exit.density)
			//playsound(src, 'white/valtos/sounds/error1.ogg', 20, TRUE)
			say("Ошибка! Выход заблокирован.")
			desc = "Пытается выдавить [D.name], но выход заблокирован."
			stored_part = I
			return FALSE

		//playsound(src, 'white/valtos/sounds/click2.ogg', 20, TRUE)
		say("[capitalize(I.name)] готова.")
		I.forceMove(exit)
		return TRUE
	else
		//playsound(src, 'white/valtos/sounds/click2.ogg', 20, TRUE)
		say("[capitalize(I.name)] готова.")
		I.forceMove(drop_location)
		return TRUE

/**
 * Adds a list of datum designs to the build queue.
 *
 * Will only add designs that are in this machine's stored techweb.
 * Does final checks for datum IDs and makes sure this machine can build the designs.
 * * part_list - List of datum design ids for designs to add to the queue.
 */
/obj/machinery/mecha_part_fabricator/proc/add_part_set_to_queue(list/part_list)
	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		if((D.build_type & MECHFAB) && (D.id in part_list))
			add_to_queue(D)

/**
 * Adds a datum design to the build queue.
 *
 * Returns TRUE if successful and FALSE if the design was not added to the queue.
 * * D - Datum design to add to the queue.
 */
/obj/machinery/mecha_part_fabricator/proc/add_to_queue(datum/design/D)
	if(!istype(queue))
		queue = list()
	if(D)
		queue[++queue.len] = D
		return TRUE
	return FALSE

/**
 * Removes datum design from the build queue based on index.
 *
 * Returns TRUE if successful and FALSE if a design was not removed from the queue.
 * * index - Index in the build queue of the element to remove.
 */
/obj/machinery/mecha_part_fabricator/proc/remove_from_queue(index)
	if(!isnum(index) || !ISINTEGER(index) || !istype(queue) || (index<1 || index>length(queue)))
		return FALSE
	queue.Cut(index,++index)
	return TRUE

/**
 * Generates a list of parts formatted for tgui based on the current build queue.
 *
 * Returns a formatted list of lists containing formatted part information for every part in the build queue.
 */
/obj/machinery/mecha_part_fabricator/proc/list_queue()
	if(!istype(queue) || !length(queue))
		return null

	var/list/queued_parts = list()
	for(var/datum/design/D in queue)
		var/list/part = output_part_info(D)
		queued_parts += list(part)
	return queued_parts

/**
 * Calculates the coefficient-modified resource cost of a single material component of a design's recipe.
 *
 * Returns coefficient-modified resource cost for the given material component.
 * * D - Design datum to pull the resource cost from.
 * * resource - Material datum reference to the resource to calculate the cost of.
 * * roundto - Rounding value for round() proc
 */
/obj/machinery/mecha_part_fabricator/proc/get_resource_cost_w_coeff(datum/design/D, datum/material/resource, roundto = 1)
	return round(D.materials[resource]*component_coeff, roundto)

/**
 * Calculates the coefficient-modified build time of a design.
 *
 * Returns coefficient-modified build time of a given design.
 * * D - Design datum to calculate the modified build time of.
 * * roundto - Rounding value for round() proc
 */
/obj/machinery/mecha_part_fabricator/proc/get_construction_time_w_coeff(construction_time, roundto = 1) //aran
	return round(construction_time*time_coeff, roundto)

/obj/machinery/mecha_part_fabricator/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/sheetmaterials)
	)

/obj/machinery/mecha_part_fabricator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ExosuitFabricator")
		ui.open()

/obj/machinery/mecha_part_fabricator/ui_static_data(mob/user)
	var/list/data = list()

	var/list/final_sets = list()
	var/list/buildable_parts = list()

	for(var/part_set in part_sets)
		final_sets += part_set

	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		if(D.build_type & MECHFAB)
			// This is for us.
			var/list/part = output_part_info(D, TRUE)

			if(part["category_override"])
				for(var/cat in part["category_override"])
					buildable_parts[cat] += list(part)
					if(!(cat in part_sets))
						final_sets += cat
				continue

			for(var/cat in part_sets)
				// Find all matching categories.
				if(!(cat in D.category))
					continue

				buildable_parts[cat] += list(part)

	data["partSets"] = final_sets
	data["buildableParts"] = buildable_parts

	return data

/obj/machinery/mecha_part_fabricator/ui_data(mob/user)
	var/list/data = list()

	data["materials"] = rmat.mat_container?.ui_data()

	if(being_built)
		var/list/part = list(
			"name" = being_built.name,
			"duration" = build_finish - world.time,
			"printTime" = get_construction_time_w_coeff(initial(being_built.construction_time))
		)
		data["buildingPart"] = part
	else
		data["buildingPart"] = null

	data["queue"] = list_queue()

	if(stored_part)
		data["storedPart"] = stored_part.name
	else
		data["storedPart"] = null

	data["isProcessingQueue"] = process_queue

	return data

/obj/machinery/mecha_part_fabricator/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	. = TRUE

	add_fingerprint(usr)
	usr.set_machine(src)

	switch(action)
		if("sync_rnd")
			// Syncronises designs on interface with R&D techweb.
			update_static_data(usr)
			//playsound(src, 'white/valtos/sounds/click2.ogg', 20, TRUE)
			say("Successfully synchronized with R&D server.")
			return
		if("add_queue_set")
			// Add all parts of a set to queue
			var/part_list = params["part_list"]
			add_part_set_to_queue(part_list)
			return
		if("add_queue_part")
			// Add a specific part to queue
			var/T = params["id"]
			for(var/v in stored_research.researched_designs)
				var/datum/design/D = SSresearch.techweb_design_by_id(v)
				if((D.build_type & MECHFAB) && (D.id == T))
					add_to_queue(D)
					break
			return
		if("del_queue_part")
			// Delete a specific from from the queue
			var/index = text2num(params["index"])
			remove_from_queue(index)
			return
		if("clear_queue")
			// Delete everything from queue
			queue.Cut()
			return
		if("build_queue")
			// Build everything in queue
			if(process_queue)
				return
			process_queue = TRUE

			if(!being_built)
				begin_processing()
			return
		if("stop_queue")
			// Pause queue building. Also known as stop.
			process_queue = FALSE
			return
		if("build_part")
			// Build a single part
			if(being_built || process_queue)
				return

			var/id = params["id"]
			var/datum/design/D = SSresearch.techweb_design_by_id(id)

			if(!(D.build_type & MECHFAB) || !(D.id == id))
				return

			if(build_part(D))
				on_start_printing()
				begin_processing()

			return
		if("move_queue_part")
			// Moves a part up or down in the queue.
			var/index = text2num(params["index"])
			var/new_index = index + text2num(params["newindex"])
			if(isnum(index) && isnum(new_index) && ISINTEGER(index) && ISINTEGER(new_index))
				if(ISINRANGE(new_index,1,length(queue)))
					queue.Swap(index,new_index)
			return
		if("remove_mat")
			var/datum/material/material = locate(params["ref"])
			var/amount = text2num(params["amount"])

			if (!amount)
				return

			// SAFETY: eject_sheets checks for valid mats
			rmat.eject_sheets(material, amount)
			return

	return FALSE

/**
 * Eject material sheets.
 *
 * Returns the number of sheets successfully ejected.
 * eject_sheet - Byond REF of the material to eject.
 *	eject_amt - Number of sheets to attempt to eject.
 */
/obj/machinery/mecha_part_fabricator/proc/eject_sheets(eject_sheet, eject_amt)
	var/datum/component/material_container/mat_container = rmat.mat_container
	if (!mat_container)
		//playsound(src, 'white/valtos/sounds/error1.ogg', 20, TRUE)
		say("Нет доступа к хранилищу материалов, свяжитесь с завхозом.")
		return 0
	if (rmat.on_hold())
		//playsound(src, 'white/valtos/sounds/error1.ogg', 20, TRUE)
		say("Запрещено использование материалов из хранилища, свяжитесь с завхозом.")
		return 0
	var/count = mat_container.retrieve_sheets(text2num(eject_amt), eject_sheet, drop_location())
	var/list/matlist = list()
	matlist[eject_sheet] = text2num(eject_amt)
	rmat.silo_log(src, "ejected", -count, "sheets", matlist)
	return count

/obj/machinery/mecha_part_fabricator/proc/AfterMaterialInsert(item_inserted, id_inserted, amount_inserted)
	var/datum/material/M = id_inserted
	add_overlay("fab-load-[M.name]")
	addtimer(CALLBACK(src, /atom/proc/cut_overlay, "fab-load-[M.name]"), 10)

/obj/machinery/mecha_part_fabricator/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(being_built)
		to_chat(user, span_warning("<b>[capitalize(src)]</b> всё ещё работает! Нужно подождать."))
		return FALSE
	return default_deconstruction_screwdriver(user, "fab-o", "fab-idle", I)

/obj/machinery/mecha_part_fabricator/crowbar_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(being_built)
		to_chat(user, span_warning("<b>[capitalize(src)]</b> всё ещё работает! Нужно подождать."))
		return FALSE
	return default_deconstruction_crowbar(I)

/obj/machinery/mecha_part_fabricator/proc/is_insertion_ready(mob/user)
	if(panel_open)
		to_chat(user, span_warning("Не могу загрузить что-то в [src.name], пока он работает!"))
		return FALSE
	if(being_built)
		to_chat(user, span_warning("<b>[capitalize(src)]</b> всё ещё работает! Нужно подождать."))
		return FALSE

	return TRUE

/obj/machinery/mecha_part_fabricator/maint
	link_on_init = FALSE
*/
