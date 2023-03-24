//ass blast goonstation

/obj/item/mechcomp
	name = "base MechComp component"
	desc = "Holds the basic functionality for the MechComp components. Does nothing, and you should not be seeing this."
	icon = 'lambda/sanecman/icons/obj/mechcomp.dmi'

	var/last_anchored_by

	var/datum/component/mechanics_holder/compdatum

	/**
	 * A crutch to use the goon mechcomp sprites, because goon iconstate
	 * format for mechcomp is [compname] for unanchored and u[compname] for anchored components.
	 *
	 * Avoid editing it in runtime as it should (?) hold the "initial" value at all times. Use update_icon_state instead,
	 * it also handles all the logic regarding anchored/unanchored sprites.
	 **/
	var/part_icon_state = "generic"

	/**
	 * Icon state for when the component is active. If you do not have a sprite for this, keep it null.
	 **/
	var/active_icon_state = null

	/**
	 * if the component has a smaller sprite for when it's anchored to the floor.
	 **/
	var/has_anchored_icon_state = FALSE


	/**
	 * If the current component is active, i.e. performing some work.
	 **/
	var/active = FALSE

	///cringe
	var/deactivatecb = CALLBACK()

	/**
	 * If only a single instance of a component is allowed to be anchored onto a tile.
	 * Also resets it's own pixel_x and pixel_y vars when anchored so that it stays centered.
	 **/
	var/only_one_per_tile = FALSE

	/**
	 * Set this to the same value as initial part_icon_state, or else the icon in right-click menu
	 * will break. For runtime updates, use update_icon_state("comp_ass") instead.
	 **/
	icon_state = "fixme"

/obj/item/mechcomp/examine(mob/user)
	. = ..()
	. += "<hr><span class='notice'>It is <i>[!anchored ? "un":""]anchored</i>. To <i>[anchored ? "un":""]anchor</i> it, <b>click</b> on it with a <b>wrench</b> while on</span> <span class='alert'>harm</span> <span class='notice'>intent.</span><br>"
	. += span_notice("<b>Click</b> on the component with a <b>C.U.M.</b> while on</span> <span class='alert'>harm</span> <span class='notice'>intent  to access it's properties, <b>drag-n-drop</b> the <i>anchored</i> component onto another <i>anchored</i> component while on</span> <span class='alert'>harm</span> <span class='notice'>intent to connect them.")
	. += "<br>"

/**
 * Another part to the gooncode crutch adaptation.
 * Use it to actually change icon_state, instead of accessing icon_state or part_icon_state directly.
 **/
/obj/item/mechcomp/update_icon_state(var/part_icon_state)
	. = ..()
	icon_state = "[src.anchored && src.has_anchored_icon_state ? "u" : ""][part_icon_state]"


/obj/item/mechcomp/Initialize(mapload)
	. = ..()
	update_icon_state(part_icon_state)

/obj/item/mechcomp/ComponentInitialize()
	. = ..()
	compdatum = AddComponent(/datum/component/mechanics_holder)


/**
 * Called when a user clicks the component with an empty hand.
 * Moved to a separate proc for easier handling of active/inactive states.
 **/
/obj/item/mechcomp/proc/interact_by_hand(mob/user)
	return


/**
 * Called when a user clicks the component with an item while not on harm intent.
 * Moved to a separate proc for easier handling of active/inactive states.
 **/
/obj/item/mechcomp/proc/interact_by_item(obj/item/I, mob/user)
	return


/**
 * please no touch, use interact_by_hand instead!
 **/
/obj/item/mechcomp/attack_hand(mob/user)
	. = ..()
	if(anchored)
		interact_by_hand(user)

/**
 * please no touch, use interact_by_item instead!
 **/
/obj/item/mechcomp/attackby(obj/item/I, mob/living/user, params)
	//can't attack an /obj/item/ anyway, so might as well use harm intent for this stuff.
	if(user.a_intent == INTENT_HARM)
		. = ..() //also calls the COMSIG_PARENT_ATTACKBY, so the component handles the multitool stuff by itself.
		//i want to fucking die btw
		//this should probably be moved to another proc.
		if(I.tool_behaviour == TOOL_WRENCH)


			if(anchored && can_unanchor(user))
				unanchor(user)
			else if(!anchored && can_anchor(user))
				anchor(user)
		return

	//shouldn't get to this point if the user's intent is harm
	//this way stuff like item scanners can accept all items (like a fucking wrench) on the first 3 intents
	//AND still be wrenched (bypassing the scan) if on harm intent.
	if(anchored)
		interact_by_item(I, user)


///Returns true if anchoring is allowed, returns false if not.
/obj/item/mechcomp/proc/can_anchor(mob/living/user)
	if(only_one_per_tile)
		for(var/obj/item/mechcomp/i in get_turf(src))
			if(istype(i, src) && i.anchored)
				to_chat(user, span_alert("Cannot wrench two [src.name]s in one place! Pick a different spot for this one!"))
				return FALSE
		src.pixel_x = 0
		src.pixel_y = 0
	return TRUE

