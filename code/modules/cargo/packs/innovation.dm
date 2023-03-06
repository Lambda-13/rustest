
/datum/supply_pack/innovations
	group = "Инновации"

/datum/supply_pack/innovations/farmbox
	name = "Ударогенератор"
	desc = "Эта штука служит для выращивания денег в прогрессии."
	cost = COST_MIN * 25500
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
