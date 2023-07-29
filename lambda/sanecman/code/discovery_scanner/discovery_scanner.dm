///obj/item/discovery_scanner
//	name = "научсканер"
//	desc = "Используется для сканирования различных артефактов и неизвестных форм жизни."
//	icon = 'white/valtos/icons/objects.dmi'
//	icon_state = "nuher"
//	inhand_icon_state = "electronic"
//	worn_icon_state = "electronic"
//	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
//	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
//	w_class = WEIGHT_CLASS_SMALL
//	var/datum/techweb/linked_techweb
//
///obj/item/discovery_scanner/Initialize(mapload)
//	. = ..()
//	if(!linked_techweb)
//		linked_techweb = SSresearch.science_tech
//
///obj/item/discovery_scanner/Destroy()
//	linked_techweb = null	//Note: Shouldn't hard del anyway since techwebs don't get deleted, however if they do then troubles will arise and this will need to be changed.
//	. = ..()
//
///obj/item/discovery_scanner/examine(mob/user)
//	. = ..()
//	. += "<hr><span class='notice'>Левый клик по чему угодно для начала исследований.</span>"
//	. += span_notice("\n[capitalize(src.name)] имеет безлимитный радиус, можете сканировать хоть через камеры.")
//	. += span_notice("\nНаучные очки помогут узнать что может оказаться полезным.")
//
///obj/item/discovery_scanner/attack_obj(obj/O, mob/living/user)
//	if(istype(O, /obj/machinery/computer/rdconsole))
//		to_chat(user, span_notice("Привязываю [src] к [O]."))
//		var/obj/machinery/computer/rdconsole/rdconsole = O
//		linked_techweb = rdconsole.stored_research
//		return
//	. = ..()
//
///obj/item/discovery_scanner/proc/begin_scanning(mob/user, datum/component/discoverable/discoverable)
//	to_chat(user, span_notice("Начинаю сканировать [discoverable.parent]..."))
//	if(do_after(user, 50, target=get_turf(user)))
//		discoverable.discovery_scan(linked_techweb, user)
//
