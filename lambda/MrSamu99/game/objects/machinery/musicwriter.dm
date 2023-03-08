/obj/item/card/data/music
	icon_state = "data_3"
	var/datum/track/track
	var/uploader_ckey

/obj/machinery/musicwriter
	name = "записыватель мозговых импульсов МК-3"
	desc = "Может быть перезапущен с использованием мультитула."
	icon = 'lambda/MrSamu99/icons/musicconsole.dmi'
	icon_state = "off"
	var/coin = 1
	var/mob/retard //current user
	var/writing = 0

/obj/machinery/musicwriter/examine(mob/user)
	. = ..()
	if(writing)
		. += span_notice("Можно перезагрузить <b>мультитулом</b>.")

/obj/machinery/musicwriter/attackby(obj/item/I, mob/user)
	if(default_unfasten_wrench(user, I))
		return
	if(istype(I, /obj/item/coin))
		user.dropItemToGround(I)
		qdel(I)
		coin++
		return

/obj/machinery/musicwriter/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	if(writing && do_after(user, 5 SECONDS, src))
		writing = 0
		to_chat(user,span_warning("Перезагружаю систему мультулом."))
		icon_state = "off"
		retard = null

/obj/machinery/musicwriter/ui_interact(mob/user)
	if (!anchored)
		to_chat(user,span_warning("Надо бы прикрутить!"))
		return
	if(!allowed(user))
		to_chat(user,span_warning("Ошибка! Нет доступа."))
		user.playsound_local(src,'sound/misc/compiler-failure.ogg', 25, 1)
		return
	if(writing)
		say("Записываем мозги [retard.name]... Подождите!")
		return
	if(!coin)
		say("Вставьте монетку.")
		return
	write(user)

/obj/machinery/musicwriter/proc/write(mob/user)
	if(!writing && !retard && coin)
		icon_state = "on"
		writing = TRUE
		retard = user
		var/N = sanitize(input("Название") as text|null)
		to_chat(user,span_warning("Надо бы прикрутить!"))
		if(N)
			var/sound/S = input("Файл") as sound|null
			if(S)
				var/datum/track/T = new()
				var/obj/item/card/data/music/disk = new(src)
				T.song_path = S
				T.song_name = N
				disk.track = T
				disk.name = "диск ([N])"
				disk.forceMove(get_turf(src))
				disk.uploader_ckey = retard.ckey
				message_admins("[ADMIN_LOOKUPFLW(user)] uploaded <A HREF='?_src_=holder;listensound=\ref[S]'>sound</A> named as [N]. <A HREF='?_src_=holder;wipedata=\ref[disk]'>Wipe</A> data.")
				coin--

		icon_state = "off"
		writing = FALSE
		retard = null
