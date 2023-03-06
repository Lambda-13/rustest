/datum/supply_pack/ammo
	group = "Аммуниция"
	crate_type = /obj/structure/closet/crate/secure/gear

/*
		Pistol ammo
*/

/datum/supply_pack/ammo/co9mm_ammo
	name = "Ящик с патронами 9мм калибра (Commander)"
	desc = "Содержит три магазина калибра 9 мм для стандартного пистолета Commander, каждый из которых содержит десять патронов."
	contains = list(/obj/item/ammo_box/magazine/co9mm,
					/obj/item/ammo_box/magazine/co9mm,
					/obj/item/ammo_box/magazine/co9mm)
	cost = COST_MIN * 1500

/datum/supply_pack/ammo/m10mm_ammo
	name = "Ящик с патронами 10мм калибра (Stechkin)"
	desc = "Содержит три 10-мм магазина для пистолета Стечкина по восемь патронов в каждом."
	contains = list(/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm)
	cost = COST_MIN * 1500

/*
		Shotgun ammo
*/

/datum/supply_pack/ammo/buckshot
	name = "Ящик с картечью 12мм (Buckshot)"
	desc = "Содержит две коробки картечи для охоты или защиты. Или доказывания своей правоты."
	cost = COST_MIN * 2000
	contains = list(/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot)

/datum/supply_pack/ammo/slugs
	name = "Ящик с патронами 12мм (Slug)"
	desc = "Содержит две коробки картечи для охоты или защиты. Или доказывания своей правоты."
	cost = COST_MIN * 2000
	contains = list(/obj/item/storage/box/slugshot,
					/obj/item/storage/box/slugshot)

/*
		.38 ammo
*/

/datum/supply_pack/ammo/winchester_ammo
	name = "Ящик с патронами .38 калибра (Winchester and Detective Special)"
	desc = "Содержит два ящика с патронами на 30 патронов для перезарядки оружия .38 калибра."
	cost = COST_MIN * 2500
	contains = list(/obj/item/ammo_box/c38_box,
					/obj/item/ammo_box/c38_box)
	crate_name = "оружейный ящик"

/datum/supply_pack/ammo/winchester_hunting_ammo
	name = "Ящик с охотничьими патронами .38 калибра (Winchester and Detective Special)"
	desc = "Содержит два ящика на 30 патронов для перезарядки оружия .38 калибра для охоты на слонов."
	cost = COST_MIN * 2000
	contains = list(/obj/item/ammo_box/c38_box/hunting,
					/obj/item/ammo_box/c38_box/hunting)
	crate_name = "оружейный ящик"

/datum/supply_pack/ammo/match
	name = "Спидлоадер .38 калибра"
	desc = "Содержит один спидлоадер с патронами калибра .38, идеально подходящий для демонстрации самой быстрой руки в этом секторе."
	cost = COST_MIN * 1200
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/match)
	crate_name = "ящик со спидлоадером .38 калибра"

/datum/supply_pack/ammo/dumdum
	name = "Спидлоадер .38 калибра (DumDum)"
	desc = "Содержит один спидлоадер с патронами калибра .38, идеально подходящий для демонстрации самой быстрой руки в этом секторе. Теперь с разрывными патронами."
	cost = COST_MIN * 1200
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/dumdum)
	crate_name = "ящик со спидлоадером .38 калибра"

/*
		WT-550 ammo
*/

/datum/supply_pack/ammo/wt550_ammo
	name = "Ящик с боеприпасами для автоматической винтовки WT-550"
	desc = "Содержит три магазина на 20 патронов для автоматической винтовки WT-550 для быстрой тактической перезарядки."
	cost = 2250
	contains = list(/obj/item/ammo_box/magazine/wt550m9,
					/obj/item/ammo_box/magazine/wt550m9,
					/obj/item/ammo_box/magazine/wt550m9)

/datum/supply_pack/ammo/cool_wt550_ammo
	name = "Ящик с экзотическими патронами для автоматической винтовки WT-550"
	desc = "Содержит один магазин бронебойных и один магазин зажигательных патронов для автомата WT-550. К сожалению, наш производитель прекратил выпуск пуль из урана."
	cost = 2500
	contains = list(/obj/item/ammo_box/magazine/wt550m9/wtap,
					/obj/item/ammo_box/magazine/wt550m9/wtic)
