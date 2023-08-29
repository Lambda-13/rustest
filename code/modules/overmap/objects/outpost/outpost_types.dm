/*
	Map templates
*/

/datum/map_template/outpost/New()
	. = ..(path = "_maps/outpost/[name].dmm")

/datum/map_template/outpost/hangar
	var/dock_width
	var/dock_height

// Аванпост оффов который создан для примера
/datum/map_template/outpost/outpost_test_1
	name = "outpost_test_1"

// Аванпост оффов который выглядит намного лучше чем прошлый аванпост но всё ещё всрато
/datum/map_template/outpost/outpost_test_2
	name = "outpost_test_2"

// Аванпост от бандермена и санекмена
/datum/map_template/outpost/banderstadt
	name = "outpost_banderstadt"

/datum/map_template/outpost/elevator_test
	name = "elevator_test"


/datum/map_template/outpost/hangar/test_20x20
	name = "hangar/test_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/test_40x20
	name = "hangar/test_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/test_40x40
	name = "hangar/test_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/test_56x20
	name = "hangar/test_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/test_56x40
	name = "hangar/test_56x40"
	dock_width = 56
	dock_height = 40


/datum/map_template/outpost/hangar/test_2_20x20
	name = "hangar/test_2_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/test_2_40x20
	name = "hangar/test_2_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/test_2_40x40
	name = "hangar/test_2_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/test_2_56x20
	name = "hangar/test_2_56x20"
	dock_width = 56
	dock_height = 20

// Лямбдовские ангары
/datum/map_template/outpost/hangar/banderstadt_20x20
	name = "hangar/bandera/bandera_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/banderstadt_40x20
	name = "hangar/bandera/bandera_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/banderstadt_40x40
	name = "hangar/bandera/bandera_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/banderstadt_56x20
	name = "hangar/bandera/bandera_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/banderstadt_56x40
	name = "hangar/bandera/bandera_56x40"
	dock_width = 56
	dock_height = 40

// does not currently exist
// /datum/map_template/outpost/hangar/test_2_56x40
// 	name = "hangar/test_2_56x40"
// 	dock_width = 56
// 	dock_height = 40

/*
	/datum/overmap/outpost subtypes
*/

//Аванпосты оффов
//Выпилены ибо хуйня
/*
/datum/overmap/outpost/test_1
	token_icon_state = "station_1"
	main_template = /datum/map_template/outpost/outpost_test_1
	elevator_template = /datum/map_template/outpost/elevator_test
	// Uses "test" hangars.

/datum/overmap/outpost/test_2
	token_icon_state = "station_asteroid_0"
	main_template = /datum/map_template/outpost/outpost_test_2
	elevator_template = /datum/map_template/outpost/elevator_test
	// Using an (incomplete) second list of hangar templates. Note that the 56x40 hangar is the first skin.
	hangar_templates = list(
		/datum/map_template/outpost/hangar/test_2_20x20,
		/datum/map_template/outpost/hangar/test_2_40x20,
		/datum/map_template/outpost/hangar/test_2_40x40,
		/datum/map_template/outpost/hangar/test_2_56x20,
		/datum/map_template/outpost/hangar/test_56x40
	)
*/

// НАШ ответ аванпостам оффов
/datum/overmap/outpost/banderastation
	token_icon_state = "station_1"
	main_template = /datum/map_template/outpost/banderstadt
	elevator_template = /datum/map_template/outpost/elevator_test
	hangar_templates = list(
		/datum/map_template/outpost/hangar/banderstadt_2_20x20,
		/datum/map_template/outpost/hangar/banderstadt_2_40x20,
		/datum/map_template/outpost/hangar/banderstadt_2_40x40,
		/datum/map_template/outpost/hangar/banderstadt_2_56x20,
		/datum/map_template/outpost/hangar/banderstadt_56x40
	)

/datum/overmap/outpost/no_main_level // For example and adminspawn.
	main_template = null
	elevator_template = /datum/map_template/outpost/elevator_test
	// Uses "test" hangars.
