/mob/living/simple_animal/hostile/scavenger
	name = "харвестер"
	icon = 'lambda/sanecman/icons/scavenger.dmi'
	desc = "Выглядит как куча хлипкого хлама, которая вот-вот развалится."
	speak_emote = list("металлирует")
	initial_language_holder = /datum/language_holder/swarmer
	bubble_icon = "swarmer"
	mob_biotypes = MOB_ROBOTIC
	health = 50
	maxHealth = 50
	status_flags = CANPUSH
	icon_state = "scavenger"
	icon_living = "scavenger"
	icon_dead = "scavenger"
	icon_gib = null
	wander = TRUE
	harm_intent_damage = 10
	minbodytemp = 0
	maxbodytemp = 5000
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0
	melee_damage_lower = 20
	melee_damage_upper = 40
	melee_damage_type = BURN
	damage_coeff = list(BRUTE = 2, BURN = 0.25, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	hud_possible = list(ANTAG_HUD, DIAG_STAT_HUD, DIAG_HUD)
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	attack_verb_continuous = "пилит"
	attack_verb_simple = "пилит"
	attack_sound = 'lambda/sanecman/sound/crash.ogg'
	friendly_verb_continuous = "тыкает"
	friendly_verb_simple = "тыкает"
	speed = 0
	faction = list("scavenger", "swarmer")
	AIStatus = AI_ON
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_TINY
	ranged = FALSE
	loot = list(/obj/effect/decal/cleanable/robot_debris)
	del_on_death = TRUE
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_color = LIGHT_COLOR_BLOOD_MAGIC
	speech_span = SPAN_ROBOT
	search_objects = 1
	attack_all_objects = TRUE
	lose_patience_timeout = 150
	var/static/list/sharedWanted = typecacheof(list(/turf/closed/mineral, /turf/closed/wall))
	var/static/list/sharedIgnore = typecacheof(list(/obj/structure/lattice))

/mob/living/simple_animal/hostile/scavenger/Initialize(mapload)
	. = ..()
	deathmessage = "[src] разваливается!"
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	update_health_hud()

/mob/living/simple_animal/hostile/scavenger/Initialize(mapload)
	. = ..()
	remove_verb(src, /mob/living/verb/pulled)
	for(var/datum/atom_hud/data/diagnostic/diag_hud in GLOB.huds)
		diag_hud.add_atom_to_hud(src)

/mob/living/simple_animal/hostile/scavenger/death(gibbed)
	do_sparks(3, TRUE, src)
	new /obj/effect/spawner/lootdrop/waste/hivebot(loc) //Может потом заменю на дроп получше
	..(TRUE)

/mob/living/simple_animal/hostile/scavenger/med_hud_set_health()
	var/image/holder = hud_list[DIAG_HUD]
	var/icon/I = icon(icon, icon_state, dir)
	holder.pixel_y = I.Height() - world.icon_size
	holder.icon_state = "huddiag[RoundDiagBar(health/maxHealth)]"

/mob/living/simple_animal/hostile/scavenger/med_hud_set_status()
	var/image/holder = hud_list[DIAG_STAT_HUD]
	var/icon/I = icon(icon, icon_state, dir)
	holder.pixel_y = I.Height() - world.icon_size
	holder.icon_state = "hudstat"

/mob/living/simple_animal/hostile/scavenger/emp_act()
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(health > 1)
		adjustHealth(health-1)
	else
		death()

/mob/living/simple_animal/hostile/scavenger/AttackingTarget()
	if(iscyborg(target))
		var/mob/living/silicon/borg = target
		borg.adjustFireLoss(melee_damage_lower)
		return TRUE
	if(target.scavenger_act(src))
		add_type_to_wanted(target.type)
		return TRUE
	else
		add_type_to_ignore(target.type)
		return FALSE

/atom/proc/scavenger_act(mob/living/simple_animal/hostile/scavenger/actor)
	actor.dis_integrate(src)
	return TRUE

/obj/scavenger_act(mob/living/simple_animal/hostile/scavenger/actor)
	if(resistance_flags & INDESTRUCTIBLE)
		return FALSE
	return ..()

/turf/open/scavenger_act()
	return FALSE

/mob/living/simple_animal/hostile/scavenger/proc/dis_integrate(atom/movable/target)
	new /obj/effect/temp_visual/scavenger(get_turf(target))
	do_attack_animation(target)
	flick("scavenger_drill", src)
	changeNext_move(2 SECONDS)
//	SSexplosions.low_mov_atom += target //Похуй
	adjustHealth(-3)

/obj/effect/temp_visual/scavenger
	icon = 'lambda/sanecman/icons/scavenger.dmi'
	icon_state = "drone_drill"
	layer = BELOW_MOB_LAYER
	blend_mode = 2
	duration = 1 SECONDS

/obj/effect/temp_visual/scavenger/Initialize(mapload)
	. = ..()
	playsound(loc, 'lambda/sanecman/sound/crash.ogg', 100, TRUE, -5)

/mob/living/simple_animal/hostile/scavenger/CanAttack(atom/the_target)

	if(is_type_in_typecache(the_target, sharedIgnore))
		return FALSE
	if(is_type_in_typecache(the_target, sharedWanted))
		return TRUE

	return ..()

/mob/living/simple_animal/hostile/scavenger/proc/add_type_to_wanted(typepath)
	if(!sharedWanted[typepath])
		sharedWanted += typecacheof(typepath)

/mob/living/simple_animal/hostile/scavenger/proc/add_type_to_ignore(typepath)
	if(!sharedIgnore[typepath])
		sharedIgnore += typecacheof(typepath)
