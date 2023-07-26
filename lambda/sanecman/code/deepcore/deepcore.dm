GLOBAL_LIST_EMPTY(ore_vein_landmarks)
#define DEEPCORE_MATERIAL_RATE 2

/*\
	Crude Material Container - Subcomponent to support the transfer of unrefined ores
	Assumes ores are the same material value as sheets, because at the time of writing they in fact are.
\*/

//I know it still says sheets but bear with me here, it's ores now
/datum/component/material_container/crude/retrieve_sheets(sheet_amt, datum/material/M, target)
	if((!M.sheet_type) || (sheet_amt <= 0))
		return 0
	if(!target)
		target = get_turf(parent)
	if(materials[M] < (sheet_amt * MINERAL_MATERIAL_AMOUNT))
		sheet_amt = round(materials[M] / MINERAL_MATERIAL_AMOUNT)
	var/count = 0
	while(sheet_amt > MAX_STACK_SIZE)
		new M.sheet_type(target, MAX_STACK_SIZE)
		count += MAX_STACK_SIZE
		use_amount_mat(sheet_amt * MINERAL_MATERIAL_AMOUNT, M)
		sheet_amt -= MAX_STACK_SIZE
	if(sheet_amt >= 1)
		new M.sheet_type(target, sheet_amt)
		count += sheet_amt
		use_amount_mat(sheet_amt * MINERAL_MATERIAL_AMOUNT, M)
	return count

/*\
	Deepcore machines:
		network - The DCMnet itself
		container - The material container component used for those sweet mats
\*/
/obj/machinery/deepcore
	icon = 'lambda/sanecman/icons/deepcore/deepcore.dmi'

/obj/machinery/deepcore/drill
	name = "бур глубокого погружения"
	desc = "Мощная машина, которая способна извлекать руду из недр планеты."
	icon = 'lambda/sanecman/icons/deepcore/drill.dmi'
	icon_state = "deep_core_drill"
	density = TRUE
	anchored = FALSE
	use_power = NO_POWER_USE
	pressure_resistance = 30
	max_integrity = 200
	integrity_failure = 0.3
	circuit = /obj/item/circuitboard/machine/deepcore/drill
	processing_flags = START_PROCESSING_MANUALLY

	var/obj/machinery/deepcore/hopper/target_hopper
	var/deployed = FALSE //If the drill is anchored and ready-to-mine
	var/active = FALSE //If the drill is activly mining ore
	var/obj/effect/landmark/ore_vein/active_vein //Ore vein currently set to be mined in
	var/mult = 1

/obj/machinery/deepcore/drill/proc/toggle()
	active = !active
	if(active)
		START_PROCESSING(SSmachines, src)
	else
		STOP_PROCESSING(SSmachines, src)

/obj/machinery/deepcore/drill/interact(mob/user, special_state)
	. = ..()
	if(machine_stat & BROKEN)
		return .
	if(deployed)
		if(!target_hopper)
			to_chat(user, span_notice("Бур не подключен к воронке!"))
			return
		toggle()
		if(active)
			to_chat(user, span_notice("Включаю [src.name]."))
		else
			to_chat(user, span_notice("Выключаю [src.name]."))
		update_icon_state()
		update_overlays()
		return TRUE
	else
		var/obj/effect/landmark/ore_vein/O = scanArea()
		if(O)
			anchored = TRUE
			playsound(src, 'sound/machines/windowdoor.ogg', 50)
			flick("deep_core_drill-deploy", src)
			addtimer(CALLBACK(src, .proc/Deploy), 14)
			to_chat(user, span_notice("[capitalize(src.name)] обнаруживает [O.name] и начинает работу..."))
			return TRUE
		else
			to_chat(user, span_warning("[capitalize(src.name)] не может найти руду в зоне!"))

/obj/machinery/deepcore/drill/AltClick(mob/user)
	. = ..()
	if(active)
		to_chat(user, span_warning("Не могу выключить пока [src.name] активен!"))
		return
	else
		playsound(src, 'sound/machines/windowdoor.ogg', 50)
		flick("deep_core_drill-undeploy", src)
		addtimer(CALLBACK(src, .proc/Undeploy), 13)

/obj/machinery/deepcore/drill/process(delta_time)
	if(machine_stat & BROKEN || isnull(active_vein) || isnull(target_hopper) )
		active = FALSE
		STOP_PROCESSING(SSmachines, src)
		update_overlays()
		update_icon_state()
		return
	if(deployed && active && target_hopper)
		mine_ore(delta_time)


