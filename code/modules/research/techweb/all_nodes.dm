
//Current rate: 135000 research points in 90 minutes

//Base Nodes
/datum/techweb_node/base
	id = "base"
	starting_node = TRUE
	design_ids = list(
		// Basic Parts
		"basic_matter_bin", "basic_cell", "basic_scanning", "basic_capacitor", "basic_micro_laser", "micro_mani",
		// Cargo Stuff
		"c-reader", "desttagger", "salestagger", "handlabel", "packagewrap",
		// Research Stuff
		"destructive_analyzer", "circuit_imprinter", "experimentor", "rdconsole", "bepis", "rdserver", "design_disk", "tech_disk", "mechfab",
		// Miscellaneous Stufff
		"paystand", "space_heater", "bucket", "plastic_knife", "plastic_fork", "plastic_spoon",
		// Security Stuff
		"sec_rshot", "sec_beanbag_slug", "sec_slug", "sec_Islug", "sec_dart", "sec_38", "buckshot_shell", "beanbag_slug", "rubber_shot", "buckshot_box", "beanbag_box", "slug_box", "rubber_box", "incendiary_box",
		//Handgun Ammo (Security)
		"commanderammo", "stechkinammo", "m1911ammo", "m9cammo", "c9mm", "c10mm", "c45", "c556mmHITP", "rubbershot9mm", "rubbershot10mm", "rubbershot45", "rubbershot556mmHITP",
		// Construction Materials
		"rglass", "plasteel", "plastitanium", "plasmaglass", "plasmareinforcedglass", "titaniumglass", "plastitaniumglass",
		// You People Are Animals
		"trashbag",
	display_name = "Базовые научные разработки"
	description = "Стандартный пакет данных предоставляемый компанией НаноТрейзен всем научно-исследовательским станциям. Содержит основные чертежи машиностроения и производства."
	)

/datum/techweb_node/mmi
	id = "mmi"
	starting_node = TRUE
	display_name = "Машинно-человеческий интерфейс"
	description = "Вторая жизнь человеку который потерял мозг."
	design_ids = list("mmi")

/datum/techweb_node/cyborg
	id = "cyborg"
	starting_node = TRUE
	design_ids = list("robocontrol", "sflash", "borg_suit", "borg_head", "borg_chest", "borg_r_arm", "borg_l_arm", "borg_r_leg", "borg_l_leg", "borgupload",
					"cyborgrecharger", "borg_upgrade_restart", "borg_upgrade_rename", "augmanipulator")
	display_name = "Базовая кибернетика"
	description = "Стандартный пакет данных предоставляемый компанией НаноТрейзен всем научно-исследовательским станциям. Содержит основные чертежи строительства киборгов."

/datum/techweb_node/mech
	id = "mecha"
	starting_node = TRUE
	design_ids = list("mecha_tracking", "mechacontrol", "mechapower", "mech_recharger", "ripley_chassis", "firefighter_chassis", "ripley_torso", "ripley_left_arm",
					"ripley_right_arm", "ripley_left_leg", "ripley_right_leg", "ripley_main", "ripley_peri", "ripleyupgrade", "mech_hydraulic_clamp")
	display_name = "Рабочие экзокостюмы"
	description = "Стандартный пакет данных предоставляемый компанией НаноТрейзен всем научно-исследовательским станциям. Расширяют физические границы человека благодаря сложным гидравлическим системам."

/datum/techweb_node/mech_tools
	id = "mech_tools"
	starting_node = TRUE
	design_ids = list("mech_drill", "mech_mscanner", "mech_extinguisher", "mech_cable_layer") //WS Edit - Reverted Smartwire
	display_name = "Базовая экипировка экзокостюмов"
	description = "Стандартный пакет данных предоставляемый компанией НаноТрейзен всем научно-исследовательским станциям. Базовые инструменты экзокостюмов."

/datum/techweb_node/basic_tools
	id = "basic_tools"
	starting_node = TRUE
	design_ids = list("screwdriver", "wrench", "wirecutters", "crowbar", "multitool", "welding_tool", "tscanner", "analyzer", "cable_coil", "pipe_painter", "airlock_painter",
					"cultivator", "plant_analyzer", "shovel", "spade", "hatchet", "mop", "floor_painter", "decal_painter", "plunger", "spraycan") //WS Edit - Floor Painters
	display_name = "Базовые инструменты"
	description = "Стандартный пакет данных предоставляемый компанией НаноТрейзен всем научно-исследовательским станциям. Хранит базовые чертежи механических, хирургических, ботанических и прочих инструментов."

/datum/techweb_node/basic_medical
	id = "basic_medical"
	starting_node = TRUE
	display_name = "Basic Medical Equipment"
	description = "Basic medical tools and equipment."
	design_ids = list("cybernetic_liver", "cybernetic_heart", "cybernetic_lungs", "cybernetic_stomach", "scalpel", "circular_saw", "surgicaldrill", "retractor", "cautery", "hemostat",
					"syringe", "plumbing_rcd", "beaker", "large_beaker", "xlarge_beaker", "dropper", "defibmountdefault", "portable_chem_mixer")

/////////////////////////Biotech/////////////////////////
/datum/techweb_node/biotech
	id = "biotech"
	prereq_ids = list("base")
	design_ids = list("sleeper", "chem_heater", "chem_master", "pandemic", "defibrillator", "defibmount", "operating", "soda_dispenser", "beer_dispenser", "healthanalyzer", "medigel","genescanner", "med_spray_bottle", "chem_pack", "blood_pack", "medical_kiosk", "crewpinpointerprox", "medipen_refiller", "prosthetic_l_arm", "prosthetic_r_arm", "prosthetic_l_leg", "prosthetic_r_leg", "kprosthetic_l_arm", "kprosthetic_r_arm", "kprosthetic_l_leg", "kprosthetic_r_leg", "vprosthetic_l_arm", "vprosthetic_r_arm", "vprosthetic_l_leg", "vprosthetic_r_leg", "lprosthetic_l_arm", "lprosthetic_r_arm", "lprosthetic_l_leg", "lprosthetic_r_leg")
	display_name = "Биотехнологии"
	description = "То, что заставляет сердце биться."	//the MC, silly!
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_biotech
	id = "adv_biotech"
	prereq_ids = list("biotech")
	design_ids = list("piercesyringe", "crewpinpointer", "smoke_machine", "plasmarefiller", "limbgrower", "meta_beaker", "healthanalyzer_advanced", "harvester", "holobarrier_med", "detective_scanner", "defibrillator_compact")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Продвинутые Биотехнологии"
	description = "Расширят границы познания."

/datum/techweb_node/xenoorgan_biotech
	id = "xenoorgan_bio"
	prereq_ids = list("adv_biotech")
	design_ids = list("limbdesign_abductor", "limbdesign_fly", "limbdesign_golem", "limbdesign_pod", "limbdesign_skeleton", "limbdesign_snail")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/xenomorph_biotech
	id = "xenomorph_bio"
	prereq_ids = list("adv_biotech", "xenoorgan_bio")
	design_ids = list("limbdesign_xenomorph")
	boost_item_paths = list(/obj/item/organ/brain/alien, /obj/item/organ/body_egg/alien_embryo, /obj/item/organ/eyes/night_vision/alien, /obj/item/organ/tongue/alien,
	/obj/item/organ/liver/alien, /obj/item/organ/ears, /obj/item/organ/alien/plasmavessel, /obj/item/organ/alien/plasmavessel/large, /obj/item/organ/alien/plasmavessel/large/queen,
	/obj/item/organ/alien/plasmavessel/small, /obj/item/organ/alien/plasmavessel/small/tiny, /obj/item/organ/alien/resinspinner, /obj/item/organ/alien/acid, /obj/item/organ/alien/neurotoxin)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 20000
	hidden = TRUE
	display_name = "Ксено-органы"
	description = "Органы ксенорас."

