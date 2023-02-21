// Машины 20-21 века
// Сначала идёт отображение веток в рнд
// КАРТА ВЕТКИ СТАРЫХ ТЕХНОЛОГИЙ
//
//
//
//
//
//       /datum/techweb_node/old_tech      ->        /datum/techweb_node/adv_old_tech      ->        /datum/techweb_node/mechcomp_tech
//
//
//
//
//
//
//
//

// Старые технологии
/datum/techweb_node/old_tech
	id = "old_tech"
	display_name = "Восстановление затерянных технологий"
	description = "Начало восстановления технологий 20-21 века."
	prereq_ids = list("engineering")
	design_ids = list("pacman_wood")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

// Улучшенные старые технологии
/datum/techweb_node/adv_old_tech
	id = "adv_old_tech"
	display_name = "Полное восстановление затерянных технологий"
	description = "Технологии 20-21 века были восстановлены и улучшены при помощи технологий будущего."
	prereq_ids = list("old_tech")
	design_ids = list()
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 25000)
	export_price = 50000

// MechComp, отсылка на Portal
/datum/techweb_node/mechcomp_tech
	id = "mechcomp_tech"
	display_name = "MechComp машинерия"
	description = "Используя данные полученные с паралельной вселенной где существовала лабаратория по изучению порталов, мы можем соеденить их вместе с нашими технологиями и научиться воспроизводить её."
	prereq_ids = list("old_tech", "adv_datatheory")
	design_ids = list("mechcomp_button", "mechcomp_delay", "mechcomp_speaker", "mechcomp_textpad", "mechcomp_pressurepad", "mechcomp_grav_accelerator", "mechcomp_math", "mechcomp_list_packer", "mechcomp_list_extractor", "mechcomp_find_regex", "mechcomp_timer", "mechcomp_microphone", "mechcomp_teleport", "mechcomp_disposalconstruct", "mechcomp_multitool", "mechcomp_egunholder", "mechcomp_longrange")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 10000

// HEV, отсылка на Half Life
// Для меня: в будущем допилить данную ветку
/*/datum/techweb_node/black_mesa_tech
	id = "black_mesa_tech"
	display_name = "Восстановление технологий создания защиты"
	description = "Первые шаги в восстановлении технологий из паралельной вселенной где существовала секретная исследовательская лабаратория по изучению телепортаций через транзитный мир."
	prereq_ids = list("adv_old_tech")
	design_ids = list()
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 50000)
	export_price = 25000

// PCV или же энергожилет ну и остальные броники HECUшников
/datum/techweb_node/adv_black_mesa_tech
	id = "black_mesa_tech"
	display_name = "Восстановление технологий создания защиты ч.2"
	description = "Восстановление военной брони и некоторых военных принадлежностей."
	prereq_ids = list("black_mesa_tech")
	design_ids = list()
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 10000

// Остальное
/datum/techweb_node/valve_tech
	id = "black_mesa_tech"
	display_name = "Восстановление технологий создания защиты ч.3"
	description = "Поняв что две вселенные это одна мы решили обьеденить данные и получили возможность синтезировать и воспроизводить ещё неизвестное всему миру оборудование."
	prereq_ids = list("adv_black_mesa_tech")
	design_ids = list()
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 20000)
	export_price = 10000*/
