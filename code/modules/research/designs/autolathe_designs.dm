///////////////////////////////////
//////////Autolathe Designs ///////
///////////////////////////////////

/datum/design/bucket
	name = "Ведро"
	id = "bucket"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/reagent_containers/glass/bucket
	category = list("initial","Tools","Tool Designs")


/datum/design/mop
	name = "Швабра"
	id = "mop"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/mop
	category = list("initial","Tools","Tool Designs")


/datum/design/broom
	id="pushbroom"
	name = "Метла"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/pushbroom
	category = list("initial","Tools","Tool Designs")


/datum/design/crowbar
	name = "Карманный ломик"
	id = "crowbar"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50)
	build_path = /obj/item/crowbar
	category = list("initial","Tools","Tool Designs")


/datum/design/flashlight
	name = "Фонарик"
	id = "flashlight"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50, /datum/material/glass = 20)
	build_path = /obj/item/flashlight
	category = list("initial","Tools")

/datum/design/extinguisher
	name = "Огнетушитель"
	id = "extinguisher"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 90)
	build_path = /obj/item/extinguisher/empty
	category = list("initial","Tools")

/datum/design/pocketfireextinguisher
	name = "Карманный огнетушитель"
	id = "pocketfireextinguisher"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50, /datum/material/glass = 40)
	build_path = /obj/item/extinguisher/mini/empty
	category = list("initial","Tools")

/datum/design/multitool
	name = "Мультитул"
	id = "multitool"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50, /datum/material/glass = 20)
	build_path = /obj/item/multitool
	category = list("initial","Tools","Tool Designs")


/datum/design/analyzer
	name = "Газоанализатор"
	id = "analyzer"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 30, /datum/material/glass = 20)
	build_path = /obj/item/analyzer
	category = list("initial","Tools","Tool Designs")

/datum/design/tscanner
	name = "Терагерцовый сканер"
	id = "tscanner"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/t_scanner
	category = list("initial","Tools","Tool Designs")

/datum/design/weldingtool
	name = "Сварочный аппарат"
	id = "welding_tool"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list("$metal" = 1750, "$glass" = 400)
	build_path = /obj/item/weldingtool
	category = list("initial","Tools")

/datum/design/mini_weldingtool
	name = "Аварийный сварочный аппарат"
	id = "mini_welding_tool"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 30, /datum/material/glass = 10)
	build_path = /obj/item/weldingtool/mini/empty
	category = list("initial","Tools")

/datum/design/weldingtool
	name = "Welding Tool"
	id = "welding_tool"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 70, /datum/material/glass = 30)
	build_path = /obj/item/weldingtool/empty
	category = list("initial","Tools","Tool Designs")


/datum/design/screwdriver
	name = "Отвёртка"
	id = "screwdriver"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 75)
	build_path = /obj/item/screwdriver
	category = list("initial","Tools","Tool Designs")

/datum/design/wirecutters
	name = "Кусачки"
	id = "wirecutters"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 80)
	build_path = /obj/item/wirecutters
	category = list("initial","Tools","Tool Designs")

/datum/design/wrench
	name = "Гаечный ключ"
	id = "wrench"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/wrench
	category = list("initial","Tools","Tool Designs")

/datum/design/plunger
	name = "Вантуз"
	desc = "Не для унитаза!"
	id = "plunger"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/plunger
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SERVICE
	construction_time = 40

/datum/design/welding_helmet
	name = "Сварочная маска"
	id = "welding_helmet"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1750, /datum/material/glass = 400)
	build_path = /obj/item/clothing/head/welding
	category = list("initial","Tools")

/datum/design/cable_coil
	name = "Моток кабеля"
	id = "cable_coil"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 10, /datum/material/glass = 5)
	build_path = /obj/item/stack/cable_coil/random //WS Edit - Smartwire Revert
	category = list("initial","Tools","Tool Designs")
	maxstack = MAXCOIL

/datum/design/toolbox
	name = "Ящик с инструментами"
	id = "tool_box"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 500)
	build_path = /obj/item/storage/toolbox
	category = list("initial","Tools")

/datum/design/apc_board
	name = "Контролер энергощитка АПЦ"
	id = "power control"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 100, /datum/material/glass = 100)
	build_path = /obj/item/electronics/apc
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/airlock_board
	name = "Контролер шлюза"
	id = "airlock_board"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/electronics/airlock
	category = list("initial", "Electronics")