/datum/techweb_node/bio_process
	id = "bio_process"
	prereq_ids = list("biotech")
	design_ids = list("smartfridge", "gibber", "deepfryer", "monkey_recycler", "processor", "gibber", "microwave", "reagentgrinder", "dish_drive", "fat_sucker")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Биологическая обработка"
	description = "От слаймов до кухни."

/////////////////////////Advanced Surgery/////////////////////////
/datum/techweb_node/imp_wt_surgery
	id = "imp_wt_surgery"
	prereq_ids = list("biotech")
	design_ids = list("surgery_heal_brute_upgrade","surgery_heal_burn_upgrade")
	display_name = "Улучшенная Травматологическая Хирургия"
	description = "Удивительно, но оказывается, что надежно зафиксированный пациент более не нуждается в анестезии!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 1000


/datum/techweb_node/adv_surgery
	id = "adv_surgery"
	prereq_ids = list("imp_wt_surgery")
	design_ids = list("surgery_lobotomy", "surgery_heal_brute_upgrade_femto", "surgery_heal_burn_upgrade_femto","surgery_heal_combo","surgery_adv_dissection")
	display_name = "Продвинутая Хирургия"
	description = "Не бывает лишних органов, есть только их недостаточное количество..."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)
	export_price = 4000

/datum/techweb_node/exp_surgery
	id = "exp_surgery"
	prereq_ids = list("adv_surgery")
	design_ids = list("surgery_pacify","surgery_vein_thread","surgery_muscled_veins","surgery_nerve_splice","surgery_nerve_ground","surgery_ligament_hook","surgery_ligament_reinforcement","surgery_viral_bond", "surgery_heal_combo_upgrade", "surgery_exp_dissection", "surgery_cortex_imprint","surgery_cortex_folding")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000
	display_name = "Экспериментальная Хирургия"
	description = "Когда природная эволюция не поспевает за прогрессом."

/datum/techweb_node/alien_surgery
	id = "alien_surgery"
	prereq_ids = list("exp_surgery", "alientech")
	design_ids = list("surgery_brainwashing","surgery_zombie","surgery_heal_combo_upgrade_femto", "surgery_ext_dissection")
	display_name = "Инопланетная Хирургия"
	description = "Похитители ни в чем не виноваты!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000