// Затем идут сами вещи после изучений в рнд
// Генератор на дереве
/datum/design/board/power_compressor
	name = "поративный генератор внутренего сгорания (Оборудование)"
	desc = "Поративный генератор сжигающий дерево и превращающий его в энергию."
	id = "pacman_wood"
	build_path = /obj/item/circuitboard/machine/pacman/wood
	category = list ("Engineering Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

// Создание на протолате MechComp машинерии
/datum/design/mechcomp_button
	name = "Кнопка"
	desc = "Подаёт сигнал и передаёт данные по нажатию на неё."
	id = "mechcomp_button"
	build_path = /obj/item/mechcomp/button
	materials = list(/datum/material/iron = 5000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_delay
	name = "Временной ретранслятор"
	desc = "Ретранслирует сигнал с настраиваемой задержкой."
	id = "mechcomp_delay"
	build_path = /obj/item/mechcomp/delay
	materials = list(/datum/material/iron = 3000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_speaker
	name = "Динамик"
	desc = "Издаёт голос при активации."
	id = "mechcomp_speaker"
	build_path = /obj/item/mechcomp/speaker
	materials = list(/datum/material/iron = 8000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_textpad
	name = "Текстовая панель"
	desc = "Для написания текста и отправки его в другие машины."
	id = "mechcomp_textpad"
	build_path = /obj/item/mechcomp/textpad
	materials = list(/datum/material/iron = 1000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_pressurepad
	name = "Нажимная плита"
	desc = "Подаёт сигнал если на неё наступают."
	id = "mechcomp_pressurepad"
	build_path = /obj/item/mechcomp/pressurepad
	materials = list(/datum/material/iron = 10000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_grav_accelerator
	name = "Гравитонный ускоритель"
	desc = "Запускает предметы в сторону напрвления."
	id = "mechcomp_grav_accelerator"
	build_path = /obj/item/mechcomp/grav_accelerator
	materials = list(/datum/material/iron = 20300, /datum/material/glass = 1000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_math
	name = "Модуль арифметики"
	desc = "Высчитывает данные. Математично."
	id = "mechcomp_math"
	build_path = /obj/item/mechcomp/math
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_list_packer
	name = "Модуль упаковщика списка"
	desc = "Упаковывает набор входных данных в компактную форму списка. Пропустит нулевые входные данные и вообще ничего не выведет, если все входные данные нулевые."
	id = "mechcomp_list_packer"
	build_path = /obj/item/mechcomp/list_packer
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_list_extractor
	name = "Модуль экстрактора списка"
	desc = "Принимает числовой индекс и выводит значение из заданного списка с этим индексом. Это так просто. Отклоняет списки с одним элементом (т.е. без разделителей \"&\"). Если в качестве индекса ему передано не числовое значение, он вернет первый элемент списка."
	id = "mechcomp_list_extractor"
	build_path = /obj/item/mechcomp/list_extractor
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_find_regex
	name = "Модуль поиска данных"
	desc = "Использует черную магию регулярных выражений для поиска определенных данных в заданной строке."
	id = "mechcomp_find_regex"
	build_path = /obj/item/mechcomp/find_regex
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_timer
	name = "Таймер"
	desc = "Посылает установленный сигнал каждый период времени. Можно установить периоды от 0.1 до 10 секунд."
	id = "mechcomp_timer"
	build_path = /obj/item/mechcomp/timer
	materials = list(/datum/material/iron = 3000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_microphone
	name = "Микрофон"
	desc = "Большой микрофон для передачи данных. Или прослушки."
	id = "mechcomp_microphone"
	build_path = /obj/item/mechcomp/microphone
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 1000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_teleport
	name = "Телепорт"
	desc = "Телепортирует обьекты на расстоянии до 14 плиток."
	id = "mechcomp_teleport"
	build_path = /obj/item/mechcomp/teleport
	materials = list(/datum/material/iron = 20000, /datum/material/uranium = 5000, /datum/material/gold = 1000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_disposalconstruct
	name = "Люк"
	desc = "Подходит для утилизации ненужных обьектов. Или быстрого перемещения."
	id = "mechcomp_disposalconstruct"
	build_path = /obj/structure/disposalconstruct/mechcomp
	materials = list(/datum/material/iron = 10000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_multitool
	name = "Мультитул-соеденитель"
	desc = "Соединитель марки MechComp, используемый в конструкции и использовании механических компонентов марки MechComp. Может также использоваться как мультитул."
	id = "mechcomp_multitool"
	build_path = /obj/item/multitool/mechcomp
	materials = list(/datum/material/iron = 200, /datum/material/glass = 300)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_egunholder
	name = "Устроиство для установки оружия"
	desc = "В него вставляется энергетическое оружие которое стреляет при получении сигнала."
	id = "mechcomp_egunholder"
	build_path = /obj/item/mechcomp/egunholder
	materials = list(/datum/material/iron = 10000, /datum/material/diamond = 1000, /datum/material/gold = 1000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/mechcomp_longrange
	name = "Дальний телепорт"
	desc = "Телепорт не ограниченный в радиусе действия."
	id = "mechcomp_longrange"
	build_path = /obj/item/mechcomp/teleport/longrange
	materials = list(/datum/material/iron = 20000, /datum/material/bluespace = 10000, /datum/material/gold = 5000)
	category = list("MechComp")
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