/obj/machinery/deepcore/drill/proc/mine_ore(delta_time)
	var/obj/effect/landmark/ore_vein/vein = active_vein
	target_hopper.try_add_material(round(vein.material_rate * min(src.mult, target_hopper.mult) * delta_time), vein.resource)

/obj/machinery/deepcore/drill/proc/scanArea()
	//Checks for ores and latches to an active vein if one is located.
	var/turf/deployed_zone = get_turf(src)
	var/obj/effect/landmark/ore_vein/vein = locate() in deployed_zone
	if(vein)
		active_vein = vein
		return vein
	else
		return FALSE

/obj/machinery/deepcore/drill/RefreshParts()
	. = ..()
	var/MM_value = 0
	var/MM_amount = 0
	for(var/obj/item/stock_parts/manipulator/MM in component_parts)
		MM_value += MM.rating
		MM_amount++
	mult = MM_value/MM_amount

/obj/machinery/deepcore/drill/proc/Deploy()
	deployed = TRUE
	layer = MOB_LAYER+0.01
	update_icon_state()
	playsound(src, 'sound/machines/boltsdown.ogg', 50)
	visible_message(span_notice("[capitalize(name)] готов к работе!"))


/obj/machinery/deepcore/drill/proc/Undeploy()
	active_vein = null
	deployed = FALSE
	anchored = FALSE
	update_icon_state()
	playsound(src, 'sound/machines/boltsup.ogg', 50)
	visible_message(span_notice("[capitalize(name)] готов к движению!"))
	layer = initial(layer)

/obj/machinery/deepcore/drill/update_icon_state()
	. = ..()
	if(deployed)
		if(machine_stat & BROKEN)
			icon_state = "deep_core_drill-deployed-broken"
			return
		if(active)
			icon_state = "deep_core_drill-active"
		else
			icon_state = "deep_core_drill-idle"
	else
		if(machine_stat & BROKEN)
			icon_state = "deep_core_drill-broken"
		else
			icon_state = "deep_core_drill"

/obj/machinery/deepcore/drill/update_overlays()
	. = ..()
	//Cool beam of light ignores shadows.
	if(active && deployed)
		set_light(3, 1, "99FFFF")
		. += mutable_appearance(icon, "mining_beam-particles", layer, src, plane, alpha)
		. += emissive_appearance(icon, "mining_beam-particles", src)
	else
		set_light(0)

/obj/machinery/deepcore/drill/obj_break(damage_flag)
	. = ..()
	if(.)
		active = FALSE
		set_light(0)
		update_overlays()

//wtf?
/obj/machinery/deepcore/drill/can_be_unfasten_wrench(mob/user, silent)
	to_chat(user, span_notice("Мне потребуется гаечный ключ для установки [src.name]!"))
	return CANT_UNFASTEN

/obj/machinery/deepcore/drill/multitool_act(mob/living/user, obj/item/multitool/I)
	. = ..()
	if(!istype(I))
		return FALSE
	if(istype(I.buffer, /obj/machinery/deepcore/hopper))
		if(I.buffer.z != src.z)
			to_chat(user, span_notice("The drill seems to experience some sort of bluespace interference. Perhaps you should move the hopper closer to it?"))
			return FALSE
		to_chat(user, span_notice("You connect the deepcore drill to the hopper."))
		target_hopper = I.buffer
		return TRUE

/obj/item/circuitboard/machine/deepcore/drill
	name = "бур глубокого погружения"
	desc = "Мощная машина, которая способна извлекать руду из недр планеты."
	icon_state = "supply"
	build_path = /obj/machinery/deepcore/drill
	req_components = list(
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/manipulator = 4,
		/obj/item/stock_parts/scanning_module = 1)

/obj/item/circuitboard/machine/deepcore/hopper
	name = "блюспейс рудоприемник"
	desc = "Машина, предназначенная для приема руды от любых подключенных к ней буров глубокого погружения посредством блюспейс телепортации."
	icon_state = "supply"
	build_path = /obj/machinery/deepcore/hopper
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 2,
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/manipulator = 4,
		/obj/item/stock_parts/matter_bin = 5)
	def_components = list(/obj/item/stack/ore/bluespace_crystal = /obj/item/stack/ore/bluespace_crystal/artificial)

