//Guns
/obj/item/gun/ballistic/automatic/fallout/smg45
	name = ".45 пистолет-пулемёт"
	desc = "Класический .45 пистолет-пулемёт использующий вместительный барабанный магазин на 50 патронов."
	icon_state = "smg45"
	inhand_icon_state = "smg45"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/fallout/smgm45
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/45/45auto3.ogg'
	can_suppress = FALSE
	fire_delay = 3
	burst_size = 3
	extra_damage = 15
	extra_penetration = 5
	spread = 12

/obj/item/gun/ballistic/automatic/fallout/smg22
	name = ".22 пистолет-пулемёт"
	desc = "Пистолет-пулемёт .22 со встроенным глушителемкоторый питается из большого лоткового магазина, расположенного в верхней части ПП. Интересное оружие для интересных людей."
	icon_state = "smg22"
	inhand_icon_state = "smg22"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	suppressed = TRUE
	can_unsuppress = FALSE
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/fallout/smgm22
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	fire_delay = 3
	burst_size = 3
	extra_damage = 15
	spread = 12

/obj/item/gun/ballistic/automatic/fallout/smg10mm
	name = "10мм пистолет-пулемёт"
	desc = "Одноручный 10мм пистолет-пулемёт. Достойная мощность в маленьком корпусе."
	icon_state = "smg10mm"
	inhand_icon_state = "smg10mm"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/fallout/smgm10mm
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/10mmsmg/10mmsmg1.ogg'
	burst_size = 3
	fire_delay = 3
	extra_damage = 15
	extra_penetration = 5
	spread = 12

/obj/item/gun/ballistic/automatic/fallout/smg9mm
	name = "9mm пистолет-пулемёт"
	desc = "Скорострельный 9мм пистолет-пулемёт. Не наносит много повреждений за выстрел, но это не имеет значения, когда вы стреляете быстро."
	icon_state = "smg9mm"
	inhand_icon_state = "smg9mm"
	mag_type = /obj/item/ammo_box/magazine/fallout/smgm9mm
	fire_sound = 'lambda/sanecman/sound/fallout/greasegun.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 3
	extra_damage = 15
	force = 15
	spread = 12

/obj/item/gun/ballistic/automatic/fallout/smg9mm/handmade
	name = "самодельный пистолет-пулемёт"
	desc = "Пистолет-пулемёт собраный из хлама и использующий 9мм SMG магазин. Плохо сделанный корпус затрудняет точную стрельбу."
	icon_state = "hsmg"
	inhand_icon_state = "hsmg"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 16

/obj/item/gun/ballistic/automatic/fallout/smg12mm
	name = "12.7мм пистолет-пулемёт"
	desc = "Сверхмощный пистолет-пулемёт под патрон 12,7мм не может вместить много патронов, но несмотря на это он бьёт больно."
	icon_state = "smg12mm"
	inhand_icon_state = "smg12mm"
	mag_type = /obj/item/ammo_box/magazine/fallout/smg12mm
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/12mm/m12mm2.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 3
	extra_damage = 15
	extra_penetration = 15
	force = 15
	spread = 10

/obj/item/gun/ballistic/automatic/fallout/assaultrifle
	name = "штурмовая винтовка"
	desc = "Стандартная автоматическая штурмовая винтовка общего назначения под патрон 5,56. Обычно использовался довоенными вооруженными силами США в 20-21 веках."
	icon_state = "assaultrifle"
	inhand_icon_state = "assaultrifle"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/fallout/r20
	fire_sound = 'lambda/sanecman/sound/fallout/arfire.ogg'
	burst_size = 3
	fire_delay = 3
	extra_damage = 20
	extra_penetration = 10
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 8

/obj/item/gun/ballistic/automatic/fallout/assaultrifle/infiltrator
	name = "\"Уничтожитель\""
	desc = "Сильно модифицированная штурмовая винтовка с оптическим прицелом и глушителем в качестве наиболее заметных дополнений. Жертвует уроном ради меткости."
	icon_state = "infiltrator"
	inhand_icon_state = "infiltrator"
	suppressed = TRUE
	can_unsuppress = FALSE
	extra_damage = 20
	extra_penetration = 0
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	spread = 6

/obj/item/gun/ballistic/automatic/fallout/assaultrifle/infiltrator/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

/obj/item/gun/ballistic/automatic/fallout/assaultrifle/chinese
	name = "китайская штурмовая винтовка"
	desc = "Штурмовая винтовка китайского производства с более тяжелым патроном калибра 7,62 обладает большей мощностью в обмен на меньшую точность."
	icon_state = "chinesear"
	inhand_icon_state = "chinesear"
	mag_type = /obj/item/ammo_box/magazine/fallout/ar762
	fire_sound = 'lambda/sanecman/sound/fallout/chinesearfire.ogg'
	extra_penetration = 10
	spread = 10

