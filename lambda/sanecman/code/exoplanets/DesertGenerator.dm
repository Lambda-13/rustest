//Код пустыни
// Выполнено:
// Тайлы +
// Стены +
// Атмос +
// Датум генерации карты +
// Руины
// Дефаины +
// Растения
// Мобы +-
// Протестировано
// Оценено
// Допилено
// Протестировано снова
// Если всё то удалить данные комментарии
// Завершить
/*
/datum/map_generator/planet_generator/exoplanet_desert
	mountain_height = 0.8
	perlin_zoom = 65

	primary_area_type = /area/overmap_encounter/planetoid/sand

	// these are largely placeholder biomes and could do with being improved
	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/desert
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/desert
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/desert
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/desert
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY =/datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/desert
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/desert
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/desert
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/desert,
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/desert
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/desert,
			BIOME_LOW_HUMIDITY = /datum/biome/desert,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/desert,
			BIOME_HIGH_HUMIDITY = /datum/biome/desert,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/desert,
		)
	)

/datum/biome/desert
	open_turf_types = list(/turf/open/floor/plating/asteroid/desert/lit = 1)
	flora_spawn_chance = 3
	flora_spawn_list = list(
		/obj/structure/flora/ash/leaf_shroom = 4 ,
		/obj/structure/flora/ash/cap_shroom = 4 ,
		/obj/structure/flora/ash/stem_shroom = 4 ,
	)
	feature_spawn_chance = 0.1
	feature_spawn_list = list(/obj/structure/geyser/random = 1)
	mob_spawn_chance = 1
	mob_spawn_list = list(
		/mob/living/simple_animal/thinbug = 30,
		/mob/living/simple_animal/tindalos = 30,
		/mob/living/simple_animal/hostile/voxslug = 30,
		/mob/living/simple_animal/hostile/antlion = 30,
	)

/datum/biome/cave/desert
	closed_turf_types = list(/turf/closed/mineral/random/desert = 1)
	open_turf_types = list(/turf/open/floor/plating/asteroid/desert = 5)
	flora_spawn_chance = 1
	flora_spawn_list = list(
		/obj/structure/flora/rock = 1,
		/obj/structure/flora/rock/pile = 2,
		/obj/structure/flora/ash/fern = 1,
		/obj/structure/flora/ash/puce = 1,
	)
	feature_spawn_list = list(/obj/structure/geyser/random = 1)
	mob_spawn_chance = 1
	mob_spawn_list = list(
		/mob/living/simple_animal/thinbug = 30,
		/mob/living/simple_animal/tindalos = 30,
		/mob/living/simple_animal/hostile/voxslug = 30,
		/mob/living/simple_animal/hostile/antlion = 30,
	)
*/
