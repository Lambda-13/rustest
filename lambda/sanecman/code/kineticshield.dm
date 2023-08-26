/obj/item/kinetic_shield
	name = "кинетический щит"
	desc = "Отражает все попадающие в поле снаряды, однако имеет ограниченный заряд. Надпись на обороте гласит: <b>Внимание! Перед применением оружия дальнего боя щит необходимо отключить во избежание непредвиденных обстоятельств.</b>"
	icon = 'lambda/sanecman/icons/obj/kinetic.dmi'
	icon_state = "kinetic0"
	base_icon_state = "kinetic"
	inhand_icon_state = "assaultbelt"
	slot_flags = ITEM_SLOT_BELT
	var/ison = FALSE
	var/obj/item/stock_parts/cell/our_powercell = null

/obj/item/kinetic_shield/Initialize(mapload)
	. = ..()
	our_powercell = new /obj/item/stock_parts/cell/high(src)

/obj/item/kinetic_shield/examine(mob/user)
	. = ..()
	if(our_powercell)
		. += "<hr>"
		. += span_notice("<b>[uppertext(our_powercell.name)]:</b> [our_powercell.percent()]%")

/obj/item/kinetic_shield/equipped(mob/user, slot, initial)
	. = ..()
	update_appearance(UPDATE_ICON)
	user.update_appearance(UPDATE_ICON)

/obj/item/kinetic_shield/dropped(mob/user, silent)
	. = ..()
	ison = FALSE
	update_appearance(UPDATE_ICON)
	user.update_appearance(UPDATE_ICON)
	UnregisterSignal(user, list(COMSIG_ATOM_UPDATE_OVERLAYS, COMSIG_HUMAN_CHECK_SHIELDS, COMSIG_MOB_FIRED_GUN))

/obj/item/kinetic_shield/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][ison]"

/obj/item/kinetic_shield/proc/on_update_overlays(atom/parent_atom, list/overlays)
	SIGNAL_HANDLER
	if(ison)
		overlays += mutable_appearance('icons/effects/effects.dmi', "shield-grey", MOB_SHIELD_LAYER)

/obj/item/kinetic_shield/proc/on_gun_fired(mob/user, obj/item/gun/gun_fired, target, params, zone_override)
	SIGNAL_HANDLER
	if(!ison || our_powercell?.charge < 200 || target == user)
		return
	INVOKE_ASYNC(gun_fired, /obj/item/gun.proc/process_fire, user, user, TRUE, params, zone_override)
	return COMSIG_GUN_FIRED_CANCEL

/obj/item/kinetic_shield/attack_hand(mob/user)
	if(loc == user)
		playsound(loc, 'sound/magic/charge.ogg', 50, TRUE)
		ison = !ison
		if(ison)
			RegisterSignal(user, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(on_update_overlays))
			RegisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS,  PROC_REF(on_shields))
			RegisterSignal(user, COMSIG_GUN_FIRED, 		  	  PROC_REF(on_gun_fired))
			START_PROCESSING(SSobj, src)
			for(var/obj/item/kinetic_shield/KS in user.contents)
				if(KS != src && KS.ison == TRUE)
					to_chat(user, span_userdanger("Щиты перегружаются!"))
					explosion(user, devastation_range = 1, heavy_impact_range = 2, light_impact_range = 4, flame_range = 5, flash_range = 10)
					qdel(src)
					qdel(KS)
		else
			UnregisterSignal(user, list(COMSIG_ATOM_UPDATE_OVERLAYS, COMSIG_HUMAN_CHECK_SHIELDS, COMSIG_MOB_FIRED_GUN))
		update_appearance(UPDATE_ICON)
		user.update_appearance(UPDATE_ICON)
		return
	. = ..()

/obj/item/kinetic_shield/MouseDrop(atom/over_object)
	. = ..()
	var/mob/M = usr

	if(ismecha(M.loc))
		return

	if(!M.incapacitated() && loc == M && istype(over_object, /atom/movable/screen/inventory/hand))
		var/atom/movable/screen/inventory/hand/H = over_object
		if(M.putItemFromInventoryInHandIfPossible(src, H.held_index))
			add_fingerprint(usr)

/obj/item/kinetic_shield/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(istype(attacking_item, /obj/item/stock_parts/cell))
		if(our_powercell)
			var/turf/T = get_turf(src)
			our_powercell.forceMove(T)
		attacking_item.forceMove(src)
		our_powercell = attacking_item
		playsound(loc, 'sound/weapons/kenetic_reload.ogg', 60, TRUE)
		to_chat(user, span_notice("Тактически заменяю батарею."))
		check_charge()
	if(attacking_item.tool_behaviour == TOOL_SCREWDRIVER)
		if(our_powercell)
			var/turf/T = get_turf(src)
			our_powercell.forceMove(T)
			to_chat(user, span_notice("Достаю батарею."))
			check_charge()

/obj/item/kinetic_shield/process(delta_time)
	if(!ison)
		return PROCESS_KILL
	check_charge()

/obj/item/kinetic_shield/proc/on_shields(datum/source, mob/M, atom/movable/AM)
	SIGNAL_HANDLER

	if(!ison)
		return FALSE

	var/calculated_damage = AM.throwforce
	var/obj/projectile/P
	if(isprojectile(AM))
		P = AM
		calculated_damage = P.damage

	if(!our_powercell?.use(calculated_damage * 200))
		our_powercell?.use(our_powercell?.charge)
		check_charge()
		return FALSE

	if(P)
		P.firer = M
		P.set_angle(P.Angle + rand(60, -60))
	else
		AM.throw_at(get_distant_turf(get_turf(AM), REVERSE_DIR(AM.dir), 3), 3, 4)

	visible_message(span_danger("Щит <b>[M]</b> отражает [AM.name]!"), span_userdanger("Щит отражает [AM.name]!"))
	playsound(loc, 'sound/effects/empulse.ogg', 75, TRUE)
	check_charge()
	return SHIELD_BLOCK

/obj/item/kinetic_shield/proc/check_charge()
	if(ison && !our_powercell?.use(10))
		ison = FALSE
		update_appearance(UPDATE_ICON)
		if(loc && ismob(loc))
			var/mob/M = loc
			M.update_appearance(UPDATE_ICON)

/obj/item/kinetic_shield/get_cell()
	return our_powercell
