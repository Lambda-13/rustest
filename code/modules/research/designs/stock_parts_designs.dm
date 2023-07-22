////////////////////////////////////////
/////////////Stock Parts////////////////
////////////////////////////////////////

/datum/design/RPED
	name = "Автоматическое Монтажное Устройство (РПЕД)"
	desc = "Специальный механический модуль, предназначенный для хранения, сортировки и монтажа стандартных деталей машин."
	id = "rped"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000) //hardcore
	build_path = /obj/item/storage/part_replacer
	category = list("Stock Parts","Imported")
	departmental_flags = ALL

/datum/design/BS_RPED
	name = "Блюспейс монтажное устройство (РПЕД)"
	desc = "Продвинутая модель, основанная на технологии блюспейса, за счет фазового сдвига позволяет модернизировать машины на расстоянии, без необходимости снятия передней панели."
	id = "bs_rped"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 5000, /datum/material/silver = 2500) //hardcore
	build_path = /obj/item/storage/part_replacer/bluespace
	category = list("Stock Parts","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

//Capacitors
/datum/design/basic_capacitor
	name = "Базовый конденсатор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "basic_capacitor"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/glass = 100)
	build_path = /obj/item/stock_parts/capacitor
	category = list("Stock Parts","Machinery","initial")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/adv_capacitor
	name = "Продвинутый конденсатор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "adv_capacitor"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 150, /datum/material/glass = 150)
	build_path = /obj/item/stock_parts/capacitor/adv
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/super_capacitor
	name = "Супер конденсатор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "super_capacitor"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/glass = 200, /datum/material/gold = 100)
	build_path = /obj/item/stock_parts/capacitor/super
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/quadratic_capacitor
	name = "Ультра конденсатор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "quadratic_capacitor"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/glass = 200, /datum/material/gold = 100, /datum/material/diamond = 100)
	build_path = /obj/item/stock_parts/capacitor/quadratic
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

//Scanning modules
/datum/design/basic_scanning
	name = "Базовый модуль сканирования"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "basic_scanning"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/glass = 50)
	build_path = /obj/item/stock_parts/scanning_module
	category = list("Stock Parts","Machinery","initial")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/adv_scanning
	name = "Продвинутый модуль сканирования"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "adv_scanning"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 150, /datum/material/glass = 100)
	build_path = /obj/item/stock_parts/scanning_module/adv
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/phasic_scanning
	name = "Супер фазированный модуль сканирования"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "phasic_scanning"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/glass = 150, /datum/material/silver = 60)
	build_path = /obj/item/stock_parts/scanning_module/phasic
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/triphasic_scanning
	name = "Ультра трифазированный модуль сканирования"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "triphasic_scanning"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/glass = 200, /datum/material/diamond = 30, /datum/material/bluespace = 30)
	build_path = /obj/item/stock_parts/scanning_module/triphasic
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

//Maipulators
/datum/design/micro_mani
	name = "Базовый микроманипулятор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "micro_mani"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100)
	build_path = /obj/item/stock_parts/manipulator
	category = list("Stock Parts","Machinery","initial")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/nano_mani
	name = "Продвинутый наноманипулятор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "nano_mani"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/stock_parts/manipulator/nano
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/pico_mani
	name = "Супер пикоманипулятор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "pico_mani"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/stock_parts/manipulator/pico
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/femto_mani
	name = "Ультра фемтоманипулятор"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "femto_mani"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/diamond = 30, /datum/material/titanium = 30)
	build_path = /obj/item/stock_parts/manipulator/femto
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

