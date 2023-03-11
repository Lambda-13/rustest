// Used for translating channels to tokens on examination
GLOBAL_LIST_INIT(channel_tokens, list(
	RADIO_CHANNEL_COMMON = RADIO_KEY_COMMON,
	RADIO_CHANNEL_COMMAND = RADIO_TOKEN_COMMAND,
	RADIO_CHANNEL_CENTCOM = RADIO_TOKEN_CENTCOM,
	RADIO_CHANNEL_SOLGOV = RADIO_TOKEN_SOLGOV,		//WS Edit - SolGov Rep
	RADIO_CHANNEL_SYNDICATE = RADIO_TOKEN_SYNDICATE,
	RADIO_CHANNEL_NANOTRASEN = RADIO_TOKEN_NANOTRASEN, //Shiptest edits - faction channels, removed department channels
	RADIO_CHANNEL_MINUTEMEN = RADIO_TOKEN_MINUTEMEN,
	RADIO_CHANNEL_INTEQ = RADIO_TOKEN_INTEQ,
	RADIO_CHANNEL_PIRATE = RADIO_TOKEN_PIRATE,
	MODE_BINARY = MODE_TOKEN_BINARY,
	RADIO_CHANNEL_AI_PRIVATE = RADIO_TOKEN_AI_PRIVATE,
	RADIO_CHANNEL_FACTION = RADIO_TOKEN_FACTION,
))

/obj/item/radio/headset
	name = "гарнитура"
	desc = "Обновленный, модульный интерком, который располагается над головой. Принимает ключи шифрования."
	icon_state = "headset"
	item_state = "headset"
	custom_materials = list(/datum/material/iron=75)
	subspace_transmission = TRUE
	headset = TRUE
	canhear_range = 0 // can't hear headsets from very far away

	slot_flags = ITEM_SLOT_EARS
	var/obj/item/encryptionkey/keyslot2 = null
	dog_fashion = null
	supports_variations = VOX_VARIATION

/obj/item/radio/headset/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins putting \the [src]'s antenna up [user.p_their()] nose! It looks like [user.p_theyre()] trying to give [user.p_them()]self cancer!</span>")
	return TOXLOSS

/obj/item/radio/headset/examine(mob/user)
	. = ..()

	if(item_flags & IN_INVENTORY && loc == user)
		// construction of frequency description
		var/list/avail_chans = list("[RADIO_KEY_COMMON] для текущей частоты.")
		if(translate_binary)
			avail_chans += "[MODE_TOKEN_BINARY] для [MODE_BINARY]"
		if(length(channels))
			for(var/i in 1 to length(channels))
				if(i == 1)
					avail_chans += "[MODE_TOKEN_DEPARTMENT] или [GLOB.channel_tokens[channels[i]]] для [lowertext(ru_comms(channels[i]))]"
				else
					avail_chans += "[GLOB.channel_tokens[channels[i]]] для [lowertext(channels[i])]"
		. += "<span class='notice'>Дисплей показывает следующие частоты:\n[english_list(avail_chans)].</span>"

		if(command)
			. += "<span class='info'>Alt-клик для включения усилителя голоса.</span>"
	else
		. += "<span class='notice'>Дисплей настолько маленький что отсюда я ничего не вижу.</span>"

/obj/item/radio/headset/Initialize()
	. = ..()
	recalculateChannels()

/obj/item/radio/headset/Destroy()
	QDEL_NULL(keyslot2)
	return ..()

/obj/item/radio/headset/talk_into(mob/living/M, message, channel, list/spans, datum/language/language, list/message_mods)
	if (!listening)
		return ITALICS | REDUCE_RANGE
	return ..()

/obj/item/radio/headset/can_receive(freq, map_zones, AIuser)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.ears == src)
			return ..(freq, map_zones)
	else if(AIuser)
		return ..(freq, map_zones)
	return FALSE

/obj/item/radio/headset/ui_data(mob/user)
	. = ..()
	.["headset"] = TRUE

/obj/item/radio/headset/alt
	name = "гарнитура-бабочка"
	desc = "Обновленный, модульный интерком, который располагается над головой. Защищает уши от светошумовых гранат."
	icon_state = "headset_alt"
	item_state = "headset_alt"

/obj/item/radio/headset/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//syndicate
/obj/item/radio/headset/syndicate
	name = "гарнитура синдиката"
	desc = "Гарнитура, которую носят члены различных пограничных Синдикатов."
	icon_state = "syndie_headset"
	item_state = "syndie_headset"
	keyslot = new /obj/item/encryptionkey/syndicate
	theme = "syndicate"

