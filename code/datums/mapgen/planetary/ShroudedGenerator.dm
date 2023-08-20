//Ported with bay12 by sanecman
//Портировано с бэй12 санекменом
/datum/map_generator/planet_generator/shrouded

	mountain_height = 0.35
	perlin_zoom = 40

	initial_closed_chance = 45
	smoothing_iterations = 20
	birth_limit = 4
	death_limit = 3
	primary_area_type = /area/overmap_encounter/planetoid/shroudedplanet

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/shrouded/crater,
			BIOME_LOW_HUMIDITY = /datum/biome/shrouded/crater,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/shrouded/clearing,
			BIOME_HIGH_HUMIDITY = /datum/biome/shrouded/clearing/mushroom,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/shrouded/metal/rust
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/shrouded/crater,
			BIOME_LOW_HUMIDITY = /datum/biome/shrouded/crater/rad,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/shrouded,
			BIOME_HIGH_HUMIDITY = /datum/biome/shrouded/clearing/mushroom,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/shrouded/tar_bed
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/shrouded/clearing,
			BIOME_LOW_HUMIDITY = /datum/biome/shrouded/clearing,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/shrouded/clearing/mushroom,
			BIOME_HIGH_HUMIDITY = /datum/biome/shrouded,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/shrouded
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/shrouded,
			BIOME_LOW_HUMIDITY = /datum/biome/shrouded/tar_bed,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/shrouded/metal,
			BIOME_HIGH_HUMIDITY = /datum/biome/shrouded,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/shrouded/metal/rust
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/shrouded,
			BIOME_LOW_HUMIDITY = /datum/biome/shrouded/tar_bed,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/shrouded/tar_bed,
			BIOME_HIGH_HUMIDITY = /datum/biome/shrouded/tar_bed/total,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/shrouded/tar_bed/total
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/shrouded/metal,
			BIOME_LOW_HUMIDITY = /datum/biome/shrouded/metal,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/shrouded/metal,
			BIOME_HIGH_HUMIDITY = /datum/biome/shrouded/metal/rust,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/shrouded/metal/rust
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/shrouded,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/shrouded,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/shrouded/tar_bed,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/shrouded/tar_bed/full,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/shrouded/tar_bed/full
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/shrouded,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/shrouded/rad,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/shrouded,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/shrouded/rad,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/shrouded
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/shrouded,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/shrouded,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/shrouded/metal,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/shrouded/metal,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/shrouded/tar_bed
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/shrouded/tar_bed,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/shrouded/tar_bed,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/shrouded/tar_bed,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/shrouded/metal/,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/shrouded/metal/
		)
	)

/datum/biome/shrouded
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 80,
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 15,
		/turf/open/floor/plating/asteroid/shroudedplanet = 5
	)

	flora_spawn_list = list(

		//mech spawners
		/obj/effect/spawner/lootdrop/waste/mechwreck/rare = 0.1,
		/obj/effect/spawner/lootdrop/waste/trash = 0.1,
		/obj/structure/reagent_dispensers/fueltank = 0.1,
		/obj/structure/reagent_dispensers/watertank = 0.1,
		/obj/structure/flora/ash/glowshroom/shadowshroom = 20,
		/obj/structure/closet/crate/secure/loot = 0.1,
		/obj/effect/spawner/lootdrop/waste/atmos_can = 1,
		/obj/effect/spawner/lootdrop/waste/atmos_can/rare = 0.1,
		/obj/structure/flora/ash/garden/seaweed = 20,
		/obj/effect/spawner/lootdrop/maintenance = 2,
		/obj/effect/spawner/lootdrop/maintenance/two = 1,
		/obj/structure/glowshroom/shadowshroom = 0.1
	)

	feature_spawn_list = list(
		/obj/effect/radiation/shrouded = 3,
		/obj/effect/radiation/shrouded/intense = 1,
		/obj/structure/geyser/random = 1
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/retaliate/beast/shantak/alt = 70,
		/mob/living/simple_animal/hostile/retaliate/jelly/alt = 30,
		/mob/living/simple_animal/hostile/abandoned_minebot = 0.1,
	)

	flora_spawn_chance = 25
	feature_spawn_chance = 0.5
	mob_spawn_chance = 2

/datum/biome/shrouded/crater
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 90,
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 10,
	)

	flora_spawn_list = list(
		/obj/effect/spawner/lootdrop/waste/trash = 1,
		/obj/effect/spawner/lootdrop/waste/atmos_can = 1,
		/obj/effect/spawner/lootdrop/waste/atmos_can/rare = 0.1,
		/obj/effect/spawner/lootdrop/waste/salvageable = 1,
	)
	mob_spawn_chance = 1

/datum/biome/shrouded/crater/rad
	flora_spawn_list = list(
		/obj/structure/flora/ash/glowshroom/shadowshroom = 25,
		/obj/effect/spawner/lootdrop/waste/trash = 10,
		/obj/effect/spawner/lootdrop/waste/radiation = 50,
		/obj/effect/spawner/lootdrop/waste/radiation/more_rads = 30,
		/obj/structure/sign/warning/radiation/rad_area = 10,
		/obj/effect/spawner/lootdrop/maintenance = 20,
		/obj/effect/spawner/lootdrop/maintenance/two = 10,
		/obj/effect/spawner/lootdrop/maintenance/three = 5,
		/obj/effect/spawner/lootdrop/maintenance/four = 2,
	)