/datum/design/firelock_board
	name = "Контролер пожарного шлюза"
	id = "firelock_board"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/electronics/firelock
	category = list("initial", "Electronics")

/datum/design/airalarm_electronics
	name = "Контролер АТМОСа"
	id = "airalarm_electronics"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/electronics/airalarm
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/aac_electronics
	name = "Airlock Controller Electronics"
	id = "aac_electronics"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/electronics/advanced_airlock_controller
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/firealarm_electronics
	name = "Контролер пожарной сигнализации"
	id = "firealarm_electronics"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/electronics/firealarm
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/camera
	name = "Фотокамера"
	id = "camera"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 50, /datum/material/glass = 100)
	build_path = /obj/item/camera
	category = list("initial", "Misc")

/datum/design/camera_film
	name = "Фотопленка"
	id = "camera_film"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 10, /datum/material/glass = 10)
	build_path = /obj/item/camera_film
	category = list("initial", "Misc")

/datum/design/earmuffs
	name = "Защитные наушники"
	id = "earmuffs"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/ears/earmuffs
	category = list("initial", "Misc")

/datum/design/pipe_painter
	name = "Маркировщик труб"
	id = "pipe_painter"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2000)
	build_path = /obj/item/pipe_painter
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/airlock_painter
	name = "Маркировщик шлюзов"
	id = "airlock_painter"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/airlock_painter
	category = list("initial","Tools","Tool Designs")

/datum/design/airlock_painter/decal
	name = "Красильщик пола"
	id = "decal_painter"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/decal_painter
	category = list("initial","Tools","Tool Designs")

/datum/design/emergency_oxygen
	name = "Аварийный кислородный баллон"
	id = "emergency_oxygen"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500)
	build_path = /obj/item/tank/internals/emergency_oxygen/empty
	category = list("initial","Misc","Equipment")

/datum/design/emergency_oxygen_engi
	name = "Карманный кислородный баллон"
	id = "emergency_oxygen_engi"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 750)
	build_path = /obj/item/tank/internals/emergency_oxygen/engi/empty
	category = list("hacked","Misc","Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/plasmaman_tank_belt
	name = "Плазма-дыхательный баллон"
	id = "plasmaman_tank_belt"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 800)
	build_path = /obj/item/tank/internals/plasmaman/belt/empty
	category = list("hacked","Misc","Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/generic_gas_tank
	name = "Газовый баллон"
	id = "generic_tank"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/tank/internals/generic
	category = list("initial","Misc","Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/metal
	id = "metal"
	name = "Железо"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/metal
	category = list("initial","Construction")
	maxstack = 50

/datum/design/glass
	name = "Стекло"
	id = "glass"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/glass
	category = list("initial","Construction")
	maxstack = 50

/datum/design/rglass
	name = "Армированное стекло"
	id = "rglass"
	build_type = AUTOLATHE | SMELTER | PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/rglass
	category = list("initial","Construction","Stock Parts")
	maxstack = 50

/datum/design/rods
	name = "Железные стержни"
	id = "rods"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/stack/rods
	category = list("initial","Construction")
	maxstack = 50

/datum/design/rcd_ammo
	name = "Малый картридж спрессованной материи"
	id = "rcd_ammo"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 100
	materials = list(/datum/material/iron = 12000, /datum/material/glass = 8000)
	build_path = /obj/item/rcd_ammo
	category = list("initial","Construction")

/datum/design/kitchen_knife
	name = "Кухонный нож"
	id = "kitchen_knife"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/kitchen/knife
	category = list("initial","Dinnerware")

/datum/design/plastic_knife
	name = "Пластиковый нож"
	id = "plastic_knife"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/plastic = 100)
	build_path = /obj/item/kitchen/knife/plastic
	category = list("initial", "Tool Designs","Dinnerware")

/datum/design/fork
	name = "Вилка"
	id = "fork"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 80)
	build_path = /obj/item/kitchen/fork
	category = list("initial","Dinnerware")

