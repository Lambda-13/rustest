
/////////////////////////////////////////
/////////////////Tools///////////////////
/////////////////////////////////////////

/datum/design/large_welding_tool
	name = "Industrial Welding Tool"
	id = "large_welding_tool"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 70, /datum/material/glass = 60)
	build_path = /obj/item/weldingtool/largetank/empty
	category = list("initial", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/handdrill
	name = "Шуруповерт"
	desc = "Удобный и компактный инструмент со сменными насадками."
	id = "handdrill"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3500, /datum/material/silver = 1500, /datum/material/titanium = 2500)
	build_path = /obj/item/screwdriver/power
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/jawsoflife
	name = "Гидравлические ножницы"
	desc = "Спасательный инструмент для выламывания и перекусывания конструкций, форсированного открытия шлюзов и демонтажа оборудования."
	id = "jawsoflife" // added one more requirment since the Jaws of Life are a bit OP
	build_path = /obj/item/crowbar/power
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 4500, /datum/material/silver = 2500, /datum/material/titanium = 3500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/exwelder
	name = "Экспериментальный сварочный аппарат"
	desc = "Экспериментальный сварочный аппарат, способный самостоятельно генерировать топливо и менее вредный для глаз."
	id = "exwelder"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/plasma = 1500, /datum/material/uranium = 200)
	build_path = /obj/item/weldingtool/experimental
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rpd
	name = "РПД - портативный раздатчик труб"
	desc = "Компактный и удобный инструмент для прокладки любых коммуникаций."
	id = "rpd_loaded"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 75000, /datum/material/glass = 37500)
	build_path = /obj/item/pipe_dispenser
	category = list("Tool Designs","Imported")
	departmental_flags =  DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/rcd_loaded
	name = "РЦД - автоматический строительный комплекс"
	desc = "Многофункциональный инструмент для быстрого строительства и разбора базовых конструкций, можно загрузить дополнительные чертежи."
	id = "rcd_loaded"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 60000, /datum/material/glass = 5000)  // costs more than what it did in the autolathe, this one comes loaded.
	build_path = /obj/item/construction/rcd/loaded
	category = list("Tool Designs","Imported")
	departmental_flags =  DEPARTMENTAL_FLAG_ENGINEERING


/datum/design/rcd_upgrade/frames
	name = "Диск с чертежами для РЦД - Машиностроение"
	desc = "Он содержит чертежи для машинных и компьютерных каркасов."
	id = "rcd_upgrade_frames"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/rcd_upgrade/frames
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rcd_upgrade/simple_circuits
	name = "Диск с чертежами для РЦД - Контролеры"
	desc = "Он чертежи для плат пожарных шлюзов, контролера АТМОСа, пожарной сигнализации, контролера электропитания и даже синтеза примитивных батарей."
	id = "rcd_upgrade_simple_circuits"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/rcd_upgrade/simple_circuits
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rcd_upgrade/silo_link
	name = "Диск с чертежами для РЦД - Сило-линк"
	desc = "Он содержит обновление для прямого подключения к хранилищу ресурсов. Связь осуществляется мультитулом."
	id = "rcd_upgrade_silo_link"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2500, /datum/material/silver = 2500, /datum/material/titanium = 2500, /datum/material/bluespace = 2500)
	build_path = /obj/item/rcd_upgrade/silo_link
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rld_mini
	id = "rld_mini"
	build_type = PROTOLATHE
	name = "РЛД - Светопостановщик"
	desc = "Устройство для быстрого монтажа импровизированного освещения. Чертежи выкуплены у компании Б.Е.П.И.С."
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 20000, /datum/material/glass = 10000, /datum/material/plastic = 8000, /datum/material/gold = 2000)
	build_path = /obj/item/construction/rld/mini
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rapid_shuttle_designator
	name = "Rapid Shuttle Designator"
	desc = "A tool that can be used to designate a shuttle for a shuttle launch."
	id = "rapid_shuttle_designator"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/shuttle_creator
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE

/////////////////////////////////////////
//////////////Alien Tools////////////////
/////////////////////////////////////////

/datum/design/alienwrench
	name = "Инопланетный гаечный ключ"
	desc = "Поляризованный ключ. Это приводит к тому, что все, что находится между полюсами, поворачивается."
	id = "alien_wrench"
	build_path = /obj/item/wrench/abductor
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienwirecutters
	name = "Инопланетные кусачки"
	desc = "Очень острые канаторезы, изготовленные из серебристо-зеленого металла."
	id = "alien_wirecutters"
	build_path = /obj/item/wirecutters/abductor
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienscrewdriver
	name = "Инопланетная отвёртка"
	desc = "Похожа на экспериментальную сверхзвуковую отвертку."
	id = "alien_screwdriver"
	build_path = /obj/item/screwdriver/abductor
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/aliencrowbar
	name = "Инопланетный лом"
	desc = "Жесткий лёгкий ломик. Похоже, он работает сам по себе, даже не нужно прилагать никаких усилий."
	id = "alien_crowbar"
	build_path = /obj/item/crowbar/abductor
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienwelder
	name = "Инопланетная сварка"
	desc = "Инопланетный сварочный инструмент. Какое бы топливо он ни использовал, оно у него никогда не заканчивается."
	id = "alien_welder"
	build_path = /obj/item/weldingtool/abductor
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 5000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienmultitool
	name = "Инопланетный мультитул"
	desc = "Омни-технологический интерфейс."
	id = "alien_multitool"
	build_path = /obj/item/multitool/abductor
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 5000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/////////////////////////////////////////
/////////Alien Surgical Tools////////////
/////////////////////////////////////////

/datum/design/alienscalpel
	name = "Инопланетный скальпель"
	desc = "Сверкающий острый нож, сделанный из серебристо-зеленого металла."
	id = "alien_scalpel"
	build_path = /obj/item/scalpel/alien
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/alienhemostat
	name = "Инопланетный зажим"
	desc = "Как эта штука вообще работает?"
	id = "alien_hemostat"
	build_path = /obj/item/hemostat/alien
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/alienretractor
	name = "Инопланетный расширитель"
	desc = "Вы точно не хотите знать как эта штука работает."
	id = "alien_retractor"
	build_path = /obj/item/retractor/alien
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/aliensaw
	name = "Инопланетная пила"
	desc = "Уберите это от меня!"
	id = "alien_saw"
	build_path = /obj/item/circular_saw/alien
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 1500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/aliendrill
	name = "Инопланетная дрель"
	desc = "Может хотя бы инопланетяне знают зачем нужна хирургическая дрель?"
	id = "alien_drill"
	build_path = /obj/item/surgicaldrill/alien
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 1500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/aliencautery
	name = "Инопланетный прижигатель"
	desc = "Зачем вообще инопланетянам инструмент для остановки кровотечений? Разве только для..."
	id = "alien_cautery"
	build_path = /obj/item/cautery/alien
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
