/datum/mood_event/drunk
	mood_change = 3
	description = "<span class='nicegreen'>После первой и второй перерывчик небольшой</span>\n"

/datum/mood_event/drunk/add_effects(param)
	// Display blush visual
	ADD_TRAIT(owner, TRAIT_BLUSHING, "[type]")
	owner.update_body()

/datum/mood_event/drunk/remove_effects()
	// Stop displaying blush visual
	REMOVE_TRAIT(owner, TRAIT_BLUSHING, "[type]")
	owner.update_body()

/datum/mood_event/quality_nice
	description = "<span class='nicegreen'>На вкус напиток ничего</span>\n"
	mood_change = 2
	timeout = 7 MINUTES

/datum/mood_event/quality_good
	description = "<span class='nicegreen'>Приятно выпил</span>\n"
	mood_change = 4
	timeout = 7 MINUTES

/datum/mood_event/quality_verygood
	description = "<span class='nicegreen'>Вкусно попил!</span>\n"
	mood_change = 6
	timeout = 7 MINUTES

/datum/mood_event/quality_fantastic
	description = "<span class='nicegreen'>Прекрасно выпил!</span>\n"
	mood_change = 8
	timeout = 7 MINUTES

/datum/mood_event/amazingtaste
	description = "<span class='nicegreen'>Не передаваемый вкус!</span>\n"
	mood_change = 50
	timeout = 10 MINUTES