/////////////////////////data theory tech/////////////////////////
/datum/techweb_node/datatheory //Computer science
	id = "datatheory"
	prereq_ids = list("base")
	display_name = "Теория данных"
	description = "Мало получить данные из эксперимента, для начала их еще надо как-то интерпретировать и записать!"
	design_ids = list(
		"survey-handheld-advanced",
		"design_disk_adv"
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_datatheory
	id = "adv_datatheory"
	display_name = "Продвинутая теория данных"
	description = "Новый взгляд на программирование."
	prereq_ids = list("datatheory")
	design_ids = list("icprinter", "icupgadv", "icupgclo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/////////////////////////engineering tech/////////////////////////
/datum/techweb_node/engineering
	id = "engineering"
	prereq_ids = list("base")
	design_ids = list("solarcontrol", "solarassembly", "recharger", "powermonitor", "rped", "pacman", "adv_capacitor", "adv_scanning", "emitter", "high_cell", "adv_matter_bin", "scanner_gate",
	"atmosalerts", "atmos_control", "recycler", "autolathe", "high_micro_laser", "nano_mani", "mesons", "welding_goggles", "thermomachine", "rad_collector", "tesla_coil", "grounding_rod",
	"apc_control", "cell_charger", "power control", "airlock_board", "firelock_board", "aac_electronics", "airalarm_electronics", "firealarm_electronics", "cell_charger", "stack_console", "stack_machine",
	"oxygen_tank", "plasma_tank", "emergency_oxygen", "emergency_oxygen_engi", "plasmaman_tank_belt", "pneumatic_seal", "shieldwallgen", "shieldwallgen_atmos") //WS edit, solar assemblies from lathe
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000
	display_name = "Промышленное машиностроение"
	description = "Первый шаг индустриализации - это переход на значительно более качественный уровень продукции и автоматизацию техпроцесса."

/datum/techweb_node/adv_engi
	id = "adv_engi"
	prereq_ids = list("engineering", "emp_basic")
	design_ids = list("engine_goggles", "magboots", "forcefield_projector", "weldingmask", "rcd_loaded", "rpd_loaded", "sheetifier")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Передовые инженерные разработки"
	description = "Запустить процесс цепной ядерной реакции не так сложно, но всегда стоит помнить, что граница между атомным реактором и атомным взрывом определяется лишь квалификацией и сознательностью."

/datum/techweb_node/anomaly
	id = "anomaly_research"
	prereq_ids = list("adv_engi", "practical_bluespace")
	design_ids = list("reactive_armour", "anomaly_neutralizer")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Исследование аномалий"
	description = "Если бы люди древности узрели плоды наших трудов, они назвали бы это магией. Но магии не существует, существует лишь недостаток информации. А аномалии? Это лишнее доказательство безграничности познания."

/datum/techweb_node/high_efficiency
	id = "high_efficiency"
	prereq_ids = list("engineering", "datatheory")
	design_ids = list("pico_mani", "super_matter_bin")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000
	display_name = "Высокоэффективные детали"
	description = "Точность. Это то что отличает гаражную самоделку от заводского продукта."

/datum/techweb_node/adv_power
	id = "adv_power"
	prereq_ids = list("engineering")
	design_ids = list("smes", "super_cell", "hyper_cell", "super_capacitor", "superpacman", "mrspacman", "power_turbine", "power_turbine_console", /*"power_compressor", */"circulator", "teg", "multi_cell_charger")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Передовые энергетические разработки"
	description = "Занимательный факт. Атомные станции прошлого вырабатывали сотни ГВатт энергии, однако усвоить из них могли лишь не более 1%, а запасти на примитивные энергоносители меньше 0.00001%."

/////////////////////////Bluespace tech/////////////////////////
/datum/techweb_node/bluespace_basic //Bluespace-memery
	id = "bluespace_basic"
	prereq_ids = list("base")
	design_ids = list("beacon", "xenobioconsole", "telesci_gps", "bluespace_crystal")
	display_name = "Фундаментальная теория блюспейса"
	description = "Выявление основополагающих законов - ключ к познанию сути."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/bluespace_travel
	id = "bluespace_travel"
	prereq_ids = list("practical_bluespace")
	design_ids = list("tele_station", "tele_hub", "teleconsole", "quantumpad", "launchpad", "launchpad_console")
	display_name = "Блюспейс телепортация"
	description = "Прикладные изыскания в области блюспейса для транслокального перемещения."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/techweb_node/micro_bluespace
	id = "micro_bluespace"
	prereq_ids = list("bluespace_travel", "practical_bluespace", "high_efficiency")
	design_ids = list("bluespace_matter_bin", "femto_mani", "bluespacebodybag", "triphasic_scanning", "quantum_keycard", "wormholeprojector", "swapper")
	display_name = "Квантовая изометрия"
	description = "Прорывная технология приближающая возможности манипулирования материи к атомарному уровню."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000

/datum/techweb_node/advanced_bluespace
	id = "bluespace_storage"
	prereq_ids = list("micro_bluespace", "janitor")
	design_ids = list("bag_holding")
	display_name = "Подпространственные карманы"
	description = "Первый шаг за грань Евклидового пространства."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 3000

/datum/techweb_node/practical_bluespace
	id = "practical_bluespace"
	prereq_ids = list("bluespace_basic", "engineering")
	design_ids = list("bs_rped","minerbag_holding", "bluespacebeaker", "bluespacesyringe", "phasic_scanning", "roastingstick", "ore_silo", "chem_dispenser", "biobag_holding", "engibag_holding", "plantbag_holding", "chembag_holding")
	display_name = "Прикладная блюспейс физика"
	description = "Разработка теории квантовых близнецов и межпространственных дыр."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/techweb_node/bluespace_power
	id = "bluespace_power"
	prereq_ids = list("adv_power", "practical_bluespace")
	design_ids = list("bluespace_cell", "quadratic_capacitor")
	display_name = "Блюспейс энергетика"
	description = "Позволяет аккумулировать заряд на межатомном уровне!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/regulated_bluespace
	id = "regulated_bluespace"
	display_name = "Основная блюспейс физика"
	description = "Технологии блюспейс с использованием стабильных и сбалансированных процедур. Разрешена к использованию галактическим соглашением."
	prereq_ids = list("base")
	design_ids = list()
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500

/datum/techweb_node/unregulated_bluespace
	id = "unregulated_bluespace"
	prereq_ids = list("bluespace_travel", "syndicate_basic")
	design_ids = list("desynchronizer")
	display_name = "Несертифицированные блюспейс исследования"
	description = "Технология позволяющая грубо вмешаться в структуру блюспейс пространства и способная повлиять на пространственно-временной континиум. Строго запрещена космической академией наук."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500

///////////////////////// Неевклидовые детали /////////////////////////
/datum/techweb_node/noneuclidic
	id = "noneuclidic"
	display_name = "Неевклидовые исследования"
	description = "Эксперименты в области технологий блюспейса привели к открытию неевклидовых законов физики."
	prereq_ids = list(
		"bluespace_travel",
		"practical_bluespace",
		"bluespace_storage",
	)
	design_ids = list(
		"noneuclid_capacitor",
		"noneuclid_scanning",
		"noneuclid_mani",
		"noneuclid_micro_laser",
		"noneuclid_matter_bin",
		"noneuclid_capacitor_x10",
		"noneuclid_scanning_x10",
		"noneuclid_mani_x10",
		"noneuclid_micro_laser_x10",
		"noneuclid_matter_bin_x10",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 250000)

/////////////////////////plasma tech/////////////////////////
/datum/techweb_node/basic_plasma
	id = "basic_plasma"
	prereq_ids = list("engineering")
	design_ids = list("mech_generator")
	display_name = "Базовое исследование плазмы"
	description = "Плазма - это философский камень нового тысячелетия, что расширяет границы познания и стирает грани дозволенного."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_plasma
	id = "adv_plasma"
	prereq_ids = list("basic_plasma")
	design_ids = list("mech_plasma_cutter")
	display_name = "Продвинутое исследование плазмы"
	description = "Практические опыты показали, что температура горения плазмы превышает оную в короне солнца."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/////////////////////////robotics tech/////////////////////////
/datum/techweb_node/robotics
	id = "robotics"
	prereq_ids = list("base")
	design_ids = list("paicard")
	display_name = "Базовое исследование робототехники"
	description = "Программируемые машины, что делают нашу жизнь проще."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_robotics
	id = "adv_robotics"
	prereq_ids = list("neural_programming", "robotics")
	design_ids = list("mmi_posi")
	display_name = "Продвинутое исследование робототехники"
	description = "Машины, использующие нейронные сети для имитации человеческого поведения."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/neural_programming
	id = "neural_programming"
	prereq_ids = list("biotech", "datatheory")
	display_name = "Нейронное программирование"
	description = "Изучение объединенной сети процессоров, которые имитируют наш мозг."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/cyborg_upg_util
	id = "cyborg_upg_util"
	display_name = "Модернизация киборгов: Утилитарные"
	description = "Utility upgrades for cyborgs."
	prereq_ids = list("adv_robotics")
	design_ids = list("borg_upgrade_thrusters", "borg_upgrade_selfrepair", "borg_upgrade_expand", "borg_upgrade_disablercooler", "borg_upgrade_trashofholding", "borg_upgrade_advancedmop")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 5000

/datum/techweb_node/cyborg_upg_engiminer
	id = "cyborg_upg_engiminer"
	prereq_ids = list("adv_engi", "basic_mining")
	design_ids = list("borg_upgrade_rped", "borg_upgrade_circuitapp", "borg_upgrade_diamonddrill", "borg_upgrade_lavaproof", "borg_upgrade_holding")
	display_name = "Модернизация киборгов: Шахтер и Инженер"
	description = "Модернизации для строительства и добычи ресурсов."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 5000

/datum/techweb_node/cyborg_upg_med
	id = "cyborg_upg_med"
	prereq_ids = list("adv_biotech")
	design_ids = list("borg_upgrade_defibrillator", "borg_upgrade_piercinghypospray", "borg_upgrade_expandedsynthesiser", "borg_upgrade_pinpointer", "borg_upgrade_surgicalprocessor", "borg_upgrade_beakerapp")
	display_name = "Модернизация киборгов: Медик"
	description = "Модернизации для оказания медицинской помощи в более эффективном диапазоне."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 5000

/datum/techweb_node/ai
	id = "ai"
	prereq_ids = list("adv_robotics")
	design_ids = list("aifixer", "aicore", "safeguard_module", "onehuman_module", "protectstation_module", "quarantine_module", "oxygen_module", "freeform_module",
	"reset_module", "purge_module", "remove_module", "freeformcore_module", "asimov_module", "paladin_module", "tyrant_module", "overlord_module", "corporate_module",
	"default_module", "borg_ai_control", "mecha_tracking_ai_control", "aiupload", "intellicard")
	display_name = "Искусственный интеллект"
	description = "Именитые робототехники считают что главное отличие человеческого мозга от искусственного аналога - это неспособность последнего к самостоятельному творчеству. Только всегда стоит помнить про главную ошибку любого начинающего Бога - не недооценивай свое собственное творение, ведь оно может превзойти создателя."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/////////////////////////EMP tech/////////////////////////
/datum/techweb_node/emp_basic //EMP tech for some reason
	id = "emp_basic"
	prereq_ids = list("base")
	design_ids = list("holosign", "holosignsec", "holosignengi", "holosignatmos", "inducer", "tray_goggles", "holopad")
	display_name = "Электромагнитная теория"
	description = "Изучение использования частот в электромагнитном спектре."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/emp_adv
	id = "emp_adv"
	prereq_ids = list("emp_basic")
	design_ids = list("ultra_micro_laser")
	display_name = "Продвинутая электромагнитная теория"
	description = "Практическое применение поляризации светового потока."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)
	export_price = 5000

/datum/techweb_node/emp_super
	id = "emp_super"
	prereq_ids = list("emp_adv")
	design_ids = list("quadultra_micro_laser")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)
	export_price = 5000
	display_name = "Квантовая электромагнитная теория"	//bs
	description = "Научное подтверждение теории струн."

/////////////////////////Clown tech/////////////////////////
/datum/techweb_node/clown
	id = "clown"
	prereq_ids = list("base")
	design_ids = list("air_horn", "honker_main", "honker_peri", "honker_targ", "honk_chassis", "honk_head", "honk_torso", "honk_left_arm", "honk_right_arm",
	"honk_left_leg", "honk_right_leg", "mech_banana_mortar", "mech_mousetrap_mortar", "mech_honker", "mech_punching_face", "implant_trombone", "borg_transform_clown")
	display_name = "Технологии Клоунов"
	description = "Хонк?!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

