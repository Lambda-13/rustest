// Snow, wood, sandbags, metal, plasteel
/*
/obj/structure/deployable_barricade
	icon = 'white/valtos/icons/barricade.dmi'
	anchored = TRUE
	density = TRUE
	flags_1 = ON_BORDER_1
	max_integrity = 100
	///The type of stack the barricade dropped when disassembled if any.
	var/stack_type
	///The amount of stack dropped when disassembled at full health
	var/stack_amount = 5
	///to specify a non-zero amount of stack to drop when destroyed
	var/destroyed_stack_amount = 0
	var/base_acid_damage = 2
	///Whether things can be thrown over
	var/allow_thrown_objs = TRUE
	var/barricade_type = "barricade" //"metal", "plasteel", etc.
	///Whether this barricade has damaged states
	var/can_change_dmg_state = TRUE
	///Whether we can open/close this barrricade and thus go over it
	var/closed = FALSE
	///Дополнительный щит
	var/raise = FALSE
	///Can this barricade type be wired
	var/can_wire = FALSE
	///is this barriade wired?
	var/is_wired = FALSE

/obj/structure/deployable_barricade/Initialize(mapload)
	. = ..()
	update_icon()
	var/static/list/connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_try_exit)
	)
	AddElement(/datum/element/connect_loc, connections)
	AddElement(/datum/element/climbable)

/obj/structure/deployable_barricade/examine(mob/user)
	. = ..()
	if(is_wired)
		to_chat(user, span_info("По верху этой баррикады протянута колючая проволока."))
	switch((obj_integrity / max_integrity) * 100)
		if(75 to INFINITY)
			to_chat(user, span_info("Она в отличном состоянии."))
		if(50 to 75)
			to_chat(user, span_warning("Она немного повреждена, но выдержит еще много ударов."))
		if(25 to 50)
			to_chat(user, span_warning("Она серьезно потрепана, но пока еще держится."))
		if(-INFINITY to 25)
			to_chat(user, span_warning("Она разваливается на части! Еще несколько ударов и она рухнет!"))


/obj/structure/deployable_barricade/proc/on_try_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(leaving == src)
		return

	if(!(direction & dir))
		return

	if (!density)
		return

	if (leaving.throwing)
		return

	if (leaving.movement_type & (PHASING | FLYING | FLOATING))
		return

	if (leaving.move_force >= MOVE_FORCE_EXTREMELY_STRONG)
		return

	leaving.Bump(src)
	return COMPONENT_ATOM_BLOCK_EXIT

/obj/structure/deployable_barricade/CanPass(atom/movable/mover, border_dir)
	. = ..()

	if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		if(!raise)
			var/obj/projectile/proj = mover
			if(proj.firer && Adjacent(proj.firer))
				return TRUE
			if(prob(25))
				return TRUE
		return FALSE

	if((border_dir & dir) && !closed)
		return . || mover.throwing || mover.movement_type & (FLYING | FLOATING)
	return TRUE

/obj/structure/deployable_barricade/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum)
	. = ..()
	update_icon()

/obj/structure/deployable_barricade/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/stack/cable_coil) && can_wire)
		var/obj/item/stack/S = I
		if(S.use(15))
			wire()
		else
			return
	else
		..()
		update_icon()

/obj/structure/deployable_barricade/attack_animal(mob/user)
	return attack_alien(user)

/obj/structure/deployable_barricade/proc/wire()
	can_wire = FALSE
	is_wired = TRUE
	modify_max_integrity(max_integrity + 50)
	update_icon()

/obj/structure/deployable_barricade/wirecutter_act(mob/living/user, obj/item/I)
	if(!is_wired)
		return FALSE

	user.visible_message(span_notice("[user] начинает перекусывать колючую проволоку на [src]."),
	span_notice("Начинаю перекусывать колючую проволоку на [src]."))

	if(!do_after(user, 2 SECONDS, src))
		return TRUE

	playsound(loc, 'sound/items/wirecutter.ogg', 25, TRUE)
	user.visible_message(span_notice("[user] перекусил колючую проволоку на [src]."),
	span_notice("Перекусываю колючую проволоку на [src]."))
	modify_max_integrity(max_integrity - 50)
	can_wire = TRUE
	is_wired = FALSE
	update_icon()


/obj/structure/deployable_barricade/deconstruct(disassembled = TRUE)
	if(stack_type)
		var/stack_amt
		if(!disassembled && destroyed_stack_amount)
			stack_amt = destroyed_stack_amount
		else
			stack_amt = round(stack_amount * (obj_integrity/max_integrity)) //Get an amount of sheets back equivalent to remaining health. Obviously, fully destroyed means 0

		if(stack_amt)
			new stack_type (loc, stack_amt)
	return ..()

/obj/structure/deployable_barricade/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			visible_message(span_danger("[src] сейчас рванет!"))
			deconstruct(FALSE)
			return
		if(EXPLODE_HEAVY)
			take_damage(rand(33, 66))
		if(EXPLODE_LIGHT)
			take_damage(rand(10, 33))
	update_icon()

/obj/structure/deployable_barricade/setDir(newdir)
	. = ..()
	update_icon()

/obj/structure/deployable_barricade/update_icon()
	. = ..()
	var/damage_state
	var/percentage = (obj_integrity / max_integrity) * 100
	switch(percentage)
		if(-INFINITY to 25)
			damage_state = 3
		if(25 to 50)
			damage_state = 2
		if(50 to 75)
			damage_state = 1
		if(75 to INFINITY)
			damage_state = 0
	if(!closed)
		if(can_change_dmg_state)
			icon_state = "[barricade_type]_[damage_state]"
		else
			icon_state = "[barricade_type]"
		switch(dir)
			if(SOUTH)
				layer = ABOVE_MOB_LAYER
			if(NORTH)
				SET_PLANE(src, GAME_PLANE_FOV_HIDDEN, src)
				layer = MOB_LAYER
			else
				layer = initial(layer)
		if(!anchored)
			layer = initial(layer)
	else
		if(can_change_dmg_state)
			icon_state = "[barricade_type]_closed_[damage_state]"
		else
			icon_state = "[barricade_type]_closed"
		layer = OBJ_LAYER

/obj/structure/deployable_barricade/update_overlays()
	. = ..()
	if(is_wired)
		if(!closed)
			. += image('white/valtos/icons/barricade.dmi', icon_state = "[barricade_type]_wire")
		else
			. += image('white/valtos/icons/barricade.dmi', icon_state = "[barricade_type]_closed_wire")

/obj/structure/deployable_barricade/verb/rotate()
	set name = "Поворот баррикады против часовой стрелки"
	set category = "Object"
	set src in oview(1)

	if(anchored)
		to_chat(usr, span_warning("Она прикручена к полу, у меня не выйдет повернуть ее!"))
		return FALSE

	setDir(turn(dir, 90))

/obj/structure/deployable_barricade/verb/revrotate()
	set name = "Поворот баррикады по часовой стрелке"
	set category = "Object"
	set src in oview(1)

	if(anchored)
		to_chat(usr, span_warning("Она прикручена к полу, у меня не выйдет повернуть ее!"))
		return FALSE

	setDir(turn(dir, 270))


/obj/structure/deployable_barricade/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(anchored)
		to_chat(user, span_warning("Она прикручена к полу, у меня не выйдет повернуть ее!"))
		return FALSE

	setDir(turn(dir, 270))


/*----------------------*/
// SNOW
/*----------------------*/

