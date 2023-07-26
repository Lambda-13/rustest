GLOBAL_LIST_EMPTY(cargo_marks)
#define MAX_CARGO_MARKER 3

/obj/item/cargo_teleporter
	name = "телепортатор груза"
	desc = "Предмет, который может устанавливать определенное количество маркеров, позволяя им телепортировать предметы внутри метки к установленным маркерам."
	icon = 'lambda/sanecman/icons/obj/cargo_teleporter.dmi'
	icon_state = "cargo-off"
	///the list of markers spawned by this item
	var/list/marker_children = list()

	COOLDOWN_DECLARE(use_cooldown)

/obj/item/cargo_teleporter/examine(mob/user)
	. = ..()
	. += span_notice("<hr>Используй в руке для установки маркера.")
	. += span_notice("<hr>Альт-клик для удаления всех маркеров!")

/obj/item/cargo_teleporter/Destroy()
	if(length(marker_children))
		for(var/obj/effect/decal/cleanable/cargo_mark/destroy_children in marker_children)
			destroy_children.parent_item = null
			qdel(destroy_children)
	return ..()

/obj/item/cargo_teleporter/attack_self(mob/user, modifiers)
	if(length(marker_children) >= MAX_CARGO_MARKER)
		to_chat(user, span_warning("Максимум три маркера!"))
		return
	to_chat(user, span_notice("Устанавливаю маркер."))
	var/obj/effect/decal/cleanable/cargo_mark/spawned_marker = new /obj/effect/decal/cleanable/cargo_mark(get_turf(src))
	playsound(src, 'sound/machines/click.ogg', 50)
	spawned_marker.parent_item = src
	marker_children += spawned_marker

/obj/item/cargo_teleporter/AltClick(mob/living/victim, mob/living/user, params)
	. = ..()
	if(length(marker_children))
		for(var/obj/effect/decal/cleanable/cargo_mark/destroy_children in marker_children)
			qdel(destroy_children)

/obj/item/cargo_teleporter/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return ..()
	if(target == src)
		return ..()
	if(!COOLDOWN_FINISHED(src, use_cooldown))
		to_chat(user, span_warning("[capitalize(src.name)] перезаряжается!"))
		return
	var/choice = tgui_input_list(user, "К какой метке будем телепортировать груз?", "Выбор метки", GLOB.cargo_marks)
	if(!choice)
		return ..()
	if(get_dist(user, target) > 1)
		return
	var/turf/moving_turf = get_turf(choice)
	var/turf/target_turf = get_turf(target)
	for(var/check_content in target_turf.contents)
		if(isobserver(check_content))
			continue
		if(!ismovable(check_content))
			continue
		var/atom/movable/movable_content = check_content
		if(isliving(movable_content))
			to_chat(user, span_warning("Это существо!"))
			continue
		if(length(movable_content.get_all_contents_type(/mob/living)))
			to_chat(user, span_warning("Внутри есть существо!"))
			continue
		if(movable_content.anchored)
			to_chat(user, span_warning("Обьект прикручен!"))
			continue
		icon_state = "cargo-on"
		do_teleport(movable_content, moving_turf, asoundout = 'lambda/sanecman/sound/cargo_teleporter.ogg')
		icon_state = "cargo-off"
	new /obj/effect/decal/cleanable/ash(target_turf)
	COOLDOWN_START(src, use_cooldown, 8 SECONDS)

/datum/design/cargo_teleporter
	name = "Телепортатор груза"
	desc = "Замечательный предмет, который может устанавливать маркеры и телепортировать предметы на эти маркеры."
	id = "cargotele"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/cargo_teleporter
	materials = list(/datum/material/iron = 5000, /datum/material/plastic = 5000, /datum/material/uranium = 30000)
	category = list("initial","Tools","Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/obj/effect/decal/cleanable/cargo_mark
	name = "грузовая метка"
	desc = "Метка, оставленная грузовым телепортом, позволяющая телепортировать штуки по назначению. Может быть удалена грузовым телепортом."
	icon = 'lambda/sanecman/icons/obj/cargo_teleporter.dmi'
	icon_state = "marker"
	///the reference to the item that spawned the cargo mark
	var/obj/item/cargo_teleporter/parent_item

	light_range = 3
	light_color = COLOR_VIVID_YELLOW

/obj/effect/decal/cleanable/cargo_mark/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/cargo_teleporter))
		to_chat(user, span_notice("Удаляю [src] используя [W]."))
		playsound(src, 'sound/machines/click.ogg', 50)
		qdel(src)
		return
	return ..()

/obj/effect/decal/cleanable/cargo_mark/Destroy()
	if(parent_item)
		parent_item.marker_children -= src
	GLOB.cargo_marks -= src
	return ..()

/obj/effect/decal/cleanable/cargo_mark/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	var/area/src_area = get_area(src)
	name = "[src_area.name] #[rand(100000,999999)]"
	GLOB.cargo_marks += src
