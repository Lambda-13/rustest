//big thanks to ninja and ma44 on coderbus for solving my autism
/*obj/item/circuitboard/machine/bluespace_miner
	name = "блюспейс майнер"
	desc = "Машина, которая использует блюспейс магию для медленного создания ресурсов и перемещает их в связанный рудный бункер."
	build_path = /obj/machinery/mineral/bluespace_miner
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stack/ore/bluespace_crystal = 3)
	needs_anchored = FALSE

/obj/machinery/mineral/bluespace_miner
	name = "блюспейс майнер"
	desc = "Невероятно опасный агрегат, который использует блюспейс магию для медленного создания ресурсов и переноса их в связанный рудный бункер."
	icon = 'lambda/MrSamu99/modules/bluespace_miner/icons/miner.dmi'
	icon_state = "bsm_idle"
	density = TRUE
	circuit = /obj/item/circuitboard/machine/bluespace_miner
	layer = BELOW_OBJ_LAYER
	var/list/ores = list(
			/datum/material/iron = 600,
			/datum/material/glass = 600,
			/datum/material/plasma = 400,
			/datum/material/silver = 400,
			/datum/material/gold = 250,
			/datum/material/titanium = 250,
			/datum/material/uranium = 250,
			/datum/material/bananium = 90,
			/datum/material/diamond = 90,
			/datum/material/bluespace = 90
		)
	var/datum/component/remote_materials/materials
	var/mine_rate = 1
	var/atom/movable/warp_effect/warp

/obj/machinery/mineral/bluespace_miner/update_icon_state()
	. = ..()
	if(panel_open)
		icon_state = "bsm_t"
	else if(!powered())
		icon_state = "bsm_off"
	else if(!materials?.silo || materials?.on_hold())
		icon_state = "bsm_idle"
	else
		icon_state = "bsm_on"

/obj/machinery/mineral/bluespace_miner/RefreshParts()
	. = ..()
	var/tot_rating = 0
	for(var/obj/item/stock_parts/SP in src)
		tot_rating += SP.rating
	mine_rate = tot_rating

/obj/machinery/mineral/bluespace_miner/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSmachines, src)
	materials = AddComponent(/datum/component/remote_materials, "bsm", mapload)

	warp = new(src)
	vis_contents += warp

/obj/machinery/mineral/bluespace_miner/Destroy()
	materials = null
	STOP_PROCESSING(SSmachines, src)

	vis_contents -= warp
	warp = null
	QDEL_NULL(warp)

	return ..()

/obj/machinery/mineral/bluespace_miner/multitool_act(mob/living/user, obj/item/multitool/I)
	. = ..()
	if (istype(I))
		to_chat(user, span_notice("Обновляю буфер майнера буфером мультитула."))
		materials?.silo = I.buffer
		return TRUE
	else
		to_chat(user, span_notice("Буфер пуст."))
		return FALSE

/obj/machinery/mineral/bluespace_miner/examine(mob/user)
	. = ..()
	. += "<hr>"
	. += span_notice("Скорость сбора ресурсов [mine_rate]")
	if(!materials?.silo)
		. += span_notice("\nБункер для руды не подключен. Используйте многофункциональный инструмент, чтобы связать бункер для руды с этой машиной.")
	else if(materials?.on_hold())
		. += span_warning("\nДоступ к рудным бункерам заблокирован, обратитесь к завхозу.")

/obj/machinery/mineral/bluespace_miner/attackby(obj/item/O, mob/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(default_deconstruction_screwdriver(user, "bsm_t", "bsm_off", O))
		update_icon_state()
		return

/obj/machinery/mineral/bluespace_miner/process()
	if(!materials?.silo || materials?.on_hold())
		update_icon_state()
		return

	var/datum/component/material_container/mat_container = materials.mat_container
	if(!mat_container || panel_open || !powered())
		update_icon_state()
		return

	var/datum/material/ore = pick_weight(ores)
	if(!mat_container.can_hold_material(ore))
		WARNING("Валера, твой блюспейс майнер опять обосрался!!! Причина: [ore]")
		return

	for(var/obj/O in orange(4, src))
		if(!O.anchored)
			step_towards(O, src)

	for(var/mob/living/near in orange(4, src))
		if(!near.mob_negates_gravity())
			step_towards(near, src)

		if (HAS_TRAIT(near, TRAIT_SUPERMATTER_MADNESS_IMMUNE) || (near.mind && HAS_TRAIT(near.mind, TRAIT_SUPERMATTER_MADNESS_IMMUNE)))
			continue

		if (near.is_blind())
			continue

		var/dist = sqrt(1 / max(1, get_dist(near, get_turf(src))))
		near.hallucination += 50 * dist
		near.hallucination = clamp(near.hallucination, 0, 150)
		var/list/messages = list(
			"Сознание разваливается!",
			"Реальность оборачивается вокруг меня!",
			"Кто-то что-то шепчет!",
			"ААААААААААААААА!",
		)
		to_chat(near, span_warning(pick(messages)))


	animate(warp, time = 3, transform = matrix().Scale(0.5,0.5))
	animate(time = 7, transform = matrix())

	materials.mat_container.insert_amount_mat(mine_rate, ore)
	update_icon_state()*/

