/mob/living/carbon/human/proc/moan()

	if(!(prob(dancing / dancing_tolerance * 65)))
		return

	visible_message(span_purple("<b>[capitalize(src)]</b> [pick("стонет", "стонет в наслаждении")]."))

	var/temp_age = 0

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		temp_age = H.age

	if (gender == FEMALE && temp_age < 30)
		playsound(get_turf(src), "lambda/ss7v/sounds/love/shot[rand(1, 8)].ogg", 90, 1, 0)
	else
		playsound(get_turf(src), "lambda/ss7v/sounds/exrp/interactions/moan_[gender == FEMALE ? "f" : "m"][rand(1, 7)].ogg", 70, 1, 0)

/mob/living/carbon/human/proc/end_dance(mob/living/carbon/human/partner, target_dancise)

	var/message
	if(gender == MALE)

		if(!istype(partner))
			target_dancise = null

		switch(target_dancise)
			if(DANCE_TARGET_MOUTH)
				if(!partner.wear_mask)
					message = pick(
						"сметанит прямо в рот [partner]","спустил на язычок [partner]",
						"брызгает сметанкой в рот [partner]","заполняет рот [partner] сметанкой",
						"обильно сметанит в рот [partner], так, что стекает изо рта",
						"выпускает в ротик [partner] порцию густого молочка",
					)
					partner.reagents.add_reagent(/datum/reagent/consumable/nutriment/protein/semen, 100)
				else
					message = "сметанит на лицо [partner]"
			if(DANCE_TARGET_THROAT)
				if(!partner.wear_mask)
					message = "засунул свой стан-батон как можно глубже в глотку [partner] и сметанит"
					partner.reagents.add_reagent(/datum/reagent/consumable/nutriment/protein/semen, 1599)
				else
					message = "сметанит на лицо [partner]"
			if(DANCE_TARGET_DANCERESS)
				if(partner.is_literally_ready_to_dance() && partner.gender == FEMALE)
					message = "сметанит в пельмешек [partner]"
				else
					message = "сметанит на животик [partner]"
			if(DANCE_TARGET_DANCOR)
				if(partner.is_literally_ready_to_dance())
					message = "сметанит в шоколадницу [partner]"
				else
					message = "сметанит на спинку [partner]"
			if(DANCE_TARGET_HAND)
				if(ishuman(partner))
					message = "сметанит в руку [partner]"
				else
					message = "сметанит на [partner]"
			if(DANCE_TARGET_CHEST)
				if(partner.is_literally_ready_to_dance() && partner.gender == FEMALE)
					message = "сметанит на грудь [partner]"
				else
					message = "сметанит на шею и грудь [partner]"
			if(DANCE_TO_FACE)
				if(!partner.wear_mask)
					message = "нещадно принуждает [partner] съесть яишницу с колбасой"
			if(THIGH_DANCE)
				message = "удерживает [partner] в очень крепком захвате не давая выбраться попутно смазывая лицо майонезиком"
			else
				message = "спустил на пол сметанку"

		dancing = 5
		dancing_tolerance += 50

	else
		message = pick(
			"прикрывает глаза и мелко дрожит",
			"дёргается в удовлетворении",
			"замирает, закатив глаза",
			"содрогается, а затем резко расслабляется",
			"извивается в приступе сытости",
		)
		dancing -= pick(50, 55, 80, 125)

	if(gender == MALE)
		if (prob(75))
			playsound(loc, "lambda/ss7v/sounds/exrp/interactions/final_m[rand(1, 3)].ogg", 90, 1, 0)
		else
			playsound(loc, "lambda/ss7v/sounds/gachi/penetration_[rand(1, 2)].ogg", 90, 1, 0)
	else if(gender == FEMALE)
		var/temp_age = 0
		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			temp_age = H.age
		if (temp_age > 30)
			playsound(loc, "lambda/ss7v/sounds/exrp/interactions/final_f[rand(1, 5)].ogg", 70, 1, 0)
		else
			playsound(loc, "lambda/ss7v/sounds/love/shot9.ogg", 90, 1, 0)

	visible_message(span_purple("<b>[capitalize(src)]</b> [message]."))

	SSblackbox.record_feedback("amount", "dances", 1)

	if(iscarbon(src))
		var/mob/living/carbon/C = src
		var/turf/floor = get_turf(src)
		if ((!locate(/obj/effect/decal/cleanable/cum) in src.loc))
			var/obj/effect/decal/cleanable/cum/spew = new(floor, C.get_static_viruses())
			spew.transfer_mob_blood_dna(src)

	multidances += 1
	if(multidances == 1)
		log_combat(partner, src, "danced on")

	flash_act(1, TRUE, FALSE, TRUE)

	if(multidances > (dancing_potency/3))
		dancing_period = 100 //dance cooldown
		adjust_drugginess(35)
	else
		dancing_period = 100
		adjust_drugginess(12)