/obj/structure/deployable_barricade/snow
	name = "снежная баррикада"
	desc = "Сугроб, тщательно утрамбованный ладошками до относительно твердого состояния. Шестилетний архитектор в вашей голове считает, что это лучше чем ничего. В принципе вы с ним согласны."
	icon_state = "snow_0"
	barricade_type = "snow"
	max_integrity = 75
	stack_type = /obj/item/stack/sheet/mineral/snow
	stack_amount = 3
	destroyed_stack_amount = 0
	can_wire = FALSE

	layer = ABOVE_MOB_LAYER		// Закрывает космонавтика
	plane = GAME_PLANE_UPPER


/*----------------------*/
// GUARD RAIL
/*----------------------*/

/obj/structure/deployable_barricade/guardrail
	name = "ограждение"
	desc = "Небольшое заграждение из металлического профиля для предотвращения доступа туда, где вам быть не положено."
	icon_state = "railing_0"
	max_integrity = 150
	armor = list("melee" = 0, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 15, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 10)
	stack_type = /obj/item/stack/rods
	destroyed_stack_amount = 3
	barricade_type = "railing"
	allow_thrown_objs = FALSE
	can_wire = FALSE

	layer = ABOVE_MOB_LAYER		// Закрывает космонавтика
	plane = GAME_PLANE_UPPER


/obj/structure/deployable_barricade/guardrail/update_icon()
	. = ..()
	if(dir == NORTH)
		pixel_y = 12
		SET_PLANE(src, GAME_PLANE_FOV_HIDDEN, src)
		layer = MOB_LAYER

/*----------------------*/
// WOOD
/*----------------------*/

/obj/structure/deployable_barricade/wooden
	name = "деревянная баррикада"
	desc = "Стена, сбитая из деревянных досок, даже на вид не очень прочная, но все же обеспечивает некоторую защиту."
	icon = 'white/valtos/icons/barricade.dmi'
	icon_state = "wooden"
	max_integrity = 100
	layer = OBJ_LAYER
	stack_type = /obj/item/stack/sheet/mineral/wood
	stack_amount = 5
	destroyed_stack_amount = 3
	can_change_dmg_state = FALSE
	barricade_type = "wooden"
	can_wire = FALSE

	layer = ABOVE_MOB_LAYER		// Закрывает космонавтика
	plane = GAME_PLANE_UPPER


/obj/structure/deployable_barricade/wooden/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/D = I
		if(obj_integrity >= max_integrity)
			return

		if(D.get_amount() < 1)
			to_chat(user, span_warning("Для ремонта [skloname(src.name, RODITELNI, src.gender)] вам понадобится хотя бы одна доска."))
			return

		visible_message(span_notice("[user] начинает чинить [skloname(src.name, VINITELNI, src.gender)]."))

		if(!do_after(user,20, src) || obj_integrity >= max_integrity)
			return

		if(!D.use(1))
			return

		repair_damage(max_integrity)
		visible_message(span_notice("[user] завершает починку [skloname(src.name, RODITELNI, src.gender)]."))

	else ..()

/*----------------------*/
// METAL
/*----------------------*/

#define BARRICADE_METAL_LOOSE 0
#define BARRICADE_METAL_ANCHORED 1
#define BARRICADE_METAL_FIRM 2

#define CADE_TYPE_BOMB "взрывостойкую броню"
#define CADE_TYPE_MELEE "баллистическую броню"
#define CADE_TYPE_ACID "антикислотную броню"

