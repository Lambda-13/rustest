//Guns
/obj/item/gun/ballistic/revolver/fallout/caravan
	name = "дробовик караванщика"
	desc = "Изношенное, но надежное двуствольное ружье."
	icon_state = "caravan"
	inhand_icon_state = "caravan"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/caravan
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/caravan/caravan.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/revolver/fallout/single
	name = "одноствольное ружье"
	desc = "Очень дешевый и очень распространённый дробовик который вмещает один патрон."
	icon_state = "singleshot"
	inhand_icon_state = "singleshot"
	force = 15
	mag_type = /obj/item/ammo_box/magazine/internal/shot/single
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/caravan/caravan2.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/revolver/fallout/single/handmade
	name = "самодельный дробовик"
	desc = "Добовик, сделанный вручную, примерно такой же мощный, как и его брат. Но, может быть, не так надёжен."
	icon_state = "hshot"

/obj/item/gun/ballistic/revolver/fallout/rev44
	name = "\"магнум\" .44"
	desc = "Револьвер двойного действия под патроны калибра .44 Magnum. Прилично быстрый и разрушительный одновременно."
	icon_state = "44magnum"
	inhand_icon_state = "44magnum"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	fire_sound = 'lambda/sanecman/sound/fallout/44mag.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 5
	extra_damage = 35
	extra_penetration = 10

/obj/item/gun/ballistic/revolver/fallout/rev44/mysterious
	name = "мистический \"Магнум\""
	desc = "Уникальный .44 Magnum с серебряной отделкой для стиля, более высокой скорострельностью и уроном для убийства. Однако что-то таинственное в этом пистолете есть своё."
	icon_state = "mysterious"
	inhand_icon_state = "mysterious"
	fire_delay = 4
	extra_damage = 40

/obj/item/gun/ballistic/revolver/fallout/rev44/rifle
	name = "револьверная винтовка .44"
	desc = "Медленно стреляющая револьверная винтовка под патроны .44 Magnum."
	icon_state = "revrifle"
	inhand_icon_state = "revrifle"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 6
	extra_damage = 45
	extra_penetration = 10

/obj/item/gun/ballistic/revolver/fallout/rev357
	name = "\"магнум\" .357"
	desc = "Классический револьвер .357 Magnum стреляет не очень быстро, но наносит приличный урон."
	icon_state = "rev357"
	inhand_icon_state = "rev357"
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/357/357fire3.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 6
	extra_damage = 30
	extra_penetration = 10

/obj/item/gun/ballistic/revolver/fallout/rev357/lucky
	name = "\"Счастливчик\""
	desc = "Уникальный .357 Magnum с причудливой гравировкой и красивой отделкой стреляет и наносит урона сильнее, чем его более слабый брат."
	icon_state = "lucky"
	inhand_icon_state = "lucky"
	fire_delay = 4
	extra_damage = 35

/obj/item/gun/ballistic/revolver/fallout/rev357/heavy
	name = "сверхмощный револьвер .357"
	desc = "Современный сверхмощный револьвер калибра .357 с гораздо большим уроном."
	icon_state = "heavy357"
	inhand_icon_state = "heavy357"
	fire_sound = 'lambda/sanecman/sound/fallout/magnum_fire.ogg'
	fire_delay = 6
	extra_damage = 40
	extra_penetration = 15

/obj/item/gun/ballistic/revolver/fallout/rev357/police
	name = "полицейский револьвер"
	desc = "Легкий револьвер калибра .357, который можно легко хранить и прятать, обычно использовался полицией 20 века."
	icon_state = "policerev"
	inhand_icon_state = "policerev"
	fire_sound = 'lambda/sanecman/sound/fallout/policepistol.ogg'
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 5
	extra_damage = 25
	extra_penetration = 10

/obj/item/gun/ballistic/revolver/fallout/rev357/handmade
	name = "самодельный револьвер"
	desc = "Револьвер, сделанный с нуля, который стреляет патронами калибра .357 с низкой скорострельностью и без особого пробития."
	icon_state = "hrev"
	inhand_icon_state = "hrev"
	extra_penetration = 0