////////////////////////Computer tech////////////////////////
/datum/techweb_node/comptech
	id = "comptech"
	prereq_ids = list("datatheory")
	display_name = "Компьютерные консоли"
	description = "Основной рабочий инструмент любого офисного сотрудника."
	design_ids = list(
		"comconsole",
		"crewconsole",
		"idcard",
		"idcardconsole",
		"libraryconsole",
		"mining",
		"rdcamera",
		"seccamera",
		"survey-handheld-elite",
		"design_disk_super",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 5000

/datum/techweb_node/computer_hardware_basic				//Modular computers are shitty and nearly useless so until someone makes them actually useful this can be easy to get.
	id = "computer_hardware_basic"
	prereq_ids = list("comptech")
	display_name = "Модульные компьютеры"
	description = "Минимальный пакет данных который мог освоить любой 8-летний ребенок 21 века. В связи с общей деградацией IQ сотрудников комплект поставки серьезно урезан."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)  //they are really shitty
	export_price = 2000
	design_ids = list("hdd_basic", "hdd_advanced", "hdd_super", "hdd_cluster", "ssd_small", "ssd_micro", "netcard_basic", "netcard_advanced", "netcard_wired",
	"portadrive_basic", "portadrive_advanced", "portadrive_super", "cardslot", "aislot", "miniprinter", "APClink", "bat_control", "bat_normal", "bat_advanced",
	"bat_super", "bat_micro", "bat_nano", "cpu_normal", "pcpu_normal", "cpu_small", "pcpu_small")

/datum/techweb_node/computer_board_gaming
	id = "computer_board_gaming"
	prereq_ids = list("comptech")
	design_ids = list("arcade_battle", "arcade_orion", "slotmachine")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 2000
	display_name = "Аркадные автоматы"
	description = "Только для удачливых!"

/datum/techweb_node/comp_recordkeeping
	id = "comp_recordkeeping"
	prereq_ids = list("comptech")
	design_ids = list("secdata", "med_data", "prisonmanage", "vendor", "automated_announcement", "survey-handheld-exp", "design_disk_elite")
	display_name = "Базы данных"
	description = "Алгоритмы записи, сортировки и выборки для компьютерных баз данных."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 2000

/datum/techweb_node/telecomms
	id = "telecomms"
	prereq_ids = list("comptech", "bluespace_basic")
	display_name = "Телекоммуникационные сервера"
	description = "Подпространственная передача данных для общения на практически безграничном расстоянии."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	design_ids = list("s-receiver", "s-bus", "s-broadcaster", "s-processor", "s-hub", "s-server", "s-relay", "comm_monitor", "comm_server",
	"s-ansible", "s-filter", "s-amplifier", "ntnet_relay", "s-treatment", "s-analyzer", "s-crystal", "s-transmitter", "s-messaging")

/datum/techweb_node/integrated_HUDs
	id = "integrated_HUDs"
	prereq_ids = list("comp_recordkeeping", "emp_basic")
	design_ids = list("health_hud", "security_hud", "diagnostic_hud", "scigoggles")
	display_name = "Очки дополненной реальности"
	description = "Расширяет границы восприятия путем наложения на изображение цифровых данных."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)
	export_price = 5000

/datum/techweb_node/NVGtech
	id = "NVGtech"
	prereq_ids = list("integrated_HUDs", "adv_engi", "emp_adv")
	design_ids = list("health_hud_night", "security_hud_night", "diagnostic_hud_night", "night_visision_goggles", "nvgmesons")
	display_name = "Технологии ночного видения"
	description = "Адаптация технологии дополненной реальности к условиям темного космоса."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

////////////////////////Medical////////////////////////
/datum/techweb_node/genetics
	id = "genetics"
	prereq_ids = list("biotech")
	design_ids = list("dnascanner", "scan_console", "dna_disk")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)
	export_price = 1500
	display_name = "Генная инженерия"
	description = "Вы никогда не задавались вопросом: почему у человека 23 пары хромосом, а у обезьяны 24? И кто же тогда более совершенен?"

/datum/techweb_node/cryotech
	id = "cryotech"
	prereq_ids = list("adv_engi", "biotech")
	design_ids = list("splitbeaker", "cryotube", "cryo_Grenade", "stasis")
	display_name = "Криостазис"
	description = "Технология остановки химических и биологических процессов."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 4000

/datum/techweb_node/subdermal_implants
	id = "subdermal_implants"
	prereq_ids = list("biotech")
	design_ids = list("implanter", "implantcase", "implant_chem", "implant_tracking", "locator", "c38_trac")
	display_name = "Микроимпланты"
	description = "Крошечные подкожные импланты вводимые посредством инъекции."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/cyber_organs
	id = "cyber_organs"
	prereq_ids = list("biotech")
	design_ids = list("cybernetic_ears", "cybernetic_heart_tier2", "cybernetic_liver_tier2", "cybernetic_lungs_tier2", "cybernetic_stomach_tier2")
	display_name = "Кибернетические органы"
	description = "Когда органика не справляется."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 5000

/datum/techweb_node/cyber_organs_upgraded
	id = "cyber_organs_upgraded"
	prereq_ids = list("adv_biotech", "cyber_organs")
	design_ids = list("cybernetic_ears_u", "cybernetic_heart_tier3", "cybernetic_liver_tier3", "cybernetic_lungs_tier3", "cybernetic_stomach_tier3")
	display_name = "Продвинутые кибернетические органы"
	description = "Когда слабость плоти вызывает отвращение."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)
	export_price = 5000

/datum/techweb_node/cyber_implants
	id = "cyber_implants"
	prereq_ids = list("adv_biotech", "datatheory")
	design_ids = list("ci-nutriment", "ci-breather", "ci-gloweyes", "ci-welding", "ci-medhud", "ci-sechud", "ci-diaghud")
	display_name = "Кибернетические импланты"
	description = "Начало пути симбиоза человека и машины."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_cyber_implants
	id = "adv_cyber_implants"
	prereq_ids = list("neural_programming", "cyber_implants","integrated_HUDs")
	design_ids = list("ci-toolset", "ci-surgery", "ci-reviver", "ci-nutrimentplus")
	display_name = "Продвинутые кибернетические импланты"
	description = "У нас есть 2077 причин преимущества машины перед органикой."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/combat_cyber_implants
	id = "combat_cyber_implants"
	prereq_ids = list("adv_cyber_implants","weaponry","NVGtech","high_efficiency")
	design_ids = list("ci-xray", "ci-thermals", "ci-antidrop", "ci-antistun", "ci-thrusters")
	display_name = "Военные кибернетические импланты"
	description = "Передовые разработки Нано Трейзен, компания вложила более 40 тысяч кредитов в этот проект."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

////////////////////////Tools////////////////////////

/datum/techweb_node/basic_mining
	id = "basic_mining"
	prereq_ids = list("engineering", "basic_plasma")
	design_ids = list("drill", "superresonator", "triggermod", "damagemod", "cooldownmod", "rangemod", "ore_redemption", "mining_equipment_vendor", "cargoexpress", "plasmacutter", "mecha_kineticgun", "deepcore_pinpointer")//e a r l y    g a  m e)
	display_name = "Шахтерские разработки"
	description = "Чем отличается работа обычного шахтера от работы шахтера фронтира? Ну как минимум тем, что первого не пытается сожрать 95% фауны."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_mining
	id = "adv_mining"
	prereq_ids = list("basic_mining", "adv_engi", "adv_power", "adv_plasma")
	design_ids = list("drill_diamond", "jackhammer", "hypermod", "plasmacutter_adv", "deepcore_pinpointer_advanced", "deepcore_drill", "deepcore_hopper")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
// WS Edit Start - Yeet The BSM
/datum/techweb_node/bluespace_mining
	id = "bluespace_mining"
	display_name = "Технология блюспейс шахтёрства"
	description = "Используйте возможности синего пространства, чтобы создавать материалы из ничего. Медленно."
	prereq_ids = list("practical_bluespace", "adv_mining")
	design_ids = list("bluespace_miner")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
