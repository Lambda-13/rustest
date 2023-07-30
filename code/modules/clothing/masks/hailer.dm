// **** Security gas mask ****

/obj/item/clothing/mask/gas/sechailer
	name = "security gas mask"
	desc = "A standard issue Security gas mask. It doesn't cover the eyes."
	actions_types = list(/datum/action/item_action/adjust)
	icon_state = "sechailer"
	item_state = "sechailer"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEFACIALHAIR | HIDEFACE
	w_class = WEIGHT_CLASS_SMALL
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	visor_flags_inv = HIDEFACIALHAIR | HIDEFACE
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES | PEPPERPROOF
	visor_flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES | PEPPERPROOF

/obj/item/clothing/mask/gas/sechailer/swat
	name = "\improper SWAT mask"
	desc = "A close-fitting tactical mask with an especially aggressive Compli-o-nator 3000."
	icon_state = "swat"
	item_state = "swat"
	flags_inv = HIDEFACIALHAIR | HIDEFACE | HIDEEYES | HIDEEARS | HIDEHAIR
	visor_flags_inv = 0

/obj/item/clothing/mask/gas/sechailer/swat/spacepol
	name = "spacepol mask"
	desc = "A close-fitting tactical mask created in cooperation with a certain megacorporation, comes with an especially aggressive Compli-o-nator 3000."
	icon_state = "spacepol"
	item_state = "spacepol"

/obj/item/clothing/mask/gas/sechailer/cyborg
	name = "security hailer"
	desc = "A set of recognizable pre-recorded messages for cyborgs to use when apprehending criminals."
	icon = 'icons/obj/device.dmi'
	icon_state = "taperecorder_idle"

/obj/item/clothing/mask/gas/sechailer/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/adjust))
		adjustmask(user)

/obj/item/clothing/mask/gas/sechailer/attack_self()
	halt()
/obj/item/clothing/mask/gas/sechailer/emag_act(mob/user)
	if(safety)
		safety = FALSE
		to_chat(user, "<span class='warning'>You silently fry [src]'s vocal circuit with the cryptographic sequencer.</span>")

/obj/item/clothing/mask/gas/sechailer/verb/halt()
	set category = "Object"
	set name = "HALT"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || cooldown)
		return
	if(broken_hailer)
		to_chat(usr, "<span class='warning'>[src]'s hailing system is broken.</span>")
		return

	// handle recent uses for overuse
	recent_uses++
	if(!overuse_cooldown) // check if we can reset recent uses
		recent_uses = 0
		overuse_cooldown = TRUE
		addtimer(CALLBACK(src, /obj/item/clothing/mask/gas/sechailer/proc/reset_overuse_cooldown), OVERUSE_COOLDOWN)

	switch(recent_uses)
		if(3)
			to_chat(usr, "<span class='warning'>[src] is starting to heat up.</span>")
		if(4)
			to_chat(usr, "<span class='userdanger'>[src] is heating up dangerously from overuse!</span>")
		if(5) // overload
			broken_hailer = TRUE
			to_chat(usr, "<span class='userdanger'>[src]'s power modulator overloads and breaks.</span>")
			return

	// select phrase to play
	play_phrase(usr, GLOB.hailer_phrases[select_phrase()])


/obj/item/clothing/mask/gas/sechailer/proc/select_phrase()
	if (!safety)
		return EMAG_PHRASE
	else
		var/upper_limit
		switch (aggressiveness)
			if (AGGR_GOOD_COP)
				upper_limit = GOOD_COP_PHRASES
			if (AGGR_BAD_COP)
				upper_limit = BAD_COP_PHRASES
			else
				upper_limit = ALL_PHRASES
		return rand(aggressiveness == AGGR_BROKEN ? BROKE_PHRASES : EMAG_PHRASE + 1, upper_limit)

/obj/item/clothing/mask/gas/sechailer/proc/play_phrase(mob/user, datum/hailer_phrase/phrase)
	. = FALSE
	if (!cooldown)
		usr.audible_message("[usr]'s Compli-o-Nator: <font color='red' size='4'><b>[initial(phrase.phrase_text)]</b></font>")
		playsound(src, "sound/runtime/complionator/[initial(phrase.phrase_sound)].ogg", 100, FALSE, 4)
		cooldown = TRUE
		addtimer(CALLBACK(src, /obj/item/clothing/mask/gas/sechailer/proc/reset_cooldown), PHRASE_COOLDOWN)
		. = TRUE

/obj/item/clothing/mask/gas/sechailer/proc/reset_cooldown()
	cooldown = FALSE

/obj/item/clothing/mask/gas/sechailer/proc/reset_overuse_cooldown()
	overuse_cooldown = FALSE

/obj/item/clothing/mask/whistle
	name = "police whistle"
	desc = "A police whistle for when you need to make sure the criminals hear you."
	icon_state = "whistle"
	item_state = "whistle"
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_NECK
	custom_price = 150
	var/blown_sound = 'sound/misc/whistle.ogg'

/obj/item/clothing/mask/whistle/ui_action_click(mob/user, action)
	if(cooldown < world.time - 100)
		usr.audible_message("<font color='red' size='5'><b>HALT!</b></font>")
		playsound(src, blown_sound, 20, FALSE, 4)
		cooldown = world.time

/obj/item/clothing/mask/gas/sechailer/inteq
	name = "balaclava"
	desc = "A fancy balaclava, while it doesn't muffle your voice it has a miniature rebreather for internals. Comfy to boot!"
	icon_state = "inteq_balaclava"
	item_state = "inteq_balaclava"
	strip_delay = 60
	alternate_worn_layer = BODY_LAYER
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEARS|HIDEHAIR

/obj/item/clothing/mask/gas/sechailer/minutemen
	name = "combat balaclava"
	desc = "A surprisingly advanced balaclava equipped with internals tubing. Widely used by frontier militias."
	icon_state = "rus_balaclava"
	item_state = "rus_balaclava"
	strip_delay = 60
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEARS|HIDEHAIR