/mob/living/carbon/human/proc/is_dancing(mob/living/carbon/human/partner, dancise)
	if(partner == last_dancer && dancise == last_dancing)
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/set_is_dancing(mob/living/carbon/human/partner, dancise)
	last_dancer = partner
	last_dancing = dancise

#define ACTOR_DANCER (1<<0)
#define VICTIM_DANCER (1<<1)

/mob/living/carbon/human/proc/do_dance(mob/living/carbon/human/partner, action_to_do)

	if(stat != CONSCIOUS)
		return

	var/message = "пританцовывает"
	var/dancing_increase = 0
	var/dancing_which = ACTOR_DANCER | VICTIM_DANCER
	var/dancing_target = null
	var/sound_to_play

	switch(action_to_do)
		if("do_dancero")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_MOUTH
			dancing_which = VICTIM_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/bj[rand(1, 11)].ogg"
			if(partner.is_dancing(src, DANCE_TARGET_MOUTH))
				if(prob(partner.dancing_potency))
					message = "зарывается языком в пельмешек [partner]"
					dancing_increase += 5
				else
					if(partner.gender == FEMALE)
						message = "лижет пельмешек [partner]"
					else if(partner.gender == MALE)
						message = "посасывает стан-батон [partner]"
					else
						message = "лижет стан-батон [partner]"
			else
				if(partner.gender == FEMALE)
					message = "прижимается лицом к пельмешку [partner]"
				else if(partner.gender == MALE)
					message = "берёт стан-батон [partner] в свой ротик"
				else
					message = "принимается лизать стан-батон [partner]"
				partner.set_is_dancing(src, DANCE_TARGET_MOUTH)

		if ("do_facedance")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_MOUTH
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/oral[rand(1, 2)].ogg"
			if(is_dancing(partner, DANCE_TARGET_MOUTH))
				if(gender == FEMALE)
					message = "елозит своим пельмешком по лицу [partner]"
				else if(gender == MALE)
					message = pick(
						"грубо исследует [partner] в рот",
						"сильно прижимает голову [partner] к себе",
					)
			else
				if(gender == FEMALE)
					message = "пихает [partner] лицом в свой пельмешек"
				else if(gender == MALE)
					if(is_dancing(partner, DANCE_TARGET_THROAT))
						message = "достал свой стан-батон из проруби [partner]"
					else
						message = "просовывает свой стан-батон еще глубже в прорубь [partner]"
				else
					message = "елозит пельмешком по лицу [partner]"
				set_is_dancing(partner, DANCE_TARGET_MOUTH)

		if ("do_throatdance")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_MOUTH
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/oral[rand(1, 2)].ogg"
			if(is_dancing(partner, DANCE_TARGET_THROAT))
				message = pick(
					"невероятно сильно ловит клёв в проруби [partner]",
					"топит карпика в проруби [partner]",
				)
				if(rand(3) == 1) // 33%
					partner.manual_emote("задыхается в захвате [src]")
					if(iscarbon(partner))
						partner.adjustOxyLoss(1)
			else if(is_dancing(partner, DANCE_TARGET_MOUTH))
				message = "суёт стан-батон глубже, заходя уже в прорубь [partner]"

			else
				message = "силой запихивает свой стан-батон в прорубь [partner]"
				set_is_dancing(partner , DANCE_TARGET_THROAT)

		if ("do_dancor")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_DANCOR
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/dance[rand(1, 3)].ogg"
			if(is_dancing(partner, DANCE_TARGET_DANCOR))
				message = pick(
					"исследует [partner] в шоколадницу",
					"нежно исследует пещеру [partner]",
					"всаживает стан-батон в шоколадницу [partner] по самые гренки",
					"заходит в шоколадную фабрику [partner]",
				)
			else
				message = "безжалостно прорывает шоколадницу [partner]"
				set_is_dancing(partner, DANCE_TARGET_DANCOR)

		if ("do_dance")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_DANCERESS
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/dance[rand(1, 2)].ogg"
			if(is_dancing(partner, DANCE_TARGET_DANCERESS))
				message = "проникает в пельмешек [partner]"
			else
				message = "резким движением погружается внутрь [partner]"
				set_is_dancing(partner, DANCE_TARGET_DANCERESS)

		if ("do_mount")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_DANCERESS
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/dance[rand(1, 3)].ogg"
			if(partner.is_dancing(src, DANCE_TARGET_DANCERESS))
				message = "скачет на стан-батоне [partner]"
			else
				message = "насаживает свой пельмешек на стан-батон [partner]"
				partner.set_is_dancing(src, DANCE_TARGET_DANCERESS)

		if ("do_assdance")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_DANCOR
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/dance[rand(1, 3)].ogg"
			if(partner.is_dancing(src, DANCE_TARGET_DANCOR))
				message = "по-сербски прыгает на стан-батоне [partner]"
			else
				message = "опускает свой шоколадный завод на стан-батон [partner]"
				partner.set_is_dancing(src, DANCE_TARGET_DANCOR)

		if ("do_dancering")
			dancing_increase = 10
			dancing_target = null
			dancing_which = VICTIM_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/champ_fingering.ogg"
			message = pick(
				"анализирует пельмешек [partner]",
				"измеряет глубину пельмешка [partner]",
				"проверяет на прочность пельмешек [partner]",
			)

		if ("do_fingerdance")
			dancing_increase = 10
			dancing_target = null
			dancing_which = VICTIM_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/champ_fingering.ogg"
			message = pick(
				"анализирует шоколадницу [partner]",
				"измеряет глубину скважины [partner]",
				"проверяет на прочность задний привод [partner]",
			)

		if ("do_rimdance")
			dancing_increase = 10
			dancing_target = null
			dancing_which = VICTIM_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/champ_fingering.ogg"
			message = "<b>[src]</b> вынюхивает след на заднем дворе [partner]"

		if ("do_handdance")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_HAND
			dancing_which = VICTIM_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/bang[rand(1, 3)].ogg"
			if(partner.is_dancing(src, DANCE_TARGET_HAND))
				message = pick(
					"шакалит [partner]",
					"работает рукой с головкой стан-батона [partner]",
					"включает и выключает стан-батон [partner] быстрее",
				)
			else
				message = "нежно обхватывает стан-батон [partner] рукой"
				partner.set_is_dancing(src, DANCE_TARGET_HAND)

		if ("do_breastdance")
			dancing_increase = 10
			dancing_target = DANCE_TARGET_CHEST
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/dance[rand(1, 3)].ogg"
			if(is_dancing(partner, DANCE_TARGET_CHEST))
				message = pick(
					"исследует [partner] между горок",
					"прокатывается у [partner] между горок",
				)
			else
				message = "взял горки [partner] рукой и включает/выключает ими свой стан-батон"
				set_is_dancing(partner , DANCE_TARGET_CHEST)

		if ("do_mountdance")
			dancing_increase = 1
			dancing_target = null
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/squelch[rand(1, 3)].ogg"
			if(is_dancing(partner, DANCING_FACE_WITH_DANCOR))
				message = pick(
					"кормит булочками [partner]",
					"даёт покушать булочек [partner]",
				)
			else
				message = pick(
					"видит, что [partner] голоден и срочно принимается кормить булочками его",
					"хочет накормить [partner] булочками",
				)
				set_is_dancing(partner , DANCING_FACE_WITH_DANCOR)

		if ("do_danceface")
			dancing_increase = 1
			dancing_target = null
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/foot_dry[rand(1, 4)].ogg"
			if(src.get_item_by_slot(ITEM_SLOT_FEET) != null)
				message = pick(
					"поставил [get_shoes()] подошвой на лицо [partner]",
					"опускает свои [get_shoes()] на лицо [partner] и надавливает ими",
					"грубо давит [get_shoes()] на лицо [partner]",
				)
			else
				message = pick(
					"ставит свои оголённые ноги на лицо [partner]",
					"опускает свои массивные ступни на лицо [partner], и мнёт ими его",
					"выставляет ноги на лицо [partner]",
				)
			set_is_dancing(partner , DANCING_FACE_WITH_FEET)

		if ("do_dancemouth")
			dancing_increase = 1
			dancing_target = null
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/foot_wet[rand(1, 3)].ogg"
			if(src.get_item_by_slot(ITEM_SLOT_FEET) != null)
				message = pick(
					"заставляет [partner] попробовать [get_shoes()]",
					"даёт слизать грязь с [get_shoes()] [partner]",
				)
			else
				message = pick(
					"принуждает [partner] попробовать свой грязный палец на ноге",
					"предлагает [partner] вкусить ступню",
					"прикрывает рот и нос [partner] ступнёй, затем ждёт пока [partner] отключится и резко отпускает ступню",
				)
			set_is_dancing(partner , DANCING_MOUTH_WITH_FEET)

		if ("do_eggs")
			dancing_increase = 1
			dancing_target = DANCE_TARGET_MOUTH
			dancing_which = ACTOR_DANCER
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/nuts[rand(1, 4)].ogg"
			if(is_dancing(partner, DANCE_TO_FACE))
				message = pick(
					"хватает [partner] за голову и принуждает вкусить яишницы",
					"умоляет [partner] попробовать ещё больше божественной яишенки",
					"нещадно принимается кормить [partner] яишницей",
					"вытаскивает всё то, что [partner] не скушал и ждёт пока тот проглотит остатки",
				)
			else
				message = pick(
					"видит, что [partner] очень голоден и спешит накормить его яишницей",
					"стоит в сантиметре от лица [partner] держа в руках омлетик, затем резко впихивает в рот [partner] благословлённый омлетик",
				)
				set_is_dancing(partner , DANCE_TO_FACE)

		if ("do_thighs")
			dancing_increase = 10
			dancing_target = THIGH_DANCE
			var file = pick("bj10", "bj3", "foot_wet1", "foot_dry3")
			sound_to_play = "lambda/ss7v/sounds/exrp/interactions/[file].ogg"
			if(is_dancing(partner, THIGH_DANCE))
				if(gender == FEMALE)
					message = pick(
						"берёт в ещё более крепкий захват ногами голову [partner] блокируя его обзор целиком",
						"обхватывает голову [partner] ногами принуждая вкусить пельменей",
					)
				else if(gender == MALE)
					message = pick(
						"берёт в ещё более крепкий захват ногами голову [partner] блокируя его обзор целиком",
						"обхватывает голову [partner] ногами ещё сильнее и начинает усиленно кормить яишницей",
						"вставляет кусок омлетика в беспомощный рот [partner], удерживая его лицо ловким захватом ногой",
					)
				else
					message = "захватывает голову [partner] ногами"
			else
				message = pick(
					"залезает на плечи [partner] и берёт в умелый захват своими ногами",
					"хватает голову [partner] ногами",
				)
				set_is_dancing(partner , THIGH_DANCE)
			if(prob(15))
				partner.adjustOxyLoss(1)

	balloon_alert_to_viewers("[message]", vision_distance = COMBAT_MESSAGE_RANGE)
	//visible_message("<span class='notice purple small'><b>[capitalize(src.name)]</b> [message].</span>")
	playsound(get_turf(src), sound_to_play, 50, 1, -1)
	if(dancing_which & ACTOR_DANCER)
		handle_post_dance(dancing_increase, dancing_target, partner)
	if(dancing_which & VICTIM_DANCER)
		partner.handle_post_dance(dancing_increase, dancing_target, src)
	partner.dir = get_dir(partner,src)
	do_dancing_animation(get_dir(src, partner))

#undef ACTOR_DANCER
#undef VICTIM_DANCER

/mob/living/carbon/human/proc/get_shoes()
	var/obj/A = get_item_by_slot(ITEM_SLOT_FEET)
	if(findtext_char(A.name,"the"))
		return copytext_char(A.name, 3, (length(A.name)) + 1)
	else
		return A.name

/mob/living/carbon/human/proc/handle_post_dance(amount, dancise, mob/living/carbon/human/partner)
	if(stat != CONSCIOUS)
		return
	if(amount)
		dancing += amount
	if (dancing >= dancing_tolerance)
		end_dance(partner, dancise)
	else
		moan()
