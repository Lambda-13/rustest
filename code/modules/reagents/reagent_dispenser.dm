/obj/structure/reagent_dispensers
	name = "бак"
	desc = "В него обычно заливают что-то."
	icon = 'icons/obj/objects.dmi'
	icon_state = "water"
	density = TRUE
	anchored = FALSE
	pressure_resistance = 2*ONE_ATMOSPHERE
	max_integrity = 300
	var/tank_volume = 1000 //In units, how much the dispenser can hold
	var/reagent_id = /datum/reagent/water //The ID of the reagent that the dispenser uses

/obj/structure/reagent_dispensers/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	. = ..()
	if(. && obj_integrity > 0)
		if(tank_volume && (damage_flag == "bullet" || damage_flag == "laser"))
			boom()

/obj/structure/reagent_dispensers/attackby(obj/item/W, mob/user, params)
	if(W.is_refillable())
		return 0 //so we can refill them via their afterattack.
	else
		return ..()

/obj/structure/reagent_dispensers/Initialize()
	create_reagents(tank_volume, DRAINABLE | AMOUNT_VISIBLE)
	if(reagent_id)
		reagents.add_reagent(reagent_id, tank_volume)
	. = ..()

/obj/structure/reagent_dispensers/proc/boom()
	visible_message("<span class='danger'>[src] взрывается!</span>")
	chem_splash(loc, 5, list(reagents))
	qdel(src)

/obj/structure/reagent_dispensers/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(!disassembled)
			boom()
	else
		qdel(src)

/obj/structure/reagent_dispensers/watertank
	name = "бак с водой"
	desc = "Бак с фильтрованой водой."
	icon_state = "water"

/obj/structure/reagent_dispensers/watertank/high
	name = "большой бак с водой"
	desc = "Бак с фильтрованой водой. Теперь в 10 раз больше по ёмкости."
	icon_state = "water_high" //I was gonna clean my room...
	tank_volume = 100000

/obj/structure/reagent_dispensers/foamtank
	name = "бак с противопожарной пеной"
	desc = "Бак с противопожарной пеной для тушения."
	icon_state = "foam"
	reagent_id = /datum/reagent/firefighting_foam
	tank_volume = 500

/obj/structure/reagent_dispensers/fueltank
	name = "бак с топливом"
	desc = "Бак с топливом для сварочного аппарата."
	icon_state = "fuel"
	reagent_id = /datum/reagent/fuel

/obj/structure/reagent_dispensers/fueltank/boom()
	explosion(get_turf(src), 0, 1, 5, flame_range = 9)
	qdel(src)

/obj/structure/reagent_dispensers/fueltank/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/reagent_dispensers/fueltank/ex_act()
	boom()

/obj/structure/reagent_dispensers/fueltank/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/reagent_dispensers/fueltank/zap_act(zap_flags)
	..() //extend the zap
	if(ZAP_OBJ_DAMAGE & zap_flags)
		boom()

/obj/structure/reagent_dispensers/fueltank/bullet_act(obj/projectile/P)
	. = ..()
	if(!QDELETED(src)) //wasn't deleted by the projectile's effects.
		if(!P.nodamage && ((P.damage_type == BURN) || (P.damage_type == BRUTE)))
			log_bomber(P.firer, "detonated a", src, "via projectile")
			boom()

/obj/structure/reagent_dispensers/fueltank/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_WELDER)
		if(!reagents.has_reagent(/datum/reagent/fuel))
			to_chat(user, "<span class='warning'>[src] не содержит внутри себя топливо!</span>")
			return
		var/obj/item/weldingtool/W = I
		if(istype(W) && !W.welding)
			if(W.reagents.has_reagent(/datum/reagent/fuel, W.max_fuel))
				to_chat(user, "<span class='warning'>[W.name] уже заполнено!</span>")
				return
			reagents.trans_to(W, W.max_fuel, transfered_by = user)
			user.visible_message("<span class='notice'>[user] заправляет [user.p_their()] [W.name].</span>", "<span class='notice'>Заправляю топливом [W].</span>")
			playsound(src, 'sound/effects/refill.ogg', 50, TRUE)
			W.update_icon()
		else
			user.visible_message("<span class='danger'>[user] нагревает [user.p_their()] [I.name]! Сейчас взорвётся!</span>", "<span class='userdanger'>Щас ёбанет [pick("кажись", "")]...</span>")
			playsound(get_turf(src), 'lambda/sanecman/sound/steam_hit.ogg', 80, TRUE, 5)
			spawn(rand(30, 50))
				log_bomber(user, "detonated a", src, "via welding tool")
				boom()
		return
	return ..()


