///////////////////////////////////
//////////Mecha Module Disks///////
///////////////////////////////////

/datum/design/board/ripley_main
	name = "АПЛУ \"Рипли\" - Основной контролер"
	desc = "Необходима для строительства экзокостюма \"Рипли\" - Основной контролер."
	id = "ripley_main"
	build_path = /obj/item/circuitboard/mecha/ripley/main
	category = list("Exosuit Modules")

/datum/design/board/ripley_peri
	name = "АПЛУ \"Рипли\" - Вспомогательный контролер"
	desc = "Необходима для строительства экзокостюма \"Рипли\" - Вспомогательный контролер."
	id = "ripley_peri"
	build_path = /obj/item/circuitboard/mecha/ripley/peripherals
	category = list("Exosuit Modules")

/datum/design/board/odysseus_main
	name = "\"Одиссей\" - Основной контролер"
	desc = "Необходима для строительства экзокостюма \"Одиссей\" - Основной контролер."
	id = "odysseus_main"
	build_path = /obj/item/circuitboard/mecha/odysseus/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/odysseus_peri
	name = "\"Одиссей\" - Вспомогательный контролер"
	desc = "Необходима для строительства экзокостюма \"Одиссей\" - Вспомогательный контролер."
	id = "odysseus_peri"
	build_path = /obj/item/circuitboard/mecha/odysseus/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/gygax_main
	name = "\"Гигакс\" - Основной контролер"
	desc = "Необходима для строительства экзокостюма \"Гигакс\" - Основной контролер."
	id = "gygax_main"
	build_path = /obj/item/circuitboard/mecha/gygax/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/gygax_peri
	name = "\"Гигакс\" - Вспомогательный контролер"
	desc = "Необходима для строительства экзокостюма \"Гигакс\" - Вспомогательный контролер."
	id = "gygax_peri"
	build_path = /obj/item/circuitboard/mecha/gygax/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/gygax_targ
	name = "\"Гигакс\" - Орудийный контролер"
	desc = "Необходима для строительства экзокостюма \"Гигакс\" - Орудийный контролер."
	id = "gygax_targ"
	build_path = /obj/item/circuitboard/mecha/gygax/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/durand_main
	name = "\"Дюранд\" - Основной контролер"
	desc = "Необходима для строительства экзокостюма \"Дюранд\" - Основной контролер."
	id = "durand_main"
	build_path = /obj/item/circuitboard/mecha/durand/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/durand_peri
	name = "\"Дюранд\" - Вспомогательный контролер"
	desc = "Необходима для строительства экзокостюма \"Дюранд\" - Вспомогательный контролер."
	id = "durand_peri"
	build_path = /obj/item/circuitboard/mecha/durand/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/durand_targ
	name = "\"Дюранд\" - Орудийный контролер"
	desc = "Необходима для строительства экзокостюма \"Дюранд\" - Орудийный контролер."
	id = "durand_targ"
	build_path = /obj/item/circuitboard/mecha/durand/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/honker_main
	name = "\"Х.О.Н.К\" - Основной контролер"
	desc = "Необходима для строительства экзокостюма \"Х.О.Н.К\" - Основной контролер."
	id = "honker_main"
	build_path = /obj/item/circuitboard/mecha/honker/main
	category = list("Exosuit Modules")

/datum/design/board/honker_peri
	name = "\"Х.О.Н.К\" - Вспомогательный контролер"
	desc = "Необходима для строительства экзокостюма \"Х.О.Н.К\" - Вспомогательный контролер."
	id = "honker_peri"
	build_path = /obj/item/circuitboard/mecha/honker/peripherals
	category = list("Exosuit Modules")

/datum/design/board/honker_targ
	name = "\"Х.О.Н.К\" - Орудийный контролер"
	desc = "Необходима для строительства экзокостюма \"Х.О.Н.К\" - Орудийный контролер."
	id = "honker_targ"
	build_path = /obj/item/circuitboard/mecha/honker/targeting
	category = list("Exosuit Modules")

