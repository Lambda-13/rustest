/datum/mood_event/high
	mood_change = 6
	description = "<span class='nicegreen'>Чувааааааааааак...Мои шарыыыыыыыыы...</span>\n"

/datum/mood_event/smoked
	description = "<span class='nicegreen'>Недавно курил</span>\n"
	mood_change = 2
	timeout = 6 MINUTES

/datum/mood_event/wrong_brand
	description = "<span class='warning'>Ненавижу эту марку сигарет</span>\n"
	mood_change = -2
	timeout = 6 MINUTES

/datum/mood_event/overdose
	mood_change = -8
	timeout = 5 MINUTES

/datum/mood_event/overdose/add_effects(drug_name)
	description = "<span class='warning'>Я перебрал с [drug_name]</span>\n"

/datum/mood_event/withdrawal_light
	mood_change = -2

/datum/mood_event/withdrawal_light/add_effects(drug_name)
	description = "<span class='warning'>Мне нужно ещё [drug_name]</span>\n"

/datum/mood_event/withdrawal_medium
	mood_change = -5

/datum/mood_event/withdrawal_medium/add_effects(drug_name)
	description = "<span class='warning'>Мне срочно нужно ещё [drug_name]</span>\n"

/datum/mood_event/withdrawal_severe
	mood_change = -8

/datum/mood_event/withdrawal_severe/add_effects(drug_name)
	description = "<span class='boldwarning'>Мне РЕАЛЬНО нужно ещё [drug_name]</span>\n"

/datum/mood_event/withdrawal_critical
	mood_change = -10

/datum/mood_event/withdrawal_critical/add_effects(drug_name)
	description = "<span class='boldwarning'>[drug_name]! [drug_name]! [drug_name]!</span>\n"

/datum/mood_event/happiness_drug
	description = "<span class='nicegreen'>Ничего не чувствую...</span>\n"
	mood_change = 50

/datum/mood_event/happiness_drug_good_od
	description = "<span class='nicegreen'>ДА! ДА!! ДА!!!</span>\n"
	mood_change = 100
	timeout = 30 SECONDS
	special_screen_obj = "mood_happiness_good"

/datum/mood_event/happiness_drug_bad_od
	description = "<span class='boldwarning'>НЕТ! НЕТ!! НЕТ!!!</span>\n"
	mood_change = -100
	timeout = 30 SECONDS
	special_screen_obj = "mood_happiness_bad"

/datum/mood_event/narcotic_medium
	description = "<span class='nicegreen'>Приятно онемели конечности</span>\n"
	mood_change = 4
	timeout = 3 MINUTES

/datum/mood_event/narcotic_heavy
	description = "<span class='nicegreen'>Так мягко...</span>\n"
	mood_change = 9
	timeout = 3 MINUTES

/datum/mood_event/stimulant_medium
	description = "<span class='nicegreen'>У меня прилив энергии!</span>\n"
	mood_change = 4
	timeout = 3 MINUTES

/datum/mood_event/stimulant_heavy
	description = "<span class='nicegreen'>Ех Ха АААААХ! ХА ХА ХА ХА ХАА! Ухххх.</span>\n"
	mood_change = 6
	timeout = 3 MINUTES

/datum/mood_event/legion_good
	mood_change = 20
	description = "<span class='nicegreen'>Это было приятное ощущение!</span>\n"

/datum/mood_event/legion_bad
	mood_change = -20
	description = "<span class='warning'>Это было ужасное ощущение!</span>\n"
