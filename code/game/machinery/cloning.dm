//Cloning revival method.
//The pod handles the actual cloning while the computer manages the clone profiles

//Potential replacement for genetics revives or something I dunno (?)

#define CLONE_INITIAL_DAMAGE 150    //Clones in clonepods start with 150 cloneloss damage and 150 brainloss damage, thats just logical
#define MINIMUM_HEAL_LEVEL 40
#define CLONER_FRESH_CLONE "fresh"
#define CLONER_MATURE_CLONE "mature"

#define SPEAK(message) radio.talk_into(src, message, radio_channel)

/obj/machinery/clonepod
	name = "капсула клонирования"
	desc = "Электронно-запираемая капсула для выращивания органических форм жизни."
	density = TRUE
	icon = 'icons/obj/machines/cloning.dmi'
	icon_state = "pod_0"
	req_access = list(ACCESS_CLONING) //FOR PREMATURE UNLOCKING.
	verb_say = "states"
	circuit = /obj/item/circuitboard/machine/clonepod
	processing_flags = NONE

	var/heal_level //The clone is released once its health reaches this level.
	var/obj/machinery/computer/cloning/connected //So we remember the connected clone machine.
	var/mess = FALSE //Need to clean out it if it's full of exploded clone.
	var/attempting = FALSE //One clone attempt at a time thanks
	var/speed_coeff
	var/efficiency
	var/obj/item/reagent_containers/glass/beaker = null //Beaker full of what SHOULD be synthflesh

	var/fleshamnt = 1 //Amount of synthflesh needed per cloning cycle, is divided by efficiency

	var/datum/mind/clonemind
	var/grab_ghost_when = CLONER_MATURE_CLONE

	var/internal_radio = TRUE
	var/obj/item/radio/radio
	var/radio_key = /obj/item/encryptionkey/headset_com
	var/radio_channel = RADIO_CHANNEL_COMMAND

	var/obj/effect/countdown/clonepod/countdown

	var/list/unattached_flesh
	var/flesh_number = 0
	var/datum/bank_account/current_insurance


/obj/machinery/clonepod/Initialize()
	. = ..()

	countdown = new(src)

	if(internal_radio)
		radio = new(src)
		radio.keyslot = new radio_key
		radio.subspace_transmission = TRUE
		radio.canhear_range = 0
		radio.recalculateChannels()

	if(is_operational)
		begin_processing()

/obj/machinery/clonepod/Destroy()
	var/mob/living/mob_occupant = occupant
	go_out()
	if(mob_occupant)
		log_cloning("[key_name(mob_occupant)] ejected from [src] at [AREACOORD(src)] due to Destroy().")
	QDEL_NULL(radio)
	QDEL_NULL(countdown)
	if(connected)
		connected.DetachCloner(src)
	QDEL_LIST(unattached_flesh)
	. = ..()

/obj/machinery/clonepod/RefreshParts()
	speed_coeff = 0
	efficiency = 0
	fleshamnt = 1
	for(var/obj/item/stock_parts/scanning_module/S in component_parts)
		efficiency += S.rating
		fleshamnt = 1/max(efficiency-1, 1)
	for(var/obj/item/stock_parts/manipulator/P in component_parts)
		speed_coeff += P.rating
	heal_level = (efficiency * 15) + 10
	if(heal_level < MINIMUM_HEAL_LEVEL)
		heal_level = MINIMUM_HEAL_LEVEL
	if(heal_level > 100)
		heal_level = 100

/obj/machinery/clonepod/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	if(beaker)
		beaker.forceMove(drop_location())
		if(user && Adjacent(user) && !issiliconoradminghost(user))
			user.put_in_hands(beaker)
	if(new_beaker)
		beaker = new_beaker
	else
		beaker = null
	update_icon()
	return TRUE

/obj/machinery/clonepod/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Cloner", name)
		ui.open()

