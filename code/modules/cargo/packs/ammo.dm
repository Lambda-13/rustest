/datum/supply_pack/ammo
	group = "Аммуниция"
	crate_type = /obj/structure/closet/crate/secure/gear

/*
		Pistol ammo
*/

/datum/supply_pack/ammo/co9mm_ammo
	name = "Ящик с обоймами 9мм калибра (Commander)"
	desc = "Содержит три 9-мм магазина для стандартного пистолета Commander по десять патронов."
	contains = list(/obj/item/ammo_box/magazine/co9mm,
					/obj/item/ammo_box/magazine/co9mm,
					/obj/item/ammo_box/magazine/co9mm)
	cost = COST_MIN * 3000

/datum/supply_pack/ammo/m10mm_ammo
	name = "Ящик с обоймами 10мм калибра (Stechkin)"
	desc = "Содержит три 10-мм магазина для пистолета Стечкина по восемь патронов."
	contains = list(/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm)
	cost = COST_MIN * 3000

/datum/supply_pack/ammo/m45_ammo
	name = "Ящик с обоймами .45 калибра (M1911)"
	desc = "Содержит три магазина .45 калибра для пистолета M1911 по восемь патронов."
	contains = list(/obj/item/ammo_box/magazine/m45,
					/obj/item/ammo_box/magazine/m45,
					/obj/item/ammo_box/magazine/m45)
	cost = COST_MIN * 3000

/datum/supply_pack/ammo/pistol556mm_ammo
	name = "Ящик с обоймами 5.56мм калибра (M9C)"
	desc = "Содержит три магазина калибра 5.56мм HITP для пистолета M9C по восемь патронов."
	contains = list(/obj/item/ammo_box/magazine/pistol556mm,
					/obj/item/ammo_box/magazine/pistol556mm,
					/obj/item/ammo_box/magazine/pistol556mm)
	cost = COST_MIN * 3000

/datum/supply_pack/ammo/c9mm
	name = "Ящик с патронами 9мм калибра"
	desc = "Содержит две коробки 9-мм патронов"
	contains = list(/obj/item/ammo_box/c9mm,
					/obj/item/ammo_box/c9mm)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c10mm
	name = "Ящик с патронами 10мм калибра"
	desc = "Содержит две коробки 10-мм патронов"
	contains = list(/obj/item/ammo_box/c10mm,
					/obj/item/ammo_box/c10mm)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c45
	name = "Ящик с патронами .45 калибра"
	desc = "Содержит две коробки патронов .45 калибра"
	contains = list(/obj/item/ammo_box/c45,
					/obj/item/ammo_box/c45)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c556mmHITP
	name = "Ящик с патронами 5.56мм калибра"
	desc = "Содержит две коробки патронов калибра 5.56мм HITP"
	contains = list(/obj/item/ammo_box/c556mmHITP,
					/obj/item/ammo_box/c556mmHITP)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c9mm/rubber
	name = "Ящик с резиновыми патронами 9мм калибра"
	desc = "Содержит две коробки резиновых 9-мм патронов"
	contains = list(/obj/item/ammo_box/c9mm/rubbershot,
					/obj/item/ammo_box/c9mm/rubbershot)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c10mm/rubber
	name = "Ящик с резиновыми патронами 10мм калибра"
	desc = "Содержит две коробки резиновых 10-мм патронов"
	contains = list(/obj/item/ammo_box/c10mm/rubbershot,
					/obj/item/ammo_box/c10mm/rubbershot)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c45/rubber
	name = "Ящик с резиновыми патронами .45 калибра"
	desc = "Содержит две коробки резиновых патронов .45 калибра"
	contains = list(/obj/item/ammo_box/c45/rubbershot,
					/obj/item/ammo_box/c45/rubbershot)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c556mmHITP/rubber
	name = "Ящик с резиновыми патронами 5.56мм калибра"
	desc = "Содержит две коробки резиновых патронов калибра 5.56мм HITP"
	contains = list(/obj/item/ammo_box/c556mmHITP/rubbershot,
					/obj/item/ammo_box/c556mmHITP/rubbershot)
	cost = COST_MIN * 6000