/obj/item/deepcorecapsule
	name = "deepcore drill deployment capsule"
	desc = "A deepcore mining drill compressed into an easy-to-deploy capsule."
	icon = 'lambda/sanecman/icons/white_objects.dmi'
	icon_state = "capsule_dcm"
	w_class = WEIGHT_CLASS_TINY
	var/to_deploy = /obj/machinery/deepcore/drill

/obj/item/deepcorecapsule/attack_self()
	loc.visible_message(span_warning("[capitalize(src.name)] begins to shake. Stand back!"))
	addtimer(CALLBACK(src, .proc/Deploy), 50)

/obj/item/deepcorecapsule/proc/Deploy()
	if(QDELETED(src) || !to_deploy)
		return
	playsound(src, 'sound/effects/phasein.ogg', 100, TRUE)
	var/turf/deploy_location = get_turf(src)
	new to_deploy(deploy_location)
	new /obj/effect/particle_effect/smoke(deploy_location)
	qdel(src)

/obj/item/pinpointer/deepcore
	name = "глубинный пинпоинтер"
	desc = "Ручной прибор для поиска ресурсов глубоко под поверхностью."
	icon = 'lambda/sanecman/icons/white_objects.dmi'
	icon_state = "miningpinpointing"
	custom_price = 300
	custom_premium_price = 300
	icon_suffix = "_mining"

/obj/item/pinpointer/deepcore/attack_self(mob/living/user)
	if(active)
		toggle_on()
		user.visible_message(span_notice("[user] deactivates [user.p_their()] pinpointer.") , span_notice("You deactivate your pinpointer."))
		return

	var/vein = LocateVein(user)
	if(!vein)
		user.visible_message(span_notice("[user]'s pinpointer fails to detect any material.") , span_notice("Your pinpointer fails to detect any material."))
		return

	target = vein
	toggle_on()
	user.visible_message(span_notice("[user] activates [user.p_their()] pinpointer.") , span_notice("You activate your pinpointer."))

/obj/item/pinpointer/deepcore/proc/LocateVein(mob/living/user)
	var/turf/here = get_turf(src)
	var/located_dist
	var/obj/effect/landmark/located_vein
	for(var/obj/effect/landmark/I in GLOB.ore_vein_landmarks)
		if(located_vein)
			var/new_dist = get_dist(here, get_turf(I))
			if(new_dist < located_dist)
				located_dist = new_dist
				located_vein = I
		else
			located_dist = get_dist(here, get_turf(I))
			located_vein = I
	return located_vein

/obj/item/pinpointer/deepcore/advanced
	name = "Продвинутый глубинный пинпоинтер"
	desc = "A sophisticated dowsing utility for locating specific materials at any depth."
	icon_state = "miningadvpinpointing"
	custom_price = 600
	custom_premium_price = 600

/obj/item/pinpointer/deepcore/advanced/LocateVein(mob/living/user)
	//Sorts vein artifacts by ore type
	var/viens_by_type = list()
	for(var/obj/effect/landmark/ore_vein/I in GLOB.ore_vein_landmarks)
		if(islist(viens_by_type[I.resource]))
			var/list/L = viens_by_type[I.resource]
			L += I
		else
			viens_by_type[I.resource] = list(I)
	var/A = tgui_input_list(user, "Type to locate", "DCM", sort_list(viens_by_type))
	if(!A || QDELETED(src) || !user || !user.is_holding(src) || user.incapacitated())
		return
	//Searches for nearest ore vein as usual
	var/turf/here = get_turf(src)
	var/located_dist
	var/obj/effect/landmark/located_vein
	for(var/obj/effect/landmark/I in viens_by_type[A])
		if(located_vein)
			var/new_dist = get_dist(here, get_turf(I))
			if(new_dist < located_dist)
				located_dist = new_dist
				located_vein = I
		else
			located_dist = get_dist(here, get_turf(I))
			located_vein = I
	return located_vein

/obj/effect/landmark/ore_vein
	name = "ore vein"
	var/resource
	var/material_rate = 0

/obj/effect/landmark/ore_vein/Initialize(mapload)
	. = ..()
	for(var/obj/effect/landmark/ore_vein/vein in get_turf(src))
		if(vein!=src)
			stack_trace("Ore vein initialized on a tile where another ore vein already exists and was deleted.")
			qdel(src)
			return
	GLOB.ore_vein_landmarks += src