/obj/machinery/clonepod/ui_data()
	var/list/data = list()
	data["isBeakerLoaded"] = beaker ? TRUE : FALSE
	var/beakerContents = list()
	if(beaker && beaker.reagents && beaker.reagents.reagent_list.len)
		for(var/datum/reagent/R in beaker.reagents.reagent_list)
			beakerContents += list(list("name" = R.name, "volume" = R.volume))
	data["beakerContents"] = beakerContents
	data["progress"] = round(get_completion())
	return data

/obj/machinery/clonepod/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("ejectbeaker")
			replace_beaker(usr)
			. = TRUE

/obj/machinery/chem_dispenser/AltClick(mob/living/user)
	..()
	if(istype(user) && user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		replace_beaker(user)

/obj/machinery/clonepod/attack_ai(mob/user)
	return attack_hand(user)

/obj/machinery/clonepod/examine(mob/user)
	. = ..()
	. += "<hr><span class='notice'><i>Связанное</i> устройство можно <i>просканировать<i> с помощью многофункционального инструмента. Его можно очистить, щелкнув по нему Alt-кликом.</span>"
	if(in_range(user, src) || isobserver(user))
		. += "<hr><span class='notice'>Дисплей показывает: скорость клонирования <b>[speed_coeff*50]%</b>.<br>Прогнозируемый объем клеточного повреждения: <b>[100-heal_level]%</b><br>"
		. += "<hr>Потребление синтетической плоти в <b>[round(fleshamnt*90, 1)]см<sup>3</sup></b> обьёме при клонировании.</span><br>"

		if(efficiency > 5)
			. += "<hr><span class='notice'>Модуль был модернизирован для поддержки автообработки и применения полезных мутаций.</span>"

//The return of data disks?? Just for transferring between genetics machine/cloning machine.
//TO-DO: Make the genetics machine accept them.
/obj/item/disk/data
	var/list/fields = list()

//Clonepod

/obj/machinery/clonepod/examine(mob/user)
	. = ..()
	var/mob/living/mob_occupant = occupant
	if(mess)
		. += "<hr>Внутри всё в крови и внутренностях. Оно двигается..."
	if(is_operational && istype(mob_occupant))
		if(mob_occupant.stat != DEAD)
			. += "<hr>Текущий цикл клонирования завершён на [round(get_completion())]%."

/obj/machinery/clonepod/return_air()
	// We want to simulate the clone not being in contact with
	// the atmosphere, so we'll put them in a constant pressure
	// nitrogen. They don't need to breathe while cloning anyway.
	var/static/datum/gas_mixture/immutable/cloner/GM //global so that there's only one instance made for all cloning pods
	if(!GM)
		GM = new
	return GM

/obj/machinery/clonepod/proc/get_completion()
	. = FALSE
	var/mob/living/mob_occupant = occupant
	if(mob_occupant)
		. = (100 * ((mob_occupant.health + 100) / (heal_level + 100)))

/obj/machinery/clonepod/attack_ai(mob/user)
	return examine(user)

//Start growing a human clone in the pod!
/obj/machinery/clonepod/proc/growclone(clonename, ui, mutation_index, mindref, last_death, blood_type, datum/species/mrace, list/features, factions, list/quirks, datum/bank_account/insurance, list/traumas, empty)
	if(!beaker)
		connected_message("Невозможно начать клонирование: стакан не найден.")
		return NONE
	if(!beaker.reagents.has_reagent(/datum/reagent/medicine/synthflesh, fleshamnt))
		connected_message("Невозможно начать клонирование: недостаточно синтетической плоти.")
		return NONE
	if(panel_open)
		return NONE
	if(mess || attempting)
		return NONE

	if(!empty) //Doesn't matter if we're just making a copy
		clonemind = locate(mindref) in SSticker.minds
		if(!istype(clonemind))	//not a mind
			return NONE
		if(clonemind.last_death != last_death) //The soul has advanced, the record has not.
			return NONE
		if(!QDELETED(clonemind.current))
			if(clonemind.current.stat != DEAD)	//mind is associated with a non-dead body
				return NONE
			if(clonemind.current.suiciding) // Mind is associated with a body that is suiciding.
				return NONE
		if(!clonemind.active)
			// get_ghost() will fail if they're unable to reenter their body
			var/mob/dead/observer/G = clonemind.get_ghost()
			if(!G)
				return NONE
			if(G.suiciding) // The ghost came from a body that is suiciding.
				return NONE
		if(clonemind.damnation_type) //Can't clone the damned.
			INVOKE_ASYNC(src, PROC_REF(horrifyingsound))
			mess = TRUE
			icon_state = "pod_g"
			update_icon()
			return NONE
	attempting = TRUE //One at a time!!
	countdown.start()

	var/mob/living/carbon/human/H = new /mob/living/carbon/human(src)

	if(!clonename)	//to prevent null names
		clonename = "Клон ([rand(1,999)])"
	H.real_name = clonename

	H.hardset_dna(ui, mutation_index, null, H.real_name, blood_type, mrace, features)

	if(!HAS_TRAIT(H, TRAIT_RADIMMUNE))//dont apply mutations if the species is Mutation proof.
		if(efficiency > 2)
			var/list/unclean_mutations = (GLOB.not_good_mutations|GLOB.bad_mutations)
			H.dna.remove_mutation_group(unclean_mutations)
		if(efficiency > 5 && prob(20))
			H.easy_randmut(POSITIVE)
		if(efficiency < 3 && prob(50))
			var/mob/M = H.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
			if(ismob(M))
				H = M

	H.silent = 20 //Prevents an extreme edge case where clones could speak if they said something at exactly the right moment.
	occupant = H

	icon_state = "pod_1"
	//Get the clone body ready
	maim_clone(H)
	ADD_TRAIT(H, TRAIT_STABLEHEART, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_STABLELIVER, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_EMOTEMUTE, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_MUTE, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_NOBREATH, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITDAMAGE, CLONING_POD_TRAIT)
	H.Unconscious(80)

	if(!empty)
		clonemind.transfer_to(H)

		if(grab_ghost_when == CLONER_FRESH_CLONE)
			H.grab_ghost()
			to_chat(H, "<span class='notice'><b>Сознание медленно проникает в меня, пока тело регенерирует.</b><br><i>Так вот на что похоже клонирование?</i></span>")

		if(grab_ghost_when == CLONER_MATURE_CLONE)
			H.ghostize(TRUE)	//Only does anything if they were still in their old body and not already a ghost
			to_chat(H.get_ghost(TRUE), "<span class='notice'>Твое тело начинает восстанавливаться в капсуле для клонирования. Вы встанете в сознании, когда клонирование будет завершено.</span>")

	if(H)
		H.faction |= factions

		for(var/V in quirks)
			var/datum/quirk/Q = new V(H)
			Q.on_clone(quirks[V])

		for(var/t in traumas)
			var/datum/brain_trauma/BT = t
			var/datum/brain_trauma/cloned_trauma = BT.on_clone()
			if(cloned_trauma)
				H.gain_trauma(cloned_trauma, BT.resilience)

		H.set_cloned_appearance()

		H.set_suicide(FALSE)
	attempting = FALSE
	return CLONING_SUCCESS

//Grow clones to maturity then kick them out.  FREELOADERS
/obj/machinery/clonepod/process()
	var/mob/living/mob_occupant = occupant

	if(mob_occupant && (mob_occupant.loc == src))
		if(!beaker.reagents.has_reagent(/datum/reagent/medicine/synthflesh, fleshamnt))
			go_out()
			log_cloning("[key_name(mob_occupant)] ejected from [src] at [AREACOORD(src)] due to insufficient material.")
			connected_message("Клон извлечён: недостаточно материала.")
			if(internal_radio)
				SPEAK("Клонирование [mob_occupant.real_name] было завершено досрочно по причине нехватки материала.")
		if(mob_occupant && (mob_occupant.stat == DEAD) || (mob_occupant.suiciding) || mob_occupant.hellbound)  //Autoeject corpses and suiciding dudes.
			connected_message("Клон извлечён: смерть.")
			if(internal_radio)
				SPEAK("Клонирование [mob_occupant.real_name] было прервано по причине смерти клона.")
			go_out()
			log_cloning("[key_name(mob_occupant)] ejected from [src] at [AREACOORD(src)] after suiciding.")

		else if(mob_occupant && mob_occupant.cloneloss > (100 - heal_level))
			mob_occupant.Unconscious(80)
			var/dmg_mult = CONFIG_GET(number/damage_multiplier)
//Slowly get that clone healed and finished.
			mob_occupant.adjustCloneLoss(-((speed_coeff / 2) * dmg_mult))
			if(beaker.reagents.has_reagent(/datum/reagent/medicine/synthflesh, fleshamnt))
				beaker.reagents.remove_reagent(/datum/reagent/medicine/synthflesh, fleshamnt)
			else if(beaker.reagents.has_reagent(/datum/reagent/blood, fleshamnt*3))
				beaker.reagents.remove_reagent(/datum/reagent/blood, fleshamnt*3)
			var/progress = CLONE_INITIAL_DAMAGE - mob_occupant.getCloneLoss()
			// To avoid the default cloner making incomplete clones
			progress += (100 - MINIMUM_HEAL_LEVEL)
			var/milestone = CLONE_INITIAL_DAMAGE / flesh_number
			var/installed = flesh_number - unattached_flesh.len

			if((progress / milestone) >= installed)
				// attach some flesh
				var/obj/item/I = pick_n_take(unattached_flesh)
				if(isorgan(I))
					var/obj/item/organ/O = I
					O.organ_flags &= ~ORGAN_FROZEN
					O.Insert(mob_occupant)
				else if(isbodypart(I))
					var/obj/item/bodypart/BP = I
					BP.attach_limb(mob_occupant)

			use_power(7500) //This might need tweaking.

		else if(mob_occupant && (mob_occupant.cloneloss <= (100 - heal_level)))
			connected_message("Процесс клонирования завершён.")
			if(internal_radio)
				SPEAK("Цикл клонирования [mob_occupant.real_name] завершён.")

			// If the cloner is upgraded to debugging high levels, sometimes
			// organs and limbs can be missing.
			for(var/i in unattached_flesh)
				if(isorgan(i))
					var/obj/item/organ/O = i
					O.organ_flags &= ~ORGAN_FROZEN
					O.Insert(mob_occupant)
				else if(isbodypart(i))
					var/obj/item/bodypart/BP = i
					BP.attach_limb(mob_occupant)

			go_out()
			log_cloning("[key_name(mob_occupant)] completed cloning cycle in [src] at [AREACOORD(src)].")

	else if (!mob_occupant || mob_occupant.loc != src)
		occupant = null
		if (!mess && !panel_open)
			icon_state = "pod_0"
		use_power(200)

/obj/machinery/clonepod/on_set_is_operational(old_value)
	. = ..()
	if(old_value) //Turned off
		if(occupant)
			go_out()
			log_cloning("[key_name(occupant)] ejected from [src] at [AREACOORD(src)] due to power loss.")

			connected_message("Клон извлечён: недостаточно энергии.")
		end_processing()
	else //Turned on
		begin_processing()

//Let's unlock this early I guess.  Might be too early, needs tweaking. Mark says: Jesus, even I'm not that indecisive.
/obj/machinery/clonepod/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/reagent_containers) && !(W.item_flags & ABSTRACT) && W.is_open_container())
		var/obj/item/reagent_containers/B = W
		. = TRUE //no afterattack
		if(!user.transferItemToLoc(B, src))
			return
		var/reagentlist = pretty_string_from_reagent_list(W.reagents.reagent_list)
		replace_beaker(user, B)
		to_chat(user, "<span class='notice'>Вставляю [B] в [src].</span>")
		log_game("[key_name(user)] added an [W] to the [src] at [src.loc] containing [reagentlist]")
	if(!(occupant || mess))
		if(default_deconstruction_screwdriver(user, "[icon_state]_maintenance", "[initial(icon_state)]",W))
			return

	if(default_deconstruction_crowbar(W))
		return

	if(W.tool_behaviour == TOOL_MULTITOOL)
		if(!multitool_check_buffer(user, W))
			return
		var/obj/item/multitool/P = W

		if(istype(P.buffer, /obj/machinery/computer/cloning))
			if(get_area(P.buffer) != get_area(src))
				to_chat(user, "<font color = #666633>-% Невозможно связать машины через зоны электропитания. Буфер очищен %-</font color>")
				P.buffer = null
				return
			to_chat(user, "<font color = #666633>-% Подключено [P.buffer] к [src] %-</font color>")
			var/obj/machinery/computer/cloning/comp = P.buffer
			if(connected)
				connected.DetachCloner(src)
			comp.AttachCloner(src)
		else
			P.buffer = src
			to_chat(user, "<font color = #666633>-% Данные [REF(P.buffer)] [P.buffer.name] сохранены в буфер %-</font color>")
		return

	var/mob/living/mob_occupant = occupant
	if(W.GetID())
		if(!check_access(W))
			to_chat(user, "<span class='danger'>Доступ запрещён.</span>")
			return
		if(!(mob_occupant || mess))
			to_chat(user, "<span class='danger'>В капсуле никого нет.</span>")
			return
		else
			add_fingerprint(user)
			connected_message("Аварийное извлечение")
			SPEAK("Клон [clonemind.name] был досрочно извлечён из капсулы. Выживаемость не гарантируется.")
			to_chat(user, "<span class='notice'>Экстренно вытаскиваю клона из капсулы.</span>")
			go_out()
			log_cloning("[key_name(user)] manually ejected [key_name(mob_occupant)] from [src] at [AREACOORD(src)].")
			log_combat(user, mob_occupant, "ejected", W, "from [src]")
	else
		return ..()

