/datum/supply_pack/science
	group = "Наука"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/science/slime
	name = "Ящик ядра слайма"
	desc = "Содержит внутри себя серое ядро слайма."
	cost = 1000
	contains = list(/obj/item/slime_extract/grey)
	crate_name = "slime core crate"

/datum/supply_pack/science/mod_core
	name = "Ящик ядер МОД костюмов"
	desc = "Три ядра для недавно созданных и исследованых МОД костюмов."
	cost = 4000
	contains = list(/obj/item/mod/core/standard,
		/obj/item/mod/core/standard,
		/obj/item/mod/core/standard)
	crate_name = "MOD core crate"

/datum/supply_pack/science/choice_beacon_rnd
	name = "Ящик с маяком выбора рнд плат"
	desc = "Идёт вместе с маяком выбора рнд плат."
	cost = 20000
	contains = list(/obj/item/choice_beacon/rnd)
	crate_name = "ящик с маяком рнд плат"
