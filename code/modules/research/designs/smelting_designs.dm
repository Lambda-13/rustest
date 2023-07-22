///////SMELTABLE ALLOYS///////

/datum/design/plasteel_alloy
	name = "Пласталь: Железо + Плазма"
	desc = "Пласталь является сплавом железа и плазмы. Благодаря отличной прочности и недороговизне этот новомодный сплав завоевал сердца многих инженеров."
	id = "plasteel"
	build_type = SMELTER | PROTOLATHE
	materials = list(/datum/material/iron = MINERAL_MATERIAL_AMOUNT, /datum/material/plasma = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/plasteel
	category = list("initial", "Stock Parts")
	maxstack = 50


/datum/design/plastitanium_alloy
	name = "Пластитаниум: Титан + Плазма"
	desc = "Пластитаниум является сплавом титана и плазмы. Довольно крепкий, однако из за новизны ученые еще не спроектировали основные производственные чертежи."
	id = "plastitanium"
	build_type = SMELTER | PROTOLATHE
	materials = list(/datum/material/titanium = MINERAL_MATERIAL_AMOUNT, /datum/material/plasma = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/plastitanium
	category = list("initial", "Stock Parts")
	maxstack = 50

/datum/design/plaglass_alloy
	name = "Плазмастекло: Стекло + Плазма"
	desc = "Стеклянный лист из плазмосиликатного сплава. Обладает отличной огнестойкостью и повышенной прочностью."
	id = "plasmaglass"
	build_type = SMELTER | PROTOLATHE
	materials = list(/datum/material/plasma = MINERAL_MATERIAL_AMOUNT * 0.5, /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/plasmaglass
	category = list("initial", "Stock Parts")
	maxstack = 50

/datum/design/plasmarglass_alloy
	name = "Армоплазмастекло: Железо + Стекло + Плазма"
	desc = "Стеклянный лист из плазмосиликатного сплава укрепленный металлической армосеткой. Обладает невероятной огнестойкостью и хорошей прочностью."
	id = "plasmareinforcedglass"
	build_type = SMELTER | PROTOLATHE
	materials = list(/datum/material/plasma = MINERAL_MATERIAL_AMOUNT * 0.5, /datum/material/iron = MINERAL_MATERIAL_AMOUNT * 0.5,  /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/plasmarglass
	category = list("initial", "Stock Parts")
	maxstack = 50

/datum/design/titaniumglass_alloy
	name = "Титановое стекло: Титан + Стекло"
	desc = "Стеклянный лист из титаносиликатного сплава."
	id = "titaniumglass"
	build_type = SMELTER | PROTOLATHE
	materials = list(/datum/material/titanium = MINERAL_MATERIAL_AMOUNT * 0.5, /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/titaniumglass
	category = list("initial", "Stock Parts")
	maxstack = 50

/datum/design/plastitaniumglass_alloy
	name = "Пластитановое стекло: Титан + Стекло + Плазма"
	desc = "Стеклянный лист из плазмотитано-силикатного сплава."
	id = "plastitaniumglass"
	build_type = SMELTER | PROTOLATHE
	materials = list(/datum/material/plasma = MINERAL_MATERIAL_AMOUNT * 0.5, /datum/material/titanium = MINERAL_MATERIAL_AMOUNT * 0.5, /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/plastitaniumglass
	category = list("initial", "Stock Parts")
	maxstack = 50

/datum/design/alienalloy
	name = "Инопланетный сплав"
	desc = "Загадочный материал с неизведанными свойствами."
	id = "alienalloy"
	build_type = PROTOLATHE | SMELTER
	materials = list(/datum/material/iron = 4000, /datum/material/plasma = 4000)
	build_path = /obj/item/stack/sheet/mineral/abductor
	category = list("Stock Parts","Imported")