#define CADE_UPGRADE_REQUIRED_SHEETS 2

/obj/structure/deployable_barricade/metal
	name = "металлическая баррикада"
	desc = "Прочная и легко монтируемая баррикада из металлических пластин, часто используемая для быстрого укрепления. Для ремонта необходим сварочный аппарат."
	icon_state = "metal_0"
	max_integrity = 250
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 80, "acid" = 40)
	stack_type = /obj/item/stack/sheet/iron
	stack_amount = 4
	destroyed_stack_amount = 2
	barricade_type = "metal"
	can_wire = TRUE

	layer = ABOVE_MOB_LAYER		// Закрывает космонавтика
	plane = GAME_PLANE_UPPER

	///Build state of the barricade
	var/build_state = BARRICADE_METAL_FIRM
	///The type of upgrade and corresponding overlay we have attached
	var/barricade_upgrade_type

/obj/structure/deployable_barricade/metal/update_overlays()
	. = ..()
	if(!barricade_upgrade_type)
		return
	var/damage_state
	var/percentage = (obj_integrity / max_integrity) * 100
	switch(percentage)
		if(-INFINITY to 25)
			damage_state = 3
		if(25 to 50)
			damage_state = 2
		if(50 to 75)
			damage_state = 1
		if(75 to INFINITY)
			damage_state = 0
	switch(barricade_upgrade_type)
		if(CADE_TYPE_BOMB)
			. += image('white/valtos/icons/barricade.dmi', icon_state = "+explosive_upgrade_[damage_state]")
		if(CADE_TYPE_MELEE)
			. += image('white/valtos/icons/barricade.dmi', icon_state = "+brute_upgrade_[damage_state]")
		if(CADE_TYPE_ACID)
			. += image('white/valtos/icons/barricade.dmi', icon_state = "+burn_upgrade_[damage_state]")


/obj/structure/deployable_barricade/metal/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/sheet/iron))
		var/obj/item/stack/sheet/iron/metal_sheets = I
		if(obj_integrity > max_integrity * 0.3)
			return attempt_barricade_upgrade(I, user, params)

		if(metal_sheets.get_amount() < 2)
			to_chat(user, span_warning("Для ремонта каркаса [skloname(src.name, RODITELNI, src.gender)] вам понадобится хотя бы два листа металла."))
			return FALSE

		visible_message(span_notice("[user] начинает ремонтировать каркас [skloname(src.name, RODITELNI, src.gender)]."))

		if(!do_after(user, 2 SECONDS, src) || obj_integrity >= max_integrity)
			return FALSE

		if(!metal_sheets.use(2))
			return FALSE

		repair_damage(max_integrity * 0.3)
		visible_message(span_notice("[user] производит ремонт каркаса [skloname(src.name, RODITELNI, src.gender)]."))

	else ..()


/obj/structure/deployable_barricade/metal/proc/attempt_barricade_upgrade(obj/item/stack/sheet/iron/metal_sheets, mob/user, params)
	if(barricade_upgrade_type)
		to_chat(user, span_warning("[src] уже улучшена."))
		return FALSE
	if(obj_integrity < max_integrity)
		to_chat(user, span_warning("Перед улучшением [skloname(src.name, RODITELNI, src.gender)], сначала вам необходимо полностью восстановить ее прочность."))
		return FALSE

	if(metal_sheets.get_amount() < CADE_UPGRADE_REQUIRED_SHEETS)
		to_chat(user, span_warning("Для ремонта каркаса [skloname(src.name, RODITELNI, src.gender)] вам понадобится хотя бы [CADE_UPGRADE_REQUIRED_SHEETS] листа металла."))
		return FALSE

	var/static/list/cade_types = list(CADE_TYPE_BOMB = image(icon = 'white/valtos/icons/barricade.dmi', icon_state = "explosive_obj"), CADE_TYPE_MELEE = image(icon = 'white/valtos/icons/barricade.dmi', icon_state = "brute_obj"), CADE_TYPE_ACID = image(icon = 'white/valtos/icons/barricade.dmi', icon_state = "burn_obj"))
	var/choice = show_radial_menu(user, src, cade_types, require_near = TRUE, tooltips = TRUE)

	user.visible_message(span_notice("[user] начинает присоединять [choice] к [skloname(src.name, DATELNI, src.gender)]."),
		span_notice("Начинаю присоединять [choice] к [skloname(src.name, DATELNI, src.gender)]."))
	if(!do_after(user, 2 SECONDS, src))
		return FALSE

	if(!metal_sheets.use(CADE_UPGRADE_REQUIRED_SHEETS))
		return FALSE

	switch(choice)
		if(CADE_TYPE_BOMB)
			armor = armor.modifyRating(bomb = 90)
		if(CADE_TYPE_MELEE)
			armor = armor.modifyRating(melee = 50, bullet = 50)
		if(CADE_TYPE_ACID)
			armor = armor.modifyRating(bio = 0, acid = 50)

	barricade_upgrade_type = choice

	user.visible_message(span_notice("[user] присоединил [choice] к [skloname(src.name, DATELNI, src.gender)]."),
		span_notice("Присоединяю [choice] к [skloname(src.name, DATELNI, src.gender)]."))

	playsound(loc, 'sound/items/screwdriver.ogg', 25, TRUE)
	update_icon()