//  WS Edit End - Yeet The BSM
	display_name = "Продвинутые шахтерские разработки"
	description = "Чем отличается шахтер фронтира от шахтера-охотника фронтира? Ну как минимум тем, что первый не пытается сожрать 95% фауны."
/datum/techweb_node/janitor
	id = "janitor"
	prereq_ids = list("adv_engi")
	design_ids = list("holobarrier_jani", "advmop", "buffer", "blutrash", "light_replacer", "spraybottle", "beartrap")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Передовые технологии санитарии"
	description = "Чисти вещи лучше, быстрее, сильнее и усерднее!"

/datum/techweb_node/botany
	id = "botany"
	prereq_ids = list("adv_engi", "biotech")
	design_ids = list("diskplantgene", "portaseeder", "flora_gun", "hydro_tray", "biogenerator", "plantgenes", "seed_extractor")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Ботаническая инженерия"
	description = "Кто сказал что эволюцию нельзя направить?"

/datum/techweb_node/exp_tools
	id = "exp_tools"
	design_ids = list("exwelder", "jawsoflife", "handdrill", "laserscalpel", "mechanicalpinches", "searingtool", "tricorder")
	prereq_ids = list("adv_engi")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Экспериментальные инструменты"
	description = "Инструменты с повышенной эффективностью работы и гибридным функционалом."

/datum/techweb_node/sec_basic
	id = "sec_basic"
	design_ids = list("seclite", "pepperspray", "bola_energy", "zipties", "evidencebag", "internals_tactical", "portable_recharger")
	prereq_ids = list("base")
	display_name = "Базовое оборудование службы безопасности"
	description = "Стандартная экипировка для СБ."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 5000

/datum/techweb_node/rcd_upgrade
	id = "rcd_upgrade"
	design_ids = list("rcd_upgrade_frames", "rcd_upgrade_simple_circuits")
	prereq_ids = list("adv_engi")
	display_name = "Модернизация монтажных комплексов"
	description = "Набор чертежей для расширения функционала монтажных комплексов."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_rcd_upgrade
	id = "adv_rcd_upgrade"
	design_ids = list("rcd_upgrade_silo_link")
	prereq_ids = list("rcd_upgrade", "bluespace_travel")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000
	display_name = "Продвинутая модернизация монтажных комплексов"
	description = "Технология квантовых близнецов для оперативной доставки строительных ресурсов."

/////////////////////////weaponry tech/////////////////////////
/datum/techweb_node/weaponry
	id = "weaponry"
	prereq_ids = list("engineering")
	design_ids = list("pin_testing", "tele_shield","gun_cell")
	display_name = "Оружейные технологии"
	description = "Стандарные разработки для отделов безопасности Нано-Трейзен."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000

/datum/techweb_node/adv_weaponry
	id = "adv_weaponry"
	prereq_ids = list("adv_engi", "weaponry")
	design_ids = list("pin_loyalty", "gun_cell_upgraded", "gun_cell_large")
	display_name = "Продвинутые оружейные технологии"
	description = "Базовые элементы защиты табельного оружия."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000

/datum/techweb_node/firingpin
	id = "firingpin"
	display_name = "Продвинутые бойки для оружия"
	description = "Ресурсоемкая операция, позволяющая создавать бойки без блокировки."
	prereq_ids = list("adv_weaponry")
	design_ids = list("pin_standard")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 15000)
	export_price = 5000

/datum/techweb_node/electric_weapons
	id = "electronic_weapons"
	prereq_ids = list("weaponry", "adv_power", "emp_basic")
	design_ids = list("stunrevolver", "ioncarbine")
	display_name = "Электрическое оружие"
	description = "Сила молнии в ваших руках"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/radioactive_weapons
	display_name = "Ядерное оружие"
	description = "О нет, это не то о чем вы подумали! Это не бомба которая взорвет всю станцию! Это всего-навсего нестабильный карманный ядерный реактор."
	id = "radioactive_weapons"
	prereq_ids = list("adv_engi", "adv_weaponry")
	design_ids = list("nuclear_gun")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/medical_weapons
	id = "medical_weapons"
	display_name = "Медицинское вооружение"
	description = "Для любителей лечить и стрелять."
	prereq_ids = list("adv_biotech", "weaponry")
	design_ids = list("rapidsyringe", "shotgun_dart")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/beam_weapons
	id = "beam_weapons"
	prereq_ids = list("adv_weaponry")
	design_ids = list("temp_gun", "xray_laser")
	display_name = "Лучевое оружие"
	description = "Упорядоченный поток частиц изменяющий физические свойства объекта сквозь которые он проходит."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_beam_weapons
	id = "adv_beam_weapons"
	prereq_ids = list("beam_weapons")
	design_ids = list("beamrifle")
	display_name = "Продвинутое лучевое оружие"
	description = "Придерживайтесь техники безопасности! Мощность этого лазера так высока, что лучше предупредить окружающих перед выстрелом фразой \"Я стреляю с моего лазера!\""
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/explosive_weapons
	id = "explosive_weapons"
	display_name = "Улучшенные корпуса гранат"
	description = "Знаешь почему я хороший подрывник?"
	prereq_ids = list("adv_weaponry")
	design_ids = list("large_Grenade", "pyro_Grenade", "adv_Grenade")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/ballistic_weapons
	id = "ballistic_weapons"
	display_name = "Баллистическое вооружение"
	description = "Это не научно... Но технологично!"
	prereq_ids = list("weaponry")
	design_ids = list("mag_oldsmg", "mag_oldsmg_ap", "mag_oldsmg_ic", "shotgun_slug", "speedload_12_gauge")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_ballistics
	id = "adv_ballistics"
	display_name = "Улучшенное баллистическое вооружение"
	description = "На случай если переговоры с врагами не удались."
	prereq_ids = list("ballistic_weapons", "adv_engi")
	design_ids = list("ap9mm", "ap10mm", "ap45", "hp9mm", "hp10mm", "hp45", "ap556mmHITP", "hp556mmHITP")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/exotic_ammo
	id = "exotic_ammo"
	display_name = "Экзотическое вооружение"
	description = "Опасно. Но научно."
	prereq_ids = list("adv_weaponry", "medical_weapons")
	design_ids = list("techshotshell", "c38_hotshot", "c38_iceblox", "inc9mm", "inc10mm", "inc45", "incendiary_slug")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/gravity_gun
	id = "gravity_gun"
	display_name = "Гравитационный манипулятор"
	description = "Один уборщику для сбора мусора, один службе безопасности для разгона толпы."
	prereq_ids = list("adv_weaponry", "bluespace_travel")
	design_ids = list("gravitygun", "mech_gravcatapult")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/srm_ballistics
	id = "srm_ballistics"
	display_name = "Устаревшее балистическое вооружение - Карабины"
	description = "Почувствуй себя старым."
	prereq_ids = list("adv_ballistics")
	design_ids = list("doublebarrel", "winchmk2")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/techweb_node/srm_pistols
	id = "srm_pistols"
	display_name = "Устаревшее балистическое вооружение - Пистолеты"
	description = "Любителям классики привет."
	prereq_ids = list("adv_ballistics")
	design_ids = list("pepperbox", "nagantrevolver", "derringer", "speedload357")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/techweb_node/srm_special
	id = "srm_special"
	display_name = "Устаревшее балистическое вооружение - Специальное"
	description = "Стреляет, не клинит."
	prereq_ids = list("srm_ballistics", "srm_pistols")
	design_ids = list("srmrevolver", "m1911", "stripper762", "nagantrifle")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 12000)
	export_price = 5000

////////////////////////mech technology////////////////////////
/datum/techweb_node/adv_mecha
	id = "adv_mecha"
	prereq_ids = list("adv_robotics")
	design_ids = list("mech_repair_droid")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "Продвинутые Экзокостюмы"
	description = "Боевые модели и улучшенные модули."

