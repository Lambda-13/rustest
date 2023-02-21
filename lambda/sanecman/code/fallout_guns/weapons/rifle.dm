//Guns
/obj/item/gun/ballistic/rifle/fallout/hunting
	name = "охотничье ружье"
	desc = "Прочная охотничья винтовка с продольно-скользящим затвором под патрон 308."
	icon_state = "hunting"
	inhand_icon_state = "hunting"
	mag_type = /obj/item/ammo_box/magazine/fallout/r308
	fire_sound = 'lambda/sanecman/sound/fallout/hunting_rifle.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	extra_damage = 40
	extra_penetration = 15
	fire_delay = 6

/obj/item/gun/ballistic/rifle/fallout/hunting/scoped
	name = "охотничье ружье с прицелом"
	desc = "Охотничья винтовка с продольно-скользящим поворотным затвором, с прикрепленным оптическим прицелом и слегка улучшенным стволом для лучшего пробивания."
	icon_state = "scoped_hunting"
	inhand_icon_state = "scoped_hunting"
	extra_penetration = 20

/obj/item/gun/ballistic/rifle/fallout/hunting/scoped/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

/obj/item/gun/ballistic/rifle/fallout/varmint
	name = "варминт-винтовка"
	desc = "Легкое охотничье ружье под патрон 5,56."
	icon_state = "varmint"
	inhand_icon_state = "varmint"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'lambda/sanecman/sound/fallout/varmint_rifle.ogg'
	fire_delay = 6
	extra_damage = 30
	extra_penetration = 5
	mag_type = /obj/item/ammo_box/magazine/fallout/r20

/obj/item/gun/ballistic/rifle/fallout/varmint/ratslayer
	name = "\"Крысобой\""
	desc = "Уникально модифицированная варминт-винтовка с улучшенными нарезами, оптическим прицелом и глушителем."
	icon_state = "ratslayer"
	inhand_icon_state = "ratslayer"
	extra_damage = 35
	extra_penetration = 10
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	suppressed = TRUE
	can_unsuppress = FALSE

/obj/item/gun/ballistic/rifle/fallout/varmint/ratslayer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

/obj/item/gun/ballistic/rifle/fallout/hunting/scoped/amr
	name = "анти-материальное ружьё"
	desc = "Сверхмощная снайперская винтовка калибра .50. Поохотимся?"
	icon_state = "amr"
	inhand_icon_state = "amr"
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_sound = 'lambda/sanecman/sound/fallout/amrfire.ogg'
	fire_delay = 8
	extra_damage = 60

//Magazines
/*
/obj/item/ammo_box/magazine/fallout/r10
	name = "магазин на 10 патронов (5.56mm)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "556r10"
	ammo_type = /obj/item/ammo_casing/fallout/a556
	caliber = "a556"
	max_ammo = 10
	multiple_sprites = 2
*/

/obj/item/ammo_box/magazine/fallout/r308
	name = "магазин на 5 патронов (.308)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "r308-5"
	ammo_type = /obj/item/ammo_casing/fallout/a308
	caliber = "a308"
	max_ammo = 5
	multiple_sprites = 2

/obj/item/ammo_box/magazine/fallout/r308/update_icon()
	..()
	if(ammo_count())
		icon_state = "r308-5"
	else
		icon_state = "r308-0"

/*
/obj/item/ammo_box/magazine/fallout/amr
	name = "магазин на 6 патронов (.50)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "50cal"
	ammo_type = /obj/item/ammo_casing/fallout/a50MG
	caliber = "a50MG"
	max_ammo = 6
	multiple_sprites = 2
*/