/datum/design/board/phazon_main
	name = "\"Фазон\" - Основной контролер"
	desc = "Необходима для строительства экзокостюма \"Фазон\" - Основной контролер."
	id = "phazon_main"
	materials = list(/datum/material/glass = 1000, /datum/material/bluespace = 100)
	build_path = /obj/item/circuitboard/mecha/phazon/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/phazon_peri
	name = "\"Фазон\" - Вспомогательный контролер"
	desc = "Необходима для строительства экзокостюма \"Фазон\" - Вспомогательный контролер."
	id = "phazon_peri"
	materials = list(/datum/material/glass = 1000, /datum/material/bluespace = 100)
	build_path = /obj/item/circuitboard/mecha/phazon/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/phazon_targ
	name = "\"Фазон\" - Орудийный контролер"
	desc = "Необходима для строительства экзокостюма \"Фазон\" - Орудийный контролер."
	id = "phazon_targ"
	materials = list(/datum/material/glass = 1000, /datum/material/bluespace = 100)
	build_path = /obj/item/circuitboard/mecha/phazon/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

////////////////////////////////////////
/////////// Mecha Equpment /////////////
////////////////////////////////////////

/datum/design/mech_scattershot
	name = "Тяжелая картечница \"Дуплет\""
	desc = "Оружие для боевых экзокостюмов. Стреляет шквалом крупной картечи."
	id = "mech_scattershot"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_scattershot_ammo
	name = "Картечные боеприпасы к \"Дуплету\""
	desc = "Коробка крупной картечи для использования в дробовиках для экзокостюмов."
	id = "mech_scattershot_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/scattershot
	materials = list(/datum/material/iron=6000)
	construction_time = 20
	category = list("Exosuit Ammunition", "Ammo")

/datum/design/mech_carbine
	name = "Легкий зажигательный карабин БК-БЗ \"Аид\""
	desc = "Оружие для боевых экзокостюмов. Стреляет зажигательными пулями."
	id = "mech_carbine"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/carbine
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_carbine_ammo
	name = "Зажигательные боеприпасы к БК-БЗ \"Аид\""
	desc = "Коробка зажигательных боеприпасов для использования в карабинах для экзокостюмов."
	id = "mech_carbine_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/incendiary
	materials = list(/datum/material/iron=6000)
	construction_time = 20
	category = list("Exosuit Ammunition", "Ammo")

