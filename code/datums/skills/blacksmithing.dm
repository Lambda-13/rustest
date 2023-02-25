/datum/skill/blacksmithing
	name = "Blacksmithing"
	title = "Blacksmith"
	desc = "A dwarf's second biggest skill, after drinking."
	modifiers = list(SKILL_SPEED_MODIFIER = list(1, 0.95, 0.9, 0.85, 0.75, 0.6, 0.5))
	skill_cape_path = /obj/item/clothing/neck/cloak/skill_reward/smithing

/obj/item/clothing/neck/cloak/skill_reward/smithing
	name = "legendary smithy's cloak"
	desc = "Worn by the most skilled smithies, this legendary cloak is only attainable by knowing every inch of the blacksmith's forge. \
	This status symbol represents a being who has forged some of the finest weapons and armors."
	icon = 'lambda/MrSamu99/icons/smithing/cloaks.dmi'
	mob_overlay_icon = 'lambda/MrSamu99/icons/smithing/neck.dmi'
	icon_state = "smithingcloak"
	associated_skill_path = /datum/skill/blacksmithing
