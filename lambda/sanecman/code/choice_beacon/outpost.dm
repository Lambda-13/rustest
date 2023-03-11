// Пиздюлегенератор с вайта
// https://github.com/frosty-dev/white/commit/a878db603ba5ae7275d600088eaf1d78116c49e8
// Как работает:
// 1. Привязываете карточку
// 2. Пиздите
// 3. Получаете деньги или очки

/obj/structure/punching_bag/trade
	name = "ударогенератор"
	desc = "Лучшее, что создало человечество. Работает за счёт превращения кинетической энергии в денежную."
	anchored = FALSE
	armor = list(MELEE = 20, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 10, BIO = 100, RAD = 100, FIRE = 70, ACID = 100)
	maptext_y = 24
	var/tier = 1 // Уровни
	var/exp = 0 // Деньги за удар
	var/datum/bank_account/linked_account

/obj/structure/punching_bag/trade/examine(mob/user)
	. = ..()
	. += "<hr><span class='notice'>Производительность: <b>[tier]</b></span>"
	. += span_notice("\nОпыт: <b>[exp]</b>")
	. += span_notice("\nПривязанный аккаунт: <b>[linked_account.account_holder]</b>.")

/obj/structure/punching_bag/trade/attack_hand(mob/user as mob)
	. = ..()
	if(.)
		return
	if(!linked_account)
		to_chat(user, span_warning("Надо бы для начала привязать свою карточку!"))
		return
	linked_account?.adjust_money(tier)
	exp++
	maptext = MAPTEXT("[exp]")
	user.adjustStaminaLoss(tier)
	playsound(L, 'sound/machines/shower/shower_mid1.ogg', 90, TRUE)
	if(exp >= 100 * tier)
		tier++
		exp = 0
		say("Новый уровень! Теперь производим [tier] кредит[get_num_string(tier)] за удар.")

/obj/structure/punching_bag/trade/attackby(obj/item/I, mob/living/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/acard = I
		if(acard.registered_account)
			linked_account = acard.registered_account
			to_chat(user, span_notice("Привязываю карту к удароегенератору."))
			return
		to_chat(user, span_warning("На карте нет аккаунта!"))
		return

	. = ..()