/datum/design/plastic_fork
	name = "Пластиковая вилка"
	id = "plastic_fork"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/plastic = 80)
	build_path = /obj/item/kitchen/fork/plastic
	category = list("initial", "Tool Designs", "Dinnerware")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/plastic_spoon
	name = "Пластиковая ложка"
	id = "plastic_spoon"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/plastic = 120)
	build_path = /obj/item/kitchen/spoon/plastic
	category = list("initial", "Tool Designs", "Dinnerware")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/tray
	name = "Поднос"
	id = "servingtray"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/storage/bag/tray
	category = list("initial","Dinnerware")

/datum/design/cafeteria_tray
	name = "Поднос кафетерия"
	id = "foodtray"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/storage/bag/tray/cafeteria
	category = list("initial","Dinnerware")

/datum/design/bowl
	name = "Чаша"
	id = "bowl"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/glass/bowl
	category = list("initial","Dinnerware")

/datum/design/drinking_glass
	name = "Стакан"
	id = "drinking_glass"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/food/drinks/drinkingglass
	category = list("initial","Dinnerware")

/datum/design/shot_glass
	name = "Шот"
	id = "shot_glass"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = 100)
	build_path = /obj/item/reagent_containers/food/drinks/drinkingglass/shotglass
	category = list("initial","Dinnerware")

/datum/design/modglass
	name = "Malleable Glass"
	id = "mod_glass"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass=500, /datum/material/silver=100)
	build_path = /obj/item/reagent_containers/food/drinks/modglass
	category = list("initial", "Dinnerware")

/datum/design/modglass_small
	name = "Small Malleable Glass"
	id = "mod_glass_small"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass=100, /datum/material/silver=100)
	build_path = /obj/item/reagent_containers/food/drinks/modglass/small
	category = list("initial", "Dinnerware")

/datum/design/modglass_large
	name = "Large Malleable Glass"
	id = "mod_glass_large"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass=500, /datum/material/silver=100)
	build_path = /obj/item/reagent_containers/food/drinks/modglass/large
	category = list("initial", "Dinnerware")

/datum/design/shaker
	name = "Шейкер"
	id = "shaker"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/reagent_containers/food/drinks/shaker
	category = list("initial","Dinnerware")

/datum/design/cultivator
	name = "Тяпка"
	id = "cultivator"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron=50)
	build_path = /obj/item/cultivator
	category = list("initial","Misc", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/plant_analyzer
	name = "Анализатор растений"
	id = "plant_analyzer"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 30, /datum/material/glass = 20)
	build_path = /obj/item/plant_analyzer
	category = list("initial","Misc", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/shovel
	name = "Лопата"
	id = "shovel"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 50)
	build_path = /obj/item/shovel
	category = list("initial","Misc", "Tool Designs")

/datum/design/spade
	name = "Лопаточка"
	id = "spade"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 50)
	build_path = /obj/item/shovel/spade
	category = list("initial","Misc", "Tool Designs")

/datum/design/hatchet
	name = "Топорик"
	id = "hatchet"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/hatchet
	category = list("initial","Misc", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/foilhat
	name = "Шапочка из фольги"
	id = "tinfoil_hat"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 5500)
	build_path = /obj/item/clothing/head/foilhat
	category = list("hacked", "Misc")

/datum/design/scalpel
	name = "Скальпель"
	desc = "Очень острое лезвие с микронной заточкой."
	id = "scalpel"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000)
	build_path = /obj/item/scalpel
	category = list("initial", "Medical", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/circular_saw
	name = "Циркулярная пила"
	desc = "Для работы с костью при полостных операциях."
	id = "circular_saw"
	build_type = PROTOLATHE
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 6000)
	build_path = /obj/item/circular_saw
	category = list("initial", "Medical", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/surgicaldrill
	name = "Хирургическая дрель"
	desc = "Можно просверлить с помощью этого что-то. Или пробурить?"
	id = "surgicaldrill"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 6000)
	build_path = /obj/item/surgicaldrill
	category = list("initial", "Medical", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/retractor
	name = "Расширитель"
	desc = "Позволяет получить оперативный простор в зоне проведения операции."
	id = "retractor"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 6000, /datum/material/glass = 3000)
	build_path = /obj/item/retractor
	category = list("initial", "Medical", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/cautery
	name = "Прижигатель"
	desc = "Останавливает кровотечения и дезинфецирует рабочую зону после завершения операции."
	id = "cautery"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 750)
	build_path = /obj/item/cautery
	category = list("initial", "Medical", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/hemostat
	name = "Зажим"
	desc = "Используется для манипуляций в рабочей области и остановки внутренних кровотечений."
	id = "hemostat"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500)
	build_path = /obj/item/hemostat
	category = list("initial", "Medical", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/beaker
	name = "Химический стакан"
	desc = "Химический стакан, вместимостью до 50 единиц."
	id = "beaker"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/glass/beaker
	category = list("initial", "Medical", "Medical Designs")

/datum/design/large_beaker
	name = "Большой химический стакан"
	desc = "Большой химический стакан, вместимостью до 100 единиц."
	id = "large_beaker"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 2500)
	build_path = /obj/item/reagent_containers/glass/beaker/large
	category = list("initial", "Medical", "Medical Designs")

