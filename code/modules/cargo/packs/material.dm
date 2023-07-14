/datum/supply_pack/material
	group = "Материалы"

/*
		Basic construction materials
*/

/datum/supply_pack/material/glass50
	name = "50 листов стекла"
	desc = "50 целых листов стекла для остекления тёмных помещений!"
	cost = COST_MIN * 500
	contains = list(/obj/item/stack/sheet/glass/fifty)
	crate_name = "glass sheets crate"

/datum/supply_pack/material/metal50
	name = "50 листов металла"
	desc = "Для решения почти любой задачи инженера!"
	cost = COST_MIN * 500
	contains = list(/obj/item/stack/sheet/metal/fifty)
	crate_name = "metal sheets crate"

/datum/supply_pack/material/plasteel20
	name = "20 листов пластали"
	desc = "Для укрепления шлюзов, стен и всего остального!"
	cost = COST_MIN * 2500
	contains = list(/obj/item/stack/sheet/plasteel/twenty)
	crate_name = "plasteel sheets crate"

/*
		Fuel sheets (plasma / uranium)
*/

/datum/supply_pack/material/plasma20
	name = "20 листов плазмы"
	desc = "Плазма в твёрдом состоянии. Всё ещё горит."
	cost = COST_MIN * 2000
	contains = list(/obj/item/stack/sheet/mineral/plasma/twenty)
	crate_name = "plasma sheets crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/material/uranium20
	name = "20 урановых листов"
	desc = "Радиоактивно."
	cost = COST_MIN * 6000
	contains = list(/obj/item/stack/sheet/mineral/uranium/twenty)
	crate_name = "uranium sheets crate"
	crate_type = /obj/structure/closet/crate/radiation

/*
		Misc. mineral sheets
*/

/datum/supply_pack/material/titanium20
	name = "20 титановых листов"
	desc = "Обычно титан использует НаноТрайзен. Может отражать лазеры."
	cost = COST_MIN * 2000
	contains = list(/obj/item/stack/sheet/mineral/titanium/twenty)
	crate_name = "titanium sheets crate"

/datum/supply_pack/material/gold20
	name = "20 золотых слитков"
	desc = "Если в 21 веке золото было очень дорогим, то сейчас вы можете купить золото дешевле чем двигатель."
	cost = COST_MIN * 5000
	contains = list(/obj/item/stack/sheet/mineral/gold/twenty)
	crate_name = "gold sheets crate"

/datum/supply_pack/material/silver20
	name = "20 серебрянных слитков"
	desc = "Монеты делать не получится."
	cost = COST_MIN * 2500
	contains = list(/obj/item/stack/sheet/mineral/silver/twenty)
	crate_name = "silver sheets crate"

/datum/supply_pack/material/diamond
	name = "1 алмаз"
	desc = "Блестит."
	cost = COST_MIN * 1000
	contains = list(/obj/item/stack/sheet/mineral/diamond)
	crate_name = "diamond sheet crate"

/*
		Misc. materials
*/

/datum/supply_pack/material/sandstone50
	name = "50 блоков песчаника"
	desc = "Если необходимо построить песчаный домик. Или корабль."
	cost = COST_MIN * 1000
	contains = list(/obj/item/stack/sheet/mineral/sandstone/fifty)
	crate_name = "sandstone blocks crate"

/datum/supply_pack/material/plastic50
	name = "50 пластиковых листов"
	desc = "Переработанная нефть и уничтожанная атмосфера планеты в одном ящике по цене 100 листов металла!"
	cost = COST_MIN * 1000
	contains = list(/obj/item/stack/sheet/plastic/fifty)
	crate_name = "plastic sheets crate"

/datum/supply_pack/material/cardboard50
	name = "50 картонок"
	desc = "Для сбора своей картонной армии."
	cost = COST_MIN * 1000
	contains = list(/obj/item/stack/sheet/cardboard/fifty)
	crate_name = "cardboard sheets crate"

/datum/supply_pack/material/wood50
	name = "50 деревянных досок"
	desc = "Верните ретро-футуризм - положите в своей каюте пол из дерева!"
	cost = COST_MIN * 1500
	contains = list(/obj/item/stack/sheet/mineral/wood/fifty)
	crate_name = "wood planks crate"

/datum/supply_pack/material/everything
	name = "Шкаф со всеми ресурсами"
	desc = "Внутри есть шкаф со всеми ресурсами."
	cost = COST_HIGH * 2000000
	contains = list(/obj/structure/closet/syndicate/resources/everything)
	crate_name = "ящик с шкафом"
	crate_type = /obj/structure/closet/crate/large
