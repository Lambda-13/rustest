
/mob/living/simple_animal/hostile/retaliate/beast
	speak_chance = 5
//ТУДУ: Сделать голод для мобов
//	var/hunger = 0

///mob/living/simple_animal/hostile/retaliate/beast/Life()
//	. = ..()
//	if(!.)
//		return FALSE
//	hunger++
//	if(hunger < 100) //stop hunting when satiated
//		ai_holder.hostile = FALSE
//	else
//		for(var/mob/living/simple_animal/S in range(src,1))
//			if(S.stat == DEAD)
//				visible_message("[src] consumes \the body of [S]!")
//				var/turf/T = get_turf(S)
//				var/obj/item/remains/xeno/X = new(T)
//				X.desc += "These look like they belong to \a [S.name]."
//				hunger = max(0, hunger - 5*S.maxHealth)
//				if(prob(5))
//					S.gib()
//				else
//					qdel(S)
//
//	if (hunger > 500)
//		ai_holder.hostile = TRUE

/mob/living/simple_animal/hostile/retaliate/beast/samak
	name = "самак"
	desc = "Быстрый бронированный хищник, привыкший прятаться и устраивать засады на холодной местности."
	faction = list("hostile","samak")
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "samak"
	icon_living = "samak"
	icon_dead = "samak_dead"
	move_to_delay = 2
	maxHealth = 125
	health = 125
	speed = 2
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/weapons/bite.ogg'
	a_intent = INTENT_HARM
	armour_penetration = 30
	speak = list("Hruuugh!","Hrunnph")
	speak_chance = 5
	emote_see = list("paws the ground","shakes its mane","stomps")
	emote_hear = list("snuffles")

/mob/living/simple_animal/hostile/retaliate/beast/samak/alt
	desc = "A fast, armoured predator accustomed to hiding and ambushing."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "samak-alt"
	icon_living = "samak-alt"
	icon_dead = "samak-alt_dead"

/mob/living/simple_animal/hostile/retaliate/beast/diyaab
	name = "diyaab"
	desc = "A small pack animal. Although omnivorous, it will hunt meat on occasion."
	faction = list("hostile","diyaab")
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "diyaab"
	icon_living = "diyaab"
	icon_dead = "diyaab_dead"
	move_to_delay = 2
	maxHealth = 25
	health = 25
	speed = 1
	attack_verb_continuous = "weaks"
	attack_verb_simple = "weak"
	armour_penetration = 50
	a_intent = INTENT_HARM
	mob_size = MOB_SIZE_SMALL
	speak_chance = 5
	speak = list("Awrr?","Aowrl!","Worrl")
	emote_see = list("sniffs the air cautiously","looks around")
	emote_hear = list("snuffles")
/*
/datum/ai_holder/simple_animal/diyaab/post_melee_attack(atom/A)
	. = ..()
	if(holder.Adjacent(A))
		holder.IMove(get_step(holder, pick(GLOB.alldirs)))
		holder.face_atom(A)
*/
/mob/living/simple_animal/hostile/retaliate/beast/shantak
	name = "shantak"
	desc = "A piglike creature with a bright iridiscent mane that sparkles as though lit by an inner light. Don't be fooled by its beauty though."
	faction = list("hostile","shantak")
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "shantak"
	icon_living = "shantak"
	icon_dead = "shantak_dead"
	move_to_delay = 2
	maxHealth = 75
	health = 75
	speed = 1
	a_intent = INTENT_HARM
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	speak_chance = 2
	speak = list("Shuhn","Shrunnph?","Shunpf")
	emote_see = list("scratches the ground","shakes out its mane","tinkles gently")

/mob/living/simple_animal/hostile/retaliate/beast/shantak/alt
	desc = "A piglike creature with a long and graceful mane. Don't be fooled by its beauty."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "shantak-alt"
	icon_living = "shantak-alt"
	icon_dead = "shantak-alt_dead"

/mob/living/simple_animal/yithian
	name = "yithian"
	desc = "A friendly creature vaguely resembling an oversized snail without a shell."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "yithian"
	icon_living = "yithian"
	icon_dead = "yithian_dead"
	a_intent = INTENT_HARM
	mob_size = MOB_SIZE_TINY
	density = FALSE
	faction = list("neutral")