/obj/machinery/clonepod/emag_act(mob/user)
	if(!occupant)
		return
	to_chat(user, "<span class='warning'>Повреждаю генетический компилятор.</span>")
	malfunction()
	add_fingerprint(user)
	log_cloning("[key_name(user)] emagged [src] at [AREACOORD(src)], causing it to malfunction.")
	if(user)
		log_combat(user, src, "emagged", null, occupant ? "[occupant] inside, killing them via malfunction." : null)

//Put messages in the connected computer's temp var for display.
/obj/machinery/clonepod/proc/connected_message(message)
	if ((isnull(connected)) || (!istype(connected, /obj/machinery/computer/cloning)))
		return FALSE
	if (!message)
		return FALSE

	connected.temp = message
	connected.updateUsrDialog()
	return TRUE

/obj/machinery/clonepod/proc/go_out()
	countdown.stop()
	var/mob/living/mob_occupant = occupant
	var/turf/T = get_turf(src)

	if(mess) //Clean that mess and dump those gibs!
		for(var/obj/fl in unattached_flesh)
			fl.forceMove(T)
			if(istype(fl, /obj/item/organ))
				var/obj/item/organ/O = fl
				O.organ_flags &= ~ORGAN_FROZEN
		unattached_flesh.Cut()
		mess = FALSE
		new /obj/effect/gibspawner/generic(get_turf(src), mob_occupant)
		audible_message("<span class='hear'>Слышу как что-то плюхается.</span>")
		icon_state = "pod_0"
		return

	if(!mob_occupant)
		return
	REMOVE_TRAIT(mob_occupant, TRAIT_STABLEHEART, CLONING_POD_TRAIT)
	REMOVE_TRAIT(mob_occupant, TRAIT_STABLELIVER, CLONING_POD_TRAIT)
	REMOVE_TRAIT(mob_occupant, TRAIT_EMOTEMUTE, CLONING_POD_TRAIT)
	REMOVE_TRAIT(mob_occupant, TRAIT_MUTE, CLONING_POD_TRAIT)
	REMOVE_TRAIT(mob_occupant, TRAIT_NOCRITDAMAGE, CLONING_POD_TRAIT)
	REMOVE_TRAIT(mob_occupant, TRAIT_NOBREATH, CLONING_POD_TRAIT)

	if(grab_ghost_when == CLONER_MATURE_CLONE)
		mob_occupant.grab_ghost()
		to_chat(occupant, "<span class='notice'><b>ЯРКО!</b><br><i>Похоже теперь я в новом теле.</i></span>")
		mob_occupant.flash_act()

	occupant.forceMove(T)
	icon_state = "pod_0"
	mob_occupant.domutcheck(1) //Waiting until they're out before possible monkeyizing. The 1 argument forces powers to manifest.
	for(var/fl in unattached_flesh)
		qdel(fl)
	unattached_flesh.Cut()

	occupant = null
	clonemind = null