/datum/design/pillbottle
	name = "Баночка для таблеток"
	desc = "Хранит в себе разноцветные пилюльки и таблетки."
	id = "pillbottle"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/plastic = 20, /datum/material/glass = 100)
	build_path = /obj/item/storage/pill_bottle
	category = list("initial", "Medical", "Medical Designs")

/datum/design/chem_jug
	name = "Chemical Jug"
	id = "chem_jug"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/plastic = 4000)
	build_path = /obj/item/reagent_containers/glass/chem_jug/open
	category = list("initial", "Medical", "Medical Designs")

/datum/design/recorder
	name = "Диктофон"
	id = "recorder"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 60, /datum/material/glass = 30)
	build_path = /obj/item/taperecorder/empty
	category = list("initial", "Misc")

/datum/design/tape
	name = "Магнитная касета"
	id = "tape"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 20, /datum/material/glass = 5)
	build_path = /obj/item/tape/random
	category = list("initial", "Misc")

/datum/design/igniter
	name = "Воспламенитель"
	id = "igniter"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 500, /datum/material/glass = 50)
	build_path = /obj/item/assembly/igniter
	category = list("initial", "Misc")

/datum/design/signaler
	name = "Сигналер"
	id = "signaler"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 400, /datum/material/glass = 120)
	build_path = /obj/item/assembly/signaler
	category = list("initial", "T-Comm")

/datum/design/radio_headset
	name = "Гарнитура"
	id = "radio_headset"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 75)
	build_path = /obj/item/radio/headset
	category = list("initial", "T-Comm")

/datum/design/bounced_radio
	name = "Рация"
	id = "bounced_radio"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 75, /datum/material/glass = 25)
	build_path = /obj/item/radio/off
	category = list("initial", "T-Comm")

/datum/design/intercom_frame
	name = "Каркас интеркома"
	id = "intercom_frame"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 75, /datum/material/glass = 25)
	build_path = /obj/item/wallframe/intercom
	category = list("initial", "T-Comm")

/datum/design/infrared_emitter
	name = "Инфракрасный излучатель"
	id = "infrared_emitter"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500)
	build_path = /obj/item/assembly/infra
	category = list("initial", "Misc")

/datum/design/health_sensor
	name = "Датчик жизни"
	desc = "Следит за основными жизненными показателями пользователя, может отправлять сигналы при смерти или критическом состоянии носителя."
	id = "health_sensor"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 800, /datum/material/glass = 200)
	build_path = /obj/item/assembly/health
	category = list("initial", "Medical")

/datum/design/timer
	name = "Таймер"
	id = "timer"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 50)
	build_path = /obj/item/assembly/timer
	category = list("initial", "Misc")

/datum/design/voice_analyser
	name = "Анализатор голоса"
	id = "voice_analyser"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 50)
	build_path = /obj/item/assembly/voice
	category = list("initial", "Misc")

/datum/design/light_tube
	name = "Лампа дневного света"
	id = "light_tube"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 100)
	build_path = /obj/item/light/tube
	category = list("initial", "Construction")

/datum/design/light_bulb
	name = "Лампочка"
	id = "light_bulb"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 100)
	build_path = /obj/item/light/bulb
	category = list("initial", "Construction")

/datum/design/camera_assembly
	name = "Каркас камеры"
	id = "camera_assembly"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 400, /datum/material/glass = 250)
	build_path = /obj/item/wallframe/camera
	category = list("initial", "Construction")

