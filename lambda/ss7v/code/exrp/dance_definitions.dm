/datum/interaction/assslap
	command = "assslap"
	description = "Шлёпнуть по заднице"
	simple_message = "USER шлёпает TARGET по заднице!"
	simple_style = "danger"
	needs_physical_contact = TRUE
	write_log_user = "ass-slapped"
	write_log_target = "was ass-slapped by"

/datum/interaction/assslap/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	playsound(get_turf(target), 'lambda/ss7v/sounds/exrp/interactions/slap.ogg', 50, 1, -1)

/datum/interaction/dancero
	command = "dancero"
	description = "Отполировать пельмешку"
	require_user_mouth = TRUE
	require_target_danceress = TRUE
	write_log_user = "gave head to"
	write_log_target = "was given head by"
	user_not_tired = TRUE
	require_target_naked = TRUE
	write_log_user = "dancered"
	write_log_target = "was dancered by"

/datum/interaction/dancero/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_dancero")

/datum/interaction/dancero/dancejob
	command = "dancejob"
	description = "Отполировать огурец"
	require_target_danceress = FALSE
	require_target_dancer = TRUE
	target_not_tired = TRUE
	write_log_user = "dancejobed"
	write_log_target = "was dancejobed by"

/datum/interaction/dance
	command = "dance"
	description = "Раскромсать вареник"
	require_user_dancer = TRUE
	require_target_danceress = TRUE
	write_log_user = "danced"
	write_log_target = "was danced by"
	user_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	max_distance = 0
	write_log_user = "danced"
	write_log_target = "was danced by"

/datum/interaction/dance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_dance")

/datum/interaction/dancor
	command = "danceass"
	description = "Пробить шоколадницу"
	write_log_user = "tested"
	write_log_target = "was tested by"
	write_log_user = "ass-danced"
	write_log_target = "was ass-danced by"
	require_user_naked = TRUE
	require_target_naked = TRUE
	require_target_dancor = TRUE
	user_not_tired = TRUE
	require_user_dancer = TRUE
	max_distance = 0

/datum/interaction/dancor/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_dancor")


/datum/interaction/dancering
	command = "dancering"
	description = "Засунуть сигарету в пепельницу"
	require_user_hands = TRUE
	require_target_danceress = TRUE
	user_not_tired = TRUE
	require_target_naked = TRUE
	write_log_user = "dancered"
	write_log_target = "was dancered by"

/datum/interaction/dancering/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_dancering")

/datum/interaction/fingerdance
	command = "fingerdance"
	description = "Почесать шоколадный глаз"
	require_user_hands = TRUE
	require_target_dancor = TRUE
	user_not_tired = TRUE
	require_target_naked = TRUE
	write_log_user = "fingerdanced"
	write_log_target = "was fingerdanced by"

/datum/interaction/fingerdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_fingerdance")


/datum/interaction/facedance
	command = "facedance"
	description = "Проверить глубину проруби"
	require_target_mouth = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	max_distance = 0
	write_log_user = "face-danced"
	write_log_target = "was face-danced by"

/datum/interaction/facedance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_facedance")

/datum/interaction/throatdance
	command = "throatdance"
	description = "Утопить муму в проруби"
	require_user_dancer = TRUE
	require_target_mouth = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	max_distance = 0
	write_log_user = "throat-danced"
	write_log_target = "was throat-danced by"

/datum/interaction/throatdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_throatdance")

/datum/interaction/handdance
	command = "handdance"
	description = "Потрогать ствол"
	require_user_hands = TRUE
	require_target_dancer = TRUE
	target_not_tired = TRUE
	require_target_naked = TRUE
	write_log_user = "danced-off"
	write_log_target = "was danced-off by"

/datum/interaction/handdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_handdance")

/datum/interaction/breastdance
	command = "breastdance"
	description = "Проскользить между двух горок"
	require_user_dancer = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	require_target_danceress = TRUE
	max_distance = 0
	write_log_user = "breast-danced"
	write_log_target = "was breast-danced by"

/datum/interaction/breastdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_breastdance")

/datum/interaction/mount
	command = "mount"
	description = "Покататься на карусели"
	require_user_danceress = TRUE
	require_target_dancer = TRUE
	user_not_tired = TRUE
	target_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	max_distance = 0
	write_log_user = "rode"
	write_log_target = "was rode by"

/datum/interaction/mount/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_mount")

/datum/interaction/assdance
	command = "assdance"
	description = "Присесть пончиком на выступ"
	require_user_dancor = TRUE
	require_target_dancer = TRUE
	user_not_tired = TRUE
	target_not_tired = TRUE
	require_user_naked = TRUE
	require_target_naked = TRUE
	max_distance = 0
	write_log_user = "assdance"
	write_log_target = "was assdance by"

/datum/interaction/assdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_assdance")

/datum/interaction/rimdance
	command = "rimdance"
	description = "Скушать шоколад"
	require_user_mouth = TRUE
	require_target_dancor = TRUE
	user_not_tired = TRUE
	require_target_naked = TRUE
	max_distance = 0
	write_log_user = "rimdanced"
	write_log_target = "was rimdanced by"

/datum/interaction/rimdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_rimdance")

/datum/interaction/mountdance
	command = "mountdance"
	description = "Промариновать лимончик"
	require_target_mouth = TRUE
	require_user_dancor = TRUE
	user_not_tired = TRUE
	require_user_naked = TRUE
	max_distance = 0
	write_log_user = "made-them-rim"
	write_log_target = "was made-to-rim by"

/datum/interaction/mountdance/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_mountdance")

/datum/interaction/danceface
	command = "danceface"
	description = "Дать понюхать ноги"
	require_target_mouth = TRUE
	max_distance = 0
	write_log_user = "feet-faced"
	write_log_target = "had feet grinded against their face by"

/datum/interaction/danceface/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_danceface")

/datum/interaction/dancemouth
	command = "dancemouth"
	description = "Угостить пальцами ног"
	require_target_mouth = TRUE
	max_distance = 0
	write_log_user = "feet-mouthed"
	write_log_target = "had feet grinding against their tongue by"

/datum/interaction/dancemouth/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_dancemouth")

/datum/interaction/eggs
	command = "eggs"
	description = "Накормить яишницей"
	require_user_naked = TRUE
	require_user_dancer = TRUE
	require_target_mouth = TRUE
	max_distance = 0
	write_log_user = "make-them-eat-some-eggs"
	write_log_target = "was made to eat eggs by"

/datum/interaction/eggs/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_eggs")

/datum/interaction/thighs
	command = "thighs"
	description = "Взять в захват ногами"
	max_distance = 0
	require_user_naked = TRUE
	require_target_mouth = TRUE
	write_log_user = "thigh-trapped"
	write_log_target = "was smothered by"

/datum/interaction/thighs/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.do_dance(target, "do_thighs")
