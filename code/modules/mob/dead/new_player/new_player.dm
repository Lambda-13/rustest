#define LINKIFY_READY(string, value) "<a href='byond://?src=[REF(src)];ready=[value]'>[string]</a>"

/mob/dead/new_player
	var/ready = 0
	var/spawning = 0//Referenced when you want to delete the new_player later on in the code.

	flags_1 = NONE

	invisibility = INVISIBILITY_ABSTRACT

	density = FALSE
	stat = DEAD
	hud_possible = list()

	var/mob/living/new_character	//for instant transfer once the round is set up

	//Used to make sure someone doesn't get spammed with messages if they're ineligible for roles
	var/ineligible_for_roles = FALSE

	/// is this an auth server
	var/auth_check = FALSE

/mob/dead/new_player/Initialize()
	if(client && SSticker.state == GAME_STATE_STARTUP)
		var/atom/movable/screen/splash/S = new(client, TRUE, TRUE)
		S.Fade(TRUE)

	if(length(GLOB.newplayer_start))
		forceMove(pick(GLOB.newplayer_start))
	else
		forceMove(locate(1,1,1))

	ComponentInitialize()

	. = ..()

	GLOB.new_player_list += src

/mob/dead/new_player/Destroy()
	GLOB.new_player_list -= src

	return ..()

/mob/dead/new_player/prepare_huds()
	return

/**
 * This proc generates the panel that opens to all newly joining players, allowing them to join, observe, view polls, view the current crew manifest, and open the character customization menu.
 */
/mob/dead/new_player/proc/new_player_panel()
	if(auth_check)
		return

	if(CONFIG_GET(flag/auth_only))
		if(client?.holder && CONFIG_GET(flag/auth_admin_testing))
			to_chat(src, "<span class='userdanger'>Этот сервер сейчас используется для адмистраторских тестов. Пожалуйста, убедитесь, что вы можете потом удалить за собой всё. Если сервер необходимо рестартануть сервер, свяжитесь с кем-нибудь, у кого есть доступ к TGS.</span>")
		else
			to_chat(src, "<span class='userdanger'>Этот сервер предназначен только для аутентификации.</span>")
			auth_check = TRUE
			return

	if (client?.interviewee)
		return

	var/datum/asset/asset_datum = get_asset_datum(/datum/asset/simple/lobby)
	asset_datum.send(client)
	var/list/output = list("<center><p><a href='byond://?src=[REF(src)];show_preferences=1'>Настройки</a></p>")

	if(SSticker.current_state <= GAME_STATE_PREGAME)
		switch(ready)
			if(PLAYER_NOT_READY)
				output += "<p>\[ <b>Не готов</b> | [LINKIFY_READY("Наблюдать", PLAYER_READY_TO_OBSERVE)] \]</p>"
			if(PLAYER_READY_TO_PLAY)
				output += "<p>\[ [LINKIFY_READY("Не готов", PLAYER_NOT_READY)] | [LINKIFY_READY("Наблюдать", PLAYER_READY_TO_OBSERVE)] \]</p>"
			if(PLAYER_READY_TO_OBSERVE)
				output += "<p>\[ [LINKIFY_READY("Не готов", PLAYER_NOT_READY)] | <b> Наблюдать </b> \]</p>"
	else
		output += "<p><a href='byond://?src=[REF(src)];manifest=1'>Активный экипаж</a></p>"
		output += "<p><a href='byond://?src=[REF(src)];late_join=1'>Войти в игру</a></p>"
		output += "<p><a href='byond://?src=[REF(src)];ghostrole_join=1'>Играть со спавнера</a></p>"
		output += "<p>[LINKIFY_READY("Наблюдать", PLAYER_READY_TO_OBSERVE)]</p>"

	if(!IsGuestKey(src.key))
		output += playerpolls()

	output += "</center>"

	var/datum/browser/popup = new(src, "playersetup", "<div align='center'>Настройки нового персонажа</div>", 250, 265)
	popup.set_window_options("can_close=0")
	popup.set_content(output.Join())
	popup.open(FALSE)

