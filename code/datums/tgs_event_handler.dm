/datum/tgs_event_handler/impl
	var/datum/timedevent/reattach_timer

/datum/tgs_event_handler/impl/HandleEvent(event_code, ...)
	switch(event_code)
		if(TGS_EVENT_REBOOT_MODE_CHANGE)
			var/list/reboot_mode_lookup = list ("[TGS_REBOOT_MODE_NORMAL]" = "обычного ребута", "[TGS_REBOOT_MODE_SHUTDOWN]" = "отключения", "[TGS_REBOOT_MODE_RESTART]" = "жёсткого рестарта")
			var/old_reboot_mode = args[2]
			var/new_reboot_mode = args[3]
			message_admins("ТГС: Сервер в конце раунда вместо [reboot_mode_lookup["[old_reboot_mode]"]] произведёт [reboot_mode_lookup["[new_reboot_mode]"]]")
		if(TGS_EVENT_PORT_SWAP)
			message_admins("ТГС: Смена порта с [world.port] на [args[2]]")
		if(TGS_EVENT_INSTANCE_RENAMED)
			message_admins("ТГС: Instance переименована с [world.TgsInstanceName()] на [args[2]]")
		if(TGS_EVENT_COMPILE_START)
			message_admins("TGS: Развертывание началось, новая версия поступает...")
		if(TGS_EVENT_COMPILE_CANCELLED)
			message_admins("ТГС: Развёртывание отменено!")
		if(TGS_EVENT_COMPILE_FAILURE)
			message_admins("ТГС: Ошибка развёртывания!")
		if(TGS_EVENT_DEPLOYMENT_COMPLETE)
			message_admins("ТГС: Развёртывание успешно!")
			to_chat(world, "<span class='boldannounce'>SERVER: Обновление получено и будет установлено со следующего раунда. [pick("Заебало бля говорить постоянно об этом", "Как же я устал повторять", "Надеюсь вы готовы к изменениям", "Возможно это обновление менее сломанное", "Отлично", "Больше кода, меньше багов", "Меньше кода, больше багов", "С каждым раундом всё лучше", "Класс", "Круто")].</span>")
		if(TGS_EVENT_WATCHDOG_DETACH)
			message_admins("ТГС перезапускается...")
			reattach_timer = addtimer(CALLBACK(src, .proc/LateOnReattach), 1 MINUTES)
		if(TGS_EVENT_WATCHDOG_REATTACH)
			var/datum/tgs_version/old_version = world.TgsVersion()
			var/datum/tgs_version/new_version = args[2]
			if(!old_version.Equals(new_version))
				to_chat(world, "<span class='boldannounce'>SERVER: ТГС обновлён до v[new_version.deprefixed_parameter]</span>")
			else
				message_admins("ТГС: Онлайн")
			if(reattach_timer)
				deltimer(reattach_timer)
				reattach_timer = null
		if(TGS_EVENT_WATCHDOG_SHUTDOWN)
			to_chat_immediate(world, "<span class='boldannounce'>SERVER: ОТКЛЮЧЕНИЕ!</span>")

/datum/tgs_event_handler/impl/proc/LateOnReattach()
	message_admins("Предупреждение: TGS не подавал сигналы серверу целую минуту! Есть проблема?")