/mob/living/simple_animal/tindalos
	name = "tindalos"
	desc = "It looks like a large, flightless grasshopper."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "tindalos"
	icon_living = "tindalos"
	icon_dead = "tindalos_dead"
	a_intent = INTENT_HARM
	mob_size = MOB_SIZE_TINY
	density = FALSE
	faction = list("neutral")

/mob/living/simple_animal/thinbug
	name = "taki"
	desc = "It looks like a bunch of legs."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "thinbug"
	icon_living = "thinbug"
	icon_dead = "thinbug_dead"
	a_intent = INTENT_HARM
	mob_size = MOB_SIZE_TINY
	density = FALSE
	speak_chance = 1
	emote_hear = list("scratches the ground","chitters")

/mob/living/simple_animal/hostile/retaliate/royalcrab
	name = "cragenoy"
	desc = "It looks like a crustacean with an exceedingly hard carapace. Watch the pinchers!"
	faction = list("hostile","crab")
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "royalcrab"
	icon_living = "royalcrab"
	icon_dead = "royalcrab_dead"
	a_intent = INTENT_HARM
	maxHealth = 150
	health = 150
	speed = 1
	attack_verb_continuous = "pincers"
	attack_verb_simple = "pincer"
	armour_penetration = 30
	speak_chance = 1
	emote_see = list("skitters","oozes liquid from its mouth", "scratches at the ground", "clicks its claws")

/*
//До пизды тут всё править
/mob/living/simple_animal/hostile/retaliate/beast/charbaby
	name = "charbaby"
	desc = "A huge grubby creature."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "char"
	icon_living = "char"
	icon_dead = "char_dead"
	mob_size = MOB_SIZE_LARGE
	health = 45
	maxHealth = 45
	attack_verb_continuous = "singeds"
	attack_verb_simple = "singed"
	speed = 2
	response_help =  "pats briefly"
	response_disarm = "gently pushes"
	response_harm = "strikes"
	return_damage_min = 2
	return_damage_max = 3
	harm_intent_damage = 1
	blood_color = COLOR_NT_RED
	natural_armor = list(
		laser = ARMOR_LASER_HANDGUNS
		)
	faction = list("neutral")
*/
/*
//Поджигает цель
/datum/ai_holder/simple_animal/melee/charbaby/engage_target()
	. = ..()
	var/mob/living/simple_animal/hostile/retaliate/beast/charbaby/C = holder
	if(isliving(C.target_mob) && prob(25))
		var/mob/living/L = C.target_mob
		if(prob(10))
			L.adjust_fire_stacks(1)
			L.IgniteMob()
*/
/mob/living/simple_animal/hostile/retaliate/beast/shantak/lava
	desc = "A vaguely canine looking beast. It looks as though its fur is made of stone wool."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "lavadog"
	icon_living = "lavadog"
	icon_dead = "lavadog_dead"
	speak = list("Karuph","Karump")

/mob/living/simple_animal/hostile/retaliate/jelly
	name = "zeq"
	desc = "It looks like a floating jellyfish. How does it do that?"
	faction = list("hostile","zeq")
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/animal.dmi'
	icon_state = "jelly"
	icon_living = "jelly"
	icon_dead = "jelly_dead"
	move_to_delay = 2
	maxHealth = 75
	health = 75
	speed = 1
	a_intent = INTENT_HARM
	attack_verb_continuous = list("stungs","slaps")
	attack_verb_simple = list("stung","slapped")
	melee_damage_type = BURN
	harm_intent_damage = 10
	var/gets_random_color = TRUE
	emote_see = list("wobbles slightly","oozes something out of tentacles' ends")


/mob/living/simple_animal/hostile/retaliate/jelly/Initialize()
	. = ..()
	if(gets_random_color)
		color = color_rotation(round(rand(0,360),20))

/mob/living/simple_animal/hostile/retaliate/jelly/alt
	icon_state = "jelly-alt"
	icon_living = "jelly-alt"
	icon_dead = "jelly-alt_dead"

//megajellyfish
/mob/living/simple_animal/hostile/retaliate/jelly/mega
	name = "zeq queen"
	desc = "A gigantic jellyfish-like creature. Its bell wobbles about almost as if it's ready to burst."
	maxHealth = 300
	health = 300
	gets_random_color = FALSE