/obj/item/radio/headset/syndicate/captain
	name = "гарнитура лидера синдиката"
	desc = "Гарнитура, которую носят члены различных пограничных Синдикатов."
	command = TRUE
	keyslot2 = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/syndicate/alt
	name = "гарнитура-бабочка синдиката"
	desc = "Гарнитура, которую носят члены различных пограничных Синдикатов. Защищает уши от светошумовых гранат."
	icon_state = "syndie_headset_alt"
	item_state = "syndie_headset_alt"

/obj/item/radio/headset/syndicate/alt/captain
	name = "sгарнитура-бабочка лидера синдиката"
	desc = "Гарнитура, которую носят члены различных пограничных Синдикатов. Защищает уши от светошумовых гранат."
	command = TRUE
	keyslot2 = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/syndicate/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/syndicate/alt/leader
	name = "гарнитура лидера команды"
	command = TRUE

//nanotrasen
/obj/item/radio/headset/nanotrasen
	name = "гарнитура нанотрайзен"
	desc = "С гордостью носят потрепанные остатки пограничных владений Нанотрайзена."
	icon_state = "nanotrasen_headset"
	keyslot = new /obj/item/encryptionkey/nanotrasen
	theme = "ntos"

/obj/item/radio/headset/nanotrasen/captain
	name = "nгарнитура капитана нанотрайзен"
	desc = "С гордостью носят оставшиеся капитаны Нанотрайзена на границе."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/nanotrasen/alt
	name = "гарнитура-бабочка нанотрайзен"
	desc = "С гордостью носят потрепанные остатки пограничных владений Нанотрайзена. Защищает уши от светошумовых гранат."
	icon_state = "nanotrasen_headset_alt"
	item_state = "nanotrasen_headset_alt"

/obj/item/radio/headset/nanotrasen/alt/captain
	name = "гарнитура-бабочка капитана нанотрайзен"
	desc = "С гордостью носят оставшиеся капитаны Нанотрайзена на границе. Защищает уши от светошумовых гранат."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/nanotrasen/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//minutemen
/obj/item/radio/headset/minutemen
	name = "гарнитура морпеха"
	desc = "Используется пятизвёздочными Колониальными Минитимами."
	icon_state = "cmm_headset"
	keyslot = new /obj/item/encryptionkey/minutemen
	theme = "neutral"

/obj/item/radio/headset/minutemen/captain
	name = "гарнитура офицера морпехов"
	desc = "Используется пятизвёздочными Колониальными Минитимами. Этот офицерский."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/minutemen/alt
	name = "гарнитура-бабочка морпеха"
	desc = "Используется пятизвёздочными Колониальными Минитимами. Защищает уши от светошумовых гранат."
	icon_state = "cmm_headset_alt"
	item_state = "cmm_headset_alt"

/obj/item/radio/headset/minutemen/alt/captain
	name = "гарнитура-бабочка офицера морпехов"
	desc = "Используется пятизвёздочными Колониальными Минитимами. Этот офицерский. Защищает уши от светошумовых гранат."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/minutemen/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//inteq
/obj/item/radio/headset/inteq
	name = "гарнитура наёмника"
	desc = "Им пользуются наемники Inteq Risk Management Group."
	icon_state = "inteq_headset"
	keyslot = new /obj/item/encryptionkey/inteq
	theme = "neutral"

/obj/item/radio/headset/inteq/captain
	name = "гарнитура элитного наёмника"
	desc = "Используется элитным авангардом Inteq Risk Management Group."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/inteq/alt
	name = "гарнитура-бабочка наёмника"
	desc = "Им пользуются наемники Inteq Risk Management Group. Защищает уши от светошумовых гранат."
	icon_state = "inteq_headset_alt"
	item_state = "inteq_headset_alt"

/obj/item/radio/headset/inteq/alt/captain
	name = "гарнитура-бабочка элитного наёмника"
	desc = "Используется элитным авангардом Inteq Risk Management Group. Защищает уши от светошумовых гранат."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/inteq/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//pirate
/obj/item/radio/headset/pirate
	name = "гарнитура пиратов"
	desc = "Раньше через них пели лачуги в безбрежной космической пустоте и жаловались на патрули Минитменов."
	icon_state = "pirate_headset"
	keyslot = new /obj/item/encryptionkey/pirate
	theme = "syndicate"

/obj/item/radio/headset/pirate/captain
	name = "гарнитура капитана пиратов"
	desc = "Гарнитура кровожадного пиратского капитана."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/pirate/alt
	name = "гарнитура-бабочка пиратов"
	desc = "Раньше через них пели лачуги в безбрежной космической пустоте и жаловались на патрули Минитменов. Защищает уши от светошумовых гранат."
	icon_state = "pirate_headset_alt"
	item_state = "pirate_headset_alt"

/obj/item/radio/headset/pirate/alt/captain
	name = "гарнитура-бабочка капитана пиратов"
	desc = "Гарнитура кровожадного пиратского капитана. Защищает уши от светошумовых гранат."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/pirate/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//solgov
