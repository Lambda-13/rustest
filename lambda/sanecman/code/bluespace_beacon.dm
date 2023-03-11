/obj/item/sbeacondrop/exploration
	name = "блюспейс-маяк"
	desc = "Надпись на нём оглашает: <i>ВНИМАНИЕ: Активация данного устройства отправит к вам блюспейс-гигамаяк, который позволит возвращаться в зону активации снова.</i>."
	icon = 'lambda/sanecman/icons/obj/NavBeacon.dmi'
	icon_state = "beacon-item"
	droptype = /obj/structure/bluespace_beacon

//Beacon structure

/obj/structure/bluespace_beacon
	name = "блюспейс-гигамаяк"
	desc = "Закрепляет текущее местоположение в глобальной блюспейс-сети, разрешая возвращаться сюда снова. Для работы должен быть прикручен."
	icon = 'lambda/sanecman/icons/obj/NavBeacon.dmi'
	icon_state = "beacon-inactive"
	density = TRUE

	max_integrity = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF

	light_power = 2
	light_range = 3
	light_color = "#cd87df"

/obj/structure/bluespace_beacon/Initialize()
	. = ..()
	var/eblan = rand(100, 9999)
	name += " #[eblan]"
	GLOB.holding_beacon_list += src
	AddComponent(/datum/component/gps, "БСМАЯК#[eblan]")
	anchored = FALSE
	say("Прикрутите к полу для активации.")

/obj/structure/bluespace_beacon/wrench_act(mob/living/user, obj/item/I)
	if(anchored)
		to_chat(user, span_notice("Начинаю откручивать [src]..."))
	else
		to_chat(user, span_notice("Начинаю прикручивать [src]..."))
	if(I.use_tool(src, user, 40, volume=50))
		if(QDELETED(I))
			return
		if(anchored)
			to_chat(user, span_notice("Откручиваю [src]."))
			icon_state = "beacon-inactive"
			say("Система деактивирована.")
		else
			to_chat(user, span_notice("Прикручиваю [src]."))
			icon_state = "beacon-open"
			say("Система активирована.")
		anchored = !anchored
		return

/obj/structure/bluespace_beacon/Destroy()
	. = ..()
	anchored = FALSE
	GLOB.holding_beacon_list -= src
	say("КРИТИЧЕСКИЕ ПОВРЕЖДЕНИЯ, ДЕА-А-А.")
	return ..()
