//nutrition
/datum/mood_event/fat
	description = "<span class='warning'><B>Я жирный...</B></span>\n" //muh fatshaming
	mood_change = -6

/datum/mood_event/wellfed
	description = "<span class='nicegreen'>Наелся</span>\n"
	mood_change = 8

/datum/mood_event/fed
	description = "<span class='nicegreen'>Недавно покушал</span>\n"
	mood_change = 5

/datum/mood_event/hungry
	description = "<span class='warning'>Немного голоден</span>\n"
	mood_change = -6

/datum/mood_event/starving
	description = "<span class='boldwarning'>Голодаю!</span>\n"
	mood_change = -10

//charge
/datum/mood_event/supercharged
	description = "<span class='boldwarning'>Я чувствую мощь внутри себя которую не могу сдерживать так долго!</span>\n"
	mood_change = -10

/datum/mood_event/overcharged
	description = "<span class='warning'>Я немного перенапряжён, думаю нужно немного остудить свой пыл</span>\n" //Словарь по русскому языку где?
	mood_change = -4

/datum/mood_event/charged
	description = "<span class='nicegreen'>Чувствую мощь в своих мышцах!</span>\n"
	mood_change = 6

/datum/mood_event/lowpower
	description = "<span class='warning'>Моя энергия на исходе, мне стоит немного подзарядиться</span>\n"
	mood_change = -6

/datum/mood_event/decharged
	description = "<span class='boldwarning'>Мне нужно подзарядиться!</span>\n"
	mood_change = -10

//Disgust
/datum/mood_event/gross
	description = "<span class='warning'>Мне плохо</span>\n"
	mood_change = -4

/datum/mood_event/verygross
	description = "<span class='warning'>Тошнит...</span>\n"
	mood_change = -6

/datum/mood_event/disgusted
	description = "<span class='boldwarning'>Отвратительно...</span>\n"
	mood_change = -8

/datum/mood_event/disgust/bad_smell
	description = "<span class='warning'>Воняет гнилью</span>\n"
	mood_change = -6

/datum/mood_event/disgust/nauseating_stench
	description = "<span class='warning'>Меня мутит от сильной вони гнили!</span>\n"
	mood_change = -12

//Generic needs events
/datum/mood_event/favorite_food
	description = "<span class='nicegreen'>Вкусно поел</span>\n"
	mood_change = 5
	timeout = 4 MINUTES

/datum/mood_event/gross_food
	description = "<span class='warning'>На вкус не очень</span>\n"
	mood_change = -2
	timeout = 4 MINUTES

/datum/mood_event/disgusting_food
	description = "<span class='warning'>Эта еда на вкус как мусор!</span>\n"
	mood_change = -6
	timeout = 4 MINUTES

/datum/mood_event/breakfast
	description = "<span class='nicegreen'>Нет ничего лучше чем хороший перекус в начале путешествия</span>\n"
	mood_change = 2
	timeout = 10 MINUTES

/datum/mood_event/nice_shower
	description = "<span class='nicegreen'>Это был хороший душ</span>\n"
	mood_change = 4
	timeout = 5 MINUTES

/datum/mood_event/fresh_laundry
	description = "<span class='nicegreen'>Эта одежда выглядит идеально чистой</span>\n"
	mood_change = 2
	timeout = 10 MINUTES
