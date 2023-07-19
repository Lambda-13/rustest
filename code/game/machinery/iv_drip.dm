#define IV_TAKING 0
#define IV_INJECTING 1

/obj/machinery/iv_drip
	name = "капельница"
	desc = "Капельница для внутривенных вливаний с усовершенствованным инфузионным насосом, который может как сливать кровь, так и вводить жидкости из прикрепленных контейнеров. Пакеты с кровью обрабатываются ускоренными темпами. Alt-клик, чтобы изменить тип."
	icon = 'icons/obj/iv_drip.dmi'
	icon_state = "iv_drip"
	anchored = FALSE
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	var/mob/living/carbon/attached
	var/mode = IV_INJECTING
	var/dripfeed = FALSE
	var/obj/item/reagent_containers/beaker
	var/static/list/drip_containers = typecacheof(list(/obj/item/reagent_containers/blood,
									/obj/item/reagent_containers/food,
									/obj/item/reagent_containers/glass,
									/obj/item/reagent_containers/chem_pack))

/obj/machinery/iv_drip/Initialize(mapload)
	. = ..()
	update_icon()

/obj/machinery/iv_drip/Destroy()
	attached = null
	QDEL_NULL(beaker)
	return ..()

/obj/machinery/iv_drip/update_icon_state()
	if(attached)
		if(mode)
			icon_state = "injecting"
		else
			icon_state = "donating"
	else
		if(mode)
			icon_state = "injectidle"
		else
			icon_state = "donateidle"

/obj/machinery/iv_drip/update_overlays()
	. = ..()

	if(beaker)
		if(attached)
			. += "beakeractive"
		else
			. += "beakeridle"
		if(beaker.reagents.total_volume)
			var/mutable_appearance/filling_overlay = mutable_appearance('icons/obj/iv_drip.dmi', "reagent")

			var/percent = round((beaker.reagents.total_volume / beaker.volume) * 100)
			switch(percent)
				if(0 to 9)
					filling_overlay.icon_state = "reagent0"
				if(10 to 24)
					filling_overlay.icon_state = "reagent10"
				if(25 to 49)
					filling_overlay.icon_state = "reagent25"
				if(50 to 74)
					filling_overlay.icon_state = "reagent50"
				if(75 to 79)
					filling_overlay.icon_state = "reagent75"
				if(80 to 90)
					filling_overlay.icon_state = "reagent80"
				if(91 to INFINITY)
					filling_overlay.icon_state = "reagent100"

			filling_overlay.color = mix_color_from_reagents(beaker.reagents.reagent_list)
			. += filling_overlay

/obj/machinery/iv_drip/MouseDrop(mob/living/target)
	. = ..()
	if(!ishuman(usr) || !usr.canUseTopic(src, BE_CLOSE) || !isliving(target))
		return

	if(attached)
		visible_message("<span class='warning'>Игла [attached] уже прикреплена к [src].</span>")
		attached = null
		update_icon()
		return

	if(!target.has_dna())
		to_chat(usr, "<span class='danger'>Я не знаю куда вставить иглу!</span>")
		return

	if(Adjacent(target) && usr.Adjacent(target))
		if(beaker)
			usr.visible_message("<span class='warning'>[usr] прикрепляет иглу [src] к [target].</span>", "<span class='notice'>Вставляю иглу [src] в [target].</span>")
			log_combat(usr, target, "attached", src, "containing: [beaker.name] - ([beaker.reagents.log_list()])")
			add_fingerprint(usr)
			attached = target
			START_PROCESSING(SSmachines, src)
			update_icon()
		else
			to_chat(usr, "<span class='warning'>В капельницу ничего не вставлено!</span>")


/obj/machinery/iv_drip/attackby(obj/item/W, mob/user, params)
	if(is_type_in_typecache(W, drip_containers))
		if(beaker)
			to_chat(user, "<span class='warning'>Тут уже что-то есть!</span>")
			return
		if(!user.transferItemToLoc(W, src))
			return
		beaker = W
		to_chat(user, "<span class='notice'>Вставляю [W] в [src].</span>")
		user.log_message("attached a [W] to [src] at [AREACOORD(src)] containing ([beaker.reagents.log_list()])", LOG_ATTACK)
		add_fingerprint(user)
		update_icon()
		return
	else
		return ..()

/obj/machinery/iv_drip/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/metal(loc)
	qdel(src)