/datum/design/newscaster_frame
	name = "Рама новостника"
	id = "newscaster_frame"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 14000, /datum/material/glass = 8000)
	build_path = /obj/item/wallframe/newscaster
	category = list("initial", "Construction")

/datum/design/bounty_board_frame
	name = "Bounty Board Frame"
	id = "bountyboard_frame"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 14000, /datum/material/glass = 8000)
	build_path = /obj/item/wallframe/bounty_board
	category = list("initial", "Construction")

/datum/design/syringe
	name = "Шприц"
	desc = "Может содержать 15 единиц."
	id = "syringe"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 10, /datum/material/glass = 20)
	build_path = /obj/item/reagent_containers/syringe
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/dropper
	name = "Пипетка"
	desc = "Пипетка, вместимостью до 5 единиц."
	id = "dropper"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/glass = 10, /datum/material/plastic = 30)
	build_path = /obj/item/reagent_containers/dropper
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/prox_sensor
	name = "Датчик движения"
	id = "prox_sensor"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 800, /datum/material/glass = 200)
	build_path = /obj/item/assembly/prox_sensor
	category = list("initial", "Misc")

/datum/design/foam_dart
	name = "Упаковка пенных дротиков"
	desc = "Детям от восьми лет и старше."
	id = "foam_dart"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 500)
	build_path = /obj/item/ammo_box/foambox
	category = list("initial", "Misc")

//hacked autolathe recipes
//WS - emagged recipies
/datum/design/flamethrower
	name = "Огнемет"
	id = "flamethrower"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/flamethrower/full
	category = list("hacked", "Security")

/datum/design/electropack
	name = "Электропак"
	id = "electropack"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2500)
	build_path = /obj/item/electropack
	category = list("hacked", "Tools")

/datum/design/handcuffs
	name = "Наручники"
	id = "handcuffs"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500)
	build_path = /obj/item/restraints/handcuffs
	category = list("hacked", "Security")

/datum/design/receiver
	name = "Модульный приёмник"
	id = "receiver"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/weaponcrafting/receiver
	category = list("hacked", "Security")

/datum/design/c38
	name = "Ammo Box (.38)"
	id = "c38"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c38_box
	category = list("initial", "Security", "Ammo")

/datum/design/beanbag_slug
	name = "Beanbag Slug"
	id = "beanbag_slug"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_casing/shotgun/beanbag
	category = list("initial", "Security", "Ammo")

/datum/design/riot_dart
	name = "Резиновый пенчик"
	desc = "Чья это была умная идея использовать игрушки для контроля толпы? Для детей от восемнадцати и старше."
	id = "riot_dart"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 1000) //Discount for making individually - no box = less iron!
	build_path = /obj/item/ammo_casing/caseless/foam_dart/riot
	category = list("hacked", "Security")

/datum/design/riot_darts
	name = "Упаковка пенных дротиков антибунт"
	desc = "Повышенного останавливающего возздействия. Детям от восьми лет и старше."
	id = "riot_darts"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 50000) //Comes with 40 darts
	build_path = /obj/item/ammo_box/foambox/riot
	category = list("hacked", "Security")

/datum/design/a357
	name = "Пуля .357 калибра"
	desc = "Обычный патрон .357 калибра. Используется в крупнокалиберных револьверах."
	id = "a357"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/a357
	category = list("emagged", "Security")

/datum/design/c10mm_surplus
	name = "Ammo Box (10mm surplus)"
	id = "c10mm-surplus"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c10mm/surplus
	category = list("initial", "Security", "Ammo")

/datum/design/c45_surplus
	name = "Ammo Box (.45 surplus)"
	id = "c45-surplus"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c45/surplus
	category = list("initial", "Security", "Ammo")

/datum/design/c9mm_surplus
	name = "Ammo Box (9mm surplus)"
	id = "c9mm-surplus"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c9mm/surplus
	category = list("initial", "Security", "Ammo")

/datum/design/c556mmHITP_surplus
	name = "Ammo Box (surplus 5.56mm HITP caseless)"
	id = "c556mmHITP-surplus"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c556mmHITP/surplus
	category = list("initial", "Security", "Ammo")