/obj/effect/landmark/ore_vein/Destroy()
	if(GLOB.ore_vein_landmarks.Find(src))
		GLOB.ore_vein_landmarks -= src
	. = ..()


/obj/effect/landmark/ore_vein/proc/extract_ore() //Called by deepcore drills, returns a list of keyed ore stacks by amount
	var/list/ores = list()
	ores[resource] = material_rate
	return ores

//Common ore prefabs

/obj/effect/landmark/ore_vein/iron
	resource = /obj/item/stack/ore/iron
	material_rate = DEEPCORE_MATERIAL_RATE * 500
/obj/effect/landmark/ore_vein/glass
	resource = /obj/item/stack/ore/glass
	material_rate = DEEPCORE_MATERIAL_RATE * 500
/obj/effect/landmark/ore_vein/plasma
	resource = /obj/item/stack/ore/plasma
	material_rate = DEEPCORE_MATERIAL_RATE * 300
/obj/effect/landmark/ore_vein/silver
	resource = /obj/item/stack/ore/silver
	material_rate = DEEPCORE_MATERIAL_RATE * 200
/obj/effect/landmark/ore_vein/gold
	resource = /obj/item/stack/ore/gold
	material_rate = DEEPCORE_MATERIAL_RATE * 200
/obj/effect/landmark/ore_vein/diamond
	resource = /obj/item/stack/ore/diamond
	material_rate = DEEPCORE_MATERIAL_RATE * 100
/obj/effect/landmark/ore_vein/uranium
	resource = /obj/item/stack/ore/uranium
	material_rate = DEEPCORE_MATERIAL_RATE * 100
/obj/effect/landmark/ore_vein/titanium
	resource = /obj/item/stack/ore/titanium
	material_rate = DEEPCORE_MATERIAL_RATE * 200
/obj/effect/landmark/ore_vein/bluespace_crystal
	resource = /obj/item/stack/ore/bluespace_crystal
	material_rate = DEEPCORE_MATERIAL_RATE * 50
/obj/effect/landmark/ore_vein/bananium
	resource = /obj/item/stack/ore/bananium
	material_rate = DEEPCORE_MATERIAL_RATE * 50

//Генерация точек на планетах
/obj/effect/spawner/lootdrop/ore_vein/beach
	name = "beach ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 5,
		/obj/effect/landmark/ore_vein/glass = 5,
		/obj/effect/landmark/ore_vein/silver = 3,
		/obj/effect/landmark/ore_vein/gold = 2,
		/obj/effect/landmark/ore_vein/diamond = 1,
		/obj/effect/landmark/ore_vein/titanium = 1
	)

/obj/effect/spawner/lootdrop/ore_vein/jungle
	name = "jungle ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 5,
		/obj/effect/landmark/ore_vein/glass = 5,
		/obj/effect/landmark/ore_vein/silver = 5,
		/obj/effect/landmark/ore_vein/gold = 5,
		/obj/effect/landmark/ore_vein/diamond = 2,
		/obj/effect/landmark/ore_vein/titanium = 3,
		/obj/effect/landmark/ore_vein/uranium = 1,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)

/obj/effect/spawner/lootdrop/ore_vein/lava
	name = "lava ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 3,
		/obj/effect/landmark/ore_vein/glass = 2,
		/obj/effect/landmark/ore_vein/silver = 5,
		/obj/effect/landmark/ore_vein/gold = 5,
		/obj/effect/landmark/ore_vein/diamond = 3,
		/obj/effect/landmark/ore_vein/titanium = 5,
		/obj/effect/landmark/ore_vein/uranium = 3,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)

/obj/effect/spawner/lootdrop/ore_vein/rock
	name = "rock ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 10,
		/obj/effect/landmark/ore_vein/glass = 2,
		/obj/effect/landmark/ore_vein/silver = 5,
		/obj/effect/landmark/ore_vein/gold = 5,
		/obj/effect/landmark/ore_vein/diamond = 2,
		/obj/effect/landmark/ore_vein/titanium = 5,
		/obj/effect/landmark/ore_vein/uranium = 3,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)

