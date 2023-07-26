/datum/design/board/deepcore_drill
	name = "Бур глубокого погружения"
	desc = "Мощная машина, которая способна извлекать руду из недр планеты."
	id = "deepcore_drill"
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/deepcore/drill
	category = list ("Imported","Misc. Machinery")
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/board/deepcore_hopper
	name = "Блюспейс рудоприемник"
	desc = "Машина, предназначенная для приема руды от любых подключенных к ней буров глубокого погружения посредством блюспейс телепортации."
	id = "deepcore_hopper"
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/deepcore/hopper
	category = list ("Imported","Misc. Machinery")
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/deepcore_pinpointer
	name = "глубинный пинпоинтер"
	desc = "Ручной прибор для поиска ресурсов глубоко под поверхностью."
	id = "deepcore_pinpointer"
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/pinpointer/deepcore
	category = list("Mining Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/deepcore_pinpointer_advanced
	name = "Продвинутый глубинный пинпоинтер"
	desc = "A sophisticated dowsing utility for locating specific materials at any depth."
	id = "deepcore_pinpointer_advanced"
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000, /datum/material/diamond = 1000)
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/pinpointer/deepcore/advanced
	category = list("Mining Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO
