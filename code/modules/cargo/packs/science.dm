/datum/supply_pack/science
	group = "Наука"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/science/slime
	name = "Ящик ядра слайма"
	desc = "Содержит внутри себя серое ядро слайма."
	cost = COST_MIN * 1000
	contains = list(/obj/item/slime_extract/grey)
	crate_name = "slime core crate"

/datum/supply_pack/science/mod_core
	name = "Ящик ядер МОД костюмов"
	desc = "Три ядра для недавно созданных и исследованых МОД костюмов."
	cost = COST_MED * 4000
	contains = list(/obj/item/mod/core/standard,
		/obj/item/mod/core/standard,
		/obj/item/mod/core/standard)
	crate_name = "MOD core crate"

/datum/supply_pack/science/choice_beacon_rnd
	name = "Ящик с маяком выбора рнд плат"
	desc = "Идёт вместе с маяком выбора рнд плат."
	cost = COST_MED * 50000
	contains = list(/obj/item/choice_beacon/rnd)
	crate_name = "ящик с маяком рнд плат"

/datum/supply_pack/science/support_beacon
	name = "Маяк поддержки"
	desc = "Один маяк для личного использования."
	cost = COST_HIGH * 50000
	contains = list(/obj/item/choice_beacon/support_beacon)
	crate_name = "ящик с маяком поддержки"


/datum/supply_pack/science/research_notes
	name = "Ящик с научными записями (12к)"
	desc = "Внутри можно найти записи на сумму 12000 очков."
	cost = COST_MIN * 6000
	contains = list(/obj/item/research_notes/loot/small, /obj/item/research_notes/loot/small, /obj/item/research_notes/loot/small)
	crate_name = "ящик с изучениями"

/datum/supply_pack/science/research_notes_big
	name = "Ящик с научными записями (30к)"
	desc = "Внутри можно найти записи на сумму 30000 очков."
	cost = COST_MIN * 15000
	contains = list(/obj/item/research_notes/loot/genius)
	crate_name = "ящик с изучениями"

/datum/supply_pack/science/fullrnd
	name = "Ящик с целым РнД"
	desc = "Незаблокированные на отдел РнД платы."
	cost = COST_HIGH * 100000
	contains = list(/obj/item/storage/box/rndboards/old)
	crate_name = "ящик с платами рнд"
