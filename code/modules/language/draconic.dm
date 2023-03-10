/datum/language/draconic
	name = "Драконий"
	desc = "Общий язык людей-ящериц, состоящий из свистящего шипения и хрипов."
	speech_verb = "шипит"
	ask_verb = "прошипивает"
	exclaim_verb = "рычит"
	sing_verb = "нашипевает"
	key = "o"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD //WS Edit- Language icon hiding
	space_chance = 40
	syllables = list(
		"за", "аз", "зе", "ез", "зи", "из", "зо", "оз", "зу", "уз", "зс", "сз",
		"ха", "ах", "хе", "э", "хи", "их", "хо", "ох", "ху", "ух", "хс", "ш",
		"ла", "ал", "ле", "ел", "ли", "ил", "ло", "ол", "лу", "ул", "лс", "сл",
		"ка", "ак", "ке", "ек", "ки", "ик", "ко", "ок", "ку", "ук", "кс", "ск",
		"са", "ас", "се", "ес", "си", "ис", "со", "ос", "су", "ус", "сс", "сс",
		"ра", "ар", "ре", "ер", "ри", "ир", "ро", "ор", "ру", "ур", "рс", "ср",
		"а",  "а",  "е",  "е",  "и",  "и",  "о",  "о",  "у",  "у",  "с",  "с"
	)
	icon_state = "lizard"
	default_priority = 90
