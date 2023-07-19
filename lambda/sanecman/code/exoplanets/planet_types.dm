/*
// Это говно сложнее кодить короче потом
/datum/planet_type/random
	name = "экзопланета"
	desc = "Планетарный биом неизвестного типа."
	planet = DYNAMIC_WORLD_RANDOM
	icon_state = "globe"
	color = COLOR_STRONG_VIOLET
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_RANDOM
	danger_level = 5
*/
/*
// Закончу позже как перенесу спрайты и вещи с бэя
/datum/planet_type/ruined_city
	name = "планета-город" //Планета-улей с ядерными точками, хуй знает как правильно написать
	desc = "Планетарный биом, являющийся одним большим мёртвым городом после техногенной катастрофы."
	planet = DYNAMIC_WORLD_RUINED_CITY
	icon_state = "globe"
	color = COLOR_SILVER
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_RUINED_CITY
	danger_level = 5

/datum/planet_type/robotic_guardians
	name = "планета-улей" //планета-улей хайвботов, планета-металл, металлическая планета
	desc = "Планетарный биом, полностью состоящий из металла." //Metallica
	planet = DYNAMIC_WORLD_ROBOTIC_GUARDIANS
	icon_state = "globe"
	color = COLOR_GRAY
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_ROBOTIC_GUARDIANS
	danger_level = 5

/datum/planet_type/barren
	name = "бесплодная планета" //Безжизненная, бесплодная, нужное вписать
	desc = "Планетарный биом без признаков атмосферы."
	planet = DYNAMIC_WORLD_BARREN
	icon_state = "globe"
	color = COLOR_ASSEMBLY_BLACK
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_BARREN
	danger_level = 3

/datum/planet_type/chlorine
	name = "хлористая планета"
	desc = "Планетарный биом, экосистема которого состоит из хлора."
	planet = DYNAMIC_WORLD_CHLORINE
	icon_state = "globe"
	color = COLOR_VERY_SOFT_YELLOW
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_CHLORINE
	danger_level = 4

/datum/planet_type/desert
	name = "пустынная планета"
	desc = "Планетарный биом, характеризующийся засушливой погодой, песками и разнообразной флорой и фауной."
	planet = DYNAMIC_WORLD_BAYDESERT
	icon_state = "globe"
	color = COLOR_YELLOW
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_BAYDESERT
	danger_level = 2

/datum/planet_type/grass
	name = "болотистая планета" //По сути джунглиевая но такая планета есть в шиптесте
	desc = "Планетарный биом, характеризующийся обилием флоры и фауны."
	planet = DYNAMIC_WORLD_GRASS
	icon_state = "globe"
	color = COLOR_GREEN
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_GRASS
	danger_level = 3

/datum/planet_type/grass_terraformed
	name = "терраформированная планета" //На бэе подтип джунглиевой бэевской но тут пусть будет отдельно
	desc = "Планетарный биом, характеризующийся обилием флоры и фауны. Имеет признаки терраформации человеком."
	planet = DYNAMIC_WORLD_GRASS_TERRAFORMED
	icon_state = "globe"
	color = COLOR_GREEN
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_GRASS_TERRAFORMED
	danger_level = 1

/datum/planet_type/shrouded
	name = "теневая планета"
	desc = "Планетарный биом, характеризующийся вечным штормом причудливых, поглощающих свет частиц."
	planet = DYNAMIC_WORLD_SHROUDED
	icon_state = "globe"
	color = COLOR_ASSEMBLY_PURPLE
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_SHROUDED
	danger_level = 4

/datum/planet_type/snow
	name = "холодная планета" //Отличие от айсбокса в том что тут обилие снега и всё
	desc = "Планетарный биом, характеризующийся пониженной температурой, пингвинами и обилием снега."
	planet = DYNAMIC_WORLD_SNOW
	icon_state = "globe"
	color = COLOR_VERY_LIGHT_GRAY
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_SNOW
	danger_level = 2
*/
/*
/datum/planet_type/volcanic //Аналог лаваленда с бэя? Похуй?
	name = "горячая планета" //Похуй
	desc = "Планетарный биом, характеризующийся жарким и засушливым климатом."
	planet = DYNAMIC_WORLD_VOLCANIC
	icon_state = "globe"
	color = COLOR_MOSTLY_PURE_RED
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_VOLCANIC
	danger_level = 2
*/
