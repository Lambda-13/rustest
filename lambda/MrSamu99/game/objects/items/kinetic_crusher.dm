/obj/item/kinetic_crusher/bone
	name = "necropolis bone glaive"
	desc = "Tribals trying to immitate technology have spent a long time to somehow assemble bits and pieces to work together just like the real thing. \
	Although it does take a lot of effort and luck to create, it was a success."
	icon_state = "crusher-bone"
	item_state = "crusher0-bone"
	attack_verb = list("stabbed", "diced", "sliced", "cleaved", "chopped", "lacerated", "cut", "jabbed", "punctured")
	detonation_damage = 15
	backstab_bonus = 25
	custom_materials = list(/datum/material/bone=1150, /datum/material/wood=2075, /datum/material/diamond = 100, /datum/material/sandstone = 250)

/obj/item/kinetic_crusher/bone/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 60, 110)
	AddComponent(/datum/component/two_handed, force_unwielded=0, force_wielded=20)

/obj/item/kinetic_crusher/bone/update_icon_state()
	item_state = "crusher[wielded]-bone"

/datum/crafting_recipe/bone_glaive
	name = "Necropolis Glaive"
	result = /obj/item/kinetic_crusher/bone
	time = 120
	reqs = list(/obj/item/stack/sheet/bone = 2,
				 /obj/item/stack/sheet/mineral/wood = 4,
				 /obj/item/stack/sheet/sinew = 4,
				 /obj/item/organ/regenerative_core = 2,
				 /obj/item/stack/sheet/mineral/diamond = 2,
				 /obj/item/stack/sheet/animalhide/goliath_hide = 2,
				 /obj/item/stack/sheet/leather = 2)
	category = CAT_PRIMAL
