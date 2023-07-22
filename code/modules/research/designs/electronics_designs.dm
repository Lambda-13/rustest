
///////////////////////////////////
/////Non-Board Computer Stuff//////
///////////////////////////////////

/datum/design/intellicard
	name = "Интелкарта"
	desc = "Очень объемное запоминающее устройство специализированное на временом хранении и транспортировке ИИ. Будучи помещенным внутрь ИИ теряет функции удаленного управления, однако остается способен видеть окружающее, говорить, вести радиопереговоры. На экране так же отображаются все текущие законы ИИ."
	id = "intellicard"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 200)
	build_path = /obj/item/aicard
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/paicard
	name = "Персональный ИИ"
	desc = "Небольшой планшет с программой имитации искусственного разума. Зачастую используется как личный ассистент."
	id = "paicard"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500)
	build_path = /obj/item/paicard
	category = list("Electronics","Imported")


/datum/design/ai_cam_upgrade
	name = "Модернизация ПО камер для ИИ"
	desc = "Нелегальный программный пакет, который позволит ИИ \"слышать\" со своих камер с помощью чтения по губам и скрытым микрофонам."
	id = "ai_cam_upgrade"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 5000, /datum/material/gold = 15000, /datum/material/silver = 15000, /datum/material/diamond = 20000, /datum/material/plasma = 10000)
	build_path = /obj/item/surveillance_upgrade
	category = list("Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

///////////////////////////////////
//////////Nanite Devices///////////
///////////////////////////////////
/datum/design/nanite_remote
	name = "Пульт дистанционного управления нанитами"
	desc = "Устройство, которое может дистанционно управлять активными нанитами с помощью беспроводных сигналов."
	id = "nanite_remote"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500)
	build_path = /obj/item/nanite_remote
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/nanite_comm_remote
	name = "Консольный пульт управления нанитами"
	desc = "Устройство, которое может отправлять текстовые сообщения определенным программам."
	id = "nanite_comm_remote"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500)
	build_path = /obj/item/nanite_remote/comm
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/nanite_scanner
	name = "Анализатор нанитов"
	desc = "Устройство для определения нанитов и их особенностей."
	id = "nanite_scanner"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500)
	build_path = /obj/item/nanite_scanner
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE


////////////////////////////////////////
//////////Disk Construction Disks///////
////////////////////////////////////////
/datum/design/design_disk
	name = "Диск для записи чертежей"
	desc = "Диск для хранения конструктивных данных устройства для изготовления в автолатах."
	id = "design_disk"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/design_disk
	category = list("Electronics","Imported")

/datum/design/design_disk_adv
	name = "Продвинутый диск для записи чертежей"
	desc = "Диск для хранения конструктивных данных устройства для изготовления в автолатах. Продвинутая версия обладает большей емкостью."
	id = "design_disk_adv"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100, /datum/material/silver=50)
	build_path = /obj/item/disk/design_disk/adv
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/design_disk_super
	name = "Super Design Storage Disk"
	desc = "Produce additional disks for storing device designs."
	id = "design_disk_super"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100, /datum/material/silver=50, /datum/material/gold=50)
	build_path = /obj/item/disk/design_disk/super
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/design_disk_elite
	name = "Elite Design Storage Disk"
	desc = "Produce additional disks for storing device designs."
	id = "design_disk_elite"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron=300, /datum/material/glass=100, /datum/material/silver =100, /datum/material/gold=100, /datum/material/bluespace=50)
	build_path = /obj/item/disk/design_disk/elite
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/tech_disk
	name = "Диск для записи исследований"
	desc = "Диск для хранения технологических данных для дальнейших исследований."
	id = "tech_disk"
	build_type = PROTOLATHE | AUTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/tech_disk
	category = list("Electronics","Imported")

/datum/design/nanite_disk
	name = "Диск для записи нанитных программ"
	desc = "Диск, способный хранить программы нанитов. Может быть настроен с помощью консоли программирования нанитов."
	id = "nanite_disk"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/nanite_program
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
