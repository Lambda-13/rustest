#define BUY_MINIMUM_AGE 3

/datum/ship_select

/datum/ship_select/ui_state(mob/user)
	return GLOB.always_state

/datum/ship_select/ui_status(mob/user, datum/ui_state/state)
	return isnewplayer(user) ? UI_INTERACTIVE : UI_CLOSE

/datum/ship_select/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "ShipSelect")
		ui.open()

/datum/ship_select/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	if(!isnewplayer(usr))
		return
	var/mob/dead/new_player/spawnee = usr
	switch(action)
		if("join")
			var/datum/overmap/ship/controlled/target = locate(params["ship"]) in SSovermap.controlled_ships
			if(!target)
				to_chat(spawnee, "<span class='danger'>Судно потерялось в гиперпространстве, свяжитесь с администрацией!</span>")
				spawnee.new_player_panel()
				return
			if(!target.is_join_option())
				to_chat(spawnee, "<span class='danger'>Данное судно не принимает новых игроков!</span>")
				spawnee.new_player_panel()
				return

			var/did_application = FALSE
			if(target.join_mode == SHIP_JOIN_MODE_APPLY)
				var/datum/ship_application/current_application = target.get_application(spawnee)
				if(isnull(current_application))
					var/datum/ship_application/app = new(spawnee, target)
					if(app.get_user_response())
						to_chat(spawnee, "<span class='notice'>Заявка отправлена. Ты будешь уведомлён когда твою заявку примут.</span>")
					else
						to_chat(spawnee, "<span class='notice'>Заяка отменена, или произошла ошибка при подаче или рассмотрении заявки.</span>")
					return
				switch(current_application.status)
					if(SHIP_APPLICATION_ACCEPTED)
						to_chat(spawnee, "<span class='notice'>Ваша заявка на вступление принята! Ожидайте...</span>")
					if(SHIP_APPLICATION_PENDING)
						alert(spawnee, "У тебя уже есть действующая заявка!")
						return
					if(SHIP_APPLICATION_DENIED)
						alert(spawnee, "Твою заявку отклонили.")
						return
				did_application = TRUE

			if(target.join_mode == SHIP_JOIN_MODE_CLOSED || (target.join_mode == SHIP_JOIN_MODE_APPLY && !did_application))
				to_chat(spawnee, "<span class='warning'>Режим присоединения изменился!</span>")
				return

			ui.close()
			var/datum/job/selected_job = locate(params["job"]) in target.job_slots
			// Attempts the spawn itself. This checks for playtime requirements.
			if(!spawnee.AttemptLateSpawn(selected_job, target))
				to_chat(spawnee, "<span class='danger'>Не могу войти на судно как экипаж!</span>")
				spawnee.new_player_panel()

		if("buy")
			if(is_banned_from(spawnee.ckey, "Ship Purchasing"))
				to_chat(spawnee, "<span class='danger'>You are banned from purchasing ships!</span>")
				spawnee.new_player_panel()
				ui.close()
				return