/datum/design/cleaver
	name = "Тесак мясника"
	id = "cleaver"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 18000)
	build_path = /obj/item/kitchen/knife/butcher
	category = list("hacked", "Dinnerware")

/datum/design/spraycan
	name = "Баллончик с краской"
	id = "spraycan"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 100, /datum/material/glass = 100)
	build_path = /obj/item/toy/crayon/spraycan
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/desttagger
	name = "Этикетировщик назначения"
	id = "desttagger"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 250, /datum/material/glass = 125)
	build_path = /obj/item/destTagger
	category = list("initial", "Electronics")

/datum/design/salestagger
	name = "Этикетировщик скидок"
	id = "salestagger"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 700, /datum/material/glass = 200)
	build_path = /obj/item/sales_tagger
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SERVICE

/datum/design/handlabeler
	name = "Этикетировщик"
	desc = "Комбинированный принтер этикеток, аппликатор и съемник - все в одном портативном устройстве. Разработанный, чтобы быть простым в эксплуатации и использовании."
	id = "handlabel"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 150, /datum/material/glass = 125)
	build_path = /obj/item/hand_labeler
	category = list("initial", "Electronics")

/datum/design/geiger
	name = "Счётчик гейгера"
	id = "geigercounter"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 150, /datum/material/glass = 150)
	build_path = /obj/item/geiger_counter
	category = list("initial", "Tools")

/datum/design/turret_control_frame
	name = "Рама контролера турели"
	id = "turret_control"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/wallframe/turret_control
	category = list("initial", "Construction")

/datum/design/conveyor_belt
	name = "Конвейерная лента"
	id = "conveyor_belt"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/stack/conveyor
	category = list("initial", "Construction")
	maxstack = 30

/datum/design/conveyor_switch
	name = "Переключатель конвейерной ленты"
	id = "conveyor_switch"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 450, /datum/material/glass = 190)
	build_path = /obj/item/conveyor_switch_construct
	category = list("initial", "Construction")

/datum/design/laptop
	name = "Ноутбук (пустой)"
	id = "laptop"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 50
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 1000)
	build_path = /obj/item/modular_computer/laptop/buildable
	category = list("initial","Misc")

/datum/design/tablet
	name = "Планшет (пустой)"
	id = "tablet"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 50
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_path = /obj/item/modular_computer/tablet
	category = list("initial","Misc")

/datum/design/slime_scanner
	name = "Анализатор слаймов"
	id = "slime_scanner"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 50
	materials = list(/datum/material/iron = 300, /datum/material/glass = 200)
	build_path = /obj/item/slime_scanner
	category = list("initial", "Misc")

/datum/design/pet_carrier
	name = "Переноска для животных"
	id = "pet_carrier"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 7500, /datum/material/glass = 100)
	build_path = /obj/item/pet_carrier
	category = list("initial", "Misc")

/datum/design/miniature_power_cell
	name = "Батарея аварийного питания"
	id = "miniature_power_cell"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 20)
	build_path = /obj/item/stock_parts/cell/emergency_light
	category = list("initial", "Electronics")

/datum/design/packageWrap
	name = "Оберточная бумага"
	desc = "Оберните пакеты этой праздничной бумагой, чтобы сделать подарки."
	id = "packagewrap"
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 5
	materials = list(/datum/material/iron = 200, /datum/material/glass = 200)
	build_path = /obj/item/stack/packageWrap
	category = list("initial", "Misc", "Equipment")
	maxstack = 30

/datum/design/holodisk
	name = "Голодиск"
	id = "holodisk"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 100, /datum/material/glass = 100)
	build_path = /obj/item/disk/holodisk
	category = list("initial", "Misc")

/datum/design/circuit
	name = "Синяя электронная плитка"
	id = "circuit"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/stack/tile/circuit
	category = list("initial", "Misc")
	maxstack = 50

/datum/design/circuitgreen
	name = "Зелёная электронная плитка"
	id = "circuitgreen"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/stack/tile/circuit/green
	category = list("initial", "Misc")
	maxstack = 50

/datum/design/circuitred
	name = "Красная электронная плитка"
	id = "circuitred"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/stack/tile/circuit/red
	category = list("initial", "Misc")
	maxstack = 50

/datum/design/price_tagger
	name = "Этикетировщик цен"
	id = "price_tagger"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 500)
	build_path = /obj/item/price_tagger
	category = list("initial", "Misc")

