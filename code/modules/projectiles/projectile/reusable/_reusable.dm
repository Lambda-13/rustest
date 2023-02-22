/obj/projectile/bullet/reusable
	name = "многоразовая пуля"
	desc = "И как ты вообще собираешься повторно использовать пулю?"
	var/ammo_type = /obj/item/ammo_casing/caseless
	var/dropped = FALSE
	impact_effect_type = null

/obj/projectile/bullet/reusable/on_hit(atom/target, blocked = FALSE)
	. = ..()
	handle_drop()

/obj/projectile/bullet/reusable/on_range()
	handle_drop()
	..()

/obj/projectile/bullet/reusable/proc/handle_drop()
	if(!dropped)
		var/turf/T = get_turf(src)
		new ammo_type(T)
		dropped = TRUE
