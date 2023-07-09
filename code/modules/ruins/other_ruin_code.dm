///Поселение тенелингов
/*
/obj/effect/mob_spawn/human/shrouded_shadowpeople
	name = "Syndicate Bioweapon Scientist"
	roundstart = FALSE
	death = FALSE
	random = TRUE
	mob_species = /datum/species/shadow
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	short_desc = "You are a syndicate science technician, employed in a top secret research facility developing biological weapons."
	flavour_text = "Reports of potential Nanotrasen fleet movement in your sector prompted you to initiate Operation Smokescreen, killing base power and taking your crew into cryosleep. You've awoken an unknown amount of time later as base security initiates an emergency reboot. Keep vigilant for whatever reawoke you, continue your research as best you can, and try to keep a low profile."
	important_info = "Prevent yourself and any Syndicate assets from being taken by Corporate forces."
	outfit = /datum/outfit/shrouded_shadowpeople
	assignedrole = "Lavaland Syndicate"

/obj/effect/mob_spawn/human/shrouded_shadowpeople/special(mob/living/new_spawn)
	new_spawn.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)

/datum/outfit/shrouded_shadowpeople
	name = "Lavaland Syndicate Agent"
	r_hand = /obj/item/gun/ballistic/automatic/sniper_rifle
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/syndicate/alt
	back = /obj/item/storage/backpack
	r_pocket = /obj/item/gun/ballistic/automatic/pistol
	id = /obj/item/card/id/syndicate/anyone
	implants = list(/obj/item/implant/weapons_auth)

/datum/outfit/shrouded_shadowpeople/post_equip(mob/living/carbon/human/H)
	H.faction |= ROLE_SYNDICATE

/obj/effect/mob_spawn/human/shrouded_shadowpeople/comms
	name = "Syndicate Comms Agent"
	short_desc = "You are a syndicate communications agent, employed in a top secret research facility developing biological weapons."
	flavour_text = "Reports of potential Nanotrasen fleet movement in your sector prompted you to initiate Operation Smokescreen, killing base power and taking your crew into cryosleep. You've awoken an unknown amount of time later as base security initiates an emergency reboot. Keep vigilant for whatever reawoke you, and try to keep a low profile. Use the communication equipment to monitor any local activity. Anyone nearby is presumed to be an agent of Nanotrasen: Sow disinformation to throw them off your trail. Do not let the base fall into enemy hands!"
	important_info = "Prevent yourself and any Syndicate assets from being taken by Corporate forces."
	outfit = /datum/outfit/shrouded_shadowpeople/comms

/obj/effect/mob_spawn/human/shrouded_shadowpeople/comms/space
	short_desc = "You are a deep-cover syndicate agent, assigned to a small military listening post intended to keep an eye on Nanotrasen activity in the area. Increased military operations prompted you to follow Smokescreen protocol and go into cryosleep, leaving your base on minimal power."
	flavour_text = "Your base's emergency security system has reawoken you and brought the facility back to full power- It can only be presumed Nanotrasen personnel are close to locating you. Monitor any local activity as best you can, and try to keep a low profile. Use the communication equipment to attempt parlance, and sow disinformation to throw Nanotrasen off your trail."
	important_info = "Prevent yourself and any Syndicate assets from being taken by Corporate forces."

/obj/effect/mob_spawn/human/shrouded_shadowpeople/comms/space/Initialize()
	. = ..()
	if(prob(90)) //only has a 10% chance of existing, otherwise it'll just be a NPC syndie.
		new /mob/living/simple_animal/hostile/syndicate/ranged(get_turf(src))
		return INITIALIZE_HINT_QDEL

/datum/outfit/shrouded_shadowpeople/comms
	name = "Правитель"
	r_hand = /obj/item/melee/transforming/energy/sword/saber
	mask = /obj/item/clothing/mask/chameleon/gps
	suit = /obj/item/clothing/suit/armor/vest

/obj/item/clothing/mask/chameleon/gps/Initialize()
	. = ..()
	AddComponent(/datum/component/gps, "Зашифрованный сигнал")*/