/obj/item/radio/headset/solgov
	name = "гарнитура SolGov"
	desc = "Носят бюрократы, а иногда и Sonnensoldneren." // Чё за хуйня Sonnensoldneren
	icon_state = "solgov_headset"
	keyslot = new /obj/item/encryptionkey/solgov
	theme = "flight"

/obj/item/radio/headset/solgov/captain
	name = "гарнитура офицера SolGov"
	desc = "Носят различные чиновники и лидеры SolGov. Необычный головной убор в комплект не входит."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/solgov/alt
	name = "гарнитура-бабочка SolGov"
	desc = "Носят бюрократы, а иногда и Sonnensoldneren. Защищает уши от светошумовых гранат."
	icon_state = "solgov_headset_alt"

/obj/item/radio/headset/solgov/alt/captain
	name = "гарнитура-бабочка офицера SolGov"
	desc = "Носят различные чиновники и лидеры SolGov. Необычный головной убор в комплект не входит. Защищает уши от светошумовых гранат."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/solgov/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//independent
/obj/item/radio/headset/headset_com
	name = "гарнитура коммандования"
	desc = "Гарнитура с доступом к каналу командования."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/headset_com/alt
	name = "гарнитура-бабочка коммандования"
	desc = "Гарнитура с доступом к каналу командования. Защищает уши от светошумовых гранат."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/headset_com/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/heads
	command = TRUE
	keyslot = new /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/heads/captain
	name = "капитанская гарнитура"
	desc = "Гарнитура короля или королевы этих окраиных земель."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/captain/alt
	name = "капитанская гарнитура-бабочка"
	desc = "Гарнитура короля или королевы этих окраиных земель. Защищает уши от светошумовых гранат."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/heads/captain/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

//special headsets
/obj/item/radio/headset/binary
/obj/item/radio/headset/binary/Initialize()
	. = ..()
	qdel(keyslot)
	keyslot = new /obj/item/encryptionkey/binary
	recalculateChannels()

/obj/item/radio/headset/headset_cent
	name = "гарнитура ЦентКома"
	desc = "Гарнитура, используемая в высших эшелонах NanoTrasen."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_com
	keyslot2 = new /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/headset_cent/alt
	name = "гарнитура-бабочка ЦентКома"
	desc = "Гарнитура, специально предназначенная для персонала аварийно-спасательных служб. Защищает уши от светошумовых гранат."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null

/obj/item/radio/headset/headset_cent/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/silicon/pai
	name = "\proper mini Integrated Subspace Transceiver "
	subspace_transmission = FALSE


/obj/item/radio/headset/silicon/ai
	name = "\proper Integrated Subspace Transceiver "
	keyslot2 = new /obj/item/encryptionkey/ai
	command = TRUE

/obj/item/radio/headset/silicon/can_receive(freq, map_zones)
	return ..(freq, map_zones, TRUE)

//normal headsets below. encryption keys removed, so these are obsolete.
/obj/item/radio/headset/headset_sec
	name = "гарнитура охраны"
	desc = "Используется локальными охранными подразделениями."
	icon_state = "sec_headset"

/obj/item/radio/headset/headset_sec/alt
	name = "гарнитура-бабочка охраны"
	desc = "Используется локальными охранными подразделениями. Защищает уши от светошумовых гранат."
	icon_state = "sec_headset_alt"
	item_state = "sec_headset_alt"

/obj/item/radio/headset/headset_sec/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/headset_medsec
	name = "гарнитура полевого медика"
	desc = "Гарнитура для обученного персонала медотсека. С доступом к каналу охраны."
	icon_state = "medsec_headset"

/obj/item/radio/headset/headset_medsec/alt
	name = "гарнитура-бабочка полевого медика"
	desc = "Гарнитура для обученного персонала медотсека. С доступом к каналу охраны. Защищает уши от светошумовых гранат."
	icon_state = "medsec_headset_alt"

/obj/item/radio/headset/headset_medsec/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/headset_eng
	name = "инженерная гарнитура"
	desc = "Когда инженеры хотят поболтать, как девочки."
	icon_state = "eng_headset"

/obj/item/radio/headset/headset_rob
	name = "гарнитура роботехника"
	desc = "Сделано специально для робототехников, которые не могут выбирать между отделами."
	icon_state = "rob_headset"

/obj/item/radio/headset/headset_med
	name = "гарнитура медотсека"
	desc = "Гарнитура для обученного персонала медотсека."
	icon_state = "med_headset"

/obj/item/radio/headset/headset_sci
	name = "научная гарнитура"
	desc = "Научная гарнитура. Как обычно."
	icon_state = "sci_headset"

/obj/item/radio/headset/headset_medsci
	name = "гарнитура мед-исследователя"
	desc = "Гарнитура, которая является результатом спаривания медицины и науки."
	icon_state = "medsci_headset"

