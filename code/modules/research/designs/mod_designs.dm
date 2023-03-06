//MODsuit construction

/datum/design/mod_shell
	name = "Каркас МОД-Скафандра"
	desc = "Чертеж каркаса МОД-Скафандра от 'Накамура инжиниринг'"
	id = "mod_shell"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 10000, /datum/material/plasma = 5000)
	construction_time = 25 SECONDS
	build_path = /obj/item/mod/construction/shell
	category = list("MODsuit Chassis")

/datum/design/mod_helmet
	name = "Шлем МОД-Скафандра"
	desc = "Чертеж шлема МОД-Скафандра от 'Накамура инжиниринг'."
	id = "mod_helmet"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/helmet
	category = list("MODsuit Chassis")

/datum/design/mod_chestplate
	name = "Нагрудник МОД-Скафандра"
	desc = "Чертеж нагрудника МОД-Скафандра от 'Накамура инжиниринг'."
	id = "mod_chestplate"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/chestplate
	category = list("MODsuit Chassis")

/datum/design/mod_gauntlets
	name = "Перчатки МОД-Скафандра"
	desc = "Чертеж перчаток МОД-Скафандра от 'Накамура инжиниринг'."
	id = "mod_gauntlets"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/gauntlets
	category = list("MODsuit Chassis")

/datum/design/mod_boots
	name = "Ботинки МОД-Скафандра"
	desc = "Чертеж ботинок МОД-Скафандра от 'Накамура инжиниринг'."
	id = "mod_boots"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/boots
	category = list("MODsuit Chassis")

/datum/design/mod_plating
	name = "МОД Внешняя обшивка"
	desc = "Внешняя обшивка для МОД-Скафандров."
	id = "mod_plating_standard"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 6000, /datum/material/glass = 3000, /datum/material/plasma = 1000)
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating
	category = list("MODsuit Chassis")
	research_icon = 'icons/obj/clothing/modsuit/mod_construction.dmi'
	research_icon_state = "standard-plating"

/*datum/design/mod_plating/New()
	. = ..()
	var/obj/item/mod/construction/plating/armor_type = build_path
	var/datum/mod_theme/theme = GLOB.mod_themes[initial(armor_type.theme)]
	name = "МОД [theme.ru_name] обшивка"
	desc = "Внешняя обшивка для МОД-Скафандра. [theme.desc]"*/

