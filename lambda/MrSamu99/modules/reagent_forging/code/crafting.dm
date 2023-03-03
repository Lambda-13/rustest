// METAL

GLOBAL_LIST_INIT(smithing_metal_recipes, list(	
	new/datum/stack_recipe("anvil", /obj/structure/reagent_anvil, 10, time = 2 SECONDS, one_per_turf = TRUE, on_floor = TRUE),
	new/datum/stack_recipe("forge", /obj/structure/reagent_forge, 10, time = 2 SECONDS, one_per_turf = TRUE, on_floor = TRUE),
))

/obj/item/stack/sheet/metal/get_main_recipes()
	. = ..()
	. += GLOB.smithing_metal_recipes

// WOOD

GLOBAL_LIST_INIT(smithing_wood_recipes, list(
	new/datum/stack_recipe("water basin", /obj/structure/reagent_water_basin, 5, time = 2 SECONDS, one_per_turf = TRUE, on_floor = TRUE),
	new/datum/stack_recipe("forging work bench", /obj/structure/reagent_crafting_bench, 5, time = 2 SECONDS, one_per_turf = TRUE, on_floor = TRUE),
	new/datum/stack_recipe("large wooden mortar", /obj/structure/large_mortar, 10, time = 3 SECONDS, one_per_turf = TRUE, on_floor = TRUE),
	new/datum/stack_recipe("wooden cutting board", /obj/item/cutting_board, 5, time = 2 SECONDS),
))

/obj/item/stack/sheet/mineral/wood/get_main_recipes()
	. = ..()
	. += GLOB.smithing_wood_recipes
