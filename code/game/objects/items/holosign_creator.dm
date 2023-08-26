/obj/item/holosign_creator
	name = "голопроектор уборщика"
	desc = "Удобный голографический проектор, который отображает предупреждение о скользком поле."
	icon = 'icons/obj/device.dmi'
	icon_state = "signmaker"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	force = 0
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	item_flags = NOBLUDGEON
	var/list/signs
	var/max_signs = 10
	var/creation_time = 0 //time to create a holosign in deciseconds.
	var/holosign_type = /obj/structure/holosign/wetsign
	var/holocreator_busy = FALSE //to prevent placing multiple holo barriers at once

/obj/item/holosign_creator/afterattack(atom/target, mob/user, flag)
	. = ..()
	if(flag)
		if(!check_allowed_items(target, 1))
			return
		var/turf/T = get_turf(target)
		var/obj/structure/holosign/H = locate(holosign_type) in T
		if(H)
			to_chat(user, "<span class='notice'>You use [src] to deactivate [H].</span>")
			qdel(H)
		else
			if(!T.is_blocked_turf(TRUE)) //can't put holograms on a tile that has dense stuff
				if(holocreator_busy)
					to_chat(user, "<span class='notice'>[src] is busy creating a hologram.</span>")
					return
				if(signs.len < max_signs)
					playsound(src.loc, 'sound/machines/click.ogg', 20, TRUE)
					if(creation_time)
						holocreator_busy = TRUE
						if(!do_after(user, creation_time, target = target))
							holocreator_busy = FALSE
							return
						holocreator_busy = FALSE
						if(signs.len >= max_signs)
							return
						if(T.is_blocked_turf(TRUE)) //don't try to sneak dense stuff on our tile during the wait.
							return
					H = new holosign_type(get_turf(target), src)
					to_chat(user, "<span class='notice'>You create \a [H] with [src].</span>")
				else
					to_chat(user, "<span class='notice'>[src] is projecting at max capacity!</span>")

/obj/item/holosign_creator/attack(mob/living/carbon/human/M, mob/user)
	return

/obj/item/holosign_creator/attack_self(mob/user)
	if(signs.len)
		for(var/H in signs)
			qdel(H)
		to_chat(user, "<span class='notice'>You clear all active holograms.</span>")

/obj/item/holosign_creator/janibarrier
	name = "модернизированный голопроектор уборщика"
	desc = "Удобный голографический проектор, который отображает предупреждение о скользком поле. Так же блокирует передвижение невнимательных прохожих."
	holosign_type = /obj/structure/holosign/barrier/wetsign
	creation_time = 20
	max_signs = 12

/obj/item/holosign_creator/security
	name = "голопроектор СБ"
	desc = "Голографический проектор, создающий голографические защитные барьеры."
	icon_state = "signmaker_sec"
	holosign_type = /obj/structure/holosign/barrier
	creation_time = 30
	max_signs = 6

/obj/item/holosign_creator/engineering
	name = "инженерный голопроектор"
	desc = "Голографический проектор, который создает голографические инженерные барьеры. Зачастую устанавливаются перед зонами техногенной опасности. Препятствуют распространению радиации."
	icon_state = "signmaker_engi"
	holosign_type = /obj/structure/holosign/barrier/engineering
	creation_time = 30
	max_signs = 6

/obj/item/holosign_creator/atmos
	name = "голопроектор АТМОСа"
	desc = "Голографический проектор, создающий барьеры, препятствующие прохождению газов, но не людей."
	icon_state = "signmaker_atmos"
	holosign_type = /obj/structure/holosign/barrier/atmos
	creation_time = 0
	max_signs = 6

/obj/item/holosign_creator/medical
	name = "медицинский голопроектор PENLITE"
	desc = "Создает барьер который блокирует проход пациентам с опасными заболеваниями. Используется для контроля эпидемий."
	icon_state = "signmaker_med"
	holosign_type = /obj/structure/holosign/barrier/medical
	creation_time = 30
	max_signs = 3

/obj/item/holosign_creator/cyborg
	name = "Energy Barrier Projector"
	desc = "A holographic projector that creates fragile energy fields."
	creation_time = 15
	max_signs = 9
	holosign_type = /obj/structure/holosign/barrier/cyborg
	var/shock = 0

/obj/item/holosign_creator/cyborg/attack_self(mob/user)
	if(iscyborg(user))
		var/mob/living/silicon/robot/R = user

		if(shock)
			to_chat(user, "<span class='notice'>You clear all active holograms, and reset your projector to normal.</span>")
			holosign_type = /obj/structure/holosign/barrier/cyborg
			creation_time = 5
			if(signs.len)
				for(var/H in signs)
					qdel(H)
			shock = 0
			return
		else if(R.emagged&&!shock)
			to_chat(user, "<span class='warning'>You clear all active holograms, and overload your energy projector!</span>")
			holosign_type = /obj/structure/holosign/barrier/cyborg/hacked
			creation_time = 30
			if(signs.len)
				for(var/H in signs)
					qdel(H)
			shock = 1
			return
		else
			if(signs.len)
				for(var/H in signs)
					qdel(H)
				to_chat(user, "<span class='notice'>You clear all active holograms.</span>")
	if(signs.len)
		for(var/H in signs)
			qdel(H)
		to_chat(user, "<span class='notice'>You clear all active holograms.</span>")

/obj/item/holosign_creator/janibarrier/infinite
	holosign_type = /obj/structure/holosign/barrier/wetsign/infinite

/obj/item/holosign_creator/security/infinite
	holosign_type = /obj/structure/holosign/barrier/infinite

/obj/item/holosign_creator/engineering/infinite
	holosign_type = /obj/structure/holosign/barrier/engineering/infinite

/obj/item/holosign_creator/atmos/infinite
	holosign_type = /obj/structure/holosign/barrier/atmos/infinite

/obj/item/holosign_creator/medical/infinite
	holosign_type = /obj/structure/holosign/barrier/medical/infinite

/obj/item/holosign_creator/cyborg/infinite
	holosign_type = /obj/structure/holosign/barrier/cyborg/infinite
