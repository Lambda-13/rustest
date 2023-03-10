/datum/language/calcic
	name = "Кальциевый"
	desc = "Разъединенный и отрывистый язык плазмамена. Также понимают скелеты."
	speech_verb = "клацает"
	ask_verb = "скляцивает"
	exclaim_verb = "громко клацает"
	whisper_verb = "шепчет"
	sing_verb = "наклацивает"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD //WS Edit- Language icon hiding
	key = "b"
	space_chance = 10
	syllables = list(
		"к", "цк", "ацк", "ицк", "цл", "тк", "ск", "иск", "так",
		"кл", "хс", "сс", "кс", "лк", "дк", "гк", "ка", "ска", "ла", "пк",
		"вк", "ак", "ик", "ип", "ски", "бк", "кб", "та", "ис", "ит", "ли", "ди",
		"дс", "я", "сцк", "црк", "хс", "вс", "мк", "ааа", "скраа", "скее", "хсс",
		"раа", "клк", "тк", "стк", "цлк"
	)
	icon_state = "calcic"
	default_priority = 90

// Yeah, this goes to skeletons too, since it's basically just skeleton clacking.
