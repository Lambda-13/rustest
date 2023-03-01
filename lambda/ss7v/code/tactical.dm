/obj/item/tank/internals/tactical
	name = "Тактический кислородный баллон"
	desc = "Кислородный баллон военно-космического назначения. Конструкция весьма массивна и может быть закреплена только на скафандрах и тяжелой верхней одежде. Представляет собой систему магнитных креплений и стабилизирующих ремней для фиксации большинства стандартных видов вооружения. В комплект также входит универсальный оружейный кейс для нестандартных образцов."
	icon = 'lambda/ss7v/icons/tank_tactical.dmi'
	mob_overlay_icon = 'lambda/ss7v/icons/tank_tactical_back.dmi'
	icon_state = "tank"
	mob_overlay_state = "empty" //отвечает за спрайт персонажа
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE
	force = 15
	w_class = WEIGHT_CLASS_BULKY
	equip_sound = 'sound/items/equip/toolbelt_equip.ogg'
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen)
	var/static/list/holdable_weapons_list = list(
		/obj/item/kinetic_crusher = "crusher",
		/obj/item/gun/ballistic/shotgun/automatic/combat = "auto_shotgun",
		/obj/item/gun/ballistic/shotgun/riot = "shotgun",
		/obj/item/gun/ballistic/shotgun/doublebarrel = "doublebarrel",
		/obj/item/gun/grenadelauncher = "grenadelauncher",
		/obj/item/gun/ballistic/automatic/pistol = "pistol",
		/obj/item/gun/ballistic/rocketlauncher = "rocket",
		/obj/item/gun/ballistic/shotgun/bulldog = "bulldog",
		/obj/item/gun/energy/kinetic_accelerator = "kinetic",
		/obj/item/gun/energy/laser = "laser",
		/obj/item/gun/energy/laser/captain = "cap",
		/obj/item/gun/energy/e_gun = "egun",
		/obj/item/gun/energy/e_gun/hos = "hos",
		/obj/item/gun/energy/e_gun/stun = "egun_taser",
		/obj/item/gun/energy/xray = "xray",
		/obj/item/gun/energy/e_gun/mini = "pistol",
		/obj/item/gun/energy/pulse = "pulse",
		/obj/item/gun/energy/pulse/pistol = "pistol",
	)

/obj/item/tank/internals/tactical/Initialize(mapload)
	. = ..()
	create_storage(type = /datum/storage)

//Наполнение баллона воздухом (стандарт)
/obj/item/tank/internals/tactical/populate_gas()
	air_contents.set_moles(GAS_O2, (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))


//Параметры кармана
/datum/storage
	max_slots = 1
	max_specific_storage = WEIGHT_CLASS_BULKY
	rustle_sound = FALSE
	attack_hand_interact = TRUE

//Тип хранимого
/datum/storage/New(atom/parent, max_slots, max_specific_storage, max_total_storage, numerical_stacking, allow_quick_gather, allow_quick_empty, collection_mode, attack_hand_interact)
	. = ..()
	set_holdable(list(
		/obj/item/gun/ballistic,
		/obj/item/gun/energy,
		/obj/item/kinetic_crusher,
		/obj/item/gun/grenadelauncher
	))

//Быстрое извлечение через altclick, быстрое разоружение через "E" тут code\modules\mob\inventory.dm
/obj/item/tank/internals/tactical/AltClick(mob/user)
	if(length(contents))
		var/obj/item/I = contents[1]
		user.visible_message(span_notice("[user] достаёт [I] из [src]."), span_notice("Достаю [I] из [src]."))
		user.put_in_hands(I)
		update_appearance()
		user.update_inv_s_store()
	else
		to_chat(user, span_warning("Крепления расстегнуты, [capitalize(src.name)] пуст."))

	return ..()

//Изменение картинки в зависимости от содержания
/obj/item/tank/internals/tactical/update_icon_state()
	icon_state = initial(icon_state)
	mob_overlay_state = initial(mob_overlay_state)
	if(!length(contents))
		cut_overlays()
		return ..()
	var/obj/item/I = contents[1]
	mob_overlay_state = "full"
	playsound(I, 'sound/items/equip/toolbelt_equip.ogg', 25, TRUE)

	if(I.type in holdable_weapons_list)
		icon_state = holdable_weapons_list[I.type]
	else
		var/mutable_appearance/gun_overlay = mutable_appearance(I.icon, I.icon_state)
		var/matrix/M = matrix()
		M.Turn(-90)
		M.Translate(-4, 0)
		gun_overlay.transform = M
		add_overlay(gun_overlay)
		icon_state = "box"

	return ..()

/obj/item/tank/internals/tactical/empty
/obj/item/tank/internals/tactical/empty/populate_gas()
	air_contents.set_moles(0)