/datum/techweb_node/odysseus
	id = "mecha_odysseus"
	prereq_ids = list("base")
	design_ids = list("odysseus_chassis", "odysseus_torso", "odysseus_head", "odysseus_left_arm", "odysseus_right_arm" ,"odysseus_left_leg", "odysseus_right_leg",
	"odysseus_main", "odysseus_peri")
	display_name = "ЭКЗОКОСТЮМ: Одиссей"
	description = "Медициский экзокостюм разработанный компанией Нано-Мед для помощи раненым и их быстрой транспортировки в мед-блок"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/gygax
	id = "mech_gygax"
	prereq_ids = list("adv_mecha", "weaponry")
	design_ids = list("gygax_chassis", "gygax_torso", "gygax_head", "gygax_left_arm", "gygax_right_arm", "gygax_left_leg", "gygax_right_leg", "gygax_main",
	"gygax_peri", "gygax_targ", "gygax_armor")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "ЭКЗОКОСТЮМ: Гигакс"
	description = "Легкий боевой экзокостюм. Популярен среди наемников и корпоративных армий"

/datum/techweb_node/durand
	id = "mech_durand"
	prereq_ids = list("adv_mecha", "adv_weaponry")
	design_ids = list("durand_chassis", "durand_torso", "durand_head", "durand_left_arm", "durand_right_arm", "durand_left_leg", "durand_right_leg", "durand_main",
	"durand_peri", "durand_targ", "durand_armor")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "ЭКЗОКОСТЮМ: Дюранд"
	description = "Устаревший боевой экзоскелет, используемый корпорацией Нанотрасен. Сверхтяжелый и медленный, но очень прочен. Первоначально разработанный для борьбы с враждебными инопланетными формами жизни."

/datum/techweb_node/phazon
	id = "mecha_phazon"
	prereq_ids = list("adv_mecha", "weaponry" , "micro_bluespace")
	design_ids = list("phazon_chassis", "phazon_torso", "phazon_head", "phazon_left_arm", "phazon_right_arm", "phazon_left_leg", "phazon_right_leg", "phazon_main",
	"phazon_peri", "phazon_targ", "phazon_armor")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000
	display_name = "ЭКЗОКОСТЮМ: Фазон"
	description = "Вершина научных исследований и гордость Нанотрейзен, он использует передовые технологии блюспейс и дорогие материалы."

/datum/techweb_node/adv_mecha_tools
	id = "adv_mecha_tools"
	prereq_ids = list("adv_mecha")
	design_ids = list("mech_rcd", "mech_thrusters")
	display_name = "Продвинутая экипировка Экзокостюмов"
	description = "Промышленный РЦД и маневровые двигатели"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/med_mech_tools
	id = "med_mech_tools"
	prereq_ids = list("adv_biotech")
	design_ids = list("mech_sleeper", "mech_syringe_gun", "mech_medi_beam")
	display_name = "Экипировка для медицинских экзокостюмов"
	description = "Медлуч, синтезатор медикаментов с интегрированным шприцеметом и криокапсула - стандартный набор разработанный компанией Нано-Мед для экзокостюма Одиссей"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_modules
	id = "adv_mecha_modules"
	prereq_ids = list("adv_mecha", "bluespace_power")
	design_ids = list("mech_energy_relay", "mech_ccw_armor", "mech_proj_armor", "mech_generator_nuclear")
	display_name = "Простые модули экзокостюмов"
	description = "Системы дополнительного бронирования и вспомогательные энергосистемы."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_scattershot
	id = "mecha_tools"
	prereq_ids = list("ballistic_weapons")
	design_ids = list("mech_scattershot", "mech_scattershot_ammo")
	display_name = "Тяжелая картечница \"Дуплет\""
	description = "Оружие для боевых экзокостюмов. Стреляет шквалом крупной картечи."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_carbine
	id = "mech_carbine"
	prereq_ids = list("ballistic_weapons")
	design_ids = list("mech_carbine", "mech_carbine_ammo")
	display_name = "Легкий зажигательный карабин БК-БЗ \"Аид\""
	description = "Оружие для боевых экзокостюмов. Стреляет зажигательными пулями."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_ion
	id = "mmech_ion"
	prereq_ids = list("electronic_weapons", "emp_adv")
	design_ids = list("mech_ion")
	display_name = "Тяжелое ионное орудие МК-4"
	description = "Оружие для боевых экзокостюмов. Стреляет эми импульсами повреждающими технику. Не попадите под собственный выстрел!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_tesla
	id = "mech_tesla"
	prereq_ids = list("electronic_weapons", "adv_power")
	design_ids = list("mech_tesla")
	display_name = "Орудие Теслы МК-1"
	description = "Оружие для боевых экзокостюмов. Стреляет разветвленными разрядами электричества, прицельный огонь невозможен."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_laser
	id = "mech_laser"
	prereq_ids = list("beam_weapons")
	design_ids = list("mech_laser")
	display_name = "Легкий лазер ЭВ-ЛЛ \"Выжигатель\""
	description = "Оружие для боевых экзокостюмов. Стреляет слабыми лазерами."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_laser_heavy
	id = "mech_laser_heavy"
	prereq_ids = list("adv_beam_weapons")
	design_ids = list("mech_laser_heavy")
	display_name = "Тяжелый лазер ЭВ-ТЛ \"Солярис\""
	description = "Оружие для боевых экзокостюмов. Стреляет мощными лазерами."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_disabler
	id = "mech_disabler"
	prereq_ids = list("beam_weapons")
	design_ids = list("mech_disabler")
	display_name =  "Усмиритель ЭВ-УЛ \"Миротворец\""
	description = "Оружие для боевых экзокостюмов. Стреляет слабыми парализующими лучами."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_grenade_launcher
	id = "mech_grenade_launcher"
	prereq_ids = list("explosive_weapons")
	design_ids = list("mech_grenade_launcher", "mech_grenade_launcher_ammo")
	display_name = "Автоматический гранатомет АГС \"Заря\""
	description = "Оружие для боевых экзокостюмов. Автоматическая гранатометная система запускающая светошумовые гранаты."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_missile_rack
	id = "mech_missile_rack"
	prereq_ids = list("explosive_weapons")
	design_ids = list("mech_missile_rack", "mech_missile_rack_ammo")
	display_name = "Легкая ракетная установка РСЗО \"Пробой-6\""
	description = "Оружие для боевых экзокостюмов. Запускает маловзрывоопасные разрывные ракеты, предназначенные для взрыва только при попадании в прочную цель."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/clusterbang_launcher
	id = "clusterbang_launcher"
	prereq_ids = list("explosive_weapons")
	design_ids = list("clusterbang_launcher", "clusterbang_launcher_ammo")
	display_name = "Касетный гранатомет АГС \"Матрёшка\""
	description = "Оружие для боевых экзокостюмов. Запускает кластерные светошумовые гранаты. Ты чудовище."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_teleporter
	id = "mech_teleporter"
	prereq_ids = list("micro_bluespace")
	design_ids = list("mech_teleporter")
	display_name = "Телепортер экзокостюма"
	description = "Модуль экзокостюма, который позволяет им телепортироваться в любое место в поле зрения."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_wormhole_gen
	id = "mech_wormhole_gen"
	prereq_ids = list("bluespace_travel")
	design_ids = list("mech_wormhole_gen")
	display_name = "Генератор червоточин экзокостюма"
	description = "Модуль экзокостюма, который позволяет создавать небольшие квазистабильные червоточины, позволяющие осуществлять неточную телепортацию на большие расстояния."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_lmg
	id = "mech_lmg"
	prereq_ids = list("ballistic_weapons")
	design_ids = list("mech_lmg", "mech_lmg_ammo")
	display_name = "Легкий пулемет Ультра АК-2"
	description = "Оружие для боевых экзокостюмов. Стреляет короткой очередью из трех выстрелов."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/mech_diamond_drill
	id = "mech_diamond_drill"
	prereq_ids = list("adv_mining")
	design_ids = list("mech_diamond_drill")
	display_name =  "Алмазный бур экзокостюма"
	description = "Оборудование для инженерных и боевых экзоскелетов. Усовершенствованная версия."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/////////////////////////Nanites/////////////////////////

