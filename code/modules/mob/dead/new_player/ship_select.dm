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
			if(!spawnee.AttemptLateSpawn(selected_job, target))
				to_chat(spawnee, "<span class='danger'>Не могу войти на судно как экипаж!</span>")
				spawnee.new_player_panel()


		if("buy")
			if(is_banned_from(spawnee.ckey, "Ship Purchasing"))
				to_chat(spawnee, "<span class='danger'>You are banned from purchasing ships!</span>")
				spawnee.new_player_panel()
				ui.close()
				return

			ui.close()
			if(spawnee.client.holder == null && spawnee.client.player_age < BUY_MINIMUM_AGE)
				to_chat(spawnee, "<span class='danger'>Тебе ещё рано иметь лицензию на владение кораблём, возращайся к покупке через [BUY_MINIMUM_AGE - spawnee.client.player_age] дней.</span>")
				spawnee.new_player_panel()
				return
			if(!GLOB.buy_ship_allowed)
				to_chat(spawnee, "<span class='danger'>Новые суда запрещено покупать.</span>")
				spawnee.new_player_panel()
				return
			var/datum/map_template/shuttle/template = SSmapping.ship_purchase_list[params["name"]]
			if(!template.enabled)
				to_chat(spawnee, "<span class='danger'>Этот корабль нельзя купить!</span>")
				spawnee.new_player_panel()
				return
			to_chat(spawnee, "<span class='danger'>Ваш [template.name] заправляется и готовится к вылету. Не забудьте взять ключ для управления судном в соответствующей консоли.</span>")
			var/datum/overmap/ship/controlled/target = new(SSovermap.get_unused_overmap_square(), template)
			if(!target?.shuttle_port)
				to_chat(spawnee, "<span class='danger'>Судно потерялось в глубинах космоса, свяжитесь с администрацией.</span>")
				spawnee.new_player_panel()
				return
			SSblackbox.record_feedback("tally", "ship_purchased", 1, template.name) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
			if(!spawnee.AttemptLateSpawn(target.job_slots[1], target)) //Try to spawn as the first listed job in the job slots (usually captain)
				to_chat(spawnee, "<span class='danger'>Судно появилось, но ты нет. Попытайся зайти на судно обычным способом или обратитись к администратору.</span>")
				spawnee.new_player_panel()

/datum/ship_select/ui_static_data(mob/user)
	. = list()
	.["ships"] = list()
	.["purchaseBanned"] = is_banned_from(user.ckey, "Ship Purchasing")
	for(var/datum/overmap/ship/controlled/S as anything in SSovermap.controlled_ships)
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
				"ref" = REF(job)
			))

		var/list/ship_data = list(
			"name" = S.name,
			"class" = S.source_template.short_name,
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
			"crewCount" = length(T.job_slots)
		)
		.["templates"] += list(ship_data)
		.["BuyNewShip"] = GLOB.buy_ship_allowed