/obj/machinery/iv_drip/process()
	if(!attached)
		return PROCESS_KILL

	if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
		to_chat(attached, "<span class='userdanger'>Игла капельницы выскакивает из моего тела!</span>")
		attached.apply_damage(3, BRUTE, pick(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM))
		attached = null
		update_icon()
		return PROCESS_KILL

	if(beaker)
		// Give blood
		if(mode)
			if(beaker.reagents.total_volume)
				var/transfer_amount = 5
				if (dripfeed)
					transfer_amount = 1
				if(istype(beaker, /obj/item/reagent_containers/blood))
					// speed up transfer on blood packs
					transfer_amount *= 2
				beaker.reagents.trans_to(attached, transfer_amount, method = INJECT, show_message = FALSE) //make reagents reacts, but don't spam messages
				update_icon()

		// Take blood
		else
			var/amount = beaker.reagents.maximum_volume - beaker.reagents.total_volume
			amount = min(amount, 4)
			// If the beaker полон ping
			if(!amount)
				if(prob(5))
					visible_message("<span class='hear'>[src] пищит.</span>")
				return

			// If the human is losing too much blood, beep.
			if(attached.blood_volume < BLOOD_VOLUME_SAFE && prob(5))
				visible_message("<span class='hear'>[src] протяжно пищит.</span>")
				playsound(loc, 'sound/machines/twobeep_high.ogg', 50, TRUE)
			attached.transfer_blood_to(beaker, amount)
			update_icon()

/obj/machinery/iv_drip/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	if(attached)
		visible_message("<span class='notice'>[attached] отцеплён от [src].</span>")
		attached = null
		update_icon()
		return
	else if(beaker)
		eject_beaker(user)
	else
		toggle_mode()

/obj/machinery/iv_drip/AltClick(mob/living/user)
	if(!user.canUseTopic(src, be_close=TRUE))
		return
	if(dripfeed)
		dripfeed = FALSE
		to_chat(usr, "<span class='notice'>Увеличиваю скорость переливания [src].</span>")
	else
		dripfeed = TRUE
		to_chat(usr, "<span class='notice'>Уменьшаю скорость переливания [src].</span>")

/obj/machinery/iv_drip/verb/eject_beaker()
	set category = "Object"
	set name = "Remove IV Container"
	set src in view(1)

	if(!isliving(usr))
		to_chat(usr, "<span class='warning'>Ты не можешь!</span>")
		return

	if(usr.incapacitated())
		return
	if(beaker)
		beaker.forceMove(drop_location())
		beaker = null
		update_icon()

/obj/machinery/iv_drip/verb/toggle_mode()
	set category = "Object"
	set name = "Toggle Mode"
	set src in view(1)

	if(!isliving(usr))
		to_chat(usr, "<span class='warning'>Ты не можешь!</span>")
		return

	if(usr.incapacitated())
		return
	mode = !mode
	to_chat(usr, "<span class='notice'>Капельница теперь [mode ? "вводит жидкость из контейнера" : "выкачивает кровь"].</span>")
	update_icon()

/obj/machinery/iv_drip/examine(mob/user)
	. = ..()
	if(get_dist(user, src) > 2)
		return

	. += "[src] в режиме [mode ? "ввода жидкостей из контейнера" : "забора крови"]."

	if(beaker)
		if(beaker.reagents && beaker.reagents.reagent_list.len)
			. += "<hr><span class='notice'>Виднеется [beaker] с [beaker.reagents.total_volume] юнитами внутри.</span>"
		else
			. += "<hr><span class='notice'>Виднеется пустая [beaker.name].</span>"
	else
		. += "<hr><span class='notice'>Не вижу ничего прикреплённого.</span>"

	. += "<hr><span class='notice'>[attached ? attached : "Никто не"] подключён.</span>"


/obj/machinery/iv_drip/saline
	name = "saline drip"
	desc = "An all-you-can-drip saline canister designed to supply a hospital without running out, with a scary looking pump rigged to inject saline into containers, but filling people directly might be a bad idea."
	icon_state = "saline"
	density = TRUE

/obj/machinery/iv_drip/saline/Initialize(mapload)
	. = ..()
	beaker = new /obj/item/reagent_containers/saline_holder(src)

/obj/machinery/iv_drip/saline/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_blocker)

/obj/machinery/iv_drip/saline/eject_beaker()
	return

/obj/machinery/iv_drip/saline/toggle_mode()
	return

/obj/item/reagent_containers/saline_holder
	name = "saline canister"
	volume = 5000
	list_reagents = list(/datum/reagent/medicine/salglu_solution = 5000)

#undef IV_TAKING
#undef IV_INJECTING