/datum/design/custom_vendor_refill
	name = "Комплект снабжения вендора"
	id = "custom_vendor_refill"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2000)
	build_path = /obj/item/vending_refill/custom
	category = list("initial", "Misc")

/datum/design/ducts
	name = "Набор труб"
	desc = "Используются для передачи жидкости на расстояние."
	id = "fluid_ducts"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500)
	build_path = /obj/item/stack/ducts
	category = list("initial", "Construction")
	maxstack = 50

/datum/design/toygun
	name = "Игрушечный пистолет"
	id = "toygun"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 100, /datum/material/glass = 50)
	build_path = /obj/item/toy/gun
	category = list("hacked", "Misc")

/datum/design/capbox
	name = "Коробка с пистонами"
	id = "capbox"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 20, /datum/material/glass = 5)
	build_path = /obj/item/toy/ammo/gun
	category = list("hacked", "Misc")

/datum/design/toy_balloon
	name = "Воздушный шарик"
	id = "toy_balloon"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 1200)
	build_path = /obj/item/toy/balloon
	category = list("hacked", "Misc")

/datum/design/toy_meteor
	name = "Plastic Toy Meteor"
	id = "toy_meteor"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 1000)
	build_path = /obj/item/toy/minimeteor
	category = list("hacked", "Misc")

/datum/design/toy_armblade
	name = "Пенопластовая рука-лезвие"
	id = "toy_armblade"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 2000)
	build_path = /obj/item/toy/foamblade
	category = list("hacked", "Misc")

/datum/design/plastic_tree
	name = "Пластиковое дерево"
	id = "plastic_trees"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 8000)
	build_path = /obj/item/kirbyplants/fullysynthetic
	category = list("initial", "Misc")

/datum/design/beads
	name = "Пластиковые бусы"
	id = "plastic_necklace"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 500)
	build_path = /obj/item/clothing/neck/beads
	category = list("initial", "Misc")

/datum/design/plastic_ring
	name = "Упаковка для содовой"
	id = "ring_holder"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 1200)
	build_path = /obj/item/storage/cans
	category = list("initial", "Dinnerware")

/datum/design/plastic_box
	name = "Пластиковая коробка"
	id = "plastic_box"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plastic = 1000)
	build_path = /obj/item/storage/box/plastic
	category = list("initial", "Misc")

/datum/design/sticky_tape
	name = "Клейкая лента"
	id = "sticky_tape"
	build_type = AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plastic = 200)
	build_path = /obj/item/stack/tape
	category = list("initial", "Misc")

/datum/design/duct_tape
	name = "Duct Tape"
	id = "duct_tape"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 500)
	build_path = /obj/item/stack/tape/industrial
	category = list("initial", "Misc")

/datum/design/floor_painter
	name = "Маркировщик пола"
	desc = "Используется для покраски полов. Круто?"
	id = "floor_painter"
	materials = list(/datum/material/iron = 200, /datum/material/glass = 50)
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/floor_painter
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE

/datum/design/zip_ammo_9mm
	name = "Budget Pistol 9mm Magazine"
	id = "ZipAmmo9mm"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/magazine/zip_ammo_9mm
	category = list("hacked", "Security")

/datum/design/pipedispenser
	name = "Pipe Dispenser (Оборудование)"
	id = "pipedispenser"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/circuitboard/machine/pipedispenser
	category = list("initial", "Machinery")

/datum/design/control
	name = "Blast Door Controller"
	id = "blast"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 100, /datum/material/glass = 50)
	build_path = /obj/item/assembly/control
	category = list("initial","Misc")

/datum/design/trashbag
	name="Trash Bag"
	id="trashbag"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/plastic = 5000)
	build_path = /obj/item/storage/bag/trash
	category = list("initial","Tools","Tool Designs","Misc")

/datum/design/fishing_rod_basic
	id = "fishing rod"
	name = "Удочка"
	desc = "Ловись рыбка большая и маленькая."
	build_type = AUTOLATHE | AWAY_LATHE | MECHFAB
	materials = list(/datum/material/iron = 200, /datum/material/glass = 200)
	build_path = /obj/item/fishing_rod
	category = list("initial","Misc","Equipment")
