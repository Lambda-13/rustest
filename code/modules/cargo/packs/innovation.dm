
/datum/supply_pack/innovations
	group = "Инновации"

/datum/supply_pack/innovations/farmbox
	name = "Ударогенератор"
	desc = "Эта штука служит для выращивания денег в прогрессии."
	cost = COST_MIN * 80000
	contains = list(/obj/structure/punching_bag/trade)
	crate_name = "коробка с ударогенератором"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/innovations/uplink
	name = "Аплинк"
	desc = "Нам приходится постоянно терять людей ради таких штук."
	cost = COST_HIGH * 100000
	contains = list(/obj/item/uplink/emengercy)
	crate_name = "ящик с аплинком"
	crate_type = /obj/structure/closet/crate/science


/datum/supply_pack/innovations/exploration
	name = "Блюспейс-маяк"
	desc = "Содержит внутри маяк который может удержать на месте планету или регион в космосе."
	cost = COST_HIGH * 300000
	contains = list(/obj/item/sbeacondrop/exploration)
	crate_name = "ящик с маяком"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/innovations/copytech
	name = "Коробка копировальных плат"
	desc = "Содержит внутри коробку с копировальным платами. Из-за некоторых нюансов с законом цены данных плат необычайно возросли."
	cost = COST_HIGH * 1000000
	contains = list(/obj/item/storage/box/copytech)
	crate_name = "ящик с копировальными платами"
	crate_type = /obj/structure/closet/crate/science