/obj/machinery/clonepod/proc/malfunction()
	var/mob/living/mob_occupant = occupant
	if(mob_occupant)
		connected_message("Критический сбой!")
		SPEAK("Критический сбой системы клонирования.")
		mess = TRUE
		maim_clone(mob_occupant)	//Remove every bit that's grown back so far to drop later, also destroys bits that haven't grown yet
		icon_state = "pod_g"
		if(clonemind && mob_occupant.mind != clonemind)
			clonemind.transfer_to(mob_occupant)
		mob_occupant.grab_ghost() // We really just want to make you suffer.
		flash_color(mob_occupant, flash_color="#960000", flash_time=100)
		to_chat(mob_occupant, "<span class='warning'><b>Агония пронзает ваше сознание, когда ваше тело разрывается на части.</b><br><i>Так ли это, как умереть? Да это так.</i></span>")
		playsound(src, 'sound/machines/warning-buzzer.ogg', 50)
		SEND_SOUND(mob_occupant, sound('sound/hallucinations/veryfar_noise.ogg',0,1,50))
		log_cloning("[key_name(mob_occupant)] destroyed within [src] at [AREACOORD(src)] due to malfunction.")
		QDEL_IN(mob_occupant, 40)

/obj/machinery/clonepod/relaymove(mob/user)
	container_resist_act(user)

