//hand portable floodlights for emergencies. Less bulky than the large ones. But also less light. Unused green variant in the sheet.

/obj/item/flashlight/lamp/floodlamp
	name = "прожектор"
	desc = "Портативный прожектор со сверхъярким светодиодом."
	icon = 'icons/obj/lighting.dmi' //пофиксить
	icon_state = "floodlamp"
	item_state = "lamp"
	on = TRUE
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 7
	light_power = 0.8

/obj/item/flashlight/upgraded
	name = "мощный фонарик"
	desc = "Энергоэффективный фонарик."
	icon_state = "biglight"
	item_state = "biglight"
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_power = 0.75
	light_range = 4

/obj/item/flashlight/flashdark/stone
	name = "hellstone shard"
	desc = "The stone is blacker than the night itself, it seems to dim all the light around."
	icon = 'icons/obj/lighting.dmi' //пофиксить
	icon_state = "hellstone"
	item_state = "electronic"
	toggle_on_sound = null
	toggle_off_sound = null

