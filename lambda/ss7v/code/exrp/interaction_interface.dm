/mob/living/carbon/human/MouseDrop_T(mob/M, mob/user)
	. = ..()

	if(M == src || src == usr || M != usr)
		return

	if(HAS_TRAIT(usr, TRAIT_HANDS_BLOCKED))
		return

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	H.try_interaction(src)

/mob/living/carbon/human/proc/try_interaction(mob/partner)

	if (!check_rights_for(client, R_ADMIN) && !check_whitelist_exrp(ckey))
		return

	var/dat = ""

	make_interactions()
	for(var/interaction_key in GLOB.interactions)
		var/datum/interaction/I = GLOB.interactions[interaction_key]
		if(I.evaluate_user(src) && I.evaluate_target(src, partner))
			dat += I.get_action_link_for(src, partner)

	var/datum/browser/popup = new(usr, "interactions", "Взаимодействие с [partner]", 400, 300)
	popup.set_content(dat)
	popup.open()