/obj/machinery/clonepod/container_resist_act(mob/living/user)
	if(user.stat == CONSCIOUS)
		go_out()

/obj/machinery/clonepod/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_SELF))
		var/mob/living/mob_occupant = occupant
		if(mob_occupant && prob(100/(severity*efficiency)))
			connected_message(Gibberish("Извлечение клона из-за ЭМИ излучения"))
			SPEAK(Gibberish("Воздействие электромагнитных полей вызвало выброс [mob_occupant.real_name] из капсулы."))
			go_out()
			log_cloning("[key_name(mob_occupant)] ejected from [src] at [AREACOORD(src)] due to EMP pulse.")

/obj/machinery/clonepod/ex_act(severity, target)
	..()
	if(!QDELETED(src) && occupant)
		var/mob/living/mob_occupant = occupant
		go_out()
		log_cloning("[key_name(mob_occupant)] ejected from [src] at [AREACOORD(src)] due to explosion.")

/obj/machinery/clonepod/handle_atom_del(atom/A)
	if(A == occupant)
		occupant = null
		countdown.stop()

/obj/machinery/clonepod/proc/horrifyingsound()
	for(var/i in 1 to 5)
		playsound(src,pick('sound/hallucinations/growl1.ogg','sound/hallucinations/growl2.ogg','sound/hallucinations/growl3.ogg'), 100, (rand(95,105) * 0.01))
		sleep(1)
	sleep(10)
	playsound(src,'sound/hallucinations/wail.ogg', 100, TRUE)