/datum/supply_pack/ammo/c9mm/ap
	name = "Ящик с бронебойными патронами 9мм калибра"
	desc = "Содержит две коробки бронебойных 9-мм патронов"
	contains = list(/obj/item/ammo_box/c9mm/ap,
					/obj/item/ammo_box/c9mm/ap)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c10mm/ap
	name = "Ящик с бронебойными патронами 10мм калибра"
	desc = "Содержит две коробки бронебойных 10-мм патронов"
	contains = list(/obj/item/ammo_box/c10mm/ap,
					/obj/item/ammo_box/c10mm/ap)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c45/ap
	name = "Ящик с бронебойными патронами .45 калибра"
	desc = "Содержит две коробки бронебойных патронов .45 калибра"
	contains = list(/obj/item/ammo_box/c45/ap,
					/obj/item/ammo_box/c45/ap)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c556mmHITP/ap
	name = "Ящик с бронебойными патронами 5.56мм калибра"
	desc = "Содержит две коробки бронебойных патронов калибра 5.56мм HITP"
	contains = list(/obj/item/ammo_box/c556mmHITP/ap,
					/obj/item/ammo_box/c556mmHITP/ap)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c9mm/hp
	name = "Ящик с разрывными патронами 9мм калибра"
	desc = "Содержит две коробки разрывных 9-мм патронов"
	contains = list(/obj/item/ammo_box/c9mm/hp,
					/obj/item/ammo_box/c9mm/hp)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c10mm/hp
	name = "Ящик с разрывными патронами 10мм калибра"
	desc = "Содержит две коробки разрывных 10-мм патронов"
	contains = list(/obj/item/ammo_box/c10mm/hp,
					/obj/item/ammo_box/c10mm/hp)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c45/hp
	name = "Ящик с разрывными патронами .45 калибра"
	desc = "Содержит две коробки разрывных патронов .45 калибра"
	contains = list(/obj/item/ammo_box/c45/hp,
					/obj/item/ammo_box/c45/hp)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c556mmHITP/hp
	name = "Ящик с разрывными патронами 5.56мм калибра"
	desc = "Содержит две коробки разрывных патронов калибра 5.56мм HITP"
	contains = list(/obj/item/ammo_box/c556mmHITP/hp,
					/obj/item/ammo_box/c556mmHITP/hp)
	cost = COST_MIN * 12000

/datum/supply_pack/ammo/c9mm/incendiary
	name = "Ящик с зажигательными патронами 9мм калибра"
	desc = "Содержит две коробки зажигательных 9-мм патронов"
	contains = list(/obj/item/ammo_box/c9mm/fire,
					/obj/item/ammo_box/c9mm/fire)
	cost = COST_MIN * 18000

/datum/supply_pack/ammo/c10mm/incendiary
	name = "Ящик с зажигательными патронами 10мм калибра"
	desc = "Содержит две коробки зажигательных 10-мм патронов"
	contains = list(/obj/item/ammo_box/c10mm/fire,
					/obj/item/ammo_box/c10mm/fire)
	cost = COST_MIN * 18000

/datum/supply_pack/ammo/c45/incendiary
	name = "Ящик с зажигательными патронами .45 калибра"
	desc = "Содержит две коробки зажигательных патронов .45 калибра"
	contains = list(/obj/item/ammo_box/c45/fire,
					/obj/item/ammo_box/c45/fire)
	cost = COST_MIN * 18000

/*
		Shotgun ammo
*/

/datum/supply_pack/ammo/c12mm/buckshot
	name = "Ящик с картечью 12мм (Buckshot)"
	desc = "Содержит две коробки картечи для охоты или защиты. Или доказывания своей правоты."
	cost = COST_MIN * 4000
	contains = list(/obj/item/ammo_box/shotgunbox/buckshot,
					/obj/item/ammo_box/shotgunbox/buckshot)

/datum/supply_pack/ammo/c12mm/slugs
	name = "Ящик с патронами 12мм (Slug)"
	desc = "Содержит две коробки пуль для охоты или защиты. Или доказывания своей правоты."
	cost = COST_MIN * 4000
	contains = list(/obj/item/ammo_box/shotgunbox,
					/obj/item/ammo_box/shotgunbox)

/datum/supply_pack/ammo/c12mm/rubber
	name = "Ящик с патронами 12мм (Rubber)"
	desc = "Содержит две коробки резиновой картечи для защиты. Или установления порядка."
	cost = COST_MIN * 4000
	contains = list(/obj/item/ammo_box/shotgunbox/rubber,
					/obj/item/ammo_box/shotgunbox/rubber)

