/datum/crafting_recipe/improvised_capacitor
	name = "Capacitor"
	result = /obj/item/stock_parts/capacitor
	reqs = list(/obj/item/stack/sheet/metal = 2,
		/obj/item/stack/rods = 8)
	tools = list(TOOL_SCREWDRIVER)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_scanning_module
	name = "Scanning Module"
	result = /obj/item/stock_parts/scanning_module
	reqs = list(/obj/item/stack/rods = 2,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/capacitor = 1)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_manipulator
	name = "Manipulator"
	result = /obj/item/stock_parts/manipulator
	reqs = list(/obj/item/stack/rods = 12,
		/obj/item/stock_parts/capacitor = 1)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_micro_laser
	name = "Micro Laser"
	result = /obj/item/stock_parts/micro_laser
	reqs = list(/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/rods = 2,
		/obj/item/stock_parts/scanning_module = 1)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_matter_bin
	name = "Matter Bin"
	result = /obj/item/stock_parts/matter_bin
	reqs = list(/obj/item/stack/sheet/metal = 25,
		/obj/item/stack/rods = 10)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_cell
	name = "Cell"
	result = /obj/item/stock_parts/cell/empty
	reqs = list(/obj/item/stack/sheet/metal = 10,
		/obj/item/stack/sheet/glass = 1
		/obj/item/stock_parts/capacitor = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_WELDER)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_rdserver
	name = "самодельная плата сервера РнД"
	result = /obj/item/circuitboard/machine/rdserver
	reqs = list(/obj/item/electronics/apc = 1,
		/obj/item/stack/rods = 2,
		/obj/item/stock_parts/scanning_module = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_ANALYZER)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_rdconsole
	name = "самодельная плата консоли РнД"
	result = /obj/item/circuitboard/computer/rdconsole
	reqs = list(/obj/item/stack/sheet/glass = 10,
		/obj/item/electronics/apc = 1,
		/obj/item/stock_parts/micro_laser = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_ANALYZER)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_techfab
	name = "самодельная плата техфаба"
	result = /obj/item/circuitboard/machine/techfab
	reqs = list(/obj/item/stack/sheet/metal = 50,
		/obj/item/electronics/apc = 2,
		/obj/item/stack/sheet/glass = 50,
		/obj/item/circuitboard/machine/autolathe = 1)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_WELDER)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_apc
	name = "контроллер зоны APC"
	result = /obj/item/electronics/apc
	reqs = list(/obj/item/stack/sheet/metal = 10,
		/obj/item/stack/rods = 8,
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stack/cable_coil = 10)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL)
	time = 1000
	category = CAT_PRIMITIVE

/datum/crafting_recipe/improvised_autolathe
	name = "Autolathe"
	result = /obj/item/circuitboard/machine/autolathe
	reqs = list(/obj/item/stack/sheet/metal = 25,
		/obj/item/stack/rods = 20,
		/obj/item/stack/cable_coil = 15)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL)
	time = 1000
	category = CAT_PRIMITIVE
