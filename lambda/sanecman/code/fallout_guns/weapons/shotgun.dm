// Guns
/obj/item/gun/ballistic/shotgun/fallout/lever
	name = "рычажной дробовик"
	desc = "Не только мощный дробовик, но ещё и неплохое оружие ближнего боя."
	icon_state = "levershot"
	inhand_icon_state = "levershot"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lever
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/levershot/levershot2.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 25
	fire_delay = 5

/obj/item/gun/ballistic/shotgun/fallout/huntingshot
	name = "охотничий дробовик"
	desc = "Старое помповое ружье с удлиненным стволом, вмещающим восемь патронов, и громоздким прикладом, отлично подходящим для ближнего боя."
	icon_state = "huntingshot"
	inhand_icon_state = "huntingshot"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/huntingshot
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/huntingshot/huntingshot2.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 30
	fire_delay = 5

/obj/item/gun/ballistic/shotgun/fallout/trail
	name = "карабин следопыта"
	desc = "Карабин рычажного действия под патрон .44 Magnum с солидной емкостью."
	icon_state = "trail"
	inhand_icon_state = "trail"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube44
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'lambda/sanecman/sound/fallout/trailfire.ogg'
	fire_delay = 5
	extra_damage = 40
	extra_penetration = 10

/obj/item/gun/ballistic/shotgun/fallout/cowboy
	name = "рычажной карабин"
	desc = "Классический карабин со скобой Генри под .357 калибр."
	icon_state = "cowboy"
	inhand_icon_state = "cowboy"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube357
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/repeater/repeater1.ogg'
	fire_delay = 5
	extra_penetration = 10

/obj/item/gun/ballistic/shotgun/fallout/brush
	name = "медвежье ружьё"
	desc = "Ружьё рычажного действия под смертоносный патрон .45-70. Не может вмещать много патронов и стреляет не очень быстро, но с таким большим уроном это действительно имеет значение?"
	icon_state = "brush"
	inhand_icon_state = "brush"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube4570
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'lambda/sanecman/sound/fallout/brushfire.ogg'
	fire_delay = 5
	extra_damage = 55
	extra_penetration = 10

/obj/item/gun/ballistic/shotgun/automatic/fallout/battle
	name = "боевое ружьё"
	desc = "Очень старая, но очень надежная полуавтоматическая винтовка. Под патрон .308."
	icon_state = "battler"
	inhand_icon_state = "battler"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/battler
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'lambda/sanecman/sound/fallout/battlerifle.ogg'
	fire_delay = 5
	extra_damage = 40
	extra_penetration = 15

/obj/item/gun/ballistic/shotgun/automatic/fallout/battle/sks
	name = "СКС"
	desc = "Старая европейская полуавтоматическая винтовка под патрон 7,62, обычно питаемая из 10-зарядных обойм."
	icon_state = "sks"
	inhand_icon_state = "sks"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/sks
	fire_sound = 'lambda/sanecman/sound/fallout/gunsounds/sks/sks1.ogg'
	extra_damage = 30
	extra_penetration = 10

/obj/item/gun/ballistic/shotgun/automatic/fallout/battle/sks/warfare
	extra_damage = 60
	extra_penetration = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/sks/warfare

/obj/item/gun/ballistic/shotgun/automatic/fallout/battle/sks/scoped
	name = "СКС"
	desc = "СКС с прикрепленным оптическим прицелом и улучшенными нарезами для лучшего пробития."
	icon_state = "scoped_sks"
	inhand_icon_state = "scoped_sks"
	extra_penetration = 15

/obj/item/gun/ballistic/shotgun/automatic/fallout/battle/sks/scoped/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

//Magazines
/obj/item/ammo_box/magazine/internal/shot/tube4570
	name = "внутренний трубчатый магазин .45-70"
	ammo_type = /obj/item/ammo_casing/fallout/c4570
	caliber = "4570"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shot/tube44
	name = "внутренний трубчатый магазин .44"
	ammo_type = /obj/item/ammo_casing/fallout/m44
	caliber = "44"
	max_ammo = 8

/obj/item/ammo_box/magazine/internal/shot/tube357
	name = "внутренний трубчатый магазин .357"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/shot/battler
	name = "встроеный магазин боевого ружья (.308)"
	ammo_type = /obj/item/ammo_casing/fallout/a308
	caliber = "a308"
	max_ammo = 8

/obj/item/ammo_box/magazine/internal/shot/sks
	name = "встроеный магазин СКС (7.62)"
	ammo_type = /obj/item/ammo_casing/fallout/a762
	caliber = "a762"
	max_ammo = 10


/obj/item/ammo_box/magazine/internal/shot/sks/warfare
	name = "встроеный магазин СКС (7.62)"
	ammo_type = /obj/item/ammo_casing/fallout/a762
	caliber = "a762"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/shot/lever
	name = "внутренний трубчатый магазин рычажного дробовика"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/shot/huntingshot
	name = "внутренний трубчатый магазин охотничьего ружья"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 8

/obj/item/ammo_box/magazine/internal/shot/huntingshot/fire
	ammo_type = /obj/item/ammo_casing/shotgun/incendiary

//Loaders
/obj/item/ammo_box/fallout/tube4570
	name = "скорозарядник .45-70"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "4570tube"
	ammo_type = /obj/item/ammo_casing/fallout/c4570
	caliber = "4570"
	max_ammo = 6

/obj/item/ammo_box/fallout/tube44
	name = "скорозарядник .44"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "44tube"
	ammo_type = /obj/item/ammo_casing/fallout/m44
	caliber = "44"
	max_ammo = 8

/obj/item/ammo_box/fallout/tube357
	name = "винтовочный скорозарядник .357 калибра"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "357tube"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 7

/obj/item/ammo_box/fallout/battler
	name = "клипса для боевого ружья (.308)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "battler"
	ammo_type = /obj/item/ammo_casing/fallout/a308
	caliber = "a308"
	max_ammo = 8

/obj/item/ammo_box/fallout/sks
	name = "клипса для СКС (7.62)"
	icon = 'lambda/sanecman/icons/fallout/ammo.dmi'
	icon_state = "sksclip"
	ammo_type = /obj/item/ammo_casing/fallout/a762
	caliber = "a762"
	max_ammo = 10
