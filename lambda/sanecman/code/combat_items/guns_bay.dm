/*
//По сути тут используются только спрайты и виды стрельбы оружия с baystation 12 infinity edition
// Первый этап: добавление
// Второй этап: сортировка
// Третий этап: обновление
/obj/item/gun/energy/toxgun
	name = "плазменный пистолет"
	desc = "Специфичное оружие которое стреляет сгустками плазмы."
	icon = 'lambda/sanecman/icons/bay12/guns/toxgun.dmi'
	icon_state = "toxgun"
	w_class = WEIGHT_CLASS_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_PHORON = 4)
	projectile_type = /obj/item/projectile/energy/phoron

/obj/item/gun/energy/gun/secure
	name = "LAEP90 смартган"
	desc = "Более безопасный LAEP90, LAEP90-S разработан, чтобы угодить параноикам."
	icon = 'lambda/sanecman/icons/bay12/guns/energy_gun_secure.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns_secure.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns_secure.dmi',
		)
	item_state = null	//so the human update icon uses the icon_state instead.
	req_access = list(list(access_brig, access_bridge))
	authorized_modes = list(AUTHORIZED, AUTHORIZED, UNAUTHORIZED) //inf, was: list(ALWAYS_AUTHORIZED, AUTHORIZED, UNAUTHORIZED)
	s_gun = "LP90-S"

/obj/item/gun/energy/gun/secure/preauthorized
	authorized_modes = list(ALWAYS_AUTHORIZED, AUTHORIZED, AUTHORIZED)

/obj/item/gun/projectile/automatic/nt41
	name = "NT41 submachine gun"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "nt41"
	item_state = "nt41"
	icon = 'lambda/sanecman/icons/bay12/guns.dmi'
	wielded_item_state = "nt41-wielded"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'icons/mob/onmob/lefthand.dmi',
		)

	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/nt28mm
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/n10mm
	allowed_magazines = /obj/item/ammo_magazine/n10mm
	screen_shake = 0.5 //SMG

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=2,    one_hand_penalty=3, burst_accuracy=list(0,-1),       dispersion=list(0.0, 0.8)),
		list(mode_name="short bursts",   burst=4, fire_delay=null, move_delay=4,    one_hand_penalty=4, burst_accuracy=list(0,-1,-1.5,-2), dispersion=list(0.6, 0.8, 1.0, 1.4)),
		)

	bulk = GUN_BULK_CARABINE
	w_class = WEIGHT_CLASS_NORMAL
	one_hand_penalty = 2

/obj/item/gun/projectile/automatic/nt41/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "nt41" : "nt41-e"

/obj/item/gun/projectile/automatic/amrcarabine
	name = "LDC-542 carabine"
	desc = "The sielent and deadly and manufactured by Aussec Armory, bullpup carabine LDC-542 is a common weapon for a long-medium ranged combat units in Private Military Companies. Uses 12.7x55mm rounds."
	icon = 'lambda/sanecman/icons/bay12/guns.dmi'
	icon_state = "amrcarabine"
	item_state = "z8carbine"
	force = 10
	caliber = CALIBER_ANTIMATERIAL_SMALL
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c12755
	allowed_magazines = /obj/item/ammo_magazine/c12755
	ammo_type = /obj/item/ammo_casing/a12755
	wielded_item_state = "z8carbine-wielded"
	burst_delay = 2
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=4, move_delay=1, one_hand_penalty=7, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=6, move_delay=1, one_hand_penalty=15, burst_accuracy=list(0,-0.8), dispersion=list(0.0, 0.4)),
		)

	bulk = GUN_BULK_RIFLE
	w_class = WEIGHT_CLASS_HUGE
	one_hand_penalty = 7

/obj/item/gun/projectile/automatic/amrcarabine/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "amrcarabine" : "amrcarabine-e"


/obj/item/gun/projectile/automatic/bp15
	name = "BP-15 PDW"
	desc = "The BP-15 'Moloh' is a  personal defense weapon, produced by Aussec Armory for use by police spec ops or solders. Uses 5.7x28 mm rounds."
	icon = 'icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		)
	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c57
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc57
	allowed_magazines = /obj/item/ammo_magazine/mc57

	//machine pistol, like SMG but easier to one-hand with
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

	bulk = GUN_BULK_SMG
	w_class = WEIGHT_CLASS_NORMAL
	one_hand_penalty = 3

/obj/item/gun/projectile/automatic/bp15/on_update_icon()
	icon_state = (ammo_magazine)? "pdw" : "pdw-empty"
	..()

/obj/item/gun/projectile/automatic/invider
	name = "Invider submachine gun"
	desc = "The Invider is a Hi-tech and rapid firing SMG. Uses 4.6x30mm universal rounds."
	icon = 'icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	var/projetcile_type = 0
	force = 10
	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ESOTERIC = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/uni46x30mm
	allowed_magazines = /obj/item/ammo_magazine/uni46x30mm
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=0, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

	bulk = GUN_BULK_CARABINE
	w_class = WEIGHT_CLASS_LARGE
	one_hand_penalty = 3


/obj/item/gun/projectile/automatic/invider/modify_projectile(obj/item/projectile/p, var/list/params = list())
	if (params["Charged"] == 1 && loaded.len)
		p = new /obj/item/projectile/bullet/smg/uni46x30mm_charged
	return p

/obj/item/gun/projectile/automatic/invider/CtrlAltClick(mob/user)
	if(user.incapacitated())
		to_chat(user, "<span class='warning'>You can't do that right now!</span>")
		return

	else
		if(src == user.get_active_hand())
			projetcile_type = !projetcile_type
			playsound(user, 'sound/weapons/selector.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You toggle the bullet penetration mode [projetcile_type ? "on":"off"].</span>")

/obj/item/gun/projectile/automatic/invider/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0, var/list/params = list())
	if (projetcile_type == 1)
		..(target, user, clickparams, pointblank, reflex, list("Charged" = 1))
	else
		..(target, user, clickparams, pointblank, reflex, list("Charged" = 0))

/obj/item/gun/projectile/automatic/invider/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "pdw"
	else
		icon_state = "pdw-empty"
	return

/obj/item/gun/projectile/automatic/nt41/armory
	starts_loaded = 0

/obj/item/gun/projectile/shotgun/pump/combat/armory
	starts_loaded = 0

/obj/item/gun/energy/ionrifle
	name = "Mk60 ion rifle"
	desc = "The NT Mk60 EW Halicon is a man portable anti-armor weapon designed to disable mechanical threats, produced by NT. Not the best of its type."
	icon = 'lambda/sanecman/icons/bay12/guns/ion_rifle.dmi' //inf //was: icon = 'lambda/sanecman/icons/bay12/guns/ion_rifle.dmi'
	icon_state = "ionrifle"
	item_state = "ionrifle"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 4)
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	charge_cost = 30
	max_shots = 8
	fire_delay = 30
	projectile_type = /obj/item/projectile/ion
	wielded_item_state = "ionrifle-wielded"
	combustion = 0

	bulk = GUN_BULK_RIFLE
	w_class = WEIGHT_CLASS_HUGE
	one_hand_penalty = 4
	is_serial = 1
	s_gun = "I-60"

/obj/item/gun/energy/ionrifle/emp_act(severity)
	..(max(severity, 2)) //so it doesn't EMP itself, I guess

/obj/item/gun/energy/ionrifle/small
	name = "Mk72 ion pistol"
	desc = "The NT Mk72 EW Preston is a personal defense weapon designed to disable mechanical threats."
	icon = 'lambda/sanecman/icons/bay12/guns/ion_pistol.dmi'
	icon_state = "ionpistol"
	item_state = "ionpistol"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 4)
	force = 5
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	charge_cost = 20
	max_shots = 4
	projectile_type = /obj/item/projectile/ion/small

	bulk = GUN_BULK_REVOLVER
	w_class = WEIGHT_CLASS_NORMAL
	one_hand_penalty = 0
	s_gun = "I-72"

/obj/item/gun/energy/xray
	name = "G56E x-ray carbine"
	desc = "A high-power laser gun capable of emitting concentrated x-ray blasts, that are able to penetrate laser-resistant armor much more readily than standard photonic beams."
	icon = 'lambda/sanecman/icons/bay12/guns/xray.dmi'
	icon_state = "xray"
	item_state = "xray"
	slot_flags = SLOT_BELT|SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 2)
	projectile_type = /obj/item/projectile/beam/xray/midlaser
	charge_cost = 15
	max_shots = 10
	wielded_item_state = "gun_wielded"
	combustion = 0

	bulk = GUN_BULK_CARABINE //inf
	w_class = WEIGHT_CLASS_LARGE
	one_hand_penalty = 2
	s_gun = "G56E"
	is_serial = 1

/obj/item/gun/energy/xray/pistol
	name = "G56E-s x-ray pistol"
	icon = 'lambda/sanecman/icons/bay12/guns/xray_pistol.dmi'
	icon_state = "oldxray"
	item_state = "oldxray"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 2)
	projectile_type = /obj/item/projectile/beam/xray
	fire_delay = 10

	bulk = GUN_BULK_REVOLVER
	w_class = WEIGHT_CLASS_NORMAL
	one_hand_penalty = 1
	s_gun = "G56E-S"

/obj/item/gun/energy/sniperrifle
	name = "9E marksman energy rifle"
	desc = "The HI DMR 9E is an older design of Hephaestus Industries. A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon to kill from a distance."
	icon = 'lambda/sanecman/icons/bay12/guns/laser_sniper.dmi'
	icon_state = "sniper"
	item_state = "laser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	slot_flags = SLOT_BACK
	charge_cost = 40
	max_shots = 4
	fire_delay = 35
	force = 10
	wielded_item_state = "gun_wielded"
	scope_zoom = 2

	accuracy = -2 //shooting at the hip
	scoped_accuracy = 9
	bulk = GUN_BULK_SNIPER_RIFLE
	w_class = WEIGHT_CLASS_HUGE
	one_hand_penalty = 5 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	s_gun = "9E"
	is_serial = 1

/obj/item/gun/energy/sniperrifle/on_update_icon()
	..()
	item_state_slots[slot_back_str] = icon_state //so that the on-back overlay uses the different charged states

/obj/item/gun/energy/stunrevolver/rifle
	name = "X10 stun rifle"
	desc = "An A&M X10 Thor. A vastly oversized variant of the A&M X6 Zeus. Fires overcharged electrodes to obliterate pain receptors without harming them too much."
	icon = 'lambda/sanecman/icons/bay12/guns/stunrifle.dmi'
	icon_state = "stunrifle"
	item_state = "stunrifle"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = SLOT_BACK
	one_hand_penalty = 6
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	force = 10
	max_shots = 10
	accuracy = 1
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	wielded_item_state = "stunrifle-wielded"
//[INF]
	bulk = GUN_BULK_RIFLE
	s_gun = "X10"
//[/INF]

/obj/item/gun/magnetic/railgun/tcc // Oppa! Should only be available to TCC shock troops or high-budget mercs.
	name = "advanced railgun"
	desc = "The HelTek Arms HR-22 Hammerhead. A man-portable helical rail cannon; favorite weapon of Terran shock troops and anti-tank personnel."
	icon = 'lambda/sanecman/icons/bay12/guns/railgun_adv.dmi'
	icon_state = "railgun-tcc"
	removable_components = TRUE // Railgunners are expected to be able to completely disassemble and reassemble their weapons in the field. But we don't have that mechanic, so the cell and capacitor will do.

	cell = /obj/item/cell/hyper // Standard power
	capacitor = /obj/item/stock_parts/capacitor/adv // 6-8 shots
	power_cost = 280 // Same number of shots, but it'll seem to recharge slightly faster

	loaded = /obj/item/stack/material/rods
	load_type = /obj/item/stack/material/rods // The Confederation learned that chunks of metal work just as well as fancy matter cartridges - actually they dont
	projectile_type = /obj/item/projectile/bullet/magnetic
	load_sheet_max = 6 // Fewer shots per "magazine", but more abundant than matter cartridges.
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3, TECH_MAGNET = 5)
	slowdown_worn = 3 // Little slower when worn

/obj/item/gun/magnetic/railgun/tcc/show_ammo(var/mob/user)
	var/obj/item/stack/material/rods/ammo = loaded
	if(istype(ammo))
		to_chat(user, "<span class='notice'>It has [ammo.amount] shots loaded.</span>")

/obj/item/gun/magnetic/railgun/tcc/check_ammo()
	var/obj/item/stack/material/rods/ammo = loaded
	return ammo && ammo.amount

/obj/item/gun/magnetic/railgun/tcc/out_of_ammo()
	QDEL_NULL(loaded)
	loaded = null
	spawn(3)
		playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
	visible_message("<span class='warning'>\The [src] beeps, before clanging as the ammunition bank resets.</span>")

/obj/item/gun/magnetic/railgun/tcc/use_ammo()
	var/obj/item/stack/material/rods/ammo = loaded
	ammo.use(1)
	if(!istype(ammo))
		out_of_ammo()

/obj/item/gun/projectile/pistol/holdout
	name = "holdout pistol"
	desc = "The Lumoco Arms P3 Whisper. A small, easily concealable gun."
	icon = 'lambda/sanecman/icons/bay12/guns/holdout_pistol.dmi'
	icon_state = "pistol"
	item_state = null
	caliber = CALIBER_PISTOL_SMALL
	fire_delay = 4
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ESOTERIC = 2)
	magazine_type = /obj/item/ammo_magazine/pistol/small
	allowed_magazines = /obj/item/ammo_magazine/pistol/small
	var/obj/item/silencer/silencer

	bulk = 0
	w_class = WEIGHT_CLASS_SMALL

	is_serial = 1
	s_gun = "LA-P3"

/obj/item/gun/projectile/pistol/holdout/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(silenced)
			if(user.l_hand != src && user.r_hand != src)
				..()
				return
			if (silencer)
				to_chat(user, SPAN_NOTICE("You unscrew \the [silencer] from \the [src]."))
				user.put_in_hands(silencer)
				silencer = null
			silenced = FALSE
			w_class = initial(w_class)
			update_icon()
			return
	..()

/obj/item/gun/projectile/pistol/holdout/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/silencer))
		if(user.l_hand != src && user.r_hand != src)	//if we're not in his hands
			to_chat(user, SPAN_WARNING("You'll need \the [src] in your hands to do that."))
			return
		if (silenced)
			to_chat(user, SPAN_WARNING("\The [src] is already silenced."))
			return
		if(!user.unEquip(I, src))
			return//put the silencer into the gun
		to_chat(user, SPAN_NOTICE("You screw \the [I] onto \the [src]."))
		silenced = TRUE
		silencer = I
		w_class = WEIGHT_CLASS_NORMAL
		update_icon()
		return
	..()

/obj/item/gun/projectile/pistol/holdout/on_update_icon()
	..()
	if(silenced)
		icon_state = "pistol-silencer"
	else
		icon_state = "pistol"
	if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
		icon_state = "[icon_state]-e"

/obj/item/gun/projectile/energy/
	item_state = "xray"
	icon = 'lambda/sanecman/icons/bay12/p_weapon.dmi'
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		)
	caliber = CALIBER_DART
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

/obj/item/gun/projectile/energy/mg
	name = "Ares EMG MK4"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_machinegun"
	w_class = WEIGHT_CLASS_HUGE
	wielded_item_state = "gun_wielded"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/emg
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/emg
	allowed_magazines = /obj/item/ammo_magazine/e/emg
	one_hand_penalty = 12

	firemodes = list(
		list(mode_name="semiauto",      can_autofire=0, burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1,  burst_accuracy = null, dispersion=null),
		list(mode_name="short bursts",  can_autofire=0, burst=4, fire_delay=null, move_delay=2,    one_hand_penalty=12, burst_accuracy = list(0, -1, -1.5, -2), dispersion=list(0.0, 0.8, 1, 1.2)),
		list(mode_name="long bursts",   can_autofire=0, burst=6, fire_delay=null, move_delay=4,    one_hand_penalty=12, burst_accuracy = list(0, -1, -1.5, -2, -2.5, -3, -3.5), dispersion=list(0.0, 0.8, 1, 1.2, 1.4, 1.8)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=12, burst_accuracy = list(0, -1, -2, -2, -3, -3, -4, -4), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/gun/projectile/energy/mg/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_machinegun" : "energy_machinegun-e"

/obj/item/gun/projectile/energy/rifle
	name = "Ares ER MK2"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_rifle"
	w_class = WEIGHT_CLASS_HUGE
	wielded_item_state = "gun_wielded"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/rifle
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/rifle
	allowed_magazines = /obj/item/ammo_magazine/e/rifle
	scope_zoom = 1.3
	one_hand_penalty =6

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		list(mode_name="2-short bursts",  burst=2, fire_delay=null, move_delay=1,    one_hand_penalty=6, burst_accuracy=list(0, - 0.5),       dispersion=list(0.0, 0.5)),
		)

/obj/item/gun/projectile/energy/rifle/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_rifle" : "energy_rifle-e"

/obj/item/gun/projectile/energy/carabine
	name = "Ares ER CQC MK2"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_carabine"
	w_class = WEIGHT_CLASS_LARGE
	wielded_item_state = "gun_wielded"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/rifle
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/rifle
	allowed_magazines = /obj/item/ammo_magazine/e/rifle
	one_hand_penalty = 5

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		list(mode_name="3-short bursts",  burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=6, burst_accuracy=list(0, -0.5 , -1),       dispersion=list(0.0, 0.4, 0.8)),
		)

/obj/item/gun/projectile/energy/carabine/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_carabine" : "energy_carabine-e"

/obj/item/gun/projectile/energy/pistol
	name = "Ares EP \"Predator\""
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "energy_pistol"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/e/pistol
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/e/pistol
	allowed_magazines = /obj/item/ammo_magazine/e/pistol
	one_hand_penalty = 2

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="3-short bursts",  burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=4, burst_accuracy=list(0, -1 , -2),       dispersion=list(0.0, 1, 1)),
		)

/obj/item/gun/projectile/energy/pistol/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "energy_pistol" : "energy_pistol-e"

/obj/item/gun/projectile/pistol/military
	name = "military pistol"
	desc = "The Hephaestus Industries P20 - a mass produced kinetic sidearm in widespread service with the SCGDF."
	magazine_type = /obj/item/ammo_magazine/pistol/double
	allowed_magazines = /obj/item/ammo_magazine/pistol/double
	icon = 'lambda/sanecman/icons/bay12/guns/military_pistol.dmi'
	icon_state = "military"
	item_state = "secgundark"
	safety_icon = "safety"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	fire_delay = 7
	ammo_indicator = TRUE
	is_serial = 1
	s_gun = "P20"

/obj/item/gun/projectile/pistol/military/alt
	desc = "The HelTek Optimus, best known as the standard-issue sidearm for the ICCG Navy."
	icon = 'lambda/sanecman/icons/bay12/guns/military_pistol2.dmi'
	icon_state = "military-alt"
	safety_icon = "safety"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_ESOTERIC = 8)
	fire_delay = 8
	s_gun = "P20-ICCG"
/obj/item/gun/projectile/pistol/sec
	name = "pistol"
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. Found pretty much everywhere humans are."
	icon = 'lambda/sanecman/icons/bay12/guns/pistol.dmi'
	icon_state = "secguncomp"
	safety_icon = "safety"
	magazine_type = /obj/item/ammo_magazine/pistol/rubber
	fire_delay = 6
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)

	accuracy = 0

	is_serial = 1
	s_gun = "NT-58"
*/
