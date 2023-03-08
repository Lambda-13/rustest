/datum/outfit/antagship_traitor
	name = "Syndicate Frontier Agent"
	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/combat
	implants = list(/obj/item/implant/weapons_auth)
	id = /obj/item/card/id/syndicate
	backpack_contents = list(/obj/item/toy/plush/among)

/datum/outfit/antagship_traitor/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.faction |= ROLE_SYNDICATE
	H.mind.add_antag_datum(/datum/antagonist/traitor)
	H.AddComponent(/datum/component/gps, "Зашифрованный предательский сигнал")
