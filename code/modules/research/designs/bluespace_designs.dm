
/////////////////////////////////////////
///////////////Bluespace/////////////////
/////////////////////////////////////////

/datum/design/beacon
	name = "Телепортационный маяк"
	desc = "Миниатюрное устройство служащее фокусирующим маяком для ручных и стационарных телепортов."
	id = "beacon"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 150, /datum/material/glass = 100)
	build_path = /obj/item/beacon
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SECURITY

/datum/design/bag_holding
	name = "Инертная блюспейс сумка"
	desc = "То, что в настоящее время представляет собой просто громоздкий металлический блок со слотом, готовым принять ядро блюспейс аномалии."
	id = "bag_holding"
	build_type = PROTOLATHE | MECHFAB
	materials = list(/datum/material/gold = 3000, /datum/material/diamond = 1500, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
	build_path = /obj/item/storage/backpack/holding
	category = list("Bluespace Designs","Imported")
	dangerous_construction = TRUE
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/bluespace_crystal
	name = "Синтетический блюспейс кристалл"
	desc = "Искусственно сделанный блюспейс кристалл, выглядит изысканно."
	id = "bluespace_crystal"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/diamond = 1500, /datum/material/plasma = 1500)
	build_path = /obj/item/stack/ore/bluespace_crystal/artificial
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/telesci_gps
	name = "GPS - глобальная система позиционирования"
	desc = "Помогает потерянным космонавтам найти дорогу домой с 2016 года."
	id = "telesci_gps"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/gps
	category = list("Bluespace Designs","Imported")

/datum/design/desynchronizer
	name = "Десинхронизатор"
	desc = "Технология позволяющая грубо вмешаться в структуру блюспейс пространства и способная повлиять на пространственно-временной континиум. Строго запрещена космической академией наук."
	id = "desynchronizer"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/silver = 1500, /datum/material/bluespace = 1000)
	build_path = /obj/item/desynchronizer
	category = list("Bluespace Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/miningsatchel_holding
	name = "Бездонная сумка для руды"
	desc = "Революция в удобстве: этот рюкзак позволяет хранить огромное количество руды. Он оборудован мерами безопасности от сбоев."
	id = "minerbag_holding"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/gold = 250, /datum/material/uranium = 500) //quite cheap, for more convenience
	build_path = /obj/item/storage/bag/ore/holding
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/swapper
	name = "Квантовый инвертор"
	desc = "Экспериментальное устройство, которое способно менять местами местоположения двух объектов, изменяя значения их частиц. Для корректной работы должен быть синхронизирован с другим таким же устройством."
	id = "swapper"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000, /datum/material/bluespace = 2000, /datum/material/gold = 1500, /datum/material/silver = 1000)
	build_path = /obj/item/swapper
	category = list("Bluespace Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/biobag_holding
	name = "Biohazard Container of Holding"
	desc = "A bag designed to safely contain biologically-hazardous objects. This bag has been outfitted with a bluespace storage well, and can carry considerably more then it's actual size."
	id = "biobag_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 1500, /datum/material/diamond = 750, /datum/material/uranium = 250, /datum/material/bluespace = 1000)
	build_path = /obj/item/storage/bag/bio/holding
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/engibag_holding
	name = "Construction Bag of Holding"
	desc = "A bag for storing construction equipment. With the help of bluespace, you'll be building more airlocks and cameras then ever before."
	id = "engibag_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 1500, /datum/material/diamond = 750, /datum/material/uranium = 250, /datum/material/bluespace = 1000)
	build_path = /obj/item/storage/bag/construction/holding
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/plantbag_holding
	name = "Harvest Carrier of Holding"
	desc = "A bag for storing agricultural goods, augmented with bluespace technology. A glorious melon-carrying chariot, worthy of a true botanist."
	id = "plantbag_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 1500, /datum/material/diamond = 750, /datum/material/uranium = 250, /datum/material/bluespace = 1000)
	build_path = /obj/item/storage/bag/plants/holding
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/chembag_holding
	name = "Chemistry Satchel of Holding"
	desc = "A bag for storing varied chemical goods, optimized with bluespace technology to allow the resident chemist to carry their entire lab around with them."
	id = "chembag_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 1500, /datum/material/diamond = 750, /datum/material/uranium = 250, /datum/material/bluespace = 1000)
	build_path = /obj/item/storage/bag/chemistry/holding
	category = list("Bluespace Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

