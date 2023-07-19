/datum/game_mode/fortress
	name = "крепость"
	config_tag = "fortress"
	report_type = "extended"
	false_report_weight = 0
	required_players = 0

	announce_span = "warning"
	announce_text = "Сектор представляет значительный интерес для корпораций и группировок."

	title_icon = "shiptest"

/datum/game_mode/fortress/pre_setup()
	//Костыли

	var/planet_type = DYNAMIC_WORLD_SHROUDED //Мусорная планета

	var/ruin_target = /datum/map_template/ruin/icemoon/slimelab //Лаба слаймов с ледяной планеты

	var/list/position = list()
	position = SSovermap.get_unused_overmap_square()

	message_admins("Режим крепость: Generating a new Planet with ruin: [ruin_target], this may take some time!")
	var/datum/overmap/dynamic/encounter = new(position, FALSE)
	encounter.force_encounter = planet_type
	encounter.template = ruin_target
	encounter.choose_level_type(FALSE)
	if(!ruin_target)
		encounter.ruin_type = null
	encounter.preserve_level = TRUE
	encounter.load_level()

	message_admins(span_big("Режим крепость: Click here to jump to the overmap token: " + ADMIN_JMP(encounter.token)))
	message_admins(span_big("Режим крепость: Click here to jump to the overmap dock: " + ADMIN_JMP(encounter.reserve_docks[1])))
	for(var/ruin in encounter.ruin_turfs)
		var/turf/ruin_turf = encounter.ruin_turfs[ruin]
		message_admins(span_big("Режим крепость: Click here to jump to \"[ruin]\": " + ADMIN_JMP(ruin_turf)))
	return ..()

/datum/game_mode/fortress/post_setup()
	return TRUE

/datum/game_mode/fortress/generate_report()
	return "Правительство Солнечной Федерации получили сигнал бедствия с планеты где находился один из административных корпусов данного сектора. Так как данный сектор не находится ни под одной юрисдикцией мы просим вас, обычных путешественников и пилотов помочь нам расследовать это дело."

/datum/game_mode/fortress/generate_station_goals()
	for(var/T in subtypesof(/datum/station_goal))
		var/datum/station_goal/G = new T
		station_goals += G
		G.on_report()

/datum/game_mode/fortress/announced/send_intercept(report = 0)
	priority_announce("Мы получили сигнал бедствия с планеты где находился один из наших административных корпусов данного сектора. Так как данный сектор не находится под нашей юрисдикцией уже половину века мы просим вас, обычных путешественников и пилотов помочь нам расследовать это дело.", "SolGov Report", 'sound/ai/commandreport.ogg')