/obj/item/gun/ballistic/revolver/fallout/rev357/handmade/rifle
	name = "самодельная револьверная винтовка"
	desc = "Самодельная винтовка с револьверным цилиндром, стреляющим патронами калибра .357. Не слишком медленный, с приличным уроном и самодельным прицелом."
	icon_state = "hrifle"
	inhand_icon_state = "hrifle"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 5
	extra_damage = 25
	extra_penetration = 10

/obj/item/gun/ballistic/revolver/fallout/rev10mm
	name = "револьвер 10мм"
	desc = "Громоздкий револьвер под патрон 10 мм с емкостью пять патронов."
	icon_state = "rev10mm"
	inhand_icon_state = "rev10mm"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev10mm
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/10mm/10mmfire2.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 5
	extra_damage = 25
	extra_penetration = 10

/obj/item/gun/ballistic/revolver/fallout/huntingrev
	name = "охотничий револьвер"
	desc = "Револьвер двойного действия, рассчитанный на мощные патроны калибра .45-70 и вмещающий только пять патронов одновременно."
	icon_state = "huntingrev"
	inhand_icon_state = "huntingrev"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/huntingrev/huntingrev5.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 6
	extra_damage = 45

/obj/item/gun/ballistic/revolver/fallout/huntingrev/sequoia
	name = "\"Секвойя\""
	desc = "Уникальный и модифицированный револьвер .45-70, который бьет немного сильнее чем его брат."
	icon_state = "sequoia"
	inhand_icon_state = "sequoia"
	extra_damage = 50
	extra_penetration = 5

/obj/item/gun/ballistic/revolver/fallout/rev556
	name = "револьвер 5.56"
	desc = "Современный и скорострельный револьвер калибра 5.56."
	icon_state = "556rev"
	inhand_icon_state = "556rev"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev556
	fire_sound = 'lambda/sanecman/sound/fallout/that_gun.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 4
	extra_damage = 30
	extra_penetration = 10

//Magazines
/obj/item/ammo_box/magazine/internal/shot/caravan
	name = "caravan shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shot/single
	name = "single shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/cylinder/rev44
	name = ".44 magnum cylinder"
	ammo_type = /obj/item/ammo_casing/fallout/m44
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	caliber = "44"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rev357
	name = ".357 magnum cylinder"
	ammo_type = /obj/item/ammo_casing/fallout/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rev10mm
	name = "10mm revolver cylinder"
	ammo_type = /obj/item/ammo_casing/fallout/c10mm
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	caliber = "10mm"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/rev4570
	name = ".45-70 cylinder"
	ammo_type = /obj/item/ammo_casing/fallout/c4570
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	caliber = "4570"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/rev556
	name = "5.56 revolver cylinder"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/fallout/a556
	caliber = "a556"
	max_ammo = 5

//Loaders
/obj/item/ammo_box/fallout/rev4570
	name = "скорозарядник .45-70"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "rev4570"
	ammo_type = /obj/item/ammo_casing/fallout/c4570
	caliber = "4570"
	max_ammo = 5

/obj/item/ammo_box/fallout/rev44
	name = "скорозарядник .44 Магнум"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "rev44"
	ammo_type = /obj/item/ammo_casing/fallout/m44
	caliber = "44"
	max_ammo = 6

/obj/item/ammo_box/fallout/rev357
	name = "скорозарядник .357 Магнум"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "rev357"
	ammo_type = /obj/item/ammo_casing/fallout/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/fallout/rev556
	name = "скорозарядник 5.56"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "rev556"
	ammo_type = /obj/item/ammo_casing/fallout/a556
	caliber = "a556"
	max_ammo = 5

/obj/item/ammo_box/fallout/rev10mm
	name = "скорозарядник 10мм"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "rev10mm"
	ammo_type = /obj/item/ammo_casing/fallout/c10mm
	caliber = "10mm"
	max_ammo = 5
