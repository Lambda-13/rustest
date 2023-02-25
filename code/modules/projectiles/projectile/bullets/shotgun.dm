/obj/projectile/bullet/shotgun_slug
	name = "пуля 12 калибра"
	damage = 50

/obj/projectile/bullet/shotgun_beanbag
	armour_penetration = -10		//WS Edit - Shotgun Nerf
	name = "резиновая пуля 12 калибра"
	damage = 10
	stamina = 55
	ricochets_max = 6
	ricochet_incidence_leeway = 0
	ricochet_chance = 130
	ricochet_decay_damage = 0.8

/obj/projectile/bullet/incendiary/shotgun
	name = "зажигательная пуля 12 калибра"
	damage = 40

/obj/projectile/bullet/incendiary/shotgun/dragonsbreath
	name = "гранула драконьего дыхания"
	damage = 10

/obj/projectile/bullet/shotgun_stunslug
	name = "электропуля 12 калибра"
	damage = 5
	paralyze = 100
	stutter = 5
	jitter = 20
	range = 7
	icon_state = "spark"
	color = "#FFFF00"

/obj/projectile/bullet/shotgun_meteorslug
	name = "пуля-метеор 12 калибра"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "dust"
	damage = 25
	paralyze = 15
	knockdown = 60
	hitsound = 'sound/effects/meteorimpact.ogg'

/obj/projectile/bullet/shotgun_meteorslug/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ismovable(target))
		var/atom/movable/M = target
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
		M.safe_throw_at(throw_target, 3, 2)

/obj/projectile/bullet/shotgun_meteorslug/Initialize(mapload)
	. = ..()
	SpinAnimation()

/obj/projectile/bullet/shotgun_frag12
	name = "разрывная пуля 12 калибра"
	damage = 15
	paralyze = 10

/obj/projectile/bullet/shotgun_frag12/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 1)
	return BULLET_ACT_HIT

/obj/projectile/bullet/pellet
	///How much damage is subtracted per tile?
	var/tile_dropoff = 1
	///How much stamina damage is subtracted per tile?
	var/tile_dropoff_stamina = 0.8

/obj/projectile/bullet/pellet/shotgun_buckshot
	name = "buckshot pellet"
	damage = 10
	armour_penetration = -20

/obj/projectile/bullet/pellet/shotgun_rubbershot
	name = "rubbershot pellet"
	damage = 2
	stamina = 8
	armour_penetration = -20
	tile_dropoff = 0.2

/obj/projectile/bullet/pellet/shotgun_incapacitate
	name = "incapacitating pellet"
	damage = 1
	stamina = 6

/obj/projectile/bullet/pellet/Range()
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(stamina > 0)
		stamina -= tile_dropoff_stamina
	if(damage < 0 && stamina < 0)
		qdel(src)

/obj/projectile/bullet/pellet/shotgun_buckshot
	name = "дробинки картечи"
	damage = 7.5
/obj/projectile/bullet/pellet/shotgun_rubbershot
	name = "резиновые дробинки"
	damage = 3
	stamina = 11
	speed = 1.2
	ricochets_max = 4
	ricochet_chance = 120
	ricochet_decay_chance = 0.9
	ricochet_decay_damage = 0.8
	ricochet_auto_aim_range = 2
	ricochet_auto_aim_angle = 30
	ricochet_incidence_leeway = 75
	/// Subtracted from the ricochet chance for each tile traveled
	var/tile_dropoff_ricochet = 4

/obj/projectile/bullet/pellet/shotgun_rubbershot/Range()
	if(ricochet_chance > 0)
		ricochet_chance -= tile_dropoff_ricochet
	. = ..()

/obj/projectile/bullet/pellet/shotgun_incapacitate
	name = "обезвреживающие дробинки"
	damage = 1
	stamina = 6
/obj/projectile/bullet/pellet/shotgun_improvised
	armour_penetration = -20		//WS Edit - Shotgun nerf
	tile_dropoff = 0.35		//Come on it does 6 damage don't be like that.
	damage = 6

/obj/projectile/bullet/pellet/shotgun_improvised/Initialize(mapload)
	. = ..()
	range = rand(1, 8)

/obj/projectile/bullet/pellet/shotgun_improvised/on_range()
	do_sparks(1, TRUE, src)
	..()

// Mech Scattershot

/obj/projectile/bullet/scattershot
	damage = 24

/obj/projectile/bullet/pellet/shotgun_buckshot/twobore
	name = "two-bore pellet"
	damage = 30
	armour_penetration = -25
	tile_dropoff = 5