/obj/structure/deployable_barricade/metal/examine(mob/user)
	. = ..()
	switch(build_state)
		if(BARRICADE_METAL_FIRM)
			to_chat(user, span_info("Защитная панель плотно привинчена на своем месте."))
		if(BARRICADE_METAL_ANCHORED)
			to_chat(user, span_info("Защитная панель снята, под ней заметны туго закрученные анкерные болты."))
		if(BARRICADE_METAL_LOOSE)
			to_chat(user, span_info("Защитная панель снята, а анкерные болты расслаблены. Баррикаду можно разобрать."))

	to_chat(user, span_info("Вижу [barricade_upgrade_type ? "[barricade_upgrade_type] на этой баррикаде" : ", что эта баррикада не улучшена"]."))

/obj/structure/deployable_barricade/metal/welder_act(mob/living/user, obj/item/I)

	var/obj/item/weldingtool/WT = I

	if(!WT.isOn())
		return FALSE

	if(obj_integrity <= max_integrity * 0.3)
		to_chat(user, span_warning("Кажется [src] получила слишком значительные повреждения и одной сваркой тут не обойтись, потребуется пара металлических листов."))
		return TRUE

	if(obj_integrity == max_integrity)
		to_chat(user, span_warning("[src] не нуждается в ремонте."))
		return TRUE

	user.visible_message(span_notice("[user] начинает заваривать пробоины в [skloname(src.name, DATELNI, src.gender)]."),
	span_notice("Начинаю заваривать пробоины в [skloname(src.name, DATELNI, src.gender)]."))
	playsound(loc, 'sound/items/welder2.ogg', 25, TRUE)

	if(!do_after(user, 5 SECONDS, src))
		return TRUE

	if(obj_integrity <= max_integrity * 0.3 || obj_integrity == max_integrity)
		return TRUE

	if(!WT.use(2))
		to_chat(user, span_warning("Вам не хватает сварочного топлива для ремонта."))
		return TRUE

	user.visible_message(span_notice("[user] заварил пробоины в [skloname(src.name, DATELNI, src.gender)]."),
	span_notice("Завариваю пробоины в [skloname(src.name, DATELNI, src.gender)]."))
	repair_damage(150)
	update_icon()
	playsound(loc, 'sound/items/welder2.ogg', 25, TRUE)
	return TRUE


/obj/structure/deployable_barricade/metal/screwdriver_act(mob/living/user, obj/item/I)
	switch(build_state)
		if(BARRICADE_METAL_ANCHORED) //Protection panel removed step. Screwdriver to put the panel back, wrench to unsecure the anchor bolts

			playsound(loc, 'sound/items/screwdriver.ogg', 25, TRUE)
			if(!do_after(user, 5 SECONDS, src))
				return TRUE

			user.visible_message(span_notice("[user] установил защитную панель [skloname(src.name, RODITELNI, src.gender)] на свое место."),
			span_notice("Установливаю защитную панель [skloname(src.name, RODITELNI, src.gender)] на свое место."))
			build_state = BARRICADE_METAL_FIRM
			return TRUE

		if(BARRICADE_METAL_FIRM) //Fully constructed step. Use screwdriver to remove the protection panels to reveal the bolts

			playsound(loc, 'sound/items/screwdriver.ogg', 25, TRUE)

			if(!do_after(user, 5 SECONDS, src))
				return TRUE

			user.visible_message(span_notice("[user] снимает защитную панель с [skloname(src.name, RODITELNI, src.gender)]."),
			span_notice("Снимаю защитную панель с [skloname(src.name, RODITELNI, src.gender)], за ней видны анкерные болты."))
			build_state = BARRICADE_METAL_ANCHORED
			return TRUE