/obj/structure/reagent_dispensers/peppertank
	name = "бак с перцовкой"
	desc = "Настенный бак с капсиацином. Используется для показания закона в этом районе."
	icon_state = "pepper"
	anchored = TRUE
	density = FALSE
	reagent_id = /datum/reagent/consumable/condensedcapsaicin

/obj/structure/reagent_dispensers/water_cooler
	name = "куллер"
	desc = "Офисный куллер для питья воды."
	icon = 'icons/obj/vending.dmi'
	icon_state = "water_cooler"
	anchored = TRUE
	tank_volume = 500
	var/paper_cups = 25 //Paper cups left from the cooler

/obj/structure/reagent_dispensers/water_cooler/examine(mob/user)
	. = ..()
	if (paper_cups > 1)
		. += "Внутри ещё [paper_cups] стаканчиков."
	else if (paper_cups == 1)
		. += "Внутри ещё один стаканчик."
	else
		. += "Внутри нет стаканчиков."

/obj/structure/reagent_dispensers/water_cooler/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!paper_cups)
		to_chat(user, "<span class='warning'>Стаканчиков нет!</span>")
		return
	user.visible_message("<span class='notice'>[user] берёт стаканчик из [src].</span>", "<span class='notice'>Беру стаканчик из [src].</span>")
	var/obj/item/reagent_containers/food/drinks/sillycup/S = new(get_turf(src))
	user.put_in_hands(S)
	paper_cups--

/obj/structure/reagent_dispensers/beerkeg
	name = "пивная кега"
	desc = "Летит игриво."
	icon_state = "beer"
	reagent_id = /datum/reagent/consumable/ethanol/beer

/obj/structure/reagent_dispensers/beerkeg/blob_act(obj/structure/blob/B)
	explosion(src.loc,0,3,5,7,10)
	if(!QDELETED(src))
		qdel(src)


/obj/structure/reagent_dispensers/virusfood
	name = "раздатчик вирусной еды"
	desc = "Бак с едой для вирусов. Используется для слабой мутации вирусов."
	icon_state = "virus_food"
	anchored = TRUE
	density = FALSE
	reagent_id = /datum/reagent/consumable/virus_food


/obj/structure/reagent_dispensers/cooking_oil
	name = "чан с маслом"
	desc = "Большой чан с маслом для готовки."
	icon_state = "vat"
	anchored = TRUE
	reagent_id = /datum/reagent/consumable/cooking_oil

/obj/structure/reagent_dispensers/servingdish
	name = "миска с похлёбкой"
	desc = "Странное хрючево которому уже много лет. Всё ещё съедобно."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "serving"
	anchored = TRUE
	reagent_id = /datum/reagent/consumable/nutraslop

/obj/structure/reagent_dispensers/plumbed
	name = "расширенный бак с водой"
	anchored = TRUE
	icon_state = "water_stationairy"
	desc = "Бак с жидкостью. Можно подключить к водопроводу."

/obj/structure/reagent_dispensers/plumbed/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I)
	return TRUE

/obj/structure/reagent_dispensers/plumbed/ComponentInitialize()
	AddComponent(/datum/component/plumbing/simple_supply)

/obj/structure/reagent_dispensers/plumbed/storage
	name = "расширенный бак"
	icon_state = "tank_stationairy"
	reagent_id = null //start empty

/obj/structure/reagent_dispensers/plumbed/storage/ComponentInitialize()
	AddComponent(/datum/component/plumbing/tank)