/datum/supply_pack/ammo/c12mm/beanbag
	name = "Ящик с патронами 12мм (Beanbag)"
	desc = "Содержит две коробки резиновых пуль для защиты. Или установления порядка."
	cost = COST_MIN * 2000
	contains = list(/obj/item/ammo_box/shotgunbox/beanbag,
					/obj/item/ammo_box/shotgunbox/beanbag)

/datum/supply_pack/ammo/c12mm/incendiary
	name = "Ящик с патронами 12мм (Incendiary)"
	desc = "Содержит две коробки зажигательных пуль для защиты. Или устрашения врага."
	cost = COST_MIN * 6000
	contains = list(/obj/item/ammo_box/shotgunbox/incendiary,
					/obj/item/ammo_box/shotgunbox/incendiary)

/*
		.38 ammo
*/

/datum/supply_pack/ammo/c38_ammo
	name = "Ящик с патронами .38 калибра (Winchester and Detective Special)"
	desc = "Содержит два ящика с патронами на 30 патронов для перезарядки оружия .38 калибра."
	cost = COST_MIN * 5000
	contains = list(/obj/item/ammo_box/c38_box,
					/obj/item/ammo_box/c38_box)
	crate_name = "оружейный ящик"

/datum/supply_pack/ammo/c38_hunting_ammo
	name = "Ящик с охотничьими патронами .38 калибра (Winchester and Detective Special)"
	desc = "Содержит два ящика на 30 патронов для перезарядки оружия .38 калибра для охоты на слонов."
	cost = COST_MIN * 4000
	contains = list(/obj/item/ammo_box/c38_box/hunting,
					/obj/item/ammo_box/c38_box/hunting)
	crate_name = "оружейный ящик"

/datum/supply_pack/ammo/c38
	name = "Спидлоадер .38 калибра"
	desc = "Содержит один спидлоадер с патронами калибра .38, идеально подходящий для демонстрации самой быстрой руки в этом секторе."
	cost = COST_MIN * 1200
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38)
	crate_name = "ящик со спидлоадером .38 калибра"

/datum/supply_pack/ammo/c38/match
	name = "Спидлоадер .38 калибра (Match)"
	desc = "Содержит один спидлоадер с патронами типа “Матч“ калибра .38, отскакивающими от поверхностей и наделенными необычайной точностью."
	cost = COST_MIN * 2400
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/match)
	crate_name = "ящик со спидлоадером .38 калибра"

/datum/supply_pack/ammo/c38/rubber
	name = "Спидлоадер .38 калибра (Rubber)"
	desc = "Содержит один спидлоадер с резиновыми патронами типа “Матч“ калибра .38, отскакивающими от поверхностей и наделенными необычайной точностью."
	cost = COST_MIN * 2400
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/match/bouncy)
	crate_name = "ящик со спидлоадером .38 калибра"

/datum/supply_pack/ammo/c38/dumdum
	name = "Спидлоадер .38 калибра (DumDum)"
	desc = "Содержит один спидлоадер с патронами типа “Дум-Дум“ калибра .38, обладающими самой разрывной силой среди револьверных калибров."
	cost = COST_MIN * 3600
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/dumdum)
	crate_name = "ящик со спидлоадером .38 калибра"

/*
		WT-550 ammo
*/

/datum/supply_pack/ammo/wt550_ammo
	name = "Ящик с боеприпасами для автоматической винтовки WT-550"
	desc = "Содержит три магазина на 20 патронов для автоматической винтовки WT-550 для быстрой тактической перезарядки."
	cost = 4500
	contains = list(/obj/item/ammo_box/magazine/wt550m9,
					/obj/item/ammo_box/magazine/wt550m9,
					/obj/item/ammo_box/magazine/wt550m9)

/datum/supply_pack/ammo/cool_wt550_ammo
	name = "Ящик с экзотическими патронами для автоматической винтовки WT-550"
	desc = "Содержит один магазин бронебойных и один магазин зажигательных патронов для автомата WT-550. К сожалению, наш производитель прекратил выпуск пуль из урана."
	cost = 7500
	contains = list(/obj/item/ammo_box/magazine/wt550m9/wtap,
					/obj/item/ammo_box/magazine/wt550m9/wtic)