/obj/structure/deployable_barricade/metal/wrench_act(mob/living/user, obj/item/I)
	switch(build_state)
		if(BARRICADE_METAL_ANCHORED) //Protection panel removed step. Screwdriver to put the panel back, wrench to unsecure the anchor bolts

			playsound(loc, 'sound/items/ratchet.ogg', 25, TRUE)
			if(!do_after(user, 5 SECONDS, src))
				return TRUE

			user.visible_message(span_notice("[user] расслабляет анкерные болты [skloname(src.name, RODITELNI, src.gender)]."),
			span_notice("Расслабляю анкерные болты [skloname(src.name, RODITELNI, src.gender)]."))
			build_state = BARRICADE_METAL_LOOSE
			anchored = FALSE
			modify_max_integrity(initial(max_integrity) * 0.5)
			update_icon() //unanchored changes layer
			return TRUE

		if(BARRICADE_METAL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing. Apply wrench to resecure anchor bolts

			var/turf/mystery_turf = get_turf(src)
			if(!isopenturf(mystery_turf))
				to_chat(user, span_warning("Невозможно установить баррикаду в данном месте!"))
				return TRUE

			for(var/obj/structure/deployable_barricade/B in loc)
				if(B != src && B.dir == dir)
					to_chat(user, span_warning("Здесь уже установлена другая баррикада."))
					return TRUE

			playsound(loc, 'sound/items/ratchet.ogg', 25, TRUE)
			if(!do_after(user, 5 SECONDS, src))
				return TRUE

			user.visible_message(span_notice("[user] затягивает анкерные болты [skloname(src.name, RODITELNI, src.gender)]."),
			span_notice("Затягиваю анкерные болты [skloname(src.name, RODITELNI, src.gender)]."))
			build_state = BARRICADE_METAL_ANCHORED
			anchored = TRUE
			modify_max_integrity(initial(max_integrity))
			update_icon() //unanchored changes layer
			return TRUE


/obj/structure/deployable_barricade/metal/crowbar_act(mob/living/user, obj/item/I)
	switch(build_state)
		if(BARRICADE_METAL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing. Apply wrench to resecure anchor bolts

			user.visible_message(span_notice("[user] начинает разбирать [skloname(src.name, VINITELNI, src.gender)]."),
			span_notice("Начинаю разбирать [skloname(src.name, VINITELNI, src.gender)]."))

			playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
			if(!do_after(user, 5 SECONDS, src))
				return TRUE

			user.visible_message(span_notice("[user] разбирает [skloname(src.name, VINITELNI, src.gender)]."),
			span_notice("Разбираю [skloname(src.name, VINITELNI, src.gender)]."))
			playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
			var/deconstructed = TRUE
			deconstruct(deconstructed)
			return TRUE
		if(BARRICADE_METAL_FIRM)

			if(!barricade_upgrade_type) //Check to see if we actually have upgrades to remove.
				to_chat(user, span_warning("У этой баррикады нет улучшений!"))
				return TRUE

			user.visible_message(span_notice("[user] начинает отсоединять бронепластины от [skloname(src.name, RODITELNI, src.gender)]."),
			span_notice("Начинаю отсоединять бронепластины от [skloname(src.name, RODITELNI, src.gender)]."))

			playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
			if(!do_after(user, 5 SECONDS, src))
				return TRUE

			user.visible_message(span_notice("[user] отсоединяет бронепластины от [skloname(src.name, RODITELNI, src.gender)]."),
			span_notice("Отсоединяю бронепластины от [skloname(src.name, RODITELNI, src.gender)]."))
			playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)

			switch(barricade_upgrade_type)
				if(CADE_TYPE_BOMB)
					armor = armor.modifyRating(bomb = -90)
				if(CADE_TYPE_MELEE)
					armor = armor.modifyRating(melee = -50, bullet = -50)
				if(CADE_TYPE_ACID)
					armor = armor.modifyRating(bio = 0, acid = -50)

			new /obj/item/stack/sheet/iron(loc, CADE_UPGRADE_REQUIRED_SHEETS)
			barricade_upgrade_type = null
			update_icon()
			return TRUE


/obj/structure/deployable_barricade/metal/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(rand(400, 600))
		if(EXPLODE_HEAVY)
			take_damage(rand(150, 350))
		if(EXPLODE_LIGHT)
			take_damage(rand(50, 100))

	update_icon()


#undef BARRICADE_METAL_LOOSE
#undef BARRICADE_METAL_ANCHORED
#undef BARRICADE_METAL_FIRM

/*----------------------*/
// PLASTEEL
/*----------------------*/

#define BARRICADE_PLASTEEL_LOOSE 0
#define BARRICADE_PLASTEEL_ANCHORED 1
#define BARRICADE_PLASTEEL_FIRM 2

/obj/structure/deployable_barricade/plasteel
	name = "баррикада из пластали"
	desc = "Прочнейшее защитное сооружение, заграждение может опускаться при необходимости. Ремонт производится при помощи сварочного аппарата."
	icon_state = "plasteel_closed_0"
	max_integrity = 500
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 80, "acid" = 40)
	stack_type = /obj/item/stack/sheet/plasteel
	stack_amount = 5
	destroyed_stack_amount = 2
	barricade_type = "plasteel"
	density = FALSE
	closed = TRUE
	can_wire = TRUE

	///What state is our barricade in for construction steps?
	var/build_state = BARRICADE_PLASTEEL_FIRM
	var/busy = FALSE //Standard busy check
	///ehther we react with other cades next to us ie when opening or so
	var/linked = FALSE
	COOLDOWN_DECLARE(tool_cooldown) //Delay to apply tools to prevent spamming

/obj/structure/deployable_barricade/plasteel/examine(mob/user)
	. = ..()

	switch(build_state)
		if(BARRICADE_PLASTEEL_FIRM)
			to_chat(user, span_info("Защитная панель плотно привинчена на своем месте."))
		if(BARRICADE_PLASTEEL_ANCHORED)
			to_chat(user, span_info("Защитная панель снята, под ней находятся туго закрученные анкерные болты."))
		if(BARRICADE_PLASTEEL_LOOSE)
			to_chat(user, span_info("Защитная панель снята, а анкерные болты расслаблены. Баррикаду можно разобрать."))


