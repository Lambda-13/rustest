// 7.62x38mmR (Nagant Revolver)

/obj/projectile/bullet/n762
	damage = 35
	name = "пуля калибра 7.62x38mmR"

// .50AE (Desert Eagle)

/obj/projectile/bullet/a50AE
	name = "пуля .50AE калибра"
	damage = 60

// .38 (Detective's Gun & Winchester)

/obj/projectile/bullet/c38
	name = "пуля .38 калибра"
	damage = 25
	ricochets_max = 2
	ricochet_chance = 50
	ricochet_auto_aim_angle = 10
	ricochet_auto_aim_range = 3

/obj/projectile/bullet/c38/match
	name = "самонаводящаяся пуля .38 калибра"
	ricochets_max = 4
	ricochet_chance = 100
	ricochet_auto_aim_angle = 40
	ricochet_auto_aim_range = 5
	ricochet_incidence_leeway = 50
	ricochet_decay_chance = 1
	ricochet_decay_damage = 1

/obj/projectile/bullet/c38/match/bouncy
	name = "резиновая пуля .38 калибра"
	damage = 10
	stamina = 50
	armour_penetration = -30
	ricochets_max = 12
	ricochet_incidence_leeway = 0
	ricochet_chance = 260
	ricochet_decay_damage = 0.8
	shrapnel_type = NONE

// premium .38 ammo from cargo, weak against armor, lower base damage, but excellent at embedding and causing slice wounds at close range
/obj/projectile/bullet/c38/dumdum
	name = "экспансивная пуля .38 калибра"
	damage = 40
	armour_penetration = -30
	ricochets_max = 0
	shrapnel_type = /obj/item/shrapnel/bullet/c38/dumdum

/obj/projectile/bullet/c38/trac
	name = "следящая пуля .38 калибра"
	damage = 10
	ricochets_max = 0

/obj/projectile/bullet/c38/trac/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/mob/living/carbon/M = target
	if(!istype(M))
		return
	var/obj/item/implant/tracking/c38/imp
	for(var/obj/item/implant/tracking/c38/TI in M.implants) //checks if the target already contains a tracking implant
		imp = TI
		return
	if(!imp)
		imp = new /obj/item/implant/tracking/c38(M)
		imp.implant(M)

/obj/projectile/bullet/c38/hotshot //similar to incendiary bullets, but do not leave a flaming trail
	name = "зажигательная пуля .38 калибра"
	damage = 20
	ricochets_max = 0

/obj/projectile/bullet/c38/hotshot/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/projectile/bullet/c38/iceblox //see /obj/projectile/temp for the original code
	name = "замораживающая пуля .38 калибра"
	damage = 20
	var/temperature = 100
	ricochets_max = 0

/obj/projectile/bullet/c38/iceblox/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_bodytemperature(((100-blocked)/100)*(temperature - M.bodytemperature))

/obj/projectile/bullet/c38/hunting //bonus damage to simplemobs
	name = ".38 hunting"
	damage = 15
	var/bonus_damage = 40 // if a simplemob then do this much extra

/obj/projectile/bullet/c38/hunting/on_hit(atom/target, blocked = FALSE)
	if(istype(target, /mob/living/simple_animal/hostile/asteroid/))
		damage += bonus_damage
	..()

// .357 (Syndie Revolver)

/obj/projectile/bullet/a357
	damage = 35 //shiptest nerf
	name = "пуля .357 калибра"

// admin only really, for ocelot memes
/obj/projectile/bullet/a357/match
	name = ".357 match bullet"
	ricochets_max = 5
	ricochet_chance = 140
	ricochet_auto_aim_angle = 50
	ricochet_auto_aim_range = 6
	ricochet_incidence_leeway = 80
	ricochet_decay_chance = 1

// .45-70 Gov't (Hunting Revolver)

/obj/projectile/bullet/a4570
	name = ".45-70 bullet"
	damage = 60 //it's the old .357

/obj/projectile/bullet/a4570/match
	name = ".45-70 match bullet"
	ricochets_max = 5
	ricochet_chance = 140
	ricochet_auto_aim_angle = 50
	ricochet_auto_aim_range = 6
	ricochet_incidence_leeway = 80
	ricochet_decay_chance = 1

/obj/projectile/bullet/a4570/explosive //for extra oof
	name = ".45-70 explosive bullet"

/obj/projectile/bullet/a4570/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 1)
	return BULLET_ACT_HIT
