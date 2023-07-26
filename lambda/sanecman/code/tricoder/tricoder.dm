/*

CONTAINS:
TRICORDER

*/



//Tricorder
//The tricorder is a child of a multitool for the sole purpose to make it work with Tcomms

/obj/item/multitool/tricorder
	name = "трикодер"
	desc = "Многофункциональное устройство, которое может выполнять огромный спектр задач."
	icon_state = "tricorder"
	inhand_icon_state = "tricorder"
	icon = 'lambda/sanecman/icons/tricorder.dmi'
	lefthand_file = 'lambda/sanecman/icons/mob/valtos_lefthand.dmi'
	righthand_file = 'lambda/sanecman/icons/mob/valtos_righthand.dmi'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	item_flags = NOBLUDGEON
	tool_behaviour = TOOL_MULTITOOL
	usesound = 'sound/weapons/etherealhit.ogg'
	toolspeed = 0.2
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	custom_materials = list(/datum/material/iron = 500, /datum/material/silver = 300, /datum/material/gold = 300)

	var/medicalTricorder = FALSE	//Set to TRUE for normal medical scanner, set to FALSE for a gutted version


/obj/item/multitool/tricorder/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] пробует провести глубокий анализ себя!"))
	return BRUTELOSS


//Tricorder differentiates from slimes and nonslimes
/obj/item/multitool/tricorder/attack(mob/living/M, mob/living/user, obj/item/I)
	add_fingerprint(user)
	var/turf/U = get_turf(I)
	if(U)
		atmosanalyzer_scan(U.return_air(), user, I)
	if(user.stat || user.eye_blind)
		return
	if (isslime(M))
		var/mob/living/simple_animal/slime/T = M
		slime_scan(T, user)
	else if (medicalTricorder)
		healthscan(user, M)
		return
	else
		lesserhealthscan(user, M)
		return

//Gas Analyzer Tank Scan
/obj/item/multitool/tricorder/afterattack(atom/A as obj, mob/user, proximity)
	if(!proximity)
		return
	A.analyzer_act(user, src)

//Gas Analyzer Turf Scan
/obj/item/multitool/tricorder/attack_self(mob/user)
	scangasses(user)

//If medicalTricorder is set to FALSE then the tricorder will not be as effective as a regular medical scanner
/obj/item/proc/lesserhealthscan(mob/user, mob/living/M)
	if(isliving(user) && (user.incapacitated() || user.eye_blind))
		return
	//Damage specifics
	var/oxy_damage = M.getOxyLoss()
	var/tox_damage = M.getToxLoss()
	var/fire_damage = M.getFireLoss()
	var/brute_damage = M.getBruteLoss()
	var/brain_status = M.getOrganLoss(ORGAN_SLOT_BRAIN)

	// Status Readout
	// Tricorder can detect damage but can only give estimates in most cases
	//Temperature
	to_chat(user, span_info("Температура тела: [round(M.bodytemperature-T0C,0.1)] &deg;C ([round(M.bodytemperature*1.8-459.67,0.1)] &deg;F)"))
	//Brute
	to_chat(user, "\t <font class='red'>*</font>Физический: <font class ='orange'>[brute_damage > 100 ? "<font class='red'>Критический</font>" : brute_damage > 75 ? "Серьёзный" : brute_damage > 50 ? "Высокий" : brute_damage > 25 ? "Средний" : brute_damage > 0 ? "Низкий" : "<font class='blue'>Нулевой</font>"] уровень</font></span>")
	//Burn
	to_chat(user, "\t <font color='#FF8000'>*</font>Ожоги: <font class ='orange'>[fire_damage > 100 ? "<font class='red'>Критический</font>" : fire_damage > 75 ? "Серьёзный" : fire_damage > 50 ? "Высокий" : fire_damage > 25 ? "Средний" : fire_damage > 0 ? "Низкий" : "<font class='blue'>Нулевой</font>"] уровень</font></span>")
	//Oxygen
	to_chat(user, "\t <font class='blue'>*</font>Кислород: <font class ='orange'>[oxy_damage > 100 ? "<font class='red'>Критический</font>" : oxy_damage > 75 ? "Опасный" : oxy_damage > 50 ? "Низкий" : oxy_damage > 25 ? "Средний" : oxy_damage > 0 ? "Высокий" : "<font class='blue'>Нормальный</font>"] уровень</font></span>")
	//Toxin
	to_chat(user, "\t <font class='green'>*</font>Токсины: <font class ='orange'>[tox_damage > 100 ? "<font class='red'>Критический</font>" : tox_damage > 75 ? "Серьёзный" : tox_damage > 50 ? "Высокий" : tox_damage > 25 ? "Средний" : tox_damage > 0 ? "Низкий" : "<font class='blue'>Нулевой</font>"] уровень</font></span>")
	//Brain
	to_chat(user, "\t <font class='Fuchsia'>*</font>Мозг: <font class ='orange'>[brain_status >= 200 ? "<font class='red'>Не обнаружено</font>" : brain_status > 100 ? "Почти не целый" : brain_status > 0 ? "Почти целый" : "<font class='blue'>Целый</font>"]</font></span>")
	//Radiation
	to_chat(user, "\t <font class='yellow'>*</font>Облучение: [M.radiation ? "<font class='red'>[M.radiation]</font>" : "<font class='blue'>Нет</font>"]</span>")