/datum/techweb_node/nanite_base
	id = "nanite_base"
	prereq_ids = list("datatheory")
	design_ids = list("nanite_disk","nanite_remote","nanite_comm_remote","nanite_scanner",\
						"nanite_chamber","public_nanite_chamber","nanite_chamber_control","nanite_programmer","nanite_program_hub","nanite_cloud_control",\
						"relay_nanites", "monitoring_nanites", "research_nanites" ,"researchplus_nanites", "access_nanites", "repairing_nanites","sensor_nanite_volume", "repeater_nanites", "relay_repeater_nanites","red_diag_nanites")
	display_name = "Базовое программирование нанитов"
	description = "Технология по внедрению в человеческий организм крохотных нанороботов, мало на что способных в одиночестве, но обладающих поистине гигантским потенциалом когда их колонии разрастаются до многих милиардов."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 5000

/datum/techweb_node/nanite_smart
	id = "nanite_smart"
	prereq_ids = list("nanite_base","robotics")
	design_ids = list("purging_nanites", "metabolic_nanites", "stealth_nanites", "memleak_nanites","sensor_voice_nanites", "voice_nanites")
	display_name = "Интеллектуальные нанитные программы"
	description = "Нанитные программы, позволяющие нанитам выполнять сложные независимые действия по поиску и отслеживанию целей."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500, TECHWEB_POINT_TYPE_NANITES = 500)
	export_price = 4000

/datum/techweb_node/nanite_mesh
	id = "nanite_mesh"
	prereq_ids = list("nanite_base","engineering")
	design_ids = list("hardening_nanites", "dermal_button_nanites", "refractive_nanites", "cryo_nanites", "conductive_nanites", "shock_nanites", "emp_nanites", "temperature_nanites")
	display_name = "Кластерные нанитные программы"
	description = "Нанитные программы, позволяющие нанитам объединятся в крупные объединения для влияния на физическую структуру носителя."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500, TECHWEB_POINT_TYPE_NANITES = 500)
	export_price = 5000

/datum/techweb_node/nanite_bio
	id = "nanite_bio"
	prereq_ids = list("nanite_base","biotech")
	design_ids = list("regenerative_nanites", "bloodheal_nanites", "coagulating_nanites","poison_nanites","flesheating_nanites",\
					"sensor_crit_nanites","sensor_death_nanites", "sensor_health_nanites", "sensor_damage_nanites", "sensor_species_nanites")
	display_name = "Биологические нанитные программы"
	description = "Нанитные программы, позволяющие нанитам вторгаться в клеточную структуру носителя для восстановления или реорганизации клеток."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500, TECHWEB_POINT_TYPE_NANITES = 500)
	export_price = 5000

/datum/techweb_node/nanite_neural
	id = "nanite_neural"
	prereq_ids = list("nanite_bio")
	design_ids = list("nervous_nanites", "brainheal_nanites", "paralyzing_nanites", "stun_nanites", "selfscan_nanites","good_mood_nanites","bad_mood_nanites")
	display_name = "Нейронные нанитные программы"
	description = "Нанитные программы, позволяющие нанитам изменять проводимость нервов и даже влиять на мозговые процессы."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_NANITES = 1000)
	export_price = 5000

/datum/techweb_node/nanite_synaptic
	id = "nanite_synaptic"
	prereq_ids = list("nanite_neural","neural_programming")
	design_ids = list("mindshield_nanites", "pacifying_nanites", "blinding_nanites", "sleep_nanites", "mute_nanites", "speech_nanites","hallucination_nanites")
	display_name = "Синаптические нанитные программы"
	description = "Нанитные программы, позволяющие нанитам производить серьезные изменения в мозге носителя, вплоть до изменения мыслительных и личностных патернов."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_NANITES = 1000)
	export_price = 5000

/datum/techweb_node/nanite_harmonic
	id = "nanite_harmonic"
	prereq_ids = list("nanite_bio","nanite_smart","nanite_mesh")
	design_ids = list("fakedeath_nanites","aggressive_nanites","defib_nanites","regenerative_plus_nanites","brainheal_plus_nanites","purging_plus_nanites","adrenaline_nanites")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_NANITES = 2000)
	export_price = 8000
	display_name = "Продвинутые нанитные программы"
	description = "Нанитные программы нового поколения, намного лучше интегрируемые с биологией человека. Так же пассивно повышают скорость репликации нанитов во всех облаках после исследования."

/datum/techweb_node/nanite_combat
	id = "nanite_military"
	prereq_ids = list("nanite_harmonic", "syndicate_basic")
	design_ids = list("explosive_nanites","pyro_nanites","meltdown_nanites","viral_nanites","nanite_sting_nanites")
	display_name = "Военные нанитные программы"
	description = "Нанитные программы, позволяющие нанитам насильно инфицировать жертв и уничтожать их с максимальной эффективностью."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_NANITES = 2500)
	export_price = 12500

/datum/techweb_node/nanite_hazard
	id = "nanite_hazard"
	prereq_ids = list("nanite_harmonic", "alientech")
	design_ids = list("spreading_nanites","mindcontrol_nanites","mitosis_nanites")
	display_name = "Опасные нанитные программы"
	description = "Нанитные программы третьего поколения, яркий пример того как наука способна приблизить конец света для всего человечества."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000, TECHWEB_POINT_TYPE_NANITES = 4000)
	export_price = 15000

/datum/techweb_node/nanite_replication_protocols
	id = "nanite_replication_protocols"
	prereq_ids = list("nanite_smart")
	design_ids = list("kickstart_nanites","factory_nanites","tinker_nanites","offline_nanites")
	display_name = "Протоколы репликации нанитов"
	description = "Протоколы, которые перезаписывают базовые процедуры репликации нанитов для достижения большей эффективности при определенных обстоятельствах."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_NANITES = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

////////////////////////Alien technology////////////////////////
/datum/techweb_node/alientech //AYYYYYYYYLMAOO tech
	id = "alientech"
	prereq_ids = list("biotech","engineering")
	display_name = "Инопланетные технологии"
	description = "Уж в чем не откажешь серым человечкам, так это в качественных материалах."
	boost_item_paths = list(/obj/item/gun/energy/alien, /obj/item/scalpel/alien, /obj/item/hemostat/alien, /obj/item/retractor/alien, /obj/item/circular_saw/alien,
	/obj/item/cautery/alien, /obj/item/surgicaldrill/alien, /obj/item/screwdriver/abductor, /obj/item/wrench/abductor, /obj/item/crowbar/abductor, /obj/item/multitool/abductor,
	/obj/item/weldingtool/abductor, /obj/item/wirecutters/abductor, /obj/item/circuitboard/machine/abductor, /obj/item/melee/baton/abductor, /obj/item/abductor, /obj/item/gun/energy/shrink_ray)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 20000
	hidden = TRUE
	design_ids = list("alienalloy")

