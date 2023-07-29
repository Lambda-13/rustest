///obj/structure/trash_pile
//	name = "мусор"
//	desc = "Гора мусора. Здесь есть что-то интересное, верно?"
//	icon = 'white/valtos/icons/trash_piles.dmi'
//	icon_state = "randompile"
//	density = TRUE
//	anchored = TRUE
//	layer = TABLE_LAYER
//	obj_flags = CAN_BE_HIT
//	pass_flags = LETPASSTHROW
//
//	max_integrity = 50
//
//	var/hide_person_time = 30
//	var/hide_item_time = 15
//
//	var/list/searchedby	= list()// Characters that have searched this trashpile, with values of searched time.
//
//	var/chance_alpha	= 99 // Alpha list is the normal maint loot table.
//	var/chance_beta		= 1	 // Beta list is unique items only, and will only spawn one of each.
//
//	//These are types that can only spawn once, and then will be removed from this list.
//	var/global/list/unique_beta = list(
//		/obj/item/gun/ballistic/automatic/pistol,
//		/obj/item/clothing/glasses/thermal,
//		/obj/item/clothing/gloves/tackler/combat/insulated,
//		/obj/item/disk/nuclear/fake,
//		/obj/item/pen/edagger
//	)
//
//	var/global/list/allocated_beta = list()
//
///obj/structure/trash_pile/Initialize(mapload)
//	. = ..()
//	icon_state = pick(
//		"pile1",
//		"pile2",
//		"pilechair",
//		"piletable",
//		"pilevending",
//		"brtrashpile",
//		"microwavepile",
//		"rackpile",
//		"boxfort",
//		"trashbag",
//		"brokecomp",
//	)
//	AddElement(/datum/element/swabable, CELL_LINE_TABLE_SLUDGE, CELL_VIRUS_TABLE_GENERIC, rand(2,4), 10)
//	AddElement(/datum/element/climbable)
//
///obj/structure/trash_pile/proc/do_search(mob/user)
//	if(contents.len) //There's something hidden
//		var/atom/A = contents[contents.len] //Get the most recent hidden thing
//		if(istype(A, /mob/living))
//			var/mob/living/M = A
//			to_chat(user,span_userdanger("КТО-ТО НАШЁЛСЯ!"))
//			eject_mob(M)
//		else if (istype(A, /obj/item))
//			var/obj/item/I = A
//			to_chat(user,span_notice("Что-то нашлось!"))
//			I.forceMove(src.loc)
//	else
//		//You already searched this one bruh
//		if(user.ckey in searchedby)
//			to_chat(user,span_warning("Ничего здесь нет больше!"))
//		//You found an item!
//		else
//			var/luck = rand(1,100)
//			if(luck <= chance_alpha)
//				produce_alpha_item()
//			else if(luck <= chance_alpha+chance_beta)
//				produce_beta_item()
//			to_chat(user,span_notice("Что-то нашлось!"))
//			searchedby += user.ckey
//
///obj/structure/trash_pile/attack_hand(mob/user)
//	//Human mob
//	if(ishuman(user))
//		var/mob/living/carbon/human/H = user
//		H.visible_message("[user] роется в куче мусора.",span_notice("Роюсь в куче мусора."))
//		//Do the searching
//		if(do_after(user,rand(4 SECONDS,6 SECONDS),target=src))
//			if(src.loc) //Let's check if the pile still exists
//				do_search(user)
//	else
//		return ..()
//
////Random lists
///obj/structure/trash_pile/proc/produce_alpha_item()
//	var/lootspawn = pick_weight(GLOB.maintenance_loot)
//	while(islist(lootspawn))
//		lootspawn = pick_weight(lootspawn)
//	var/obj/item/I = new lootspawn(get_turf(src))
//	return I
//
///obj/structure/trash_pile/proc/produce_beta_item()
//	var/path = pick_n_take(unique_beta)
//	if(!path) //Tapped out, reallocate?
//		for(var/P in allocated_beta)
//			var/obj/item/I = allocated_beta[P]
//			if(QDELETED(I))
//				allocated_beta -= P
//				path = P
//				break
//	if(path)
//		var/obj/item/I = new path(get_turf(src))
//		allocated_beta[path] = I
//		return I
//	else
//		return produce_alpha_item()
//
///obj/structure/trash_pile/MouseDrop_T(atom/movable/O, mob/user)
//	if(user == O && iscarbon(O))
//		var/mob/living/L = O
//		if(L.mobility_flags & MOBILITY_MOVE)
//			dive_in_pile(user)
//			return
//	. = ..()
//
///obj/structure/trash_pile/proc/eject_mob(var/mob/living/M)
//	M.forceMove(src.loc)
//	to_chat(M,span_warning("Меня нашли!"))
//	playsound(M.loc, 'sound/machines/chime.ogg', 50, FALSE, -5)
//	M.do_alert_animation(M)
//
///obj/structure/trash_pile/proc/do_dive(mob/user)
//	if(contents.len)
//		for(var/mob/M in contents)
//			to_chat(user,span_warning("Кто-то уже сидит внутри!"))
//			eject_mob(M)
//			return FALSE
//	return TRUE
//
///obj/structure/trash_pile/proc/dive_in_pile(mob/user)
//	user.visible_message(span_warning("[user] начинает залезать в кучу мусора.") , \
//								span_notice("Начинаю залезать в кучу мусора..."))
//	var/adjusted_dive_time = hide_person_time
//	if(HAS_TRAIT(user, TRAIT_RESTRAINED)) //hiding takes twice as long when restrained.
//		adjusted_dive_time *= 2
//
//	if(do_mob(user, user, adjusted_dive_time))
//		if(src.loc) //Checking if structure has been destroyed
//			if(do_dive(user))
//				to_chat(user,span_notice("Прячусь в куче мусора."))
//				user.forceMove(src)
//
///obj/structure/trash_pile/proc/can_hide_item(obj/item/I)
//	if(contents.len > 10)
//		return FALSE
//	return TRUE
//
///obj/structure/trash_pile/attackby(obj/item/I, mob/user, params)
//	if(user.a_intent == INTENT_HELP)
//		if(can_hide_item(I))
//			to_chat(user,span_notice("Начинаю прятать [I.name] в куче мусора."))
//			if(do_mob(user, user, hide_item_time))
//				if(src.loc)
//					if(user.transferItemToLoc(I, src))
//						to_chat(user,span_notice("Прячу [I.name] в куче мусора."))
//					else
//						to_chat(user, span_warning("[capitalize(I.name)] застрял в моей руке, не получится!"))
//		else
//			to_chat(user,span_warning("Куча мусора переполнена и не хочет принимать [I.name]. Дряянь!"))
//		return
//
//	. = ..()
//
///obj/structure/trash_pile/Destroy()
//	for(var/atom/movable/AM in src)
//		AM.forceMove(src.loc)
//	return ..()
//
///obj/structure/trash_pile/container_resist_act(mob/user)
//	user.forceMove(src.loc)
//
///obj/structure/trash_pile/relaymove(mob/user)
//	container_resist_act(user)
//