//Micro-lasers
/datum/design/basic_micro_laser
	name = "Базовый микролазер"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "basic_micro_laser"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/glass = 50)
	build_path = /obj/item/stock_parts/micro_laser
	category = list("Stock Parts","Machinery","initial")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/high_micro_laser
	name = "Продвинутый мощный микролазер"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "high_micro_laser"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 150, /datum/material/glass = 100)
	build_path = /obj/item/stock_parts/micro_laser/high
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/ultra_micro_laser
	name = "Супер высокомощный микролазер"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "ultra_micro_laser"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/glass = 150, /datum/material/uranium = 60)
	build_path = /obj/item/stock_parts/micro_laser/ultra
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/quadultra_micro_laser
	name = "Ультра квадромощный микролазер"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "quadultra_micro_laser"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200, /datum/material/glass = 200, /datum/material/uranium = 100, /datum/material/diamond = 60)
	build_path = /obj/item/stock_parts/micro_laser/quadultra
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/basic_matter_bin
	name = "Базовый резервуар материи"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "basic_matter_bin"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100)
	build_path = /obj/item/stock_parts/matter_bin
	category = list("Stock Parts","Machinery","initial")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/adv_matter_bin
	name = "Продвинутый резервуар материи"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "adv_matter_bin"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/stock_parts/matter_bin/adv
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = ALL

/datum/design/super_matter_bin
	name = "Супер резервуар материи"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "super_matter_bin"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/stock_parts/matter_bin/super
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/bluespace_matter_bin
	name = "Ультра блюспейс резервуар материи"
	desc = "Схемотехнический компонент используемый при сборке машин и приборов."
	id = "bluespace_matter_bin"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 250, /datum/material/diamond = 100, /datum/material/bluespace = 100)
	build_path = /obj/item/stock_parts/matter_bin/bluespace
	category = list("Stock Parts")
	lathe_time_factor = 0.2
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

//T-Comms devices
/datum/design/subspace_ansible
	name = "Подпространственный ансибль"
	desc = "Компактный модуль, способный воспринимать межпространственное излучение."
	id = "s-ansible"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/silver = 100)
	build_path = /obj/item/stock_parts/subspace/ansible
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/hyperwave_filter
	name = "Гиперволновой фильтр"
	desc = "Крошечное устройство, способное фильтровать и преобразовывать сверхинтенсивные радиоволны."
	id = "s-filter"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/silver = 100)
	build_path = /obj/item/stock_parts/subspace/filter
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/subspace_amplifier
	name = "Подпространственный усилитель"
	desc = "Компактное устройство, способное усиливать слабые межпространственные передачи."
	id = "s-amplifier"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/gold = 100, /datum/material/uranium = 100)
	build_path = /obj/item/stock_parts/subspace/amplifier
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/subspace_treatment
	name = "Подпространственная стабилизирующая тарелка"
	desc = "Компактное устройство, способное растягивать сверхсжатые радиоволны."
	id = "s-treatment"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/silver = 200)
	build_path = /obj/item/stock_parts/subspace/treatment
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/subspace_analyzer
	name = "Анализатор длины подпространственных волн"
	desc = "Сложный анализатор, способный анализировать зашифрованные передачи подпространственных волн."
	id = "s-analyzer"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron = 100, /datum/material/gold = 100)
	build_path = /obj/item/stock_parts/subspace/analyzer
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/subspace_crystal
	name = "Анзибль-кристалл"
	desc = "Кристалл из сверхчистого стекла, используемый для передачи в подпространство импульсов данных при помощи лазера."
	id = "s-crystal"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/glass = 800, /datum/material/silver = 100, /datum/material/gold = 100)
	build_path = /obj/item/stock_parts/subspace/crystal
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/subspace_transmitter
	name = "Подпространственный передатчик"
	desc = "Большое оборудование, используемое для открытия окна в подпространственное измерение."
	id = "s-transmitter"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/glass = 100, /datum/material/silver = 100, /datum/material/uranium = 100)
	build_path = /obj/item/stock_parts/subspace/transmitter
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/card_reader
	name = "Кардридер"
	desc = "Небольшой считыватель магнитных карт, используемый для устройств, которые принимают и передают голографические кредиты."
	id = "c-reader"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10
	materials = list(/datum/material/iron=50, /datum/material/glass=10)
	build_path = /obj/item/stock_parts/card_reader
	category = list("Stock Parts")
