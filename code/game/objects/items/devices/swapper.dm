/obj/item/swapper
	name = "квантово-спиральный инвентер"
	desc = "Экспериментальное устройство, способное менять местами два объекта, меняя значения вращения их частиц. Должен быть связан с другим инвентером для работы."
	icon = 'icons/obj/device.dmi'
	icon_state = "swapper"
	item_state = "electronic"
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NOBLUDGEON
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'

	var/cooldown = 300
	var/next_use = 0
	var/obj/item/swapper/linked_swapper

/obj/item/swapper/Destroy()
	if(linked_swapper)
		linked_swapper.linked_swapper = null //*inception music*
		linked_swapper.update_icon()
		linked_swapper = null
	return ..()

/obj/item/swapper/update_icon_state()
	if(linked_swapper)
		icon_state = "swapper-linked"
	else
		icon_state = "swapper"

/obj/item/swapper/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/swapper))
		var/obj/item/swapper/other_swapper = I
		if(other_swapper.linked_swapper)
			to_chat(user, "<span class='warning'>[other_swapper] уже связан с другим инвентером. Разорвите текущую связь, чтобы установить новую.</span>")
			return
		if(linked_swapper)
			to_chat(user, "<span class='warning'>[src] уже связан с другим инвентером. Разорвите текущую связь, чтобы установить новую.</span>")
			return
		to_chat(user, "<span class='notice'>Соединяю инвентор с другим инвентером.</span>")
		linked_swapper = other_swapper
		other_swapper.linked_swapper = src
		update_icon()
		linked_swapper.update_icon()
	else
		return ..()

/obj/item/swapper/attack_self(mob/living/user)
	if(world.time < next_use)
		to_chat(user, "<span class='warning'>[src] перезаряжается.</span>")
		return
	if(QDELETED(linked_swapper))
		to_chat(user, "<span class='warning'>[src] не подключён к другому инвентеру.</span>")
		return
	playsound(src, 'sound/weapons/flash.ogg', 25, TRUE)
	to_chat(user, "<span class='notice'>Активирую [src].</span>")
	playsound(linked_swapper, 'sound/weapons/flash.ogg', 25, TRUE)
	if(ismob(linked_swapper.loc))
		var/mob/holder = linked_swapper.loc
		to_chat(holder, "<span class='notice'>[linked_swapper] начинает жужжать.</span>")
	next_use = world.time + cooldown //only the one used goes on cooldown
	addtimer(CALLBACK(src, .proc/swap, user), 25)

/obj/item/swapper/examine(mob/user)
	. = ..()
	if(world.time < next_use)
		. += "<hr><span class='warning'>Осталось до конца перезарядки: [DisplayTimeText(next_use - world.time)].</span>"
	if(linked_swapper)
		. += "<hr><span class='notice'><b>Подключён.</b> Alt-клик для разрыва связи.</span>"
	else
		. += "<hr><span class='notice'><b>Не подключён.</b> Подключи к другому инвентеру для работы.</span>"

/obj/item/swapper/AltClick(mob/living/user)
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	to_chat(user, "<span class='notice'>Разрываю квантовую связь.</span>")
	if(!QDELETED(linked_swapper))
		linked_swapper.linked_swapper = null
		linked_swapper.update_icon()
		linked_swapper = null
	update_icon()

//Gets the topmost teleportable container
/obj/item/swapper/proc/get_teleportable_container()
	var/atom/movable/teleportable = src
	while(ismovable(teleportable.loc))
		var/atom/movable/AM = teleportable.loc
		if(AM.anchored)
			break
		if(isliving(AM))
			var/mob/living/L = AM
			if(L.buckled)
				if(L.buckled.anchored)
					break
				else
					var/obj/buckled_obj = L.buckled
					buckled_obj.unbuckle_mob(L)
		teleportable = AM
	return teleportable

/obj/item/swapper/proc/swap(mob/user)
	if(QDELETED(linked_swapper) || world.time < linked_swapper.cooldown)
		return

	var/atom/movable/A = get_teleportable_container()
	var/atom/movable/B = linked_swapper.get_teleportable_container()
	var/target_A = A.drop_location()
	var/target_B = B.drop_location()

	//TODO: add a sound effect or visual effect
	if(do_teleport(A, target_B, channel = TELEPORT_CHANNEL_QUANTUM))
		do_teleport(B, target_A, channel = TELEPORT_CHANNEL_QUANTUM)
		if(ismob(B))
			var/mob/M = B
			to_chat(M, "<span class='warning'>[linked_swapper] активируется, но что-то идёт не так...</span>")