/obj/structure/deployable_barricade/plasteel/attackby(obj/item/I, mob/user, params)
	if(user.a_intent == INTENT_HELP)
		if(istype(I, /obj/item/stack/sheet/plasteel))
			var/obj/item/stack/sheet/plasteel/plasteel_sheets = I
			if(obj_integrity > max_integrity * 0.3)
				return

			if(plasteel_sheets.get_amount() < 2)
				to_chat(user, span_warning("Для ремонта каркаса [skloname(src.name, RODITELNI, src.gender)] вам понадобится хотя бы два листа пластали."))
				return

			visible_message(span_notice("[user] начинает ремонтировать каркас [skloname(src.name, RODITELNI, src.gender)]."))

			if(!do_after(user, 2 SECONDS, src) || obj_integrity >= max_integrity)
				return

			if(!plasteel_sheets.use(2))
				return

			repair_damage(max_integrity * 0.3)
			visible_message(span_notice("[user] производит ремонт каркаса [skloname(src.name, RODITELNI, src.gender)]."))
			return

		if(busy)
			return

		COOLDOWN_START(src, tool_cooldown, 1 SECONDS)

		if(istype(I, /obj/item/weldingtool))
			var/obj/item/weldingtool/WT = I

			if(obj_integrity <= max_integrity * 0.3)
				to_chat(user, span_warning("Кажется [src] получила слишком значительные повреждения и одной сваркой тут не обойтись, потребуется пара листов пластали."))
				return

			if(obj_integrity == max_integrity)
				to_chat(user, span_warning("[src] не нуждается в ремонте."))
				return

			if(!WT.use(0))
				return FALSE


			user.visible_message(span_notice("[user] начинает заваривать пробоины в [skloname(src.name, DATELNI, src.gender)]."),
			span_notice("Начинаю заваривать пробоины в [skloname(src.name, DATELNI, src.gender)]."))
			playsound(loc, 'sound/items/welder2.ogg', 25, 1)
			busy = TRUE

			if(!do_after(user, 50, src))
				busy = FALSE
				return

			busy = FALSE
			user.visible_message(span_notice("[user] заварил пробоины в [skloname(src.name, DATELNI, src.gender)]."),
			span_notice("Завариваю пробоины в [skloname(src.name, DATELNI, src.gender)]."))
			repair_damage(150)
			update_icon()
			playsound(loc, 'sound/items/welder2.ogg', 25, 1)


		switch(build_state)
			if(BARRICADE_PLASTEEL_FIRM) //Fully constructed step. Use screwdriver to remove the protection panels to reveal the bolts
				if(I.tool_behaviour == TOOL_SCREWDRIVER)

					for(var/obj/structure/deployable_barricade/B in loc)
						if(B != src && B.dir == dir)
							to_chat(user, span_warning("Здесь уже установлена другая баррикада."))
							return

					playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)
					if(!do_after(user, 5 SECONDS, src))
						return TRUE

					build_state = BARRICADE_PLASTEEL_ANCHORED
					user.visible_message(span_notice("[user] снимает защитную панель с [skloname(src.name, RODITELNI, src.gender)]."),
					span_notice("Снимаю защитную панель с [skloname(src.name, RODITELNI, src.gender)], за ней видны анкерные болты."))


				if(I.tool_behaviour == TOOL_CROWBAR)
					user.visible_message(span_notice(" [user] [linked ? "разъединяет" : "объединяет" ] [src] с соседними."), span_notice("[linked ? "Разъединяю" : "Объединяю" ] [src] с соседними."))
					if(!do_after(user, 5 SECONDS, src))
						return TRUE

					linked = !linked
					for(var/direction in GLOB.cardinals)
						for(var/obj/structure/deployable_barricade/plasteel/cade in get_step(src, direction))
							cade.update_icon()
					update_icon()


			if(BARRICADE_PLASTEEL_ANCHORED) //Protection panel removed step. Screwdriver to put the panel back, wrench to unsecure the anchor bolts
				if(I.tool_behaviour == TOOL_SCREWDRIVER)
					user.visible_message(span_notice("[user] установил защитную панель [skloname(src.name, RODITELNI, src.gender)] на свое место."),
					span_notice("Устанавляваю защитную панель [skloname(src.name, RODITELNI, src.gender)] на свое место."))
					playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)
					if(!do_after(user, 5 SECONDS, src))
						return TRUE

					build_state = BARRICADE_PLASTEEL_FIRM

				if(I.tool_behaviour == TOOL_WRENCH)
					user.visible_message(span_notice("[user] расслабляет анкерные болты [skloname(src.name, RODITELNI, src.gender)]."),
					span_notice("Расслабляю анкерные болты [skloname(src.name, RODITELNI, src.gender)]."))
					playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
					if(!do_after(user, 5 SECONDS, src))
						return TRUE

					anchored = FALSE
					modify_max_integrity(initial(max_integrity) * 0.5)
					build_state = BARRICADE_PLASTEEL_LOOSE
					update_icon() //unanchored changes layer

			if(BARRICADE_PLASTEEL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing. Apply wrench to rescure anchor bolts
				if(I.tool_behaviour == TOOL_WRENCH)

					var/turf/mystery_turf = get_turf(src)
					if(!isopenturf(mystery_turf))
						to_chat(user, span_warning("Невозможно установить баррикаду в данном месте!"))
						return

					user.visible_message(span_notice("[user] затягивает анкерные болты [skloname(src.name, RODITELNI, src.gender)]."),
					span_notice("Затягиваю анкерные болты [skloname(src.name, RODITELNI, src.gender)]."))
					playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
					if(!do_after(user, 5 SECONDS, src))
						return TRUE

					anchored = TRUE
					modify_max_integrity(initial(max_integrity))
					build_state = BARRICADE_PLASTEEL_ANCHORED
					update_icon() //unanchored changes layer

				if(I.tool_behaviour == TOOL_CROWBAR)
					user.visible_message(span_notice("[user] начинает разбирать [skloname(src.name, VINITELNI, src.gender)]."),
					span_notice("Начинаю разбирать [skloname(src.name, VINITELNI, src.gender)]."))
					playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
					busy = TRUE

					if(!do_after(user, 50, src))
						busy = FALSE
						return

					busy = FALSE
					user.visible_message(span_notice("[user] разбирает [skloname(src.name, VINITELNI, src.gender)]."),
					span_notice("Разбираю [skloname(src.name, VINITELNI, src.gender)]."))
					playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
					var/deconstructed = TRUE
					deconstruct(deconstructed)
	else ..()

/obj/structure/deployable_barricade/plasteel/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(do_after(user, 50, src))
		if(istype(src, /obj/structure/deployable_barricade/plasteel/rising))
			toggle_raise(null, user)
		else
			toggle_open(null, user)

/obj/structure/deployable_barricade/plasteel/proc/toggle_open(state, mob/living/user)
	if(state == closed)
		return
	playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
	closed = !closed
	density = !density

	user?.visible_message(span_notice("[user] [closed ? "закрывает" :"открывает"] [skloname(src.name, VINITELNI, src.gender)] ."),
		span_notice("[closed ? "Закрываю" :"Открываю"] [skloname(src.name, VINITELNI, src.gender)]."))

	if(!closed)
		src.layer = ABOVE_MOB_LAYER		// Закрывает космонавтика
		SET_PLANE(src, GAME_PLANE_UPPER, src)
	else
		src.layer = initial(src.layer)	//	Возвращение отображения к изначальным параметрам
		SET_PLANE(src, initial(plane), src)

	if(!linked)
		update_icon()
		return
	for(var/direction in GLOB.cardinals)
		for(var/obj/structure/deployable_barricade/plasteel/cade in get_step(src, direction))
			if(((dir & (NORTH|SOUTH) && get_dir(src, cade) & (EAST|WEST)) || (dir & (EAST|WEST) && get_dir(src, cade) & (NORTH|SOUTH))) && dir == cade.dir && cade.linked)
				cade.toggle_open(closed)

	update_icon()

// Подъем полноростового щита
/obj/structure/deployable_barricade/plasteel/proc/toggle_raise(state, mob/living/user)
	if(state == raise)
		return
	playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
	raise = !raise

	user?.visible_message(span_notice("[user] [raise ? "поднимает" :"опускает"] дополнительный щит баррикады."),
		span_notice("[raise ? "Поднимаю" :"Опускаю"] дополнительный щит баррикады."))

	update_icon()

/obj/structure/deployable_barricade/plasteel/update_overlays()
	. = ..()
	if(!linked)
		return
	for(var/direction in GLOB.cardinals)
		for(var/obj/structure/deployable_barricade/plasteel/cade in get_step(src, direction))
			if(((dir & (NORTH|SOUTH) && get_dir(src, cade) & (EAST|WEST)) || (dir & (EAST|WEST) && get_dir(src, cade) & (NORTH|SOUTH))) && dir == cade.dir && cade.linked && cade.closed == closed)
				. += image('white/valtos/icons/barricade.dmi', icon_state = "[barricade_type]_[closed ? "closed" : "open"]_connection_[get_dir(src, cade)]")

/obj/structure/deployable_barricade/plasteel/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(rand(450, 650))
		if(EXPLODE_HEAVY)
			take_damage(rand(200, 400))
		if(EXPLODE_LIGHT)
			take_damage(rand(50, 150))

	update_icon()

#undef BARRICADE_PLASTEEL_LOOSE
#undef BARRICADE_PLASTEEL_ANCHORED
#undef BARRICADE_PLASTEEL_FIRM

/*----------------------*/
// SANDBAGS
/*----------------------*/

/obj/structure/deployable_barricade/sandbags
	name = "баррикада из мешков с песком"
	desc = "На удивление эффективная преграда, добросовестно выполняющая свою задачу с 1914 года."
	icon_state = "sandbag_0"
	max_integrity = 300
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 80, "acid" = 40)
	stack_type = /obj/item/stack/sheet/mineral/sandbags
	barricade_type = "sandbag"
	can_wire = TRUE

	layer = ABOVE_MOB_LAYER		// Закрывает космонавтика
	plane = GAME_PLANE_UPPER