/obj/machinery/clonepod/deconstruct(disassembled = TRUE)
	if(beaker)
		beaker.forceMove(drop_location())
		beaker = null
	if(occupant)
		var/mob/living/mob_occupant = occupant
		go_out()
		log_cloning("[key_name(mob_occupant)] ejected from [src] at [AREACOORD(src)] due to deconstruction.")
	..()

/obj/machinery/clonepod/proc/maim_clone(mob/living/carbon/human/H)
	if(!unattached_flesh)
		unattached_flesh = list()
	else
		for(var/fl in unattached_flesh)
			qdel(fl)
		unattached_flesh.Cut()

	H.setCloneLoss(CLONE_INITIAL_DAMAGE)     //Yeah, clones start with very low health, not with random, because why would they start with random health
	// In addition to being cellularly damaged, they also have no limbs or internal organs.
	// Applying brainloss is done when the clone leaves the pod, so application of traumas can happen
	// based on the level of damage sustained.

	if(!HAS_TRAIT(H, TRAIT_NODISMEMBER))
		var/static/list/zones = list(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
		for(var/zone in zones)
			var/obj/item/bodypart/BP = H.get_bodypart(zone)
			if(BP)
				BP.drop_limb()
				BP.forceMove(src)
				unattached_flesh += BP

	for(var/o in H.internal_organs)
		var/obj/item/organ/organ = o
		if(!istype(organ) || (organ.organ_flags & ORGAN_VITAL))
			continue
		organ.organ_flags |= ORGAN_FROZEN
		organ.Remove(H, special=TRUE)
		organ.forceMove(src)
		unattached_flesh += organ

	flesh_number = unattached_flesh.len

/obj/machinery/clonepod/mapped

/obj/machinery/clonepod/mapped/Initialize()
	. = ..()
	beaker = new /obj/item/reagent_containers/glass/beaker/large(src)
	beaker.reagents.add_reagent(/datum/reagent/medicine/synthflesh, 100)

/*
 *	Manual -- A big ol' manual.
 */

/obj/item/paper/guides/jobs/medical/cloning
	name = "paper - 'H-87 Cloning Apparatus Manual"
	info = {"<meta charset='utf-8'><h4>Начало работы</h4>
	Поздравляем, вы приобрели промышленное клонирующее устройство H-87!<br>
	Использование H-87 почти так же просто, как операция на головном мозге! Просто поместите целевого гуманоида в камеру сканирования и выберите опцию сканирования, чтобы создать новый профиль!<br>
	<b>Это все!</b><br>
	<i>Обратите внимание, система клонирования не может сканировать неорганическую жизнь или мелких приматов. Сканирование может завершиться ошибкой, если у субъекта серьезно поврежден мозг.</i><br>
	<p>Профили клонов можно просмотреть в меню профилей. Сканирование имплантирует дополнительный ИМПЛАНТАТ МОНИТОРА ЗДОРОВЬЯ в субъект, который можно просматривать из каждого профиля.
	Удаление профиля было автоматически ограничено доступом на уровне \[Капитан\].</p>
	<h4>Клонирование из профиля</h4>
	Для клонирования достаточно нажать кнопку CLONE в нижней части нужного профиля.<br>
	По результатам слушаний по делу о конфиденциальности и идентификации в 2102 году H-87 было запрещено клонировать людей, пока они еще живы.<br>
	<br>
	<p>Предоставленная СИСТЕМА CLONEPOD создаст желаемый клон. Стандартное время созревания клона (с технологией SPEEDCLONE) составляет примерно 90 секунд.
	Клонирующая капсула может быть разблокирована раньше с любым идентификатором \[Медицинский исследователь\] после завершения первоначального созревания.</p><br>
	<i>Обратите внимание, что полученные клоны могут иметь небольшой ДЕФЕКТ РАЗВИТИЯ в результате генетического дрейфа.</i><br>
	<h4>Управление профилями</h4>
	<p>H-87 (как и любой другой стандартный генетический аппарат TTEK) может принимать СТАНДАРТНЫЕ ДИСКЕТЫ С ДАННЫМИ.
	Эти дискеты используются для передачи генетической информации между машинами и профилями.
	Диалоговое окно загрузки/сохранения станет доступным в каждом профиле, если вставлен диск.</p><br>
	<i>Хорошая дискета — отличный способ противостоять вышеупомянутому генетическому дрейфу!</i><br>
	<br>
	<font size=1>Эта технология произведена по лицензии Thinktronic Systems, LTD.</font>"}

#undef CLONE_INITIAL_DAMAGE
#undef SPEAK
#undef MINIMUM_HEAL_LEVEL
