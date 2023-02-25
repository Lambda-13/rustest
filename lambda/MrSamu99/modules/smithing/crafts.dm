/datum/crafting_recipe/stick
	name = "Stick"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 1)
	result = /obj/item/stick
	//subcategory = CAT_MISC
	category = CAT_MISC


/datum/crafting_recipe/swordhilt
	name = "Sword Hilt"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)
	result = /obj/item/swordhandle
	//subcategory = CAT_MISC
	category = CAT_MISC

/datum/crafting_recipe/bone_anvil
	name = "Bone Anvil"
	result = /obj/structure/anvil/obtainable/bone
	time = 200
	reqs = list(/obj/item/stack/sheet/bone = 6,
				 /obj/item/stack/sheet/sinew = 2,
				 /obj/item/stack/sheet/animalhide/goliath_hide = 2)
	tools = list(/obj/item/wirecutters/ashwalker, /obj/item/crowbar/ashwalker)
	category = CAT_PRIMAL

/datum/crafting_recipe/furnace
	name = "Sandstone Furnace"
	result = /obj/structure/furnace
	time = 300
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 15,
	/obj/item/stack/sheet/metal = 4,
	/obj/item/stack/rods = 2)
	tools = list(TOOL_CROWBAR)
	//subcategory = CAT_MISC
	category = CAT_MISC

/datum/crafting_recipe/tableanvil
	name = "Table Anvil"
	result = /obj/structure/anvil/obtainable/table
	time = 300
	reqs = list(/obj/item/stack/sheet/metal = 4,
		        /obj/item/stack/rods = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	//subcategory = CAT_MISC
	category = CAT_MISC

/datum/crafting_recipe/sandvil
	name = "Sandstone Anvil"
	result = /obj/structure/anvil/obtainable/sandstone
	time = 300
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 24)
	tools = list(TOOL_CROWBAR)
	//subcategory = CAT_MISC
	category = CAT_MISC

/datum/supply_pack/machinery/anvil
	name = "Anvil Crate"
	desc = "An anvil in a crate, we had to dig this out of the old warehouse. It's got wheels on it so you can move it."
	cost = 5000
	contains = list(/obj/structure/anvil/obtainable/basic)

/datum/crafting_recipe/toolboxhammer
	name = "Toolbox Hammer"
	result = /obj/item/melee/smith/hammer/toolbox
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	reqs = list(/obj/item/storage/toolbox = 1,
							/obj/item/stack/sheet/metal = 4,
							/obj/item/stack/rods = 2)
	time = 40
	//subcategory = CAT_TOOL
	category = CAT_MISC