/obj/machinery/bluespace_miner
	name = "блюспейс майнер"
	desc = "Агрегат, который использует блюспейс магию для медленного создания ресурсов и переноса их в связанный рудный бункер."
	icon = 'lambda/MrSamu99/modules/bluespace_miner/icons/miner.dmi'
	icon_state = "bsm_idle"

	density = TRUE
	circuit = /obj/item/circuitboard/machine/bluespace_miner
	idle_power_usage = 300

	///the temperature of the co2 produced per successful process (its really 100) KELVIN
	var/gas_temp = 100
	///the amount of seconds process_speed goes on cooldown for
	var/processing_speed = 6 SECONDS
	///the amount of sheets we get
	var/mine_rate = 1
	///the chance each ore has to be picked, weighted list
	var/list/ore_chance = list(
		/obj/item/stack/sheet/metal = 20,
		/obj/item/stack/sheet/glass = 20,
		/obj/item/stack/sheet/mineral/plasma = 14,
		/obj/item/stack/sheet/mineral/silver = 8,
		/obj/item/stack/sheet/mineral/titanium = 8,
		/obj/item/stack/sheet/mineral/uranium = 3,
		/obj/item/stack/sheet/mineral/gold = 3,
		/obj/item/stack/sheet/mineral/diamond = 1,
	)
	var/datum/component/remote_materials/materials //connected silo
	COOLDOWN_DECLARE(process_speed)

/obj/machinery/bluespace_miner/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSmachines, src)
	materials = AddComponent(/datum/component/remote_materials, "bsm", mapload)

/obj/machinery/bluespace_miner/Destroy()
	materials = null
	STOP_PROCESSING(SSmachines, src)
	return ..()

/obj/machinery/bluespace_miner/RefreshParts()
	. = ..()

	/*gas_temp = 100 //starts at 100, should go down to 80 at most.
	for(var/datum/stock_part/micro_laser/laser_part in component_parts)
		gas_temp -= (laser_part.tier * 5)*/

	processing_speed = 6 SECONDS //starts at 6 seconds, should go down to 4 seconds at most.
	for(var/obj/item/stock_parts/manipulator/manipulator_part in component_parts)
		processing_speed -= (manipulator_part.rating * (0.5 SECONDS))

/obj/machinery/bluespace_miner/multitool_act(mob/living/user, obj/item/multitool/I)
	. = ..()
	if (istype(I))
		to_chat(user, span_notice("Обновляю буфер майнера буфером мультитула."))
		materials?.silo = I.buffer
		return TRUE
	else
		to_chat(user, span_notice("Буфер пуст."))
		return FALSE

/obj/machinery/bluespace_miner/update_icon_state()
	. = ..()
	if(panel_open)
		icon_state = "bsm_t"
	else if(machine_stat & (NOPOWER|BROKEN))
		icon_state = "bsm_off"
	else if(!materials?.silo || materials?.on_hold())
		icon_state = "bsm_idle"
	else
		icon_state = "bsm_on"