/obj/structure/deployable_barricade/sandbags/update_icon()
	. = ..()
	if(dir == SOUTH)
		pixel_y = -7
	else if(dir == NORTH)
		pixel_y = 7
	else
		pixel_y = 0


/obj/structure/deployable_barricade/sandbags/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/shovel/ET = I
		user.visible_message(span_notice("[user] начинает разбирать [src]."),
		span_notice("Начинаю разбирать [src]."))
		if(do_after(user, ET.toolspeed, src))
			user.visible_message(span_notice("[user] разбирает [src]."),
			span_notice("Разбираю [src]."))
			var/deconstructed = TRUE
			deconstruct(deconstructed)
		return TRUE

	if(istype(I, /obj/item/stack/sheet/mineral/sandbags) )
		if(obj_integrity == max_integrity)
			to_chat(user, span_warning("[src] не нуждается в починке!"))
			return
		var/obj/item/stack/sheet/mineral/sandbags/D = I
		if(D.get_amount() < 1)
			to_chat(user, span_warning("Вам необходимы новые мешки для ремонта [src]."))
			return
		visible_message(span_notice("[user] начинает заменять поврежденные мешки в [src]..."))

		if(!do_after(user, 30, src) || obj_integrity >= max_integrity)
			return

		if(!D.use(1))
			return

		repair_damage(max_integrity * 0.2) //Each sandbag restores 20% of max health as 5 sandbags = 1 sandbag barricade.
		user.visible_message(span_notice("[user] заменяет поврежденные мешки в [src], тем самым ремонтируя ее."),
		span_notice("Заменяю поврежденные мешки в [src], тем самым починив ее."))
		update_icon()
	else ..()

