// Food exports.

/datum/export/foods
	include_subtypes = TRUE

/datum/export/foods/meatslab
	cost = 30
	unit_name = "meat slab"
	export_types = list(/obj/item/reagent_containers/food/snacks/meat/slab)

/datum/export/foods/fishfillet
	cost = 30
	unit_name = "fish fillet"
	export_types = list(/obj/item/reagent_containers/food/snacks/fishmeat)

/datum/export/foods/bacon
	cost = 30
	unit_name = "bacon piece"
	export_types = list(/obj/item/reagent_containers/food/snacks/meat/rawbacon)

/datum/export/foods/crabmeat
	cost = 30
	unit_name = "crab meat"
	export_types = list(obj/item/reagent_containers/food/snacks/meat/rawcrab)

/datum/export/foods/spiderleg
	cost = 120
	unit_name = "spider legs"
	export_types = list(/obj/item/reagent_containers/food/snacks/spiderleg)