/obj/item/radio/headset/headset_srvsec
	name = "гарнитура закона и порядка"
	desc = "В гарнитуре системы уголовного правосудия ключ шифрования представляет собой две отдельные, но не менее важные группы. Служба безопасности, которая расследует преступления, и секьюрити, которые предоставляют услуги. Это их связь."
	icon_state = "srvsec_headset"

/obj/item/radio/headset/headset_srvmed
	name = "гарнитура психолога"
	desc = "Гарнитура, позволяющая владельцу общаться с медотсеком и сервисным отделом."
	icon_state = "med_headset"

/obj/item/radio/headset/heads/lieutenant
	name = "гарнитура лейтенанта"
	desc = "Через это общаются лейтенанты."
	icon_state = "com_headset"

/obj/item/radio/headset/heads/lieutenant/alt
	name = "lieutenant's гарнитура-бабочка"
	desc = "Через это общаются лейтенанты. Защищает уши от светошумовых гранат."
	icon_state = "com_headset_alt"

/obj/item/radio/headset/heads/lieutenant/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/heads/rd
	name = "гарнитура научного руководителя"
	desc = "Гарнитура того, кто держит общество в движении к технологической сингулярности."
	icon_state = "com_headset"

/obj/item/radio/headset/heads/hos
	name = "гарнитура главы безопасности"
	desc = "Гарнитура человека, отвечающего за поддержание порядка и охрану станции."
	icon_state = "com_headset"

/obj/item/radio/headset/heads/hos/alt
	name = "гарнитура-бабочка главы безопасности"
	desc = "Гарнитура человека, отвечающего за поддержание порядка и охрану станции. Защищает уши от светошумовых гранат."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/heads/hos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/heads/ce
	name = "гарнитура старшего инженера"
	desc = "Гарнитура парня, отвечающего за поддержание станции в рабочем состоянии и неповрежденной."
	icon_state = "com_headset"

/obj/item/radio/headset/heads/cmo
	name = "гарнитура главврача"
	desc = "Гарнитура высококвалифицированного медицинского руководителя."
	icon_state = "com_headset"

/obj/item/radio/headset/heads/head_of_personnel
	name = "гарнитура главы персонала"
	desc = "Гарнитура парня, который однажды станет капитаном."
	icon_state = "com_headset"

/obj/item/radio/headset/headset_cargo
	name = "гарнитура снабжения"
	desc = "Гарнитура, используемая завхозом и его подчиненными."
	icon_state = "cargo_headset"

/obj/item/radio/headset/headset_cargo/mining
	name = "шахтёрская гарнитура"
	desc = "Гарнитура, используемая шахтерами."
	icon_state = "mine_headset"

/obj/item/radio/headset/headset_srv
	name = "гарнитура обслуги"
	desc = "Гарнитура, используемая обслуживающим персоналом, призванная поддерживать станцию полной, счастливой и чистой."
	icon_state = "srv_headset"

//interactions

/obj/item/radio/headset/attackby(obj/item/W, mob/user, params)
	user.set_machine(src)

	if(W.tool_behaviour == TOOL_SCREWDRIVER)
		if(keyslot || keyslot2)
			for(var/ch_name in channels)
				SSradio.remove_object(src, GLOB.radiochannels[ch_name])
				secure_radio_connections[ch_name] = null

			if(keyslot)
				user.put_in_hands(keyslot)
				keyslot = null
			if(keyslot2)
				user.put_in_hands(keyslot2)
				keyslot2 = null

			recalculateChannels()
			to_chat(user, "<span class='notice'>Вытаскиваю ключ шифрования из гарнитуры.</span>")

		else
			to_chat(user, "<span class='warning'>У этой гарнитуры нет уникальных ключей шифрования! Как бесполезно...</span>")

	else if(istype(W, /obj/item/encryptionkey))
		if(keyslot && keyslot2)
			to_chat(user, "<span class='warning'>Все слоты в этой гарнитуре заняты!</span>")
			return

		if(!keyslot)
			if(!user.transferItemToLoc(W, src))
				return
			keyslot = W

		else
			if(!user.transferItemToLoc(W, src))
				return
			keyslot2 = W


		recalculateChannels()
	else
		return ..()


/obj/item/radio/headset/recalculateChannels()
	..()
	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(!(ch_name in src.channels))
				channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			translate_binary = TRUE
		if (keyslot2.independent)
			independent = TRUE

	for(var/ch_name in channels)
		secure_radio_connections[ch_name] = add_radio(src, GLOB.radiochannels[ch_name])

/obj/item/radio/headset/AltClick(mob/living/user)
	if(!istype(user) || !Adjacent(user) || user.incapacitated())
		return
	if (command)
		use_command = !use_command
		to_chat(user, "<span class='notice'>[use_command ? "Включаю" : "Выключаю"] усилитель голоса.</span>")