//An item thats meant to be a template for quickly deploying stuff like barricades
/obj/item/quikdeploy
	name = "К.У.Р.С.К"
	desc = "Компактный Универсальный Рубежный Саморазвертывающийся Комплекс. Незаменим для быстрой постройки укреплений."
	icon = 'white/valtos/icons/barricade.dmi'
	w_class = WEIGHT_CLASS_SMALL //While this is small, normal 50 stacks of metal is NORMAL so this is a bit on the bad space to cade ratio
	var/delay = 0 //Delay on deploying the thing
	var/atom/movable/thing_to_deploy = null
	var/atom/movable/side_thing_to_deploy = null
	var/turf/step_left = null
	var/turf/step_right = null

/obj/item/quikdeploy/examine(mob/user)
	. = ..()
	to_chat(user, "Этот К.У.Р.С.К подготовлен для развертывания [thing_to_deploy.name].")

/obj/item/quikdeploy/attack_self(mob/user)
	to_chat(user, "<span class='warning'>Начинаю развертывание комплекса перед собой...")
	if(!do_after(user, delay, user))
		to_chat(user, "<span class='warning'>Сейчас не время.")
		return
	if(can_place(user)) //can_place() handles sending the error and success messages to the user
//  Размещение центра
		var/obj/O = new thing_to_deploy(get_turf(user))
		O.setDir(user.dir)
//  Определение направления
		if(user.dir == NORTH)
			step_left = get_step(loc, WEST)
			step_right = get_step(loc, EAST)
		if(user.dir == EAST)
			step_left = get_step(loc, NORTH)
			step_right = get_step(loc, SOUTH)
		if(user.dir == SOUTH)
			step_left = get_step(loc, EAST)
			step_right = get_step(loc, WEST)
		if(user.dir == WEST)
			step_left = get_step(loc, SOUTH)
			step_right = get_step(loc, NORTH)
//  Размещение боковых
		if(!isclosedturf(step_left) && (!locate(/obj/structure/window || /obj/machinery/door/airlock || /obj/structure/deployable_barricade) in step_left.contents))
			var/obj/O1 = new side_thing_to_deploy(step_left)
			O1.setDir(user.dir)
		if(!isclosedturf(step_right) && (!locate(/obj/structure/window || /obj/machinery/door/airlock || /obj/structure/deployable_barricade) in step_right.contents))
			var/obj/O2 = new side_thing_to_deploy(step_right)
			O2.setDir(user.dir)

		playsound(loc, 'sound/items/ratchet.ogg', 25, TRUE)
		qdel(src)

/obj/item/quikdeploy/proc/can_place(mob/user)
	if(isnull(thing_to_deploy)) //Spaghetti or wrong type spawned
		to_chat(user, "<span class='warning'>Ничего не произошло, кажеться эта модель бракованная.")
		return FALSE
	return TRUE

/obj/item/quikdeploy/cade
	thing_to_deploy = /obj/structure/deployable_barricade/plasteel/rising
	side_thing_to_deploy = /obj/structure/deployable_barricade/plasteel/rising
	icon_state = "metal"
	delay = 2 SECONDS

/obj/item/quikdeploy/cade/can_place(mob/user)
	. = ..()
	if(!.)
		return FALSE

	var/turf/mystery_turf = user.loc
	if(!isopenturf(mystery_turf))
		to_chat(user, span_warning("Невозможно начать развертывание в данном месте!"))
		return FALSE

	var/turf/open/placement_loc = mystery_turf
	if(placement_loc.density) //We shouldn't be building here.
		to_chat(user, span_warning("Невозможно начать развертывание в данном месте!"))
		return FALSE

	for(var/obj/thing in user.loc)
		if(!thing.density) //not dense, move on
			continue
		if(!(thing.flags_1 & ON_BORDER_1)) //dense and non-directional, end
			to_chat(user, span_warning("Тут нет места для баррикады."))
			return FALSE
		if(thing.dir != user.dir)
			continue
		to_chat(user, span_warning("Тут нет места для баррикады."))
		return FALSE
	to_chat(user, "<span class='notice'>Подготавливаю комплекс для развертывания.")
	return TRUE

/obj/item/quikdeploy/cade/plasteel
	thing_to_deploy = /obj/structure/deployable_barricade/plasteel/reinforced
	side_thing_to_deploy = /obj/structure/deployable_barricade/metal/reinforced
	icon_state = "plasteel"

/obj/structure/deployable_barricade/plasteel/reinforced
	name = "военная складная баррикада"
	desc = "Прочнейшее защитное сооружение, заграждение может опускаться при необходимости. Ремонт производится при помощи сварочного аппарата."
	icon_state = "plasteel_closed_0"
	max_integrity = 1000
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 0, "bomb" = 50, "bio" = 100, "rad" = 0, "fire" = 100, "acid" = 40)

/obj/structure/deployable_barricade/plasteel/rising
	name = "военная раздвижная баррикада"
	desc = "Прочнейшее защитное сооружение, при необходимости можно поднять дополнительну бронепластину для защиты в полный рост, стрельба при этом становится невозможной. Ремонт производится при помощи сварочного аппарата."
	icon_state = "metal_0"
	max_integrity = 1000
	barricade_type = "rising"
	density = TRUE
	closed = FALSE
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 0, "bomb" = 50, "bio" = 100, "rad" = 0, "fire" = 100, "acid" = 40)

/obj/structure/deployable_barricade/metal/reinforced
	name = "военная металлическая баррикада"
	desc = "Прочнейшее защитное сооружение, при необходимости может быть укреплена дополнительными листами металла. Ремонт производится при помощи сварочного аппарата."
	icon_state = "metal_0"
	max_integrity = 1000
*/