/obj/effect/spawner/lootdrop/ore_vein/sand
	name = "sand ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 3,
		/obj/effect/landmark/ore_vein/glass = 3,
		/obj/effect/landmark/ore_vein/silver = 5,
		/obj/effect/landmark/ore_vein/gold = 2,
		/obj/effect/landmark/ore_vein/diamond = 3,
		/obj/effect/landmark/ore_vein/titanium = 5,
		/obj/effect/landmark/ore_vein/uranium = 3,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)

/*
/obj/effect/spawner/lootdrop/ore_vein/shrouded
	name = "shrouded ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 3,
		/obj/effect/landmark/ore_vein/glass = 3,
		/obj/effect/landmark/ore_vein/silver = 5,
		/obj/effect/landmark/ore_vein/gold = 2,
		/obj/effect/landmark/ore_vein/diamond = 3,
		/obj/effect/landmark/ore_vein/titanium = 5,
		/obj/effect/landmark/ore_vein/uranium = 3,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)
*/

/obj/effect/spawner/lootdrop/ore_vein/snow
	name = "snow ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 3,
		/obj/effect/landmark/ore_vein/glass = 5,
		/obj/effect/landmark/ore_vein/silver = 2,
		/obj/effect/landmark/ore_vein/gold = 2,
		/obj/effect/landmark/ore_vein/diamond = 3,
		/obj/effect/landmark/ore_vein/titanium = 3,
		/obj/effect/landmark/ore_vein/uranium = 3,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)

/obj/effect/spawner/lootdrop/ore_vein/waste
	name = "waste ore vein spawner"
	loot = list(
		/obj/effect/landmark/ore_vein/iron = 5,
		/obj/effect/landmark/ore_vein/glass = 5,
		/obj/effect/landmark/ore_vein/silver = 5,
		/obj/effect/landmark/ore_vein/gold = 5,
		/obj/effect/landmark/ore_vein/diamond = 5,
		/obj/effect/landmark/ore_vein/titanium = 5,
		/obj/effect/landmark/ore_vein/uranium = 5,
		/obj/effect/landmark/ore_vein/bananium = 0.1
	)

/obj/machinery/deepcore/hopper
	name = "блюспейс рудоприемник"
	desc = "Машина, предназначенная для приема руды от любых подключенных к ней буров глубокого погружения посредством блюспейс телепортации."
	icon_state = "hopper_off"
	density = TRUE
	idle_power_usage = 5
	active_power_usage = 50
	anchored = FALSE
	circuit = /obj/item/circuitboard/machine/deepcore/hopper
	processing_flags = START_PROCESSING_MANUALLY

	var/active = FALSE
	var/mult = 1
	var/list/storage = list(
		/obj/item/stack/ore/iron = 0,
		/obj/item/stack/ore/glass = 0,
		/obj/item/stack/ore/silver = 0,
		/obj/item/stack/ore/gold = 0,
		/obj/item/stack/ore/diamond = 0,
		/obj/item/stack/ore/plasma = 0,
		/obj/item/stack/ore/uranium = 0,
		/obj/item/stack/ore/titanium = 0,
		/obj/item/stack/ore/bluespace_crystal = 0,
		/obj/item/stack/ore/bananium = 0
	)
	var/storage_volume = 10000 //how many units of each material type can be stored (2000 material is still 1 sheet)
	var/eject_speed = 1 //how much time in seconds between each material type being shat out
	var/ejecting = FALSE

/obj/machinery/deepcore/hopper/RefreshParts()
	. = ..()
	var/MM_value = 0
	var/MM_amount = 0
	for(var/obj/item/stock_parts/manipulator/MM in component_parts)
		MM_value += MM.rating
		MM_amount++
	mult = MM_value/MM_amount

	storage_volume = 0
	for(var/obj/item/stock_parts/matter_bin/part in component_parts)
		storage_volume += part.rating*2000

	for(var/obj/item/stock_parts/capacitor/cap in component_parts) // fuck it, a for loop for a single item in the list
		eject_speed = 1.25 - 0.25 * cap.rating

/obj/machinery/deepcore/hopper/examine(mob/user)
	. = ..()
	if(!ejecting)
		. += "<br>Хранилище воронки содержит в себе"
		var/list/orelist = list()
		for(var/mat in storage)
			var/obj/item/stack/ore/O = mat
			var/amount = storage[mat]
			if(amount)
				orelist.Add("<i>[initial(O.name)]</i> - <b>[amount]</b> ед.<br>")
		if(orelist.len)
			. += ":<br>"
			. += orelist
		else
			. += " целое ничего. [pick(30;"Удивительно.", 30;"Поразительно.", 30;"Интересно.", 10;"Охуеть не встать.")]"
	else
		. += "Воронка находится в процессе выброса руд."