/datum/design/mech_ion
	name = "Тяжелое ионное орудие МК-4"
	desc = "Оружие для боевых экзокостюмов. Стреляет эми импульсами повреждающими технику. Не попадите под собственный выстрел!"
	id = "mech_ion"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/ion
	materials = list(/datum/material/iron=20000,/datum/material/silver=6000,/datum/material/uranium=2000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_tesla
	name = "Орудие Теслы МК-1"
	desc = "Оружие для боевых экзокостюмов. Стреляет разветвленными разрядами электричества, прицельный огонь невозможен."
	id = "mech_tesla"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/tesla
	materials = list(/datum/material/iron=20000,/datum/material/silver=8000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_laser
	name = "Легкий лазер ЭВ-ЛЛ \"Выжигатель\""
	desc = "Оружие для боевых экзокостюмов. Стреляет слабыми лазерами."
	id = "mech_laser"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_laser_heavy
	name = "Тяжелый лазер ЭВ-ТЛ \"Солярис\""
	desc = "Оружие для боевых экзокостюмов. Стреляет мощными лазерами."
	id = "mech_laser_heavy"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_disabler
	name = "Усмиритель ЭВ-УЛ \"Миротворец\""
	desc = "Оружие для боевых экзокостюмов. Стреляет слабыми парализующими лучами."
	id = "mech_disabler"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/disabler
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_grenade_launcher
	name = "Автоматический гранатомет АГС \"Заря\""
	desc = "Оружие для боевых экзокостюмов. Автоматическая гранатометная система запускающая светошумовые гранаты."
	id = "mech_grenade_launcher"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang
	materials = list(/datum/material/iron=22000,/datum/material/gold=6000,/datum/material/silver=8000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_grenade_launcher_ammo
	name = "Светошумовые граната к АГС \"Заря\""
	desc = "Коробка гранат для использования в АГС экзокостюма. Оснащены электрическим детонатором и немогут быть использованы вне АГЦ."
	id = "mech_grenade_launcher_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/flashbang
	materials = list(/datum/material/iron=4000,/datum/material/gold=500,/datum/material/iron=500)
	construction_time = 20
	category = list("Exosuit Ammunition", "Ammo")

/datum/design/mech_missile_rack
	name = "Легкая ракетная установка РСЗО \"Пробой-6\""
	desc = "Оружие для боевых экзокостюмов. Запускает маловзрывоопасные разрывные ракеты, предназначенные для взрыва только при попадании в прочную цель."
	id = "mech_missile_rack"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching
	materials = list(/datum/material/iron=22000,/datum/material/gold=6000,/datum/material/silver=8000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_missile_rack_ammo
	name = "Ракеты РСЗО \"Пробой-6\""
	desc = "Коробка с ракетами, готовая к загрузке в ракетную систему экзокостюма."
	id = "mech_missile_rack_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/missiles_br
	materials = list(/datum/material/iron=8000,/datum/material/gold=500,/datum/material/iron=500)
	construction_time = 20
	category = list("Exosuit Ammunition", "Ammo")

/datum/design/clusterbang_launcher
	name = "Касетный гранатомет АГС \"Матрёшка\""
	desc = "Оружие для боевых экзокостюмов. Запускает кластерные светошумовые гранаты. Ты чудовище."
	id = "clusterbang_launcher"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang/clusterbang
	materials = list(/datum/material/iron=20000,/datum/material/gold=10000,/datum/material/uranium=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/clusterbang_launcher_ammo
	name = "Светошумовые граната к АГС \"Матрёшка\""
	desc = "Коробка кластерных гранат для использования в АГС экзокостюма. Оснащены электрическим детонатором и немогут быть использованы вне АГЦ."
	id = "clusterbang_launcher_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/clusterbang
	materials = list(/datum/material/iron=6000,/datum/material/gold=1500,/datum/material/uranium=1500)
	construction_time = 20
	category = list("Exosuit Ammunition", "Ammo")

/datum/design/mech_wormhole_gen
	name = "Генератор червоточин экзокостюма"
	desc = "Модуль экзокостюма, который позволяет создавать небольшие квазистабильные червоточины, позволяющие осуществлять неточную телепортацию на большие расстояния."
	id = "mech_wormhole_gen"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/wormhole_generator
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_teleporter
	name = "Телепортер экзокостюма"
	desc = "Модуль экзокостюма, который позволяет им телепортироваться в любое место в поле зрения."
	id = "mech_teleporter"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/teleporter
	materials = list(/datum/material/iron=10000,/datum/material/diamond=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_rcd
	name = "РЦД экзокостюма"
	desc = "Обладает меньшим функционалом, однако работает от батареи."
	id = "mech_rcd"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/rcd
	materials = list(/datum/material/iron=30000,/datum/material/gold=20000,/datum/material/plasma=25000,/datum/material/silver=20000)
	construction_time = 1200
	category = list("Exosuit Equipment")

/datum/design/mech_thrusters
	name = "Реактивные двигатели экзокостюма"
	desc = "Набор двигателей, которые позволяют передвигаться в экзокостюме в условиях невесомости, потребляя газ из внутреннего бака жизнеобеспечения."
	id = "mech_thrusters"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/thrusters/gas
	materials = list(/datum/material/iron=25000,/datum/material/titanium=5000,/datum/material/silver=3000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_gravcatapult
	name = "Гравитационная катапульта экзокостюма"
	desc = "Гравитационная катапульта, установленная в экзокостюме."
	id = "mech_gravcatapult"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/gravcatapult
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_repair_droid
	name = "Ремонтный дрон экзокостюма"
	desc = "Автоматический ремонтный дроид для экзокостюмов. Сканирует на наличие повреждений и восстанавливает их. Может устранить практически все виды внешних или внутренних повреждений."
	id = "mech_repair_droid"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/repair_droid
	materials = list(/datum/material/iron=10000,/datum/material/glass = 5000,/datum/material/gold=1000,/datum/material/silver=2000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_energy_relay
	name = "Exosuit Module (Tesla Energy Relay)"
	desc = "Tesla Energy Relay"
	id = "mech_energy_relay"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	materials = list(/datum/material/iron=10000,/datum/material/glass =  2000,/datum/material/gold=2000,/datum/material/silver=3000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_ccw_armor
	name = "Демпферная броня (ближний бой)"
	desc = "Усиливает броню экзокостюма против атак ближнего боя. Потребляет энергию для работы."
	id = "mech_ccw_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster
	materials = list(/datum/material/iron=20000,/datum/material/silver=5000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_proj_armor
	name = "Композитная броня (дальний бой)"
	desc = "Усиливает броню экзокостюма против дальних атак. Полностью блокирует выстрелы из электрошокера. Потребляет энергию для работы."
	id = "mech_proj_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster
	materials = list(/datum/material/iron=20000,/datum/material/gold=5000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_diamond_drill
	name = "Алмазный бур экзокостюма"
	desc = "Оборудование для инженерных и боевых экзокостюмов. Это усовершенствованная версия!"
	id = "mech_diamond_drill"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/drill/diamonddrill
	materials = list(/datum/material/iron=10000,/datum/material/diamond=6500)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_generator_nuclear
	name = "Exosuit Module (ExoNuclear Reactor)"
	desc = "Compact nuclear reactor module."
	id = "mech_generator_nuclear"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/generator/nuclear
	materials = list(/datum/material/iron=10000,/datum/material/glass =  1000,/datum/material/silver=500)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_plasma_cutter
	name = "Тяжелый плазменный резак 217-Д"
	desc = "Устройство, которое стреляет резонансными плазменными вспышками с предельной скоростью. Взрывы способны дробить скалы и разрушать твердые препятствия."
	id = "mech_plasma_cutter"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/plasma
	materials = list(/datum/material/iron = 8000, /datum/material/glass = 1000, /datum/material/plasma = 2000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_lmg
	name = "Легкий пулемет Ультра АК-2"
	desc = "Оружие для боевых экзокостюмов. Стреляет короткой очередью из трех выстрелов."
	id = "mech_lmg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_lmg_ammo
	name = "Пулеметные боеприпасы к Ультра АК-2"
	desc = "Коробка ленточных боеприпасов, предназначенная для пулемета в экзокостюмах."
	id = "mech_lmg_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/lmg
	materials = list(/datum/material/iron=4000)
	construction_time = 20
	category = list("Exosuit Ammunition", "Ammo")

/datum/design/mech_sleeper
	name = "Криокапсула экзокостюма"
	desc = "Оборудование для медицинских экзокостюмов. Подвесная криокапсула, которое стабилизирует пациентов и может вводить реагенты из синтезатора экзокостюма."
	id = "mech_sleeper"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/medical/sleeper
	materials = list(/datum/material/iron=5000, /datum/material/glass =  10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_syringe_gun
	name = "Шприцемет экзокостюма"
	desc = "Оборудование для медицинских экзокостюмов. Химический синтезатор со шприц-пистолетом. Реагенты внутри находятся в состоянии стазиса, поэтому никаких реакций не произойдет."
	id = "mech_syringe_gun"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/medical/syringe_gun
	materials = list(/datum/material/iron=3000, /datum/material/glass = 2000)
	construction_time = 200
	category = list("Exosuit Equipment")

/datum/design/mech_medical_beamgun
	name = "Медлуч экзокостюма"
	desc = "Оборудование для медицинских экзокостюмов. Генерирует сфокусированный луч медицинских нанитов."
	id = "mech_medi_beam"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 8000, /datum/material/plasma = 3000, /datum/material/gold = 8000, /datum/material/diamond = 2000)
	construction_time = 250
	build_path = /obj/item/mecha_parts/mecha_equipment/medical/mechmedbeam
	category = list("Exosuit Equipment")