/datum/techweb_node/alien_bio
	id = "alien_bio"
	prereq_ids = list("alientech", "adv_biotech")
	design_ids = list("alien_scalpel", "alien_hemostat", "alien_retractor", "alien_saw", "alien_drill", "alien_cautery")
	display_name = "Инопланетные хирургические инструменты"
	description = "При взгляде на эти инструменты сквозь ваши мысли проносятся какие-то смутные воспоминания, и что-то мешает сидеть ровно."
	boost_item_paths = list(/obj/item/gun/energy/alien, /obj/item/scalpel/alien, /obj/item/hemostat/alien, /obj/item/retractor/alien, /obj/item/circular_saw/alien,
	/obj/item/cautery/alien, /obj/item/surgicaldrill/alien, /obj/item/screwdriver/abductor, /obj/item/wrench/abductor, /obj/item/crowbar/abductor, /obj/item/multitool/abductor,
	/obj/item/weldingtool/abductor, /obj/item/wirecutters/abductor, /obj/item/circuitboard/machine/abductor, /obj/item/melee/baton/abductor, /obj/item/abductor, /obj/item/gun/energy/shrink_ray)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 20000
	hidden = TRUE

/datum/techweb_node/alien_engi
	id = "alien_engi"
	prereq_ids = list("alientech", "adv_engi")
	design_ids = list("alien_wrench", "alien_wirecutters", "alien_screwdriver", "alien_crowbar", "alien_welder", "alien_multitool")
	display_name = "Инопланетные механические инструменты"
	description = "Два вопроса: зачем? и как?"
	boost_item_paths = list(/obj/item/screwdriver/abductor, /obj/item/wrench/abductor, /obj/item/crowbar/abductor, /obj/item/multitool/abductor,
	/obj/item/weldingtool/abductor, /obj/item/wirecutters/abductor, /obj/item/circuitboard/machine/abductor, /obj/item/melee/baton/abductor, /obj/item/abductor,
	/obj/item/gun/energy/shrink_ray)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 20000
	hidden = TRUE

/datum/techweb_node/syndicate_basic
	id = "syndicate_basic"
	prereq_ids = list("adv_engi", "adv_weaponry", "explosive_weapons")
	design_ids = list("decloner", "borg_syndicate_module", "ai_cam_upgrade", "suppressor", "largecrossbow", "donksofttoyvendor", "donksoft_refill", "advanced_camera")
	display_name = "Нелегальные технологии"
	description = "Опасные, несертифицированные технологии зачастую полученные незаконным путем."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000
	hidden = TRUE

/datum/techweb_node/syndicate_basic/New()		//Crappy way of making syndicate gear decon supported until there's another way.
	. = ..()
	boost_item_paths = list()
	for(var/path in GLOB.uplink_items)
		var/datum/uplink_item/UI = new path
		if(!UI.item || !UI.illegal_tech)
			continue
		boost_item_paths |= UI.item	//allows deconning to unlock.

/datum/techweb_node/dex_robotics
	id = "dex_robotics"
	display_name = "Исскуство ловкости робототехники"
	description = "Тонкое искусство противоположных больших пальцев."
	prereq_ids = list("adv_engi", "adv_robotics", "biotech")
	design_ids = list("maint_drone")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/////////////////////////shuttle tech/////////////////////////
/datum/techweb_node/basic_shuttle_tech
	id = "basic_shuttle"
	display_name = "Базовое шаттлостроение"
	description = "Технологии, необходимые для создания и использования базовых шаттлов."
	prereq_ids = list("bluespace_travel", "adv_engi")
	design_ids = list("engine_plasma", "engine_ion", "engine_heater", "engine_smes", "shuttle_helm", "rapid_shuttle_designator")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000

/datum/techweb_node/exp_shuttle_tech
	id = "exp_shuttle"
	display_name = "Эксперементальное шаттлостроение"
	description = "Куча двигателей и связанных с ними частей шаттла, которые, вероятно, не так уж и полезны, но могут оказаться в странных ситуациях."
	prereq_ids = list("basic_shuttle")
	design_ids = list("engine_expulsion")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 2500

////////////////////// IPC Parts ///////////////////////
/datum/techweb_node/ipc_organs
	id = "ipc_organs"
	display_name = "Органы СПУ"
	description = "СПУ? ЧПУ? ИПК? Какая разница."
	prereq_ids = list("cyber_organs","robotics")
	design_ids = list("robotic_liver", "robotic_eyes", "robotic_heart", "robotic_tongue", "robotic_stomach", "robotic_ears", "power_cord")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)
	export_price = 5000

////////////////////////B.E.P.I.S. Locked Techs////////////////////////
/datum/techweb_node/light_apps
	display_name = "Альтернативное освещение"
	description = "Применение технологий освещения, которые изначально не считались коммерчески жизнеспособными."
	id = "light_apps"
	prereq_ids = list("base")
	design_ids = list("bright_helmet", "rld_mini")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/rolling_table
	id = "rolling_table"
	display_name = "Расширенные возможности применения колес"
	description = "Стол на колёсиках."
	prereq_ids = list("base")
	design_ids = list("rolling_table")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/Mauna_Mug
	id = "mauna_mug"
	prereq_ids = list("base")
	design_ids = list("mauna_mug")
	display_name = "Продвинутые офисные приспособления"
	description = "Это называется наука!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/spec_eng
	id = "spec_eng"
	prereq_ids = list("base")
	design_ids = list("lava_rods", "eng_gloves")
	display_name = "Инженерная техника безопасности"
	description = "Малоперспективное направление признанное нерентабельным."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/aus_security
	id = "aus_security"
	prereq_ids = list("base")
	design_ids = list("stun_boomerang")
	display_name = "Австралийские технологии безопасности"
	description = "Пламенный привет от Австралийских охотников на серожопых!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/interrogation
	id = "interrogation"
	Ethical concerns about loss of free will do not apply to criminals, according to galactic law."
	prereq_ids = list("base")
	design_ids = list("hypnochair")
	display_name = "Продвинутые технологии допроса"
	description = "Путем перекрестных ссылок на несколько рассекреченных документов прошлых диктаторских режимов мы смогли разработать невероятно эффективное устройство для ведения допроса. Согласно галактическому законодательству, этические соображения, связанные с потерей свободы воли, не распространяются на преступников."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3500)
	export_price = 3500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/sticky_advanced
	id = "sticky_advanced"
	design_ids = list("electric_tape", "super_tape")
	display_name = "Продвинутые технологии изоленты"
	description = "Все в мире можно починить изолентой! А если не получается, то это значит изоленты намотано слишком мало!"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/tackle_advanced
	id = "tackle_advanced"
	will no longer be accepted in its academic journals."
	design_ids = list("tackle_dolphin", "tackle_rocket")
	display_name = "Продвинутые технологии перехвата"
	description = "Не бывает слишком быстрого броска на противника, бывает недостаточно болящая голова от промаха."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/fishing
	id = "fishing"
	display_name = "Технологии рыболовства"
	description = "Удочка и всё что связано с этим."
	prereq_ids = list("base")
	design_ids = list("fishing_rod_tech")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	hidden = TRUE
	experimental = TRUE

//Helpers for debugging/balancing the techweb in its entirety!
/proc/total_techweb_exports()
	var/list/datum/techweb_node/processing = list()
	for(var/i in subtypesof(/datum/techweb_node))
		processing += new i
	. = 0
	for(var/i in processing)
		var/datum/techweb_node/TN = i
		. += TN.export_price

/proc/total_techweb_points()
	var/list/datum/techweb_node/processing = list()
	for(var/i in subtypesof(/datum/techweb_node))
		processing += new i
	var/datum/techweb/TW = new
	TW.research_points = list()
	for(var/i in processing)
		var/datum/techweb_node/TN = i
		TW.add_point_list(TN.research_costs)
	return TW.research_points

/proc/total_techweb_points_printout()
	var/list/datum/techweb_node/processing = list()
	for(var/i in subtypesof(/datum/techweb_node))
		processing += new i
	var/datum/techweb/TW = new
	TW.research_points = list()
	for(var/i in processing)
		var/datum/techweb_node/TN = i
		TW.add_point_list(TN.research_costs)
	return TW.printout_points()
