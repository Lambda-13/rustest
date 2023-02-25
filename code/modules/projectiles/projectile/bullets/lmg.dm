// C3D (Borgs)

/obj/projectile/bullet/c3d
	damage = 20

/obj/projectile/bullet/ctac
	damage = 40
	armour_penetration = 35
	speed = 0.4

/obj/projectile/bullet/csour
	damage = 0
	stamina = 60
	jitter = 30
	stutter = 10
	slur = 10
	knockdown = 5
	armour_penetration = 30

/obj/projectile/bullet/csweet
	damage = 5
	irradiate = 250
	speed = 1.2

/obj/projectile/bullet/csweet/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(8)
		M.IgniteMob()

// Mech LMG

/obj/projectile/bullet/lmg
	damage = 20

// Mech FNX-99

/obj/projectile/bullet/incendiary/fnx99
	damage = 20

// Turrets

/obj/projectile/bullet/manned_turret
	damage = 20

/obj/projectile/bullet/manned_turret/hmg
	icon_state = "redtrac"

/obj/projectile/bullet/syndicate_turret
	damage = 20

// 7.12x82mm (SAW)

/obj/projectile/bullet/mm712x82
	damage = 35
	name = "пуля калибра 7.12x82"
	armour_penetration = 5

/obj/projectile/bullet/mm712x82_ap
	name = "бронебойная пуля калибра 7.12x82"
	damage = 35
	armour_penetration = 40

/obj/projectile/bullet/mm712x82_hp
	name = "экспансивная пуля калибра 7.12x82"
	damage = 50
	armour_penetration = -60

/obj/projectile/bullet/incendiary/mm712x82
	damage = 15
	name = "зажигательная пуля калибра 7.12x82"
	fire_stacks = 3

/obj/projectile/bullet/mm712x82_match
	name = "самонаводящаяся пуля калибра 7.12x82"
	damage = 40
	ricochets_max = 2
	ricochet_chance = 60
	ricochet_auto_aim_range = 4
	ricochet_incidence_leeway = 55

/obj/projectile/bullet/mm712x82_bouncy
	name = "резиновая пуля калибра 7.12x82"
	damage = 15
	ricochets_max = 40
	ricochet_chance = 500 // will bounce off anything and everything, whether they like it or not
	ricochet_auto_aim_range = 4
	ricochet_incidence_leeway = 0
	ricochet_decay_chance = 0.9
