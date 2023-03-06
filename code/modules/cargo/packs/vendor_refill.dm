/datum/supply_pack/vendor_refill
	group = "Сменные ящики"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vendor_refill/bartending
	name = "Booze-o-mat and Coffee Supply Crate"
	desc = "Bring on the booze and coffee vending machine refills."
	cost = COST_MIN * 2000
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee)
	crate_name = "bartending supply crate"

/datum/supply_pack/vendor_refill/cola
	name = "Softdrinks Supply Crate"
	desc = "Got whacked by a toolbox, but you still have those pesky teeth? Get rid of those pearly whites with this soda machine refill, today!"
	cost = COST_MIN * 1500
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

/datum/supply_pack/vendor_refill/snack
	name = "Snack Supply Crate"
	desc = "One vending machine refill of cavity-bringin' goodness! The number one dentist recommended order!"
	cost = COST_MIN * 1500
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/vendor_refill/autodrobe
	name = "Autodrobe Supply Crate"
	desc = "Autodrobe missing your favorite dress? Solve that issue today with this autodrobe refill."
	cost = COST_MIN * 1000
	contains = list(/obj/item/vending_refill/autodrobe)
	crate_name = "autodrobe supply crate"

/datum/supply_pack/vendor_refill/cigarette
	name = "Cigarette Supply Crate"
	desc = "Don't believe the reports - smoke today! Contains a cigarette vending machine refill."
	cost = COST_MIN * 1500
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"

/datum/supply_pack/vendor_refill/games
	name = "Games Supply Crate"
	desc = "Get your game on with this game vending machine refill."
	cost = COST_MIN * 1000
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"

/datum/supply_pack/vendor_refill/botany
	name = "Botany Supply Crate"
	desc = "You feel there is not enough war crimes? Solve that issue with this pack."
	cost = COST_MIN * 2000
	contains = list(/obj/item/vending_refill/hydroseeds,
					/obj/item/vending_refill/hydronutrients)
	crate_name = "botany supply crate"

/datum/supply_pack/vendor_refill/mining
	name = "Mining Supply Crate"
	desc = "Rock and Stone!"
	cost = COST_MIN * 1500
	contains = list(/obj/item/vending_refill/mining_equipment)
	crate_name = "mining supply crate"
