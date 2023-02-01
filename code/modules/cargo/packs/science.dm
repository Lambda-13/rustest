/datum/supply_pack/science/slime
	name = "Slime Core Crate"
	desc = "Ran out of slimes? No problem, contains one gray slime core."
	cost = 1000
	contains = list(/obj/item/slime_extract/grey)
	crate_name = "slime core crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/science/mod_core
	name = "MOD core Crate"
	desc = "Three cores, perfect for any MODsuit construction! Naturally harvested™, of course."
	cost = 4000
	contains = list(/obj/item/mod/core/standard,
		/obj/item/mod/core/standard,
		/obj/item/mod/core/standard)
	crate_name = "MOD core crate"
	crate_type = /obj/structure/closet/crate/science
