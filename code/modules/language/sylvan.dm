// The language of the podpeople. Yes, it's a shameless ripoff of elvish.
/datum/language/sylvan
	name = "Сильванский"
	desc = "Сложный древний язык, на котором говорят живые растения."
	speech_verb = "шелестит"
	ask_verb = "прошелестивает"
	exclaim_verb = "громко шелестит"
	sing_verb = "навевает"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD //WS Edit- Language icon hiding
	key = "h"
	space_chance = 20
	syllables = list(
		"фии", "сии", "рии", "рел", "маа", "ала", "сан", "тол", "ток", "диа", "ерес",
		"фал", "тис", "бис", "qел", "арас", "лоск", "раса", "еоб", "хил", "танл", "аере",
		"фер", "бал", "пии", "дала", "бан", "фое", "доа", "ции", "уис", "мел", "веx",
		"инцас", "инт", "елц", "ент", "авс", "qип", "нас", "вил", "йенс", "дила", "фа",
		"ла", "ре", "до", "йи", "ае", "со", "qе", "це", "на", "мо", "ха", "ю"
	)
	icon_state = "plant"
	default_priority = 90
