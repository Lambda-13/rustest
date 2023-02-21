//Guns
/obj/item/gun/ballistic/automatic/pistol/fallout/m10mm
	name = "10мм полицейский пистолет"
	desc = "Полицеский пистолет 10мм калибра использовавшийся полицией."
	icon_state = "police10mm"
	inhand_icon_state = "police10mm"
	mag_type = /obj/item/ammo_box/magazine/fallout/m10mm
	fire_sound = 'lambda/sanecman/sound/fallout/10mm_fire_02.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 4
	extra_damage = 20
	extra_penetration = 10

/obj/item/gun/ballistic/automatic/pistol/fallout/m10mm/military
	name = "10мм военный пистолет"
	desc = "Усовершенствованный 10мм пистолет, использовавшийся армией США в качестве оружия."
	icon_state = "mil10mm"
	inhand_icon_state = "mil10mm"
	extra_damage = 25

/obj/item/gun/ballistic/automatic/pistol/fallout/m10mm/chinese
	name = "китайский пистолет"
	desc = "Серийный довоенный китайский пистолет под патрон 10мм."
	icon_state = "cpistol"
	inhand_icon_state = "cpistol"
	mag_type = /obj/item/ammo_box/magazine/internal/cpistol
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/chinese/chinese1.ogg'
	extra_damage = 25
	extra_penetration = 0
	internal_magazine = TRUE

/obj/item/gun/ballistic/automatic/pistol/fallout/m10mm/chinese/v420
	name = "китайский пистолет 420"
	desc = "Прототип китайского пистолета с более низкой скорострельностью, но гораздо более высоким уроном, а также с гораздо лучшим внешним видом."
	icon_state = "420pistol"
	inhand_icon_state = "420pistol"
	extra_damage = 35
	extra_penetration = 10
	fire_delay = 5

/obj/item/gun/ballistic/automatic/pistol/fallout/m9mm
	name = "9мм пистолет"
	desc = "Очень распространенный и простой в обращении пистолет калибра 9мм."
	icon_state = "9mm"
	inhand_icon_state = "9mm"
	mag_type = /obj/item/ammo_box/magazine/fallout/m9mm
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/9mm/9mm2.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 4
	extra_damage = 20
	extra_penetration = 5

/obj/item/gun/ballistic/automatic/pistol/fallout/m9mm/maria
	name = "\"Мария\""
	desc = "Пользовательская и улучшенная модель 9-мм пистолета с улучшенной скорострельностью, уроном и стилем. Похоже, будто её прошлому владельцу выпало 18 карат невезения."
	icon_state = "maria"
	inhand_icon_state = "maria"
	fire_delay = 3
	extra_damage = 25
	extra_penetration = 10

/obj/item/gun/ballistic/automatic/pistol/fallout/m9mm/handmade
	name = "самодельный пистолет"
	desc = "Собран из подручных материалов. Стреляет очень медленно."
	icon_state = "hpistol"
	inhand_icon_state = "hpistol"
	fire_delay = 5

/obj/item/gun/ballistic/automatic/pistol/fallout/m12mm
	name = "12.7мм пистолет"
	desc = "Сверхмощный европейский пистолет под патрон 12,7мм."
	icon_state = "m12mm"
	inhand_icon_state = "m12mm"
	mag_type = /obj/item/ammo_box/magazine/fallout/m12mm
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/12mm/m12mm1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 4
	extra_damage = 35
	extra_penetration = 15

/obj/item/gun/ballistic/automatic/pistol/fallout/m12mm/devil
	name = "\"Дьяволёнок\""
	desc = "Уникальная и модифицированная версия 12,7мм пистолета с более высокой скорострельностью, улучшенным уроном и прикрепленным глушителем."
	icon_state = "devil"
	inhand_icon_state = "devil"
	suppressed = TRUE
	can_unsuppress = FALSE
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	fire_delay = 3
	extra_damage = 35
	extra_penetration = 20

/obj/item/gun/ballistic/automatic/pistol/fallout/pistol45
	name = ".45 пистолет"
	desc = "Классический пистолет под патрон .45 калибра. Чем не нравится?"
	icon_state = "45pistol"
	inhand_icon_state = "45pistol"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/fallout/m45
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/45/45auto1.ogg'
	can_suppress = FALSE
	fire_delay = 4
	extra_damage = 30
	extra_penetration = 5

/obj/item/gun/ballistic/automatic/pistol/fallout/deagle
	name = "пустынный орёл"
	desc = "Мощный, тяжелый пистолет с уникальным патроном .44 для магнума."
	icon_state = "deagle"
	inhand_icon_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/fallout/deagle
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/44/44mag1.ogg'
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_NORMAL
	extra_damage = 45
	extra_penetration = 5
	fire_delay = 5

/obj/item/gun/ballistic/automatic/pistol/fallout/pistol22
	name = ".22 пистолет"
	desc = "Чрезвычайно слабый, но также чрезвычайно простой для скрытых ликвидаций пистолет калибра .22. У этого есть встроенный глушитель."
	icon_state = "22pistol"
	inhand_icon_state = "22pistol"
	mag_type = /obj/item/ammo_box/magazine/fallout/m22
	suppressed = TRUE
	can_unsuppress = FALSE
	w_class = WEIGHT_CLASS_SMALL
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	extra_damage = 15
	fire_delay = 4


//Magazines
/obj/item/ammo_box/magazine/fallout/m45
	name = "магазин на 7 патронов (.45)"
	icon_state = "45"
	ammo_type = /obj/item/ammo_casing/fallout/c45
	caliber = ".45"
	max_ammo = 7

/obj/item/ammo_box/magazine/fallout/deagle
	name = "магазин на 8 патронов (.44)"
	icon_state = "deagle"
	ammo_type = /obj/item/ammo_casing/fallout/m44
	caliber = "44"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/m10mm
	name = "магазин на 12 патронов (10mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "10mm"
	ammo_type = /obj/item/ammo_casing/fallout/c10mm
	caliber = "10mm"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/m9mm
	name = "магазин на 13 патронов (9mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "9mm-13"
	ammo_type = /obj/item/ammo_casing/fallout/c9mm
	caliber = "9mm"
	max_ammo = 13

/obj/item/ammo_box/magazine/fallout/m9mm/update_icon()
	..()
	icon_state = "9mm-[ammo_count()]"

/obj/item/ammo_box/magazine/fallout/m22
	name = "магазин на 16 патронов (.22)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "22"
	ammo_type = /obj/item/ammo_casing/fallout/c22
	caliber = ".22"
	max_ammo = 16

/obj/item/ammo_box/magazine/fallout/m12mm
	name = "магазин на 7 патронов (12.7mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "m12mm"
	ammo_type = /obj/item/ammo_casing/fallout/m12mm
	caliber = "12.7mm"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/cpistol
	name = "интегрированный магазин китайского пистолета"
	ammo_type = /obj/item/ammo_casing/fallout/c10mm
	caliber = "10mm"
	max_ammo = 10
	multiple_sprites = 2

//Loaders
/obj/item/ammo_box/fallout/cpistol
	name = "клипса для китайского пистолета (10mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "cpistol"
	ammo_type = /obj/item/ammo_casing/fallout/c10mm
	caliber = "10mm"
	max_ammo = 10