//	can_escape = TRUE

	var/jelly_scale = 3
	var/split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/half
	var/static/megajelly_color

/mob/living/simple_animal/hostile/retaliate/jelly/mega/Initialize()
	. = ..()
	var/matrix/M = new
	M.Scale(jelly_scale)
	transform = M
	harm_intent_damage *= jelly_scale
	if(!megajelly_color)
		megajelly_color = color_rotation(round(rand(0,360),20))
	color = megajelly_color

/mob/living/simple_animal/hostile/retaliate/jelly/mega/death()
	if(split_type)
		jelly_split()
	else
		..()

/mob/living/simple_animal/hostile/retaliate/jelly/mega/proc/jelly_split()
	visible_message(span_warning("\The [src] rumbles briefly before splitting into two!"))
	var/kidnum = 2
	for(var/i = 0 to kidnum)
		var/mob/living/simple_animal/child = new split_type(get_turf(src))
//		child.min_gas = min_gas.Copy()
//		child.max_gas = max_gas.Copy()
		child.minbodytemp = minbodytemp
		child.maxbodytemp = maxbodytemp
	QDEL_NULL(src)

/mob/living/simple_animal/hostile/retaliate/jelly/mega/half
	name = "zeq duchess"
	desc = "A huge jellyfish-like creature."
	maxHealth = 150
	health = 150
//	can_escape = TRUE
	jelly_scale = 1.5
	split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/quarter

/mob/living/simple_animal/hostile/retaliate/jelly/mega/quarter
	name = "zeqling"
	desc = "A jellyfish-like creature."
	health = 75
	maxHealth = 75
	jelly_scale = 0.75
//	can_escape = FALSE
	split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/fourth

/mob/living/simple_animal/hostile/retaliate/jelly/mega/fourth
	name = "zeqetta"
	desc = "A tiny jellyfish-like creature."
	health = 40
	maxHealth = 40
	jelly_scale = 0.375
	split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/eighth

/mob/living/simple_animal/hostile/retaliate/jelly/mega/eighth
	name = "zeqttina"
	desc = "An absolutely tiny jellyfish-like creature."
	health = 20
	maxHealth = 20
	jelly_scale = 0.1875
	split_type = null

/mob/living/simple_animal/hostile/leech
	name = "megaleech"
	desc = "A green leech the size of a common snake."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/megaleech.dmi'
	icon_state = "leech"
	icon_living = "leech"
	icon_dead = "leech_dead"
	health = 15
	maxHealth = 15
	harm_intent_damage = 5
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	faction = list("hostile","leeches")
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_REPTILE
	ventcrawler = VENTCRAWLER_ALWAYS
//	bleed_colour = COLOR_VIOLET

//	var/suck_potency = 8
//	var/belly = 100

//Надо это потом всё допилить
/*
/datum/ai_holder/simple_animal/melee/leech/engage_target()
	. = ..()

	var/mob/living/simple_animal/hostile/leech/L = holder
	if(ishuman(.) && L.belly <= 75)
		var/mob/living/carbon/human/H = .
		var/obj/item/clothing/suit/space/S = H.get_covering_equipped_item_by_zone(BP_CHEST)
		if(istype(S) && !length(S.breaches))
			return
		H.remove_blood_simple(L.suck_potency)
		if(L.health < L.maxHealth)
			L.health += L.suck_potency / 1.5
		L.belly += Clamp(L.suck_potency, 0, 100)
*/
/*
/mob/living/simple_animal/hostile/leech/Life()
	. = ..()
	if(!.)
		return FALSE

	if(target_mob)
		belly -= 3
	else
		belly -= 1
*/
/obj/structure/spawner/leech_spawner
	name = "reeds"
	desc = "Some reeds with a few funnel-like structures growing alongside."
	icon = 'lambda/sanecman/icons/bay12/mob/simple_animal/megaleech.dmi'
	icon_state = "reeds"
	max_integrity = 150
	max_mobs = 12
	spawn_time = 150
	mob_types = list(/mob/living/simple_animal/hostile/leech)
	spawn_text = "A swarm of leeches burst out from"
	faction = list("hostile","leeches")
