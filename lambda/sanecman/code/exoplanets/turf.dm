//Код земли плиток пола короче всего того что есть на экзопланетах

/// Содержание: ///
/// * Покрытие планеты ///
/// * Жидкости ///
/// * Особенное покрытие ///

/// Покрытие планеты ///
//Пустынные пески
//По сути является кодом обычных песков пляжа с прикрученным атмосом пустыни
/*
/turf/open/floor/plating/asteroid/desert
	name = "песок"
	icon = 'icons/misc/beach.dmi'
	icon_state = "sand"
	base_icon_state = "sand"
	baseturfs = /turf/open/floor/plating/asteroid/desert
	initial_gas_mix = EXOPLANET_DESERT_ATMOS
	digResult = /obj/item/stack/ore/glass
	planetary_atmos = TRUE
	digResult = /obj/item/stack/ore/glass/beach

/turf/open/floor/plating/asteroid/desert/Initialize(mapload, inherited_virtual_z)
	. = ..()
	icon_state = "[base_icon_state]"

/turf/open/floor/plating/asteroid/desert/lit
	light_range = 2
	light_power = 0.80
	light_color = LIGHT_COLOR_TUNGSTEN

/turf/open/floor/plating/asteroid/desert/dense
	icon_state = "light_sand"
	planetary_atmos = TRUE
	base_icon_state = "light_sand"

/turf/open/floor/plating/asteroid/desert/dense/lit
	light_range = 2
	light_power = 0.80
	light_color = LIGHT_COLOR_TUNGSTEN

//Ice
/turf/simulated/floor/exoplanet/ice
	name = "ice"
	icon = 'icons/turf/snow.dmi'
	icon_state = "ice"

/turf/simulated/floor/exoplanet/ice/on_update_icon()
	return

//Snow
/turf/simulated/floor/exoplanet/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
	dirt_color = "#e3e7e8"
	footstep_type = /decl/footsteps/snow

/turf/simulated/floor/exoplanet/snow/Initialize()
	. = ..()
	icon_state = pick("snow[rand(1,12)]","snow0")

/turf/simulated/floor/exoplanet/snow/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	melt()

/turf/simulated/floor/exoplanet/snow/melt()
	SetName("permafrost")
	icon_state = "permafrost"
	footstep_type = /decl/footsteps/asteroid

//Grass
/turf/simulated/floor/exoplanet/grass
	name = "grass"
	icon = 'icons/turf/jungle.dmi'
	icon_state = "greygrass"
	color = "#799c4b"
	footstep_type = /decl/footsteps/grass

/turf/simulated/floor/exoplanet/grass/Initialize()
	. = ..()
	if(GLOB.using_map.use_overmap)
		var/obj/effect/overmap/visitable/sector/exoplanet/E = map_sectors["[z]"]
		if(istype(E) && E.grass_color)
			color = E.grass_color
	if(!resources)
		resources = list()
	if(prob(70))
		resources[MATERIAL_GRAPHITE] = rand(3,5)
	if(prob(5))
		resources[MATERIAL_URANIUM] = rand(1,3)
	if(prob(2))
		resources[MATERIAL_DIAMOND] = 1

/turf/simulated/floor/exoplanet/grass/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if((temperature > T0C + 200 && prob(5)) || temperature > T0C + 1000)
		melt()

/turf/simulated/floor/exoplanet/grass/melt()
	SetName("scorched ground")
	icon_state = "scorched"
	footstep_type = /decl/footsteps/asteroid
	color = null
*/
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////

/// Жидкости ///
//Добавить сюда хлорную воду и тёмную воду

///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////
///////////////////// УДАЛИТЬ ДАННЫЙ КОММЕНТАРИЙ ПОСЛЕ ПОЛНОЙ ДОРАБОТКИ /////////////////////

/// Особенное покрытие ///
/*
//Concrete
/turf/simulated/floor/exoplanet/concrete
	name = "concrete"
	desc = "Stone-like artificial material."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_state = "concrete"

/turf/simulated/floor/exoplanet/concrete/on_update_icon()
	overlays.Cut()
	if(burnt)
		overlays |= get_damage_overlay("burned[(x + y) % 3]", BLEND_MULTIPLY)
	if(broken)
		overlays |= get_damage_overlay("broken[(x + y) % 5]", BLEND_MULTIPLY)

/turf/simulated/floor/exoplanet/concrete/melt()
	burnt = TRUE
	update_icon()
*/
//Зыпучий песок
/*
/obj/effect/quicksand
	name = "quicksand"
	desc = "There is no candy at the bottom."
	icon = 'icons/obj/quicksand.dmi'
	icon_state = "intact0"
	density = FALSE
	anchored = TRUE
	can_buckle = TRUE
	buckle_dir = SOUTH
	var/exposed = FALSE
	var/busy

/obj/effect/quicksand/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	appearance = T.appearance

/obj/effect/quicksand/user_unbuckle_mob(mob/user)
	if(buckled_mob && !user.stat && !user.restrained())
		if(busy)
			to_chat(user, SPAN_NOTICE("\The [buckled_mob] is already getting out, be patient."))
			return
		var/delay = 60
		if(user == buckled_mob)
			delay *=2
			user.visible_message(
				SPAN_NOTICE("\The [user] tries to climb out of \the [src]."),
				SPAN_NOTICE("You begin to pull yourself out of \the [src]."),
				SPAN_NOTICE("You hear water sloshing.")
				)
		else
			user.visible_message(
				SPAN_NOTICE("\The [user] begins pulling \the [buckled_mob] out of \the [src]."),
				SPAN_NOTICE("You begin to pull \the [buckled_mob] out of \the [src]."),
				SPAN_NOTICE("You hear water sloshing.")
				)
		busy = TRUE
		if(do_after(user, delay, src))
			busy = FALSE
			if(user == buckled_mob)
				if(prob(80))
					to_chat(user, SPAN_WARNING("You slip and fail to get out!"))
					return
				user.visible_message(SPAN_NOTICE("\The [buckled_mob] pulls himself out of \the [src]."))
			else
				user.visible_message(SPAN_NOTICE("\The [buckled_mob] has been freed from \the [src] by \the [user]."))
			unbuckle_mob()
		else
			busy = FALSE
			to_chat(user, SPAN_WARNING("You slip and fail to get out!"))
			return

/obj/effect/quicksand/unbuckle_mob()
	..()
	update_icon()

/obj/effect/quicksand/buckle_mob(var/mob/L)
	..()
	update_icon()

/obj/effect/quicksand/on_update_icon()
	if(!exposed)
		return
	icon_state = "open"
	overlays.Cut()
	if(buckled_mob)
		overlays += image(icon,icon_state="overlay",layer=ABOVE_HUMAN_LAYER)

/obj/effect/quicksand/proc/expose()
	if(exposed)
		return
	visible_message(SPAN_WARNING("The upper crust breaks, exposing the treacherous quicksand underneath!"))
	SetName(initial(name))
	desc = initial(desc)
	icon = initial(icon)
	exposed = 1
	update_icon()

/obj/effect/quicksand/attackby(obj/item/W, mob/user)
	if(!exposed && W.force)
		expose()
	else
		..()

/obj/effect/quicksand/Crossed(var/atom/movable/AM)
	if(isliving(AM))
		var/mob/living/L = AM
		if(L.throwing || L.can_overcome_gravity())
			return
		buckle_mob(L)
		if(!exposed)
			expose()
		to_chat(L, SPAN_DANGER("You fall into \the [src]!"))
*/