///Returns true if unanchoring is allowed, returns false if not.
/obj/item/mechcomp/proc/can_unanchor(mob/living/user)
	if (length(compdatum.connected_incoming) || length(compdatum.connected_outgoing))
		to_chat(user, span_alert("The locking bolts of [src.name] are locked in and do not budge! Disconnect all first!"))
		return FALSE
	return TRUE

///handles the anchoring of component.
/obj/item/mechcomp/proc/anchor(mob/living/user)
	anchored = TRUE
	last_anchored_by = user
	playsound(src, 'sound/items/ratchet.ogg', 100, TRUE)
	user.visible_message(span_notice("[user] прикручивает [src.name].") , \
						span_notice("Прикручиваю [src.name] к полу."))
	update_icon_state(part_icon_state)

///handles the unanchoring of component.
/obj/item/mechcomp/proc/unanchor(mob/living/user)
	anchored = FALSE
	SEND_SIGNAL(src, COMSIG_MECHCOMP_RM_ALL_CONNECTIONS)
	playsound(src, 'sound/items/ratchet.ogg', 100, TRUE)
	user.visible_message(span_notice("[user] откручивает [src.name].") , \
						span_notice("Откручиваю [src.name] от пола."))
	update_icon_state(part_icon_state)


//feels like a good idea to include these
/obj/item/mechcomp/Destroy()
	SEND_SIGNAL(src, COMSIG_MECHCOMP_RM_ALL_CONNECTIONS)
	. = ..()

/obj/item/mechcomp/proc/log_action(action)
	log_mechcomp("[initial(src.name)] at x=[src.x] y=[src.y] z=[src.z]: [action]. Last IO edit [last_io_edit()], last config edit: [last_config_edit()]")

/obj/item/mechcomp/proc/last_config_edit()
	//return list("user" = compdatum.last_edited_configs_by["user"], "action" = compdatum.last_edited_configs_by["action"])
	var/mob/user = compdatum.last_edited_configs_by["user"]
	return  "by [user?.ckey], [compdatum.last_edited_configs_by["action"]]"

/obj/item/mechcomp/proc/last_io_edit()
	//return list("user" = compdatum.last_edited_inputs_by["user"], "action" = compdatum.last_edited_inputs_by["action"])
	var/mob/user = compdatum.last_edited_configs_by["user"]
	return  "by [user?.ckey], [compdatum.last_edited_inputs_by["action"]]"

/**
 * Change the active var to TRUE and current icon to active_icon_state, it it's not null.area
 * If you want your mechcomp component to have a mandatory cooldown between activations, use a
 * if(active)
 *		return
 * construction in the beginning of your interact proc or signal handling proc.
 * The visual controls whether or not to apply active_icon_state. passing FALSE to it will result
 * in applying only cooldown without any sprite changes.
 **/
/obj/item/mechcomp/proc/activate_for(var/time, visual = TRUE)
	active = TRUE
	if(active_icon_state && visual)
		update_icon_state(active_icon_state)
	addtimer(CALLBACK(src, PROC_REF(_deactivate)), time)

///internal, for callback stuff.
/obj/item/mechcomp/proc/_deactivate()
	active = FALSE
	update_icon_state(part_icon_state)

/*
/obj/item/mechcomp/MouseDrop_T(atom/_drop, mob/living/user)
	. = ..()

	if(!istype(_drop,/obj/item/mechcomp))
		return

	var/obj/item/mechcomp/drop = _drop
	if(!(src.anchored && drop.anchored))
		return

	SEND_SIGNAL(src,_COMSIG_MECHCOMP_DROPCONNECT, drop, user)
*/


/**
 * here lies fancy radial menu stuff, that i wanted to use but didn't get to because signals in mechcomp don't actually have types like "strings" and "numbers".
 * R.I.P.
**/

/*
/obj/item/mechcomp/MouseDrop(atom/_over, src_location, over_location, src_control, over_control, params)
	. = ..()
	if(!istype(over, /obj/item/mechcomp))
		return
	/*
	if(!isliving(usr))
		return
	var/mob/living/user = usr
	*/
	if(user.held_items[user.active_hand_index].tool_behaviour != TOOL_MULTITOOL)
		return

	var/obj/item/mechcomp/over = _over
	for(input in input_types)
		input_icons += list(input) = image(icon = input[1], icon_state = "[input[1] ? input[1] : "unknown"]")
	var/input_choice = show_radial_menu(user, src, list/choices, tooltips = TRUE)
	to_chat(user, span_notice("Подключаю вход \"[input_choice[2]]\" [src.name]..."))

	for(output in over.output_types)
		input_icons += list(input[2]) = image(icon = output[1], icon_state = "[output[1] ? output[1] : "unknown"]")
	var/output_choice = show_radial_menu(user, over, list/choices, tooltips = TRUE)
	to_chat(user, span_notice("...к выходу \"[output_choice[2]]\" [over.name]."))
*/
