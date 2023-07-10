/datum/supply_pack/exploration
	group = "Исследование"
	crate_type = /obj/structure/closet/crate/wooden

/*
		Basic survival kits for worlds.
*/

/datum/supply_pack/exploration/lava
	name = "Набор исследователя лаваленда"
	desc = "Содержит две кирки 60 стержней с антилавовым покрытием, и очки для защиты от жары."
	cost = COST_MIN * 1500
	contains = list(
		/obj/item/pickaxe/mini,
		/obj/item/pickaxe/mini,
		/obj/item/clothing/glasses/heat,
		/obj/item/clothing/glasses/heat,
		/obj/item/clothing/glasses/heat,
		/obj/item/clothing/glasses/heat,
		/obj/item/stack/rods/lava/thirty,
		/obj/item/stack/rods/lava/thirty,
	)
	crate_name = "набор исследователя лаваленда"

/datum/supply_pack/exploration/ice
	name = "Набор исследователя айсленда"
	desc = "Содержит две кирки, два набора одежды, и очки защищающие от холода."
	cost = COST_MIN * 1500
	contains = list(
		/obj/item/pickaxe/mini,
		/obj/item/pickaxe/mini,
		/obj/item/clothing/glasses/cold,
		/obj/item/clothing/glasses/cold,
		/obj/item/clothing/glasses/cold,
		/obj/item/clothing/glasses/cold,
		/obj/item/clothing/shoes/winterboots,
		/obj/item/clothing/shoes/winterboots,
		/obj/item/clothing/shoes/winterboots,
		/obj/item/clothing/shoes/winterboots,
	)
	crate_name = "набор исследователя айсленда"

/datum/supply_pack/exploration/jungle
	name = "Набор исследователя джунглей"
	desc = "Содержит топорик, две банки с активированым углём, и две кирки."
	cost = COST_MIN * 750
	contains = list(
		/obj/item/pickaxe/mini,
		/obj/item/pickaxe/mini,
		/obj/item/storage/pill_bottle/charcoal,
		/obj/item/storage/pill_bottle/charcoal,
		/obj/item/hatchet,
	)
	crate_name = "набор исследователя джунглей"

/datum/supply_pack/exploration/beach
	name = "Набор исследователя пляжа"
	desc = "Две кирки а остальное для купания."
	cost = COST_MIN * 500
	contains = list(
		/obj/item/pickaxe/mini,
		/obj/item/pickaxe/mini,
		/obj/item/clothing/under/shorts/black,
		/obj/item/clothing/under/shorts/blue,
		/obj/item/clothing/under/shorts/green,
		/obj/item/clothing/under/shorts/grey,
		/obj/item/clothing/under/shorts/purple,
		/obj/item/clothing/under/shorts/red,
		/obj/item/clothing/glasses/cheapsuns,
		/obj/item/clothing/glasses/cheapsuns,
		/obj/item/clothing/glasses/cheapsuns,
		/obj/item/clothing/glasses/cheapsuns,
		/obj/item/clothing/glasses/cheapsuns,
		/obj/item/clothing/glasses/cheapsuns,
	)
	crate_name = "набор исследователя пляжа"

/*
		Heavy Duty Exploration Gear
*/

/datum/supply_pack/exploration/capsules
	name = "Набор капсул быстрой развёртки"
	desc = "Содержит три капсулы для быстрой развёртки убежища три на три."
	cost = COST_MIN * 3000
	contains = list(
		/obj/item/survivalcapsule,
		/obj/item/survivalcapsule,
		/obj/item/survivalcapsule,
	)

