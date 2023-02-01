/obj/item/clothing/head/mod
	name = "MOD шлем"
	desc = "Шлем для MOD-Скафандра."
	icon = 'icons/obj/clothing/modsuit/mod_clothing.dmi'
	icon_state = "helmet"
	mob_overlay_icon = 'icons/mob/clothing/modsuit/mod_clothing.dmi'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD
	heat_protection = HEAD
	cold_protection = HEAD
	obj_flags = IMMUTABLE_SLOW

/obj/item/clothing/suit/mod
	name = "MOD нагрудник"
	desc = "Нагрудник для MOD-Скафандра."
	icon = 'icons/obj/clothing/modsuit/mod_clothing.dmi'
	icon_state = "chestplate"
	mob_overlay_icon = 'icons/mob/clothing/modsuit/mod_clothing.dmi'
	blood_overlay_type = "armor"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN
	heat_protection = CHEST|GROIN
	cold_protection = CHEST|GROIN
	obj_flags = IMMUTABLE_SLOW

/obj/item/clothing/gloves/mod
	name = "MOD перчатки"
	desc = "Пара перчаток для MOD-Скафандра."
	icon = 'icons/obj/clothing/modsuit/mod_clothing.dmi'
	icon_state = "gauntlets"
	mob_overlay_icon = 'icons/mob/clothing/modsuit/mod_clothing.dmi'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HANDS|ARMS
	heat_protection = HANDS|ARMS
	cold_protection = HANDS|ARMS
	obj_flags = IMMUTABLE_SLOW

/obj/item/clothing/shoes/mod
	name = "MOD Ботинки"
	desc = "Пара ботинок для MOD-Скафандра"
	icon = 'icons/obj/clothing/modsuit/mod_clothing.dmi'
	icon_state = "boots"
	mob_overlay_icon = 'icons/mob/clothing/modsuit/mod_clothing.dmi'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = FEET|LEGS
	heat_protection = FEET|LEGS
	cold_protection = FEET|LEGS
	obj_flags = IMMUTABLE_SLOW
	supports_variations = DIGITIGRADE_VARIATION
	can_be_tied = FALSE