/obj/machinery/deepcore/hopper/AltClick(mob/user)
	if(!active)
		to_chat(user, span_alert("Turn on the hopper bfore flushing the materials!"))
		return

	if(prob(1)) //lol
		user.say(pick(
			"Po twojej pysznej zupie", \
			"Nie ruszam dupy z klopa", \
			"Ta zupa była z mlekiem", \
			"Na mleko mam alergię"))
		to_chat(user, "<span clas=='notice'>You tell the hopper to shit out the materials <b>right now</b>[eject_materials(TRUE) ? ", and it complies." : ", but nothing happens."]</span>")
		return
	to_chat(user, "<span clas=='notice'>You press a button on the hopper marked \"Eject materials\"[eject_materials() ? ", and it starts to vibrate slightly." : ", but nothing happens."]</span>")

/obj/machinery/deepcore/hopper/interact(mob/user, special_state)
	. = ..()
	if(active)
		active = FALSE
		use_power = IDLE_POWER_USE
		to_chat(user, span_notice("You deactiveate [src.name]"))
	else
		if(!powered(power_channel))
			to_chat(user, span_warning("Unable to activate [src.name]! Insufficient power."))
			return
		active = TRUE
		use_power = ACTIVE_POWER_USE
		to_chat(user, span_notice("You activeate [src.name]"))
	update_icon_state()

/obj/machinery/deepcore/hopper/multitool_act(mob/living/user, obj/item/multitool/I)
	. = ..()
	if(!istype(I))
		return FALSE
	I.buffer = src
	to_chat(user, span_notice("You save the hopper's bluespace signature onto the multitool.[prob(2) ? " Jeez, apparently multitools, after all, <i>do</i> combine a lot of tools together." : ""]"))
	return TRUE

/obj/machinery/deepcore/hopper/process(delta_time)
	if(!anchored)
		active = FALSE
		update_icon_state()
		return PROCESS_KILL
	else if(active)
		eject_materials(TRUE)

/obj/machinery/deepcore/hopper/update_icon_state()
	. = ..()
	if(powered(power_channel) && anchored)
		if(active)
			icon_state = "hopper_on"
		else
			icon_state = "hopper_off"
	else
		icon_state = "hopper_nopower"

/obj/machinery/deepcore/hopper/can_be_unfasten_wrench(mob/user, silent)
	if(active)
		to_chat(user, span_warning("Turn [src.name] off first!"))
		return FAILED_UNFASTEN
	return ..()

/obj/machinery/deepcore/hopper/wrench_act(mob/living/user, obj/item/I)
	. = ..()
	if(default_unfasten_wrench(user, I))
		update_icon_state()
		return TRUE

/obj/machinery/deepcore/hopper/proc/try_add_material(amount, mat_typepath)
	if(!active)
		return
	var/current_mat = storage[mat_typepath]
	if(isnull(current_mat))
		stack_trace("Hopper tried to add a material that is not listed in it's storage. This should not happen.")
	storage[mat_typepath] = min(storage_volume, current_mat + amount)

/obj/machinery/deepcore/hopper/proc/eject_materials(instant = FALSE)
	for(var/mat in storage)
		if(storage[mat] >= 2000 && !ejecting)
			ejecting = TRUE
			spawn(eject_speed * 2 SECONDS) // this is dumb
				_eject_materials(instant) // probably shouldn't do this
			return TRUE // fuck it
	return FALSE

/obj/machinery/deepcore/hopper/proc/_eject_materials(instant = FALSE)
	for(var/mat in storage)
		if(storage[mat] < 2000)
			continue
		if(!anchored || !active || !powered(power_channel))
			say("No powernet connection, aborting.")
			break
		for(var/m = storage[mat], m >= 2000, m -= 2000) //fucking byond kept trowing a warning here for "StAtEmEnT hAs No EfEcT" if i used storage[mat] directly istead of a var/m
			new mat(get_step(src, dir))		// statement has no effect my ass
			. = TRUE
			storage[mat] = m
		if(!instant)
			sleep(eject_speed SECONDS)
	ejecting = FALSE
/obj/machinery/deepcore/hopper/anchored
	anchored = 1