//Старый ака ЛЯМБДОВСКИЙ способ оградить набегаторов от спама кораблями
//			if(spawnee.client.holder == null && spawnee.client.player_age < BUY_MINIMUM_AGE)
//				to_chat(spawnee, "<span class='danger'>Тебе ещё рано иметь лицензию на владение кораблём, возращайся к покупке через [BUY_MINIMUM_AGE - spawnee.client.player_age] дней.</span>")
//				spawnee.new_player_panel()
//				return
			var/datum/map_template/shuttle/template = SSmapping.ship_purchase_list[params["name"]]
			if(!SSovermap.player_ship_spawn_allowed())
				to_chat(spawnee, "<span class='danger'>No more ships may be spawned at this time!</span>")
				return
			if(!template.enabled)
				to_chat(spawnee, "<span class='danger'>Это судно в настоящее время недоступен для покупки!</span>")
				return
			if(!template.has_ship_spawn_playtime(spawnee.client)) // Да похуй что будут конфликты в будущем, верно?
				to_chat(spawnee, "<span class='danger'>У тебя мало времени на сервере - ты не можешь купить этот корабль!</span>")
				return

			var/num_ships_with_template = 0
			for(var/datum/overmap/ship/controlled/Ship as anything in SSovermap.controlled_ships)
				if(template == Ship.source_template)
					num_ships_with_template += 1
			if(num_ships_with_template >= template.limit)
				to_chat(spawnee, "<span class='danger'>Превышен лимит выбранного вами судна! Текущий лимит (кораблей в секторе): [num_ships_with_template].</span>")
				return

			ui.close()

			to_chat(spawnee, "<span class='danger'>Ваш [template.name] заправляется. Подождите немного!</span>")
			var/datum/overmap/ship/controlled/target = SSovermap.spawn_ship_at_start(template)
			if(!target?.shuttle_port)
				to_chat(spawnee, "<span class='danger'>Судно потерялось в глубинах космоса, свяжитесь с администрацией.</span>")
				spawnee.new_player_panel()
				return
			SSblackbox.record_feedback("tally", "ship_purchased", 1, template.name) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
			// Try to spawn as the first listed job in the job slots (usually captain)
			// Playtime checks are overridden, to ensure the player gets to join the ship they spawned.
			if(!spawnee.AttemptLateSpawn(target.job_slots[1], target, FALSE))
				to_chat(spawnee, "<span class='danger'>Судно появилось, но ты нет. Попытайся зайти на судно обычным способом или обратитись к администратору.</span>")
				spawnee.new_player_panel()

/datum/ship_select/ui_static_data(mob/user)
	// tracks the number of existing ships of each template type so that their unavailability for purchase can be communicated to the user
	var/list/template_num_lookup = list()

	. = list()
	.["ships"] = list()
	.["shipSpawnAllowed"] = SSovermap.player_ship_spawn_allowed()
	.["purchaseBanned"] = is_banned_from(user.ckey, "Ship Purchasing")
	.["playMin"] = user.client ? user.client.get_exp_living(TRUE) : 0

	for(var/datum/overmap/ship/controlled/S as anything in SSovermap.controlled_ships)
		if(S.source_template)
			if(!template_num_lookup[S.source_template])
				template_num_lookup[S.source_template] = 1
			else
				template_num_lookup[S.source_template] += 1
		if(!S.is_join_option())
			continue

		var/list/ship_jobs = list()
		for(var/datum/job/job as anything in S.job_slots)
			var/slots = S.job_slots[job]
			if(slots <= 0)
				continue
			ship_jobs += list(list(
				"name" = job,
				"slots" = slots,
				"minTime" = job.officer ? S.source_template.get_req_officer_minutes() : 0,
				"ref" = REF(job),
			))

		var/list/ship_data = list(
			"name" = S.name,
			"class" = S.source_template.short_name,
			"desc" = S.source_template.description,
			"tags" = S.source_template.tags,
			"memo" = S.memo,
			"jobs" = ship_jobs,
			"manifest" = S.manifest,
			"joinMode" = S.join_mode,
			"ref" = REF(S)
		)

		.["ships"] += list(ship_data)

	.["templates"] = list()
	for(var/template_name as anything in SSmapping.ship_purchase_list)
		var/datum/map_template/shuttle/T = SSmapping.ship_purchase_list[template_name]
		if(!T.enabled)
			continue
		var/list/ship_data = list(
			"name" = T.name,
			"desc" = T.description,
			"tags" = T.tags,
			"crewCount" = length(T.job_slots),
			"limit" = T.limit,
			"curNum" = template_num_lookup[T] || 0,
			"minTime" = T.get_req_spawn_minutes(),
		)
		.["templates"] += list(ship_data)
		.["BuyNewShip"] = GLOB.buy_ship_allowed
