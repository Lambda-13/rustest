//ASH TOOL
/obj/item/screwdriver/ashwalker
	name = "primitive screwdriver"
	icon = 'lambda/MrSamu99/icons/ashwalkers/ashwalker_tools.dmi'
	icon_state = "screwdriver"
	toolspeed = 1.1
	random_color = FALSE
	greyscale_colors = null

/datum/crafting_recipe/ash_recipe/ash_screwdriver
	name = "Ash Screwdriver"
	result = /obj/item/screwdriver/ashwalker

/obj/item/wirecutters/ashwalker
	name = "primitive wirecutters"
	icon = 'lambda/MrSamu99/icons/ashwalkers/ashwalker_tools.dmi'
	icon_state = "cutters"
	toolspeed = 1.1
	random_color = FALSE
	greyscale_colors = null

/datum/crafting_recipe/ash_recipe/ash_cutters
	name = "Ash Wirecutters"
	result = /obj/item/wirecutters/ashwalker

/obj/item/wrench/ashwalker
	name = "primitive wrench"
	icon = 'lambda/MrSamu99/icons/ashwalkers/ashwalker_tools.dmi'
	icon_state = "wrench"
	toolspeed = 1.1

/datum/crafting_recipe/ash_recipe/ash_wrench
	name = "Ash Wrench"
	result = /obj/item/wrench/ashwalker

/obj/item/crowbar/ashwalker
	name = "primitive crowbar"
	icon = 'lambda/MrSamu99/icons/ashwalkers/ashwalker_tools.dmi'
	icon_state = "crowbar"
	toolspeed = 1.1

/datum/crafting_recipe/ash_recipe/ash_crowbar
	name = "Ash Crowbar"
	result = /obj/item/crowbar/ashwalker

//generic ash item recipe
/datum/crafting_recipe/ash_recipe
	reqs = list(
		/obj/item/stack/sheet/bone = 1,
		/obj/item/stack/sheet/sinew = 1,
	)
	time = 4 SECONDS
	category = CAT_TOOLS
