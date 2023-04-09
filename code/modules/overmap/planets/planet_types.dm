/datum/planet_type
	var/name = "планета"
	var/desc = "Планета."
	var/planet = null
	var/ruin_type = null
	var/mapgen = null
	var/default_baseturf = null
	var/weather_controller_type = null
	var/icon_state = "globe"
	var/color = "#ffffff"
	var/weight = 20
	var/danger_level = 0

/datum/planet_type/lava
	name = "лавовая планета"
	desc = "Очень слабый энергетический сигнал, исходящий от планеты с высокой сейсмической и вулканической активностью."
	planet = DYNAMIC_WORLD_LAVA
	icon_state = "globe"
	color = COLOR_ORANGE
	mapgen = /datum/map_generator/planet_generator/lava
	default_baseturf = /turf/open/floor/plating/asteroid/basalt/lava
	weather_controller_type = /datum/weather_controller/lavaland
	ruin_type = RUINTYPE_LAVA
	danger_level = 3

/datum/planet_type/ice
	name = "ледяная планета"
	desc = "Очень слабый энергетический сигнал, исходящий от планеты со следами воды и экстремально низкой температурой."
	planet = DYNAMIC_WORLD_ICE
	icon_state = "globe"
	color = COLOR_BLUE_LIGHT
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_ICE
	danger_level = 3

/datum/planet_type/jungle
	name = "лесная планета"
	desc = "Очень слабый энергетический сигнал, исходящий от планеты, изобилующей жизнью."
	planet = DYNAMIC_WORLD_JUNGLE
	icon_state = "globe"
	color = COLOR_LIME
	mapgen = /datum/map_generator/planet_generator/jungle
	default_baseturf = /turf/open/floor/plating/dirt/jungle
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_JUNGLE
	danger_level = 2

/datum/planet_type/rock
	name = "каменистая планета"
	desc = "Очень слабый энергетический сигнал, исходящий от богатой железом каменистой планеты."
	planet = DYNAMIC_WORLD_ROCKPLANET
	icon_state = "globe"
	color = "#bd1313"
	mapgen = /datum/map_generator/planet_generator/rock
	default_baseturf = /turf/open/floor/plating/asteroid
	weather_controller_type = /datum/weather_controller/rockplanet
	ruin_type = RUINTYPE_ROCK
	danger_level = 3

/datum/planet_type/sand
	name = "пустынная планета"
	desc = "Очень слабый энергетический сигнал, исходящий от планеты со множеством следов кремния."
	planet = DYNAMIC_WORLD_SAND
	icon_state = "globe"
	color = COLOR_GRAY
	mapgen = /datum/map_generator/planet_generator/sand
	default_baseturf = /turf/open/floor/plating/asteroid/whitesands
	weather_controller_type = /datum/weather_controller/desert
	ruin_type = RUINTYPE_SAND
	danger_level = 2

/datum/planet_type/beach
	name = "океаническая планета"
	desc = "Очень слабый энергетический сигнал, исходящий от теплой, богатой кислородом планеты."
	planet = DYNAMIC_WORLD_BEACHPLANET
	icon_state = "globe"
	color = "#c6b597"
	mapgen = /datum/map_generator/planet_generator/beach
	default_baseturf = /turf/open/floor/plating/asteroid/sand/lit
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_BEACH
	danger_level = 1

/datum/planet_type/reebe
	name = "???"
	desc = "Какой-то странный портал. Нет никакой информации что это такое."
	planet = DYNAMIC_WORLD_REEBE
	icon_state = "wormhole"
	color = COLOR_YELLOW
	mapgen = /datum/map_generator/single_biome/reebe
	default_baseturf = /turf/open/chasm/reebe_void
	weather_controller_type = null
	weight = 0
	ruin_type = RUINTYPE_YELLOW
	danger_level = 4

/datum/planet_type/asteroid
	name = "большой астеройд"
	desc = "Крупный астероид со значительными следами полезных ископаемых."
	planet = DYNAMIC_WORLD_ASTEROID
	icon_state = "asteroid"
	color = COLOR_GRAY
	mapgen = /datum/map_generator/single_biome/asteroid
	// Space, because asteroid maps also include space turfs and the prospect of space turfs
	// existing without space as their baseturf scares me.
	default_baseturf = /turf/open/space
	weather_controller_type = null
	ruin_type = null // asteroid ruins when
	danger_level = 1

/datum/planet_type/spaceruin
	name = "слабый энергетический сигнал"
	desc = "Очень слабый энергетический сигнал от неизвестной структуры."
	planet = DYNAMIC_WORLD_SPACERUIN
	icon_state = "strange_event"
	color = null
	mapgen = /datum/map_generator/single_turf/space
	default_baseturf = /turf/open/space
	weather_controller_type = null
	ruin_type = RUINTYPE_SPACE
	danger_level = 0