/datum/biome/shrouded/clearing
	flora_spawn_chance = 20
	feature_spawn_chance = 2

/datum/biome/shrouded/clearing/mushroom
	flora_spawn_list = list(
		/obj/structure/reagent_dispensers/fueltank = 1,
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/structure/flora/ash/glowshroom/shadowshroom = 180,
		/obj/structure/closet/crate/secure/loot = 0.1
		)

/datum/biome/shrouded/tar_bed
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 70,
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 10,
	)

/datum/biome/shrouded/tar_bed/total
	open_turf_types = list(
		/turf/open/water/tar/shrouded/lit
	)
	flora_spawn_chance = 0

/datum/biome/shrouded/metal
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 5,
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 45,
		/turf/open/floor/plating/asteroid/shroudedplanet = 50
	)

	flora_spawn_list = list(
		/obj/effect/spawner/lootdrop/waste/mechwreck = 1,
		/obj/effect/spawner/lootdrop/waste/mechwreck/rare = 0.1,
		/obj/effect/spawner/lootdrop/waste/trash = 9,
		/obj/structure/reagent_dispensers/fueltank = 1,
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/structure/flora/ash/glowshroom/shadowshroom = 25,
		/obj/structure/closet/crate/secure/loot = 0.1,
		/obj/effect/spawner/lootdrop/maintenance = 2,
		/obj/effect/spawner/lootdrop/maintenance/two = 1
	)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/abandoned_minebot = 0.1,
		/mob/living/simple_animal/hostile/leech = 20,
		/mob/living/simple_animal/hostile/retaliate/beast/shantak/alt = 10,
		/mob/living/simple_animal/hostile/retaliate/jelly/alt = 5,
		/mob/living/simple_animal/hostile/retaliate/royalcrab = 2
	)

/datum/biome/shrouded/metal/rust
	open_turf_types = list(
		/turf/closed/wall/rust = 0.1,
		/turf/open/floor/plating/asteroid/shroudedplanet/lit = 10,
		/turf/open/floor/plating/asteroid/shroudedplanet = 4
	)

/datum/biome/cave/shrouded
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet = 80,
		/turf/open/floor/plating/asteroid/shroudedplanet = 15
	)

	closed_turf_types =  list(
		/turf/closed/mineral/random/asteroid/wasteplanet/shroudedplanet = 40,
		/turf/closed/mineral/random/asteroid/wasteplanet/shroudedplanet = 10,
		/turf/closed/wall/rust = 0.1
	)

	flora_spawn_list = list(
		/obj/structure/flora/ash/glowshroom/shadowshroom = 25,
		/obj/structure/closet/crate/secure/loot = 0.1,
		/obj/effect/spawner/lootdrop/maintenance = 2,
		/obj/effect/spawner/lootdrop/maintenance/two = 1,
	)

	feature_spawn_list = list(
		/obj/effect/radiation/shrouded = 30,
		/obj/effect/radiation/shrouded/intense = 10,
		/obj/structure/geyser/random = 1
	)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/abandoned_minebot = 0.1,
	)
	feature_spawn_list = list(
		/obj/structure/glowshroom/shadowshroom = 0.1,
	)
	flora_spawn_chance = 30
	feature_spawn_chance = 4
	mob_spawn_chance = 5

/datum/biome/cave/shrouded/tar_bed
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet = 70,
		/turf/open/floor/plating/asteroid/shroudedplanet = 20,
		/turf/open/water/tar/shrouded = 3
	)

/datum/biome/cave/shrouded/tar_bed/full
	open_turf_types = list(
		/turf/open/water/tar/shrouded
	)
	flora_spawn_chance = 0

/datum/biome/cave/shrouded/rad
	flora_spawn_list = list(
		/obj/structure/reagent_dispensers/fueltank = 1,
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/structure/flora/ash/glowshroom/shadowshroom = 25,
		/obj/structure/closet/crate/secure/loot = 0.1,
		/obj/effect/spawner/lootdrop/maintenance = 2,
		/obj/effect/spawner/lootdrop/maintenance/two = 1,
		/turf/open/floor/plating/shroudedplanet = 0.1
	)
	feature_spawn_chance = 12

/datum/biome/cave/shrouded/metal
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/shroudedplanet = 10,
		/turf/open/floor/plating/shroudedplanet = 1
	)
	closed_turf_types = list(
		/turf/closed/mineral/random/asteroid/wasteplanet/shroudedplanet = 60,
		/turf/closed/wall/r_wall/rust = 0.1,
		/turf/closed/wall/rust = 0.1
	)
	flora_spawn_list = list(
		/obj/structure/reagent_dispensers/fueltank = 1,
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/structure/flora/ash/glowshroom/shadowshroom = 20,
		/obj/structure/closet/crate/secure/loot = 0.1,
		/obj/effect/spawner/lootdrop/maintenance = 2,
		/obj/effect/spawner/lootdrop/maintenance/two = 1,
	)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/retaliate/beast/shantak/alt = 20,
		/mob/living/simple_animal/hostile/retaliate/jelly/alt = 20,

	)
	mob_spawn_chance = 30
	feature_spawn_list = list(
		/mob/living/simple_animal/hostile/leech = 20,
		/mob/living/simple_animal/hostile/retaliate/beast/shantak/alt = 10,
		/mob/living/simple_animal/hostile/retaliate/jelly/alt = 5,
		/mob/living/simple_animal/hostile/retaliate/royalcrab = 2
		)
	feature_spawn_chance = 2