/obj/machinery/bluespace_miner/attackby(obj/item/O, mob/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(default_deconstruction_screwdriver(user, "bsm_t", "bsm_off", O))
		update_icon_state()
		return

/obj/machinery/bluespace_miner/examine(mob/user)
	. = ..()
	. += "<hr>"
	. += span_notice("[processing_speed*0.1] секунд для одной партии ресурсов")
	if(!materials?.silo)
		. += span_notice("\nБункер для руды не подключен. Используйте многофункциональный инструмент, чтобы связать бункер для руды с этой машиной.")
	else if(materials?.on_hold())
		. += span_warning("\nДоступ к рудным бункерам заблокирован, обратитесь к завхозу.")

//we need to make sure we can actually print the ores out
/obj/machinery/bluespace_miner/proc/check_factors()
	if(!COOLDOWN_FINISHED(src, process_speed))
		return FALSE
	COOLDOWN_START(src, process_speed, processing_speed)
	// cant be broken or unpowered
	if(machine_stat & (NOPOWER|BROKEN))
		return FALSE
	// cant be unanchored or open panel
	if(!anchored || panel_open)
		return FALSE
	/*for(var/obj/machinery/bluespace_miner/bs_miner in range(1, src))
		if(bs_miner != src)
			return FALSE
	var/turf/src_turf = get_turf(src)
	var/datum/gas_mixture/environment = src_turf.return_air()
	// if its hotter than (or equal to) room temp, don't work
	if(environment.temperature >= T20C)
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, FALSE)
		return FALSE
	// if its lesser than(or equal to) normal pressure, don't work
	if(environment.return_pressure() <= ONE_ATMOSPHERE)
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, FALSE)
		return FALSE
	// overpressurizing will cause nuclear particles...
	if(environment.return_pressure() >= (ONE_ATMOSPHERE * 1.5))
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, FALSE)
		return FALSE
	//add amount_produced degrees to the temperature
	var/datum/gas_mixture/merger = new
	merger.assert_gas(/datum/gas/carbon_dioxide)
	merger.gases[/datum/gas/carbon_dioxide][MOLES] = MOLES_CELLSTANDARD
	if(obj_flags & EMAGGED)
		merger.assert_gas(/datum/gas/tritium)
		merger.gases[/datum/gas/tritium][MOLES] = MOLES_CELLSTANDARD
	merger.temperature = (T20C + gas_temp)
	src_turf.assume_air(merger)*/
	return TRUE

//if check_factors is good, then we spawn materials
/obj/machinery/bluespace_miner/proc/spawn_mats()
	var/obj/chosen_sheet = pickweight(ore_chance)
	new chosen_sheet(get_turf(src))

/obj/machinery/bluespace_miner/process()
	if(!check_factors())
		update_icon_state()
		return
	//var/obj/chosen_sheet = pickweight(ore_chance)
	playsound(src, 'sound/machines/ping.ogg', 50, FALSE)
	//materials.mat_container.insert_item_materials(chosen_sheet)
	spawn_mats()
	update_icon_state()

/obj/machinery/bluespace_miner/crowbar_act(mob/living/user, obj/item/tool)
	if(default_deconstruction_crowbar(tool))
		return TRUE

/obj/item/circuitboard/machine/bluespace_miner
	name = "плата блюспейс майнера"
	desc = "Блюспейс майнер это машина, которая с помощью магии блюспейса производит материалы"
	//greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/bluespace_miner
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stack/ore/bluespace_crystal/refined = 1,
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/micro_laser = 2,
		/obj/item/stock_parts/manipulator = 2,
	)
	needs_anchored = TRUE

/*datum/supply_pack/misc/bluespace_miner
	name = "Блюспейс майнер"
	desc = "Нанотрейзен совершила революцию в обработке материалов с помощью блюспейса-- представляя блюспейс майнер!"
	cost = /*CARGO_CRATE_VALUE * 150 */ 30000
	contains = list(/obj/item/circuitboard/machine/bluespace_miner)
	crate_name = "Ящик с блюспейс майнером"
	crate_type = /obj/structure/closet/crate*/

// if we were going to go research based
/datum/design/board/bluespace_miner
	name = "Machine Design (Bluespace Miner)"
	desc = "Allows for the construction of circuit boards used to build a bluespace miner."
	id = "bluespace_miner"
	build_path = /obj/item/circuitboard/machine/bluespace_miner
	category = list("Misc. Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_ENGINEERING

/*datum/experiment/scanning/points/bluespace_miner
	name = "Bluespace Miner"
	description = "We can learn from the past technology and create a better future-- with bluespace miners."
	required_points = 5
	required_atoms = list(
		/obj/item/xenoarch/broken_item/tech = 1,
	)*/

/datum/techweb_node/bluespace_miner
	id = "bluespace_miner"
	display_name = "Bluespace Miner"
	description = "The future is here, where we can mine ores from the great bluespace sea."
	prereq_ids = list("anomaly_research", "bluespace_power")
	design_ids = list(
		"bluespace_miner",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 30000)
	//discount_experiments = list(/datum/experiment/scanning/points/bluespace_miner = 5000)