/datum/design/mod_plating/engineering
	id = "mod_plating_engineering"
	name = "МОД Инженерная обшивка"
	build_type = MECHFAB
	category = list("MODsuit Chassis")
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating/engineering
	materials = list(/datum/material/iron = 6000, /datum/material/gold = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	research_icon_state = "engineering-plating"

/datum/design/mod_plating/atmospheric
	id = "mod_plating_atmospheric"
	name = "МОД Атмосферная обшивка"
	build_type = MECHFAB
	category = list("MODsuit Chassis")
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating/atmospheric
	materials = list(/datum/material/iron = 6000, /datum/material/titanium = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	research_icon_state = "atmospheric-plating"

/datum/design/mod_plating/medical
	id = "mod_plating_medical"
	name = "МОД Медицинская обшивка"
	build_type = MECHFAB
	category = list("MODsuit Chassis")
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating/medical
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
	research_icon_state = "medical-plating"

/datum/design/mod_plating/security
	id = "mod_plating_security"
	name = "МОД Охранная обшивка"
	build_type = MECHFAB
	category = list("MODsuit Chassis")
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating/security
	materials = list(/datum/material/iron = 6000, /datum/material/uranium = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	research_icon_state = "security-plating"

/datum/design/mod_plating/cosmohonk
	id = "mod_plating_cosmohonk"
	name = "МОД Клоунская обшивка"
	build_type = MECHFAB
	category = list("MODsuit Chassis")
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating/cosmohonk
	materials = list(/datum/material/iron = 6000, /datum/material/bananium = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
	research_icon_state = "cosmohonk-plating"

/datum/design/mod_plating/mining
	id = "mod_plating_mining"
	name = "МОД Шахтёрская обшивка"
	build_type = MECHFAB
	category = list("MODsuit Chassis")
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating/mining
	materials = list(/datum/material/iron = 6000, /datum/material/titanium = 4000, /datum/material/glass = 1000, /datum/material/plasma = 4000)
	departmental_flags = DEPARTMENTAL_FLAG_CARGO
	research_icon_state = "mining-plating"

/datum/design/mod_paint_kit
	name = "Набор покраски MOD-Скафандра"
	desc = "Этот комплект перекрасит ваш скафандр во что-то уникальное."
	id = "mod_paint_kit"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 1000, /datum/material/plastic = 500)
	construction_time = 5 SECONDS
	build_path = /obj/item/mod/paint
	category = list("Power Designs")

//MODsuit modules

/datum/design/module
	name = "МОД-Скаф модуль"
	build_type = MECHFAB
	construction_time = 1 SECONDS
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module
	category = list("MODsuit Modules")
	var/department_type// = MODULE_GENERAL

/datum/design/module/New()
	. = ..()
	var/obj/item/mod/module/module = build_path
	desc = "[initial(module.desc)] Создаёт [initial(module.complexity)] нагрузки на системы."

/datum/design/module/mod_storage
	name = "МОД-Скаф модуль: Хранилище"
	id = "mod_storage"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/storage/normal_capacity

/datum/design/module/mod_storage_expanded
	name = "МОД-Скаф: Расширенное хранилище"
	id = "mod_storage_expanded"
	materials = list(/datum/material/iron = 5000, /datum/material/uranium = 2000)
	build_path = /obj/item/mod/module/storage/large_capacity

/datum/design/module/mod_visor_medhud
	name = "МОД-Скаф модуль: Медицинский визор"
	id = "mod_visor_medhud"
	materials = list(/datum/material/silver = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/medhud
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/module/mod_visor_diaghud
	name = "МОД-Скаф модуль: Диагностический визор"
	id = "mod_visor_diaghud"
	materials = list(/datum/material/gold = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/diaghud
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/module/mod_visor_sechud
	name = "МОД-Скаф модуль: Визор охраны"
	id = "mod_visor_sechud"
	materials = list(/datum/material/titanium = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/sechud
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/module/mod_visor_meson
	name = "МОД-Скаф модуль: Мезонный визор"
	id = "mod_visor_meson"
	materials = list(/datum/material/uranium = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/meson
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/module/mod_visor_welding
	name = "МОД-Скаф модуль: Защита от вспышек"
	id = "mod_welding"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/welding
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_t_ray
	name = "МОД-Скаф модуль: Терагерцовый сканер"
	id = "mod_t_ray"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/t_ray
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_health_analyzer
	name = "МОД-Скаф модуль: Медицинский анализатор"
	id = "mod_health_analyzer"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/health_analyzer
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/module/mod_armor
	name = "МОД-Скаф модуль: Усиление защиты"
	id = "mod_armor"
	materials = list(/datum/material/iron = 2000, /datum/material/titanium = 1000)
	build_path = /obj/item/mod/module/armor_booster
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/module/mod_stealth
	name = "МОД-Скаф модуль: Маскировка"
	id = "mod_stealth"
	materials = list(/datum/material/iron = 1000, /datum/material/bluespace = 500)
	build_path = /obj/item/mod/module/stealth
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/module/mod_jetpack
	name = "МОД-Скаф модуль: Ионные двигатели"
	id = "mod_jetpack"
	materials = list(/datum/material/iron = 1500, /datum/material/plasma = 1000)
	build_path = /obj/item/mod/module/jetpack

/datum/design/module/mod_magboot
	name = "МОД-Скаф модуль: Магнитные ботинки"
	id = "mod_magboot"
	materials = list(/datum/material/iron = 1000, /datum/material/gold = 500)
	build_path = /obj/item/mod/module/magboot
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_mag_harness
	name = "МОД-Скаф модуль: Магнитные захваты"
	id = "mod_mag_harness"
	materials = list(/datum/material/iron = 1500, /datum/material/silver = 500)
	build_path = /obj/item/mod/module/magnetic_harness
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/module/mod_tether
	name = "МОД-Скаф модуль: Аварийный трос"
	id = "mod_tether"
	materials = list(/datum/material/iron = 1000, /datum/material/silver = 500)
	build_path = /obj/item/mod/module/tether
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_mouthhole
	name = "МОД-Скаф модуль: Аппарат для приёма пищи"
	id = "mod_mouthhole"
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/mod/module/mouthhole

/datum/design/module/mod_rad_protection
	name = "МОД-Скаф модуль: Радиационная защита"
	id = "mod_rad_protection"
	materials = list(/datum/material/iron = 1000, /datum/material/uranium = 1000)
	build_path = /obj/item/mod/module/rad_protection
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_emp_shield
	name = "МОД-Скаф модуль: Защита от ЭМИ"
	id = "mod_emp_shield"
	materials = list(/datum/material/iron = 1000, /datum/material/plasma = 1000)
	build_path = /obj/item/mod/module/emp_shield

/datum/design/module/mod_flashlight
	name = "МОД-Скаф модуль: Фонарик"
	id = "mod_flashlight"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/flashlight

/datum/design/module/mod_reagent_scanner
	name = "МОД-Скаф модуль: Сканер реагентов"
	id = "mod_reagent_scanner"
	materials = list(/datum/material/glass = 1000)
	build_path = /obj/item/mod/module/reagent_scanner
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/module/mod_gps
	name = "МОД-Скаф модуль: GPS-трекер"
	id = "mod_gps"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/gps
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/module/mod_constructor
	name = "МОД-Скаф модуль: Строительный сканер"
	id = "mod_constructor"
	materials = list(/datum/material/iron = 1000, /datum/material/titanium = 500)
	build_path = /obj/item/mod/module/constructor
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_quick_carry
	name = "МОД-Скаф модуль: Транспортёр раненых"
	id = "mod_quick_carry"
	materials = list(/datum/material/iron = 1000, /datum/material/titanium = 500)
	build_path = /obj/item/mod/module/quick_carry
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/module/mod_longfall
	name = "МОД-Скаф модуль: Защита от падения"
	id = "mod_longfall"
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/mod/module/longfall

/datum/design/module/mod_thermal_regulator
	name = "МОД-Скаф модуль: Регулятор температуры"
	id = "mod_thermal_regulator"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/thermal_regulator

/datum/design/module/mod_injector
	name = "МОД-Скаф модуль: Инъектор"
	id = "mod_injector"
	materials = list(/datum/material/iron = 1000, /datum/material/diamond = 500)
	build_path = /obj/item/mod/module/injector
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/module/mod_bikehorn
	name = "МОД-Скаф модуль: Клаксон"
	id = "mod_bikehorn"
	materials = list(/datum/material/plastic = 500, /datum/material/iron = 500)
	build_path = /obj/item/mod/module/bikehorn
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/module/mod_microwave_beam
	name = "МОД-Скаф модуль: Микроволновый луч"
	id = "mod_microwave_beam"
	materials = list(/datum/material/iron = 1000, /datum/material/uranium = 500)
	build_path = /obj/item/mod/module/microwave_beam
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/module/mod_waddle
	name = "МОД-Скаф модуль: Неуклюжая ходьба"
	id = "mod_waddle"
	materials = list(/datum/material/plastic = 1000, /datum/material/iron = 1000)
	build_path = /obj/item/mod/module/waddle
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/module/mod_clamp
	name = "МОД-Скаф модуль: Гидравлический манипулятор"
	id = "mod_clamp"
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/mod/module/clamp
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/module/mod_drill
	name = "МОД-Скаф модуль: Бур"
	id = "mod_drill"
	materials = list(/datum/material/silver = 1000, /datum/material/iron = 2000)
	build_path = /obj/item/mod/module/drill
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/module/mod_orebag
	name = "МОД-Скаф модуль: Сумки для руды"
	id = "mod_orebag"
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/mod/module/orebag
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/module/mod_organ_thrower
	name = "МОД-Скаф модуль: Замена органов"
	id = "mod_organ_thrower"
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/organ_thrower
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/*datum/design/module/mod_pathfinder
	name = "МОД-Скаф модуль: Следопыт"
	id = "mod_pathfinder"
	materials = list(/datum/material/uranium = 1000, /datum/material/iron = 1000)
	build_path = /obj/item/mod/module/pathfinder*/

/datum/design/module/mod_dna_lock
	name = "МОД-Скаф модуль: ДНК блокировка"
	id = "mod_dna_lock"
	materials = list(/datum/material/diamond = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/dna_lock

/datum/design/module/mod_plasma_stabilizer
	name = "МОД-Скаф модуль: Стабилизатор плазмы"
	id = "mod_plasma"
	materials = list(/datum/material/plasma = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/plasma_stabilizer

/datum/design/module/mod_glove_translator
	name = "МОД-Скаф модуль: Перевод языка жестов"
	id = "mod_sign_radio"
	materials = list(/datum/material/iron = 750, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/signlang_radio

/datum/design/module/mister_atmos
	name = "МОД-Скаф модуль: Огнеборец"
	id = "mod_mister_atmos"
	materials = list(/datum/material/glass = 1000, /datum/material/titanium = 1500)
	build_path = /obj/item/mod/module/mister/atmos
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/module/mod_holster
	name = "МОД-Скаф модуль: Кобура"
	id = "mod_holster"
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/holster
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//MODsuit bepis modules

/datum/design/module/disposal
	name = "МОД-Скаф модуль: Этикеровщик назначения"
	id = "mod_disposal"
	materials = list(/datum/material/iron = 2500, /datum/material/titanium = 1000)
	build_path = /obj/item/mod/module/disposal_connector
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

//MODsuit anomalock modules

/datum/design/module/mod_antigrav
	name = "МОД-Скаф модуль: Анти-гравитация"
	id = "mod_antigrav"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2000, /datum/material/uranium = 2000)
	build_path = /obj/item/mod/module/anomaly_locked/antigrav
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/module/mod_teleporter
	name = "МОД-Скаф модуль: Телепорт"
	id = "mod_teleporter"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2000, /datum/material/bluespace = 2000)
	build_path = /obj/item/mod/module/anomaly_locked/teleporter
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/*datum/design/module/mod_kinesis
	name = "МОД-Скаф модуль: Кинезис"
	id = "mod_kinesis"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2000, /datum/material/uranium = 1000, /datum/material/bluespace = 1000)
	build_path = /obj/item/mod/module/anomaly_locked/kinesis
	departmental_flags = MODULE_ENGINEERING
*/
/datum/design/module/mod_sonar
	name = "МОД-Скаф модуль: Активный сонар"
	id = "mod_sonar"
	materials = list(/datum/material/titanium = 250, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/uranium = 250)
	build_path = /obj/item/mod/module/active_sonar
	//departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/module/projectile_dampener
	name = "МОД-Скаф модуль: Гиперкинетический демпфер"
	id = "mod_projectile_dampener"
	materials = list(/datum/material/iron = 1000, /datum/material/bluespace = 500)
	build_path = /obj/item/mod/module/projectile_dampener
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
