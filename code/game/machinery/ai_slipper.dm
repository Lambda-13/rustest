/obj/machinery/ai_slipper
	name = "пеномёт"
	desc = "Активируется удалённо для контроля зоны."
	icon = 'icons/obj/device.dmi'
	icon_state = "ai-slipper0"
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER
	plane = FLOOR_PLANE
	max_integrity = 200
	armor = list("melee" = 50, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)

	var/uses = 20
	var/cooldown = 0
	var/cooldown_time = 100
	req_access = list(ACCESS_AI_UPLOAD)

/obj/machinery/ai_slipper/examine(mob/user)
	. = ..()
	. += "<hr><span class='notice'>Внутри осталось <b>[uses]</b> зарядов.</span>"

/obj/machinery/ai_slipper/update_icon_state()
	. = ..()
	if(machine_stat & BROKEN)
		return
	if((machine_stat & NOPOWER) || cooldown_time > world.time || !uses)
		icon_state = "ai-slipper0"
	else
		icon_state = "ai-slipper1"

/obj/machinery/ai_slipper/interact(mob/user)
	if(!allowed(user))
		to_chat(user, span_danger("Доступ запрещён."))
		return
	if(!uses)
		to_chat(user, span_warning("[capitalize(src.name)] полностью разряжен!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, span_warning("[capitalize(src.name)] на перезарядке, осталось <b>[COOLDOWN_TIMELEFT(src, foam_cooldown)]</b>!"))
		return
	new /obj/effect/particle_effect/foam(loc)
	uses--
	cooldown = world.time + cooldown_time
	to_chat(user, span_notice("Активирую [src.name]. Внутри осталось <b>[uses]</b> зарядов."))
	power_change()
	addtimer(CALLBACK(src, PROC_REF(power_change)), cooldown_time)
