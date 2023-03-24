/proc/make_interactions(interaction)
	if(!GLOB.interactions.len)
		for(var/itype in subtypesof(/datum/interaction))
			var/datum/interaction/I = new itype()
			GLOB.interactions[I.command] = I

/datum/interaction
	var/command = "interact"
	var/description = "Interact with them"
	var/simple_message = null
	var/simple_style = "danger"
	var/write_log_user = "tested"
	var/write_log_target = "was tested by"

	var/max_distance = 1
	var/require_user_mouth = FALSE
	var/require_user_hands = FALSE
	var/require_target_mouth = FALSE
	var/needs_physical_contact = FALSE

	var/cooldaun = 0

	var/user_not_tired = FALSE
	var/target_not_tired = FALSE

	var/require_user_naked = FALSE
	var/require_target_naked = FALSE

	var/require_user_dancer = FALSE // is user has pingas?
	var/require_user_dancor = FALSE // is user has jopa?
	var/require_user_danceress = FALSE // is user has pezda?

	var/require_target_dancer = FALSE // is target need to have pingas?
	var/require_target_dancor = FALSE // is target need to have jopa?
	var/require_target_danceress = FALSE // is target need to have pezda?

	var/user_dancing_cost = 1
	var/target_dancing_cost = 1

/datum/interaction/proc/evaluate_user(mob/living/carbon/human/user, silent = TRUE)
	if(require_user_mouth && user.wear_mask)
		if(!silent)
			to_chat(user, span_warning("Мой рот прикрыт."))
		return FALSE
	if(require_user_hands && !ishuman(user))
		if(!silent)
			to_chat(user, span_warning("У меня нет рук.</span>"))
		return FALSE
	if(user_not_tired && user.dancing_period)
		if(!silent)
			to_chat(user, span_warning("Всё еще не хочу после прошлого раза."))
		return FALSE
	if(require_user_naked && !user.is_literally_ready_to_dance())
		if(!silent)
			to_chat(user, span_warning("Мешает одежда.</span>"))
		return FALSE
	if(require_user_dancer && user.gender == FEMALE)
		if(!silent)
			to_chat(user, span_warning("Нет огурца.</span>"))
		return FALSE
	if(require_user_danceress && user.gender == MALE)
		if(!silent)
			to_chat(user, span_warning("Нет пельмешка.</span>"))
		return FALSE
	return TRUE

/datum/interaction/proc/evaluate_target(mob/living/carbon/human/user, mob/living/carbon/human/target, silent = TRUE)
	if(require_target_mouth && target.wear_mask)
		if(!silent)
			to_chat(user, span_warning("Рот <b>[target.name]</b> прикрыт.</span>"))
		return FALSE
	if(!ishuman(target))
		if(!silent)
			to_chat(user, span_warning("У <b>[target.name]</b> нет рук.</span>"))
		return FALSE
	if(target_not_tired && target.dancing_period)
		if(!silent)
			to_chat(user, span_warning("Цели не хочется."))
		return FALSE
	if(require_target_naked && !target.is_literally_ready_to_dance())
		if(!silent)
			to_chat(user, span_warning("Цели мешает одежда.</span>"))
		return FALSE
	if(require_target_dancer && target.gender == FEMALE)
		if(!silent)
			to_chat(user, span_warning("У цели нет огурца.</span>"))
		return FALSE
	if(require_target_danceress && target.gender == MALE)
		if(!silent)
			to_chat(user, span_warning("У цели нет пельмешка.</span>"))
		return FALSE
	return TRUE

/datum/interaction/proc/get_action_link_for(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return "<a href='?src=\ref[src];action=1;action_user=\ref[user];action_target=\ref[target]'>[description]</a><br>"

/datum/interaction/Topic(href, href_list)
	if(..())
		return TRUE
	if(href_list["action"])
		do_action(locate(href_list["action_user"]), locate(href_list["action_target"]))
		return TRUE
	return FALSE

/datum/interaction/proc/do_action(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(cooldaun)
		return
	if(get_dist(user, target) > max_distance)
		to_chat(user, span_warning("<b>[target.name]</b> слишком далеко."))
		return
	if(needs_physical_contact && !(user.Adjacent(target) && target.Adjacent(user)))
		to_chat(user, span_warning("Не могу добраться до <b>[target.name]</b>."))
		return
	if(!evaluate_user(user, silent = FALSE))
		return
	if(!evaluate_target(user, target, silent = FALSE))
		return
	if(user.stat != CONSCIOUS)
		return
	if(!check_rights_for(user.client, R_ADMIN) && !check_whitelist_exrp(user.ckey))
		return

	cooldaun = 3

	display_interaction(user, target)

	post_interaction(user, target)

/datum/interaction/proc/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(simple_message)
		var/use_message = replacetext(simple_message, "USER", "<b>[user]</b>")
		use_message = replacetext(use_message, "TARGET", "<b>[target]</b>")
		user.visible_message("<span class='[simple_style] purple'>[capitalize(use_message)]</span>")

/datum/interaction/proc/post_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	spawn(1)
		cooldaun = 0
	if(user_dancing_cost)
		user.dancing += user_dancing_cost
	if(target_dancing_cost)
		target.dancing += target_dancing_cost