/obj/item/gun/ballistic/automatic/fallout/assaultrifle/chinese/handmade
	name = "самодельная штурмовая винтовка"
	desc = "Самодельная штурмовая винтовка достойного качества под патрон 7.62."
	icon_state = "handmadear"
	inhand_icon_state = "handmadear"
	extra_penetration = 0

/obj/item/gun/ballistic/automatic/fallout/marksman
	name = "снайперский карабин"
	desc = "Карабин калибра 5,56 с прикрепленным оптическим прицелом для помощи в бою на дальних дистанциях. Обладает хорошей мощностью, но меньшей скорострельностью."
	icon_state = "marksman"
	inhand_icon_state = "marksman"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/fallout/r20
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/marksman/marksman2.ogg'
	can_suppress = FALSE
	fire_delay = 6
	extra_damage = 35
	extra_penetration = 10
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/fallout/marksman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

/obj/item/gun/ballistic/automatic/fallout/marksman/american
	name = "\"Всеамериканский\""
	desc = "Уникальный снайперский карабин. Усовершенствованные нарезы и подобные модификации позволяют увеличить урон, а окраска — повысить патриотизм."
	icon_state = "allamerican"
	inhand_icon_state = "allamerican"
	extra_damage = 40

/obj/item/gun/ballistic/automatic/fallout/marksman/service
	name = "служебная винтовка"
	desc = "Полуавтоматическая винтовка калибра 5,56, произведенная ныне несуществующей республикой." // НКР
	icon_state = "service"
	inhand_icon_state = "service"
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/service/service3.ogg'
	fire_delay = 4
	extra_damage = 25
	extra_penetration = 5

/obj/item/gun/ballistic/automatic/fallout/marksman/service/survival
	name = "боевая винтовка"
	desc = "Уникальная сверхмощная служебная винтовка. Стреляет медленнее, но наносит гораздо больший удар. Определенно видел, что это справедливая доля битвы."
	icon_state = "survivalist"
	inhand_icon_state = "survivalist"
	fire_delay = 5
	extra_damage = 35
	extra_penetration = 10

/obj/item/gun/ballistic/automatic/fallout/marksman/service/police22
	name = "полицейская винтовка"
	desc = "Полуавтоматическая винтовка калибра .22, в основном использовавшаяся полицейскими силами 20 века."
	icon_state = "rugerpolice"
	inhand_icon_state = "rugerpolice"
	mag_type = /obj/item/ammo_box/magazine/fallout/r22
	fire_sound = 'lambda/sanecman/sound/fallout/varmint_rifle.ogg'
	fire_delay = 4
	extra_damage = 20
	extra_penetration = 0

/obj/item/gun/ballistic/automatic/fallout/marksman/sniper
	name = "снайперская винтовка"
	desc = "Мощная полуавтоматическая снайперская винтовка калибра .308. Идеальное оружие для решительного убийцы."
	icon_state = "sniper"
	inhand_icon_state = "sniper"
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/sniper/sniper2.ogg'
	fire_delay = 6
	extra_damage = 65
	extra_penetration = 50
	mag_type = /obj/item/ammo_box/magazine/fallout/r308

//Magazines
/obj/item/ammo_box/magazine/fallout/r20
	name = "магазин на 20 патронов (5.56mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "556r20"
	ammo_type = /obj/item/ammo_casing/fallout/a556
	caliber = "a556"
	max_ammo = 20
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/smgm10mm
	name = "магазин на 24 патрона (10mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "smg10mm"
	ammo_type = /obj/item/ammo_casing/fallout/c10mm
	caliber = "10mm"
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/smgm9mm
	name = "магазин на 30 патронов (9mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "smg9mm"
	ammo_type = /obj/item/ammo_casing/fallout/c9mm
	caliber = "9mm"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/smgm45
	name = "барабанный магазин на 50 патронов (.45)"
	icon_state = "smg45"
	ammo_type = /obj/item/ammo_casing/fallout/c45
	caliber = ".45"
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/ar762
	name = "магазин на 24 патронов (7.62mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "ar762"
	ammo_type = /obj/item/ammo_casing/fallout/a762
	caliber = "a762"
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/smgm22
	name = "магазин на 60 патронов (.22)"
	icon_state = "smg22"
	ammo_type = /obj/item/ammo_casing/fallout/c22
	caliber = ".22"
	max_ammo = 60
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/r22
	name = "магазин на 15 патронов (.22)"
	icon_state = "r22"
	ammo_type = /obj/item/ammo_casing/fallout/c22
	caliber = ".22"
	max_ammo = 15
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/smg12mm
	name = "магазин на 21 патронов (12.7mm)"
	icon_state = "smg12mm"
	ammo_type = /obj/item/ammo_casing/fallout/m12mm
	caliber = "12.7mm"
	max_ammo = 21
