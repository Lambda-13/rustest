/obj/item/manual_cell_recharger
	name = "ручной зарядник для аккумуляторов"
	desc = "Простая динамо-машина"
	icon = 'lambda/ss7v/icons/obj/manual_cell_recharger.dmi'
	icon_state= "handheldcharger_black_empty"
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	var/obj/item/stock_parts/cell/incell
	var/obj/item/stock_parts/manipulator/motor

/obj/item/manual_cell_recharger/examine(mob/user)
	. = ..()
	if(incell)
		. += "<hr><span class='notice'>Индикатор [incell] показывает [incell.percent()] </span>"
	else
		. += "<hr><span class='notice'>Внутри нет аккумулятора </span>"

	if(motor)
		. += "<hr><span class='notice'>Внутри есть [motor] </span>"
	else
		. += "<hr><span class='notice'>Внутри нет манипулятора </span>"

/obj/item/manual_cell_recharger/Initialize()
	. = ..()

/obj/item/manual_cell_recharger/attack_self(mob/user)
	if(!incell)
		to_chat(user, span_notice("Тут нет аккумулятора!"))
		return

	if(!motor)
		to_chat(user, span_notice("Тут нет манипулятора!"))
		return

	if(incell.charge >= incell.maxcharge)
		to_chat(user, span_notice("[incell] Уже полностью заряжена."))
		return

	if(user.do_afters)
		to_chat(user, span_notice("Уже нажимаю!"))
		return

	while(do_after(user, 10, TRUE, src))
		incell.charge = min(incell.charge + 100*motor.rating, incell.maxcharge)
		to_chat(user, span_notice("Нажимаю на ручку несколько раз, добавляя несколько вольт заряда."))
		playsound(user, 'lambda/sanecman/sound/fallout/repeater_reload.ogg', 15, 1, 5)
		if(incell.charge >= incell.maxcharge)
			to_chat(user, span_notice("[incell] полностью заряжен."))
			return
	to_chat(user, span_notice("Перестаю нажимать ручку."))


/obj/item/manual_cell_recharger/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/stock_parts/cell))
		if(!incell)
			incell = I
			user.transferItemToLoc(I, src)
			icon_state = "handheldcharger_black"
			update_icon()
			to_chat(user, span_notice("Вставляю [incell]."))
		else
			to_chat(user, span_notice("Тут уже есть [incell]."))
			return
	if(istype(I, /obj/item/stock_parts/manipulator))
		if(!motor)
			motor = I
			user.transferItemToLoc(I, src)
			to_chat(user, span_notice("Вставляю [motor]."))
		else
			to_chat(user, span_notice("Тут уже есть [motor]."))
			return
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		to_chat(user, span_notice("Вытаскиваю [motor]."))
		motor.forceMove(drop_location())
		motor = null

/obj/item/manual_cell_recharger/AltClick(mob/user)
	if(incell)
		to_chat(user, span_notice("Вытаскиваю [incell]."))
		user.put_in_hands(incell)
		incell = null
		icon_state= "handheldcharger_black_empty"
		update_icon()
		incell.update_icon()
	else
		return

/datum/crafting_recipe/manual_cell_recharger
	name = "простая динамо-машина"
	result = /obj/item/manual_cell_recharger
	time = 80
	reqs = list(
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/rods = 2,
				/obj/item/stack/sheet/glass = 1,
				)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	category = CAT_TOOLS

/datum/design/manual_cell_recharger
	name = "ручной зарядник для аккумуляторов"
	id = "manual_cell_recharger"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/manual_cell_recharger
	category = list("initial","Misc", "Tool Designs")
