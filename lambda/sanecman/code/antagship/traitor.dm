/datum/outfit/antagship_traitor
	name = "Syndicate Frontier Agent"
	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/combat
	back = /obj/item/storage/backpack
	implants = list(/obj/item/implant/weapons_auth)
	id = /obj/item/card/id/syndicate
	ears = /obj/item/radio/headset/syndicate/alt
	backpack_contents = list(/obj/item/toy/plush/among)

/datum/outfit/antagship_traitor/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.faction |= ROLE_SYNDICATE
	H.mind.add_antag_datum(/datum/antagonist/traitor)
	H.AddComponent(/datum/component/gps, "Зашифрованный предательский сигнал")