/mob/dead/new_player/proc/playerpolls()
	var/list/output = list()
	if (SSdbcore.Connect())
		var/isadmin = FALSE
		if(client?.holder)
			isadmin = TRUE
		var/datum/DBQuery/query_get_new_polls = SSdbcore.NewQuery({"
			SELECT id FROM [format_table_name("poll_question")]
			WHERE (adminonly = 0 OR :isadmin = 1)
			AND Now() BETWEEN starttime AND endtime
			AND deleted = 0
			AND id NOT IN (
				SELECT pollid FROM [format_table_name("poll_vote")]
				WHERE ckey = :ckey
				AND deleted = 0
			)
			AND id NOT IN (
				SELECT pollid FROM [format_table_name("poll_textreply")]
				WHERE ckey = :ckey
				AND deleted = 0
			)
		"}, list("isadmin" = isadmin, "ckey" = ckey))
		var/rs = REF(src)
		if(!query_get_new_polls.Execute())
			qdel(query_get_new_polls)
			return "Failed to get player polls!"
		if(query_get_new_polls.NextRow())
			output += "<p><b><a href='byond://?src=[rs];showpoll=1'>Опрос</A> (НОВОЕ!)</b></p>"
		else
			output += "<p><a href='byond://?src=[rs];showpoll=1'>Опрос</A></p>"
		qdel(query_get_new_polls)
		if(QDELETED(src))
			return
		return output

/mob/dead/new_player/Topic(href, href_list[])
	if(auth_check)
		return

	if(src != usr)
		return 0

	if(!client)
		return 0

	if(client.interviewee)
		return FALSE

	//Determines Relevent Population Cap
	var/relevant_cap
	var/hpc = CONFIG_GET(number/hard_popcap)
	var/epc = CONFIG_GET(number/extreme_popcap)
	if(hpc && epc)
		relevant_cap = min(hpc, epc)
	else
		relevant_cap = max(hpc, epc)

	if(href_list["show_preferences"])
		client.prefs.ShowChoices(src)
		return 1

	if(href_list["ready"])
		var/tready = text2num(href_list["ready"])
		//Avoid updating ready if we're after PREGAME (they should use latejoin instead)
		//This is likely not an actual issue but I don't have time to prove that this
		//no longer is required
		if(SSticker.current_state <= GAME_STATE_PREGAME)
			ready = tready
		//if it's post initialisation and they're trying to observe we do the needful
		if(!SSticker.current_state < GAME_STATE_PREGAME && tready == PLAYER_READY_TO_OBSERVE)
			ready = tready
			make_me_an_observer()
			return

	if(href_list["refresh"])
		src << browse(null, "window=playersetup") //closes the player setup window
		new_player_panel()

	if(href_list["late_join"])
		if(!SSticker?.IsRoundInProgress())
			to_chat(usr, "<span class='boldwarning'>Раунд уже завершён или еще не начался...</span>")
			return

		if(href_list["late_join"] == "override")
			LateChoices()
			return

		if(SSticker.queued_players.len || (relevant_cap && living_player_count() >= relevant_cap && !(ckey(key) in GLOB.admin_datums)))
			to_chat(usr, "<span class='danger'>[CONFIG_GET(string/hard_popcap_message)]</span>")

			var/queue_position = SSticker.queued_players.Find(usr)
			if(queue_position == 1)
				to_chat(usr, "<span class='notice'>Вы следующий в очереди, чтобы присоединиться к игре. Вы будете уведомлены, когда слот откроется.</span>")
			else if(queue_position)
				to_chat(usr, "<span class='notice'>Ты в очереди, текущая позиция: [queue_position].</span>")
			else
				SSticker.queued_players += usr
				to_chat(usr, "<span class='notice'>Ты добавлен на очередь в игру, текущая позиция в очереди: [SSticker.queued_players.len].</span>")
			return
		LateChoices()

	if(href_list["ghostrole_join"])
		if(!SSticker?.IsRoundInProgress())
			to_chat(usr, "<span class='boldwarning'>Раунд уже завершён или еще не начался...</span>")
			return
		GhostspawnChoices()

	if(href_list["JoinAsGhostRole"])
		if(!GLOB.enter_allowed)
			to_chat(usr, "<span class='notice'>Вход временно закрыт.</span>")

		if(hpc && epc)
			relevant_cap = min(hpc, epc)
		else
			relevant_cap = max(hpc, epc)

		if(SSticker.queued_players.len && !(ckey(key) in GLOB.admin_datums))
			if((living_player_count() >= relevant_cap) || (src != SSticker.queued_players[1]))
				to_chat(usr, "<span class='warning'>Сервер полон.</span>")
				return

		var/obj/effect/mob_spawn/MS = pick(GLOB.mob_spawners[href_list["JoinAsGhostRole"]])
		if(MS.attack_ghost(src, latejoinercalling = TRUE))
			SSticker.queued_players -= src
			SSticker.queue_delay = 4
			qdel(src)

	if(href_list["manifest"])
		ViewManifest()

	if(!ready && href_list["preference"])
		if(client)
			client.prefs.process_link(src, href_list)
	else if(!href_list["late_join"])
		new_player_panel()
	if(href_list["showpoll"])
		handle_player_polling()
		return

	if(href_list["viewpoll"])
		var/datum/poll_question/poll = locate(href_list["viewpoll"]) in GLOB.polls
		poll_player(poll)

	if(href_list["votepollref"])
		var/datum/poll_question/poll = locate(href_list["votepollref"]) in GLOB.polls
		vote_on_poll_handler(poll, href_list)

//When you cop out of the round (NB: this HAS A SLEEP FOR PLAYER INPUT IN IT)
/mob/dead/new_player/proc/make_me_an_observer()
	if(auth_check)
		return

	if(QDELETED(src) || !src.client)
		ready = PLAYER_NOT_READY
		return FALSE

	var/this_is_like_playing_right = alert(src,"Ты хочешь наблюдать? [CONFIG_GET(flag/norespawn) ? "У тебя возможно не будет больше шанса вернуться в лобби." : "Ты сможешь вернуться в лобби позже." ]","Наблюдать","Да","Нет")

	if(QDELETED(src) || !src.client || this_is_like_playing_right != "Да")
		ready = PLAYER_NOT_READY
		src << browse(null, "window=playersetup") //closes the player setup window
		new_player_panel()
		return FALSE

	var/mob/dead/observer/observer = new()
	spawning = TRUE

	observer.started_as_observer = TRUE
	close_spawn_windows()
	var/obj/effect/landmark/observer_start/O = locate(/obj/effect/landmark/observer_start) in GLOB.landmarks_list
	to_chat(src, "<span class='notice'>Телепортируем.</span>")
	if (O)
		observer.forceMove(O.loc)
	observer.key = key
	observer.client = client
	observer.set_ghost_appearance()
	if(observer.client && observer.client.prefs)
		observer.real_name = observer.client.prefs.real_name
		observer.name = observer.real_name
		observer.client.init_verbs()
	observer.update_icon()
	observer.stop_sound_channel(CHANNEL_LOBBYMUSIC)
	deadchat_broadcast(" наблюдает за игрой.", "<b>[observer.real_name]</b>", follow_target = observer, turf_target = get_turf(observer), message_type = DEADCHAT_DEATHRATTLE)
	QDEL_NULL(mind)
	qdel(src)
	return TRUE

/proc/get_job_unavailable_error_message(retval, jobtitle)
	switch(retval)
		if(JOB_AVAILABLE)
			return "[jobtitle] доступен для игры."
		if(JOB_UNAVAILABLE_GENERIC)
			return "[jobtitle] недоступен для игры."
		if(JOB_UNAVAILABLE_BANNED)
			return "[jobtitle] недоступен для игры по причине блокировки."
		if(JOB_UNAVAILABLE_PLAYTIME)
			return "[jobtitle] недоступен для игры по причине малого наигранного времени."
		if(JOB_UNAVAILABLE_ACCOUNTAGE)
			return "[jobtitle] недоступен для игры по причине подозрений в мультиаккерстве."
		if(JOB_UNAVAILABLE_SLOTFULL)
			return "[jobtitle] недоступен для игры по причине заполненного слота."
	return "Error: Unknown job availability."

/mob/dead/new_player/proc/IsJobUnavailable(datum/job/job, datum/overmap/ship/controlled/ship, check_playtime, latejoin = FALSE)
	if(!job)
		return JOB_UNAVAILABLE_GENERIC
	if(!(ship.job_slots[job] > 0))
		return JOB_UNAVAILABLE_SLOTFULL
	if(is_banned_from(ckey, job.name))
		return JOB_UNAVAILABLE_BANNED
	if(QDELETED(src))
		return JOB_UNAVAILABLE_GENERIC
	if(!job.player_old_enough(client))
		return JOB_UNAVAILABLE_ACCOUNTAGE
	if(check_playtime && !ship.source_template.has_job_playtime(client, job))
		return JOB_UNAVAILABLE_PLAYTIME
	if(latejoin && !job.special_check_latejoin(client))
		return JOB_UNAVAILABLE_GENERIC
	return JOB_AVAILABLE

/mob/dead/new_player/proc/AttemptLateSpawn(datum/job/job, datum/overmap/ship/controlled/ship, check_playtime = TRUE)
	if(auth_check)
		return

	var/error = IsJobUnavailable(job, ship, check_playtime)
	if(error != JOB_AVAILABLE)
		alert(src, get_job_unavailable_error_message(error, job))
		return FALSE

	//Removes a job slot
	ship.job_slots[job]--

	//Remove the player from the join queue if he was in one and reset the timer
	SSticker.queued_players -= src
	SSticker.queue_delay = 4

	var/mob/living/carbon/human/character = create_character(TRUE)	//creates the human and transfers vars and mind
	var/equip = job.EquipRank(character, ship)
	if(isliving(equip))	//Borgs get borged in the equip, so we need to make sure we handle the new mob.
		character = equip

	if(job && !job.override_latejoin_spawn(character))
		SSjob.SendToLateJoin(character, destination = pick(ship.shuttle_port.spawn_points))
		var/atom/movable/screen/splash/Spl = new(character.client, TRUE)
		Spl.Fade(TRUE)
		character.playsound_local(get_turf(character), 'sound/voice/ApproachingTG.ogg', 25)

		character.update_parallax_teleport()

	character.client.init_verbs() // init verbs for the late join

	if(ishuman(character))	//These procs all expect humans
		var/mob/living/carbon/human/humanc = character
		ship.manifest_inject(humanc, client, job)
		GLOB.data_core.manifest_inject(humanc, client)
		AnnounceArrival(humanc, job.name, ship)
		AddEmploymentContract(humanc)
		SSblackbox.record_feedback("tally", "species_spawned", 1, humanc.dna.species.name)

		if(GLOB.summon_guns_triggered)
			give_guns(humanc)
		if(GLOB.summon_magic_triggered)
			give_magic(humanc)
		if(GLOB.curse_of_madness_triggered)
			give_madness(humanc, GLOB.curse_of_madness_triggered)
		if(CONFIG_GET(flag/roundstart_traits))
			SSquirks.AssignQuirks(humanc, humanc.client, TRUE)

	GLOB.joined_player_list += character.ckey

	log_manifest(character.mind.key, character.mind, character, TRUE)

	if(length(ship.job_slots) > 1 && ship.job_slots[1] == job) // if it's the "captain" equivalent job of the ship. checks to make sure it's not a one-job ship
		minor_announce("[job.name] [character.real_name] на борту!", zlevel = ship.shuttle_port.virtual_z())
	return TRUE

/mob/dead/new_player/proc/AddEmploymentContract(mob/living/carbon/human/employee)
	//TODO:  figure out a way to exclude wizards/nukeops/demons from this.
	for(var/C in GLOB.employmentCabinets)
		var/obj/structure/filingcabinet/employment/employmentCabinet = C
		if(!employmentCabinet.virgin)
			employmentCabinet.addFile(employee)

/mob/dead/new_player/proc/LateChoices()
	if(auth_check)
		return

	if(!can_join_round(FALSE))
		return

	if(!GLOB.ship_select_tgui)
		GLOB.ship_select_tgui = new /datum/ship_select(src)

	GLOB.ship_select_tgui.ui_interact(src)

/mob/dead/new_player/proc/can_join_round(silent = FALSE)
	if(!GLOB.enter_allowed)
		if(!silent)
			to_chat(usr, "<span class='notice'>Ты не можешь сейчас войти в игру.</span>")
		return FALSE

	if(!SSticker?.IsRoundInProgress())
		if(!silent)
			to_chat(usr, "<span class='danger'>Раунд уже закончился или ещё не начался...</span>")
		return FALSE

	var/relevant_cap
	var/hpc = CONFIG_GET(number/hard_popcap)
	var/epc = CONFIG_GET(number/extreme_popcap)
	if(hpc && epc)
		relevant_cap = min(hpc, epc)
	else
		relevant_cap = max(hpc, epc)

	if(SSticker.queued_players.len && !(ckey(key) in GLOB.admin_datums))
		if((living_player_count() >= relevant_cap) || (src != SSticker.queued_players[1]))
			if(!silent)
				to_chat(usr, "<span class='warning'>Слишком много игроков.</span>")
			return FALSE
	return TRUE

/mob/dead/new_player/proc/GhostspawnChoices()

	var/dat = "<div class='notice'>Длительность раунда: [DisplayTimeText(world.time - SSticker.round_start_time)]<br></div>"
	dat += "<center><table><tr><td valign='top'>"
	var/available_ghosts = 0
	for(var/spawner in GLOB.mob_spawners)
		if(!LAZYLEN(spawner))
			continue
		var/obj/effect/mob_spawn/S = pick(GLOB.mob_spawners[spawner])
		if(!istype(S) || !S.can_latejoin())
			continue
		available_ghosts++
		break
	if(!available_ghosts)
		dat += "<div class='notice red'>Сейчас нету доступных спавнеров.</div>"
	else
		var/list/categorizedJobs = list("Играть не на кораблях" = list(jobs = list(), titles = GLOB.mob_spawners, color = "#ffffff"))
		for(var/spawner in GLOB.mob_spawners)
			if(!LAZYLEN(spawner))
				continue
			var/obj/effect/mob_spawn/S = pick(GLOB.mob_spawners[spawner])
			if(!istype(S) || !S.can_latejoin())
				continue
			categorizedJobs["Играть не на кораблях"]["jobs"] += spawner
		dat += "<center><table><tr><td valign='top'>"
		for(var/jobcat in categorizedJobs)
			if(!length(categorizedJobs[jobcat]["jobs"]))
				continue
			var/color = categorizedJobs[jobcat]["color"]
			dat += "<fieldset style='border: 2px solid [color]; display: inline'>"
			dat += "<legend align='center' style='color: [color]'>[jobcat]</legend>"
			for(var/spawner in categorizedJobs[jobcat]["jobs"])
				dat += "<a class='otherPosition' style='display:block;width:170px' href='byond://?src=[REF(src)];JoinAsGhostRole=[spawner]'>[spawner]</a>"
			dat += "</fieldset><br>"
		dat += "</td></tr></table></center>"
		dat += "</div></div>"
	var/datum/browser/popup = new(src, "ghostrolechoices", "Выберите спавнер", 720, 600)
	popup.add_stylesheet("playeroptions", 'html/browser/playeroptions.css')
	popup.set_content(jointext(dat, ""))
	popup.open(FALSE) // FALSE is passed to open so that it doesn't use the onclose() proc

/mob/dead/new_player/proc/create_character(transfer_after)
	if(auth_check)
		return

	spawning = 1
	close_spawn_windows()

	var/mob/living/carbon/human/H = new(loc)

	var/frn = CONFIG_GET(flag/force_random_names)
	var/admin_anon_names = SSticker.anonymousnames
	if(!frn)
		frn = is_banned_from(ckey, "Appearance")
		if(QDELETED(src))
			return
	if(frn)
		client.prefs.random_character()
		client.prefs.real_name = client.prefs.pref_species.random_name(gender,1)

	if(admin_anon_names)//overrides random name because it achieves the same effect and is an admin enabled event tool
		client.prefs.random_character()
		client.prefs.real_name = anonymous_name(src)

	var/is_antag
	if(mind in GLOB.pre_setup_antags)
		is_antag = TRUE

	client.prefs.copy_to(H, antagonist = is_antag)
	H.dna.update_dna_identity()
	if(mind)
		if(transfer_after)
			mind.late_joiner = TRUE
		mind.active = 0					//we wish to transfer the key manually
		mind.transfer_to(H)					//won't transfer key since the mind is not active

	H.name = real_name
	client.init_verbs()
	. = H
	new_character = .
	if(transfer_after)
		transfer_character()

/mob/dead/new_player/proc/transfer_character()
	if(auth_check)
		return

	. = new_character
	if(.)
		new_character.key = key		//Manually transfer the key to log them in,
		new_character.stop_sound_channel(CHANNEL_LOBBYMUSIC)
		new_character = null
		qdel(src)

/mob/dead/new_player/proc/ViewManifest()
	if(!client)
		return
	if(world.time < client.crew_manifest_delay)
		return
	client.crew_manifest_delay = world.time + (1 SECONDS)

	if(!GLOB.crew_manifest_tgui)
		GLOB.crew_manifest_tgui = new /datum/crew_manifest(src)

	GLOB.crew_manifest_tgui.ui_interact(src)

/mob/dead/new_player/Move()
	return 0


/mob/dead/new_player/proc/close_spawn_windows()

	src << browse(null, "window=playersetup") //closes the player setup window
	src << browse(null, "window=preferences") //closes job selection
	src << browse(null, "window=mob_occupation")
	src << browse(null, "window=latechoices") //closes late job selection
	src << browse(null, "window=ghostrolechoices") //закрываем окошко гостролек

// Used to make sure that a player has a valid job preference setup, used to knock players out of eligibility for anything if their prefs don't make sense.
// A "valid job preference setup" in this situation means at least having one job set to low, or not having "return to lobby" enabled
// Prevents "antag rolling" by setting antag prefs on, all jobs to never, and "return to lobby if preferences not availible"
// Doing so would previously allow you to roll for antag, then send you back to lobby if you didn't get an antag role
// This also does some admin notification and logging as well, as well as some extra logic to make sure things don't go wrong
/mob/dead/new_player/proc/check_preferences()
	return TRUE

/**
 * Prepares a client for the interview system, and provides them with a new interview
 *
 * This proc will both prepare the user by removing all verbs from them, as well as
 * giving them the interview form and forcing it to appear.
 */
/mob/dead/new_player/proc/register_for_interview()
	// First we detain them by removing all the verbs they have on client
	for (var/v in client.verbs)
		var/procpath/verb_path = v
		if (!(verb_path in GLOB.stat_panel_verbs))
			remove_verb(client, verb_path)

	// Then remove those on their mob as well
	for (var/v in verbs)
		var/procpath/verb_path = v
		if (!(verb_path in GLOB.stat_panel_verbs))
			remove_verb(src, verb_path)

	// Then we create the interview form and show it to the client
	var/datum/interview/I = GLOB.interviews.interview_for_client(client)
	if (I)
		I.ui_interact(src)

	// Add verb for re-opening the interview panel, and re-init the verbs for the stat panel
	add_verb(src, /mob/dead/new_player/proc/open_interview)
