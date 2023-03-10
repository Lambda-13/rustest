// You n'wah!
// many thanks to https://casualscrolls.fandom.com/wiki/Dunmeri_language, for providing this list of syllables
/datum/language/shadowtongue
	name = "Теневой"
	desc = "Какая величественная и опьяняющая невинность."
	speech_verb = "шепчет"
	ask_verb = "шепчет"
	exclaim_verb = "громко шепчет"
	sing_verb = "прошепчивает"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD //WS Edit- Language icon hiding
	key = "x"
	space_chance = 50
	syllables = list(
		"ер", "синт", "ен", "ет", "нор", "бахр", "синт", "ун", "ку'елм", "лакор", "ери",
		"ной", "дашилу", "ас", "от", "лих", "морх", "гхину", "кин", "ша", "марик", "йибу",
		"судас", "фут", "кол", "биви", "похим", "девохр", "ру", "хуирф", "неирис", "сут",
		"девэр", "иру", "гхер", "ган", "уйил", "лацор", "бахрис", "гхар", "алнеф", "вах",
		"хурдхар", "бар", "ет", "илу", "даш", "диру", "ной", "де", "дамюлан", "лувахр",
		"телшахр", "тифур", "енхи", "ам", "бахр", "неи", "неибахри", "н'чов", "н'вах",
		"с'вит", "б'вэк", "ф'лах", "мутх", "сера", "седура", "бал", "дун"
	)
	icon_state = "shadow"
	default_priority = 90
