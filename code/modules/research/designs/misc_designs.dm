
/////////////////////////////////////////
/////////////////HUDs////////////////////
/////////////////////////////////////////

/datum/design/health_hud
	name = "Медицинский HUD"
	desc = "Дисплей с заголовком, который сканирует гуманоидов и предоставляет точные данные о состоянии их здоровья."
	id = "health_hud"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/health
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/health_hud_night
	name = "Медицинский HUD с ПНВ"
	desc = "Усовершенствованный медицинский дисплей, позволяющий врачам находить пациентов в полной темноте."
	id = "health_hud_night"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/health/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/security_hud
	name = "HUD офицера"
	desc = "Главный дисплей, который сканирует гуманоидов в поле зрения и предоставляет точные данные о состоянии их идентификатора и записях безопасности."
	id = "security_hud"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/security
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/security_hud_night
	name = "HUD офицера с ПНВ"
	desc = "Усовершенствованный головной дисплей, который обеспечивает идентификационные данные и видение в полной темноте."
	id = "security_hud_night"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/security/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/diagnostic_hud
	name = "Диагностический HUD"
	desc = "Головной дисплей, способный анализировать целостность и состояние робототехники и экзокостюмов."
	id = "diagnostic_hud"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/diagnostic
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/diagnostic_hud_night
	name = "Диагностический HUD с ПНВ"
	desc = "Диагностический интерфейс робототехника со встроенной подсветкой."
	id = "diagnostic_hud_night"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/plasma = 300)
	build_path = /obj/item/clothing/glasses/hud/diagnostic/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/////////////////////////////////////////
//////////////////Misc///////////////////
/////////////////////////////////////////

/datum/design/welding_goggles
	name = "Сварочные очки"
	desc = "Защищает глаза от ярких вспышек; одобрены ассоциацией безумных учёных."
	id = "welding_goggles"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/welding
	category = list("Equipment")

/datum/design/welding_mask
	name = "Продвинутая сварочная маска"
	desc = "Противогаз со встроенными сварочными очками и защитной маской. Выглядит как череп разработанный задротом."
	id = "weldingmask"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 1000)
	build_path = /obj/item/clothing/mask/gas/welding
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/bright_helmet
	name = "Workplace-Ready Firefighter Helmet"
	desc = "By applying state of the art lighting technology to a fire helmet with industry standard photo-chemical hardening methods, this hardhat will protect you from robust workplace hazards."
	id = "bright_helmet"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/plastic = 3000, /datum/material/silver = 500)
	build_path = /obj/item/clothing/head/hardhat/red/upgraded
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_CARGO

/datum/design/mauna_mug
	name = "Кружка с подогревом"
	desc = "Напиток становится намного вкуснее когда подается в стильной кружке. А эта еще и с подогревом!"
	id = "mauna_mug"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/reagent_containers/glass/maunamug
	category = list("Equipment")


/datum/design/rolling_table
	name = "Стол на колесиках"
	desc = "Стол на колесиках  марки NT - \"Ванька-встанька\". Это довольно удобно."
	id = "rolling_table"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/structure/table/rolling
	category = list("Equipment")

/datum/design/portaseeder
	name = "Портативный экстрактор семян"
	desc = "Для предприимчивого ботаника в движении. Менее эффективен, чем стационарная модель, он дает одно семя на растение."
	id = "portaseeder"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 400)
	build_path = /obj/item/storage/bag/plants/portaseeder
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/air_horn
	name = "Корабельный гудок"
	desc = "Дьявол тебя побери, сынок, где ты это достал?"
	id = "air_horn"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 4000, /datum/material/bananium = 1000)
	build_path = /obj/item/bikehorn/airhorn
	category = list("Equipment")

/datum/design/mesons
	name = "Мезонные очки"
	desc = "Используется инженерным и горнодобывающим персоналом для просмотра основных структурных и рельефных планировок сквозь стены независимо от условий освещения."
	id = "mesons"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/meson
	category = list("Equipment")

/datum/design/engine_goggles
	name = "Многофункциональные инженерные очки"
	desc = "Очки, используемые инженерами. Режим <b>Мезонного сканера</b> позволяет просматривать основные структурные и рельефные ландшафты сквозь стены, режим <b>Терагерцового сканера</b> позволяет видеть объекты под полом, такие как кабели и трубы, а режим <b>Радиационного сканера</b> позволяет видеть объекты, загрязненные излучением."
	id = "engine_goggles"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/plasma = 100)
	build_path = /obj/item/clothing/glasses/meson/engine
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/tray_goggles
	name = "Терагерцовые очки"
	desc = "Используется инженерным персоналом для наблюдения за объектами под полом, такими как кабели и трубы."
	id = "tray_goggles"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/meson/engine/tray
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/nvgmesons
	name = "Мезонные очки с ПНВ"
	desc = "Оптический мезонный сканер с усиленным наложением спектра видимого света, обеспечивающий большую четкость изображения в темноте."
	id = "nvgmesons"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/meson/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/portable_recharger
	name = "Переносной Зарядный Комплекс"
	desc = "Металлический чемодан. Имеет специальный порт для зарядки оружия работающего на энергии."
	id = "portable_recharger"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 1000)
	construction_time=100
	build_path = /obj/item/case_portable_recharger
	category = list("Misc","Equipment")
	departmental_flags =  DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS


/datum/design/night_vision_goggles
	name = "Очки с ПНВ"
	desc = "Можно полностью видеть в темноте сейчас!"
	id = "night_visision_goggles"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SECURITY

/datum/design/magboots
	name = "Магнитки"
	desc = "Магнитные ботинки, часто используемые во время работы в космической невесомости, для надежной фиксации пользователя к металическим конструкциям."
	id = "magboots"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 4500, /datum/material/silver = 1500, /datum/material/gold = 2500)
	build_path = /obj/item/clothing/shoes/magboots
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/forcefield_projector
	name = "Проектор силового поля"
	desc = "Экспериментальное устройство, которое может создавать несколько силовых полей на расстоянии, препятствующих проходу."
	id = "forcefield_projector"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 1000)
	build_path = /obj/item/forcefield_projector
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/sci_goggles
	name = "Science Goggles"
	desc = "Goggles fitted with a portable analyzer capable of determining the research worth of an item or components of a machine."
	id = "scigoggles"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/science
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/diskplantgene
	name = "Диск с ботаническими данными"
	desc = "Диск для записи генетических данных растений."
	id = "diskplantgene"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron=200, /datum/material/glass = 100)
	build_path = /obj/item/disk/plantgene
	category = list("Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/roastingstick
	name = "Телескопический вилка"
	desc = "Телескопическая мангальная вилка с миниатюрным генератором защитного поля, предназначенная для обеспечения доступа в различные высокотехнологичные экранированные кухонные печи и камины."
	id = "roastingstick"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron=1000, /datum/material/glass = 500, /datum/material/bluespace = 250)
	build_path = /obj/item/melee/roastingstick
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/locator
	name = "Блюспейс локатор"
	desc = "Используется для отслеживания портативных телепортационных маяков и людей с имплантированными отслеживающими маячками."
	id = "locator"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron=1000, /datum/material/glass = 500, /datum/material/silver = 500)
	build_path = /obj/item/locator
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/quantum_keycard
	name = "Квантовая ключ-карта"
	desc = "Ключ-карта, способная записать сигнатуру частиц квантовой площадки, позволяя соединить ее с другими квантовыми площадками."
	id = "quantum_keycard"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500, /datum/material/silver = 500, /datum/material/bluespace = 1000)
	build_path = /obj/item/quantum_keycard
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/anomaly_neutralizer
	name = "Нейтрализатор аномалий"
	desc = "Одноразовое устройство, способное мгновенно нейтрализовать аномалии."
	id = "anomaly_neutralizer"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/gold = 2000, /datum/material/plasma = 5000, /datum/material/uranium = 2000)
	build_path = /obj/item/anomaly_neutralizer
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/donksoft_refill
	name = "Картридж торгового атомата Donksoft"
	desc = "Картридж для пополнения запасов игрушек в торговых автоматах Donksoft."
	id = "donksoft_refill"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 25000, /datum/material/glass = 15000, /datum/material/plasma = 20000, /datum/material/gold = 10000, /datum/material/silver = 10000)
	build_path = /obj/item/vending_refill/donksoft
	category = list("Equipment")

/datum/design/oxygen_tank
	name = "Кислородный баллон"
	desc = "Пустой баллон с кислородом, этот синий."
	id = "oxygen_tank"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/tank/internals/oxygen/empty
	category = list("Equipment")

/datum/design/plasma_tank
	name = "Плазменный баллон"
	desc = "Пустой баллон для плазмы."
	id = "plasma_tank"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/tank/internals/plasma/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/internals_tactical
	name = "Тактический кислородный баллон"
	desc = "Кислородный баллон военно-космического назначения."
	id = "internals_tactical"
	build_path = /obj/item/tank/internals/tactical/empty
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/titanium = 1000)
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_CARGO


/datum/design/id
	name = "ID-карта"
	desc = "Используется для предоставления доступа к различным штукам на станции. Имеет дисплей и продвинутые внутренности в себе."
	id = "idcard"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron=200, /datum/material/glass = 100)
	build_path = /obj/item/card/id
	category = list("Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/eng_gloves
	name = "Перчатки мастера"
	desc = "Высокотехнологичные инженерные перчатки. Корректируют движения пользователя посредством наночипов с заложенными программами для инженерных работ. Защищают от ударов током и высоких температур."
	id = "eng_gloves"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron=2000, /datum/material/silver=1500, /datum/material/gold = 1000)
	build_path = /obj/item/clothing/gloves/color/latex/engineering
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/lavarods
	name = "Жаропрочные стержни"
	desc = "Обработанные, специализированные железные стержни. При воздействии космического вакуума их покрытие разрушается, но они могут противостоять сильной жаре активной лавы."
	id = "lava_rods"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron=1000, /datum/material/plasma=500, /datum/material/titanium=2000)
	build_path = /obj/item/stack/rods/lava
	category = list("initial", "Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/plasticducky
	name = "Резиновая уточка"
	desc = "Дешевая пластиковая подделка вашей любимой игрушки для ванны."
	id = "plasticducky"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plastic = 1000)
	build_path = /obj/item/bikehorn/rubberducky/plasticducky
	category = list("Equipment")

/datum/design/pneumatic_seal
	name = "Пневматический замок"
	desc = "Скоба, используемая для герметизации и укрепления воздушного шлюза. Полезно для того, чтобы сделать области недоступными для не гуманоидов или тех, у кого нет противопоставленных больших пальцев."
	id = "pneumatic_seal"
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 10000)
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/door_seal
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY

/////////////////////////////////////////
////////////Janitor Designs//////////////
/////////////////////////////////////////

/datum/design/advmop
	name = "Продвинутая швабра"
	desc = "Самый передовой инструмент в арсенале уборщика, в комплекте с влагоуловителем для смачивания! Просто представьте сколько размозженных голов и кровавых луж, вы сможете ей убрать!"
	id = "advmop"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 200)
	build_path = /obj/item/mop/advanced
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/blutrash
	name = "Бездонный мешок для мусора"
	desc = "Новейший и самый удобный при хранении мешок для мусора, способный вместить огромное количество мусора."
	id = "blutrash"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/gold = 1500, /datum/material/uranium = 250, /datum/material/plasma = 1500)
	build_path = /obj/item/storage/bag/trash/bluespace
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/buffer
	name = "Модернизация полоукладчика"
	desc = "Модернизация для ремонта пола на ДжениКаре."
	id = "buffer"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/janiupgrade
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/spraybottle
	name = "Спрей"
	desc = "Бутылочка с распылителем жидкости вместо крышки."
	id = "spraybottle"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/reagent_containers/spray
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/beartrap
	name = "Медвежий капкан"
	desc = "Ловушка, используемая для ловли медведей и прочих парнокопытных ассистентов."
	id = "beartrap"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/titanium = 1000)
	build_path = /obj/item/restraints/legcuffs/beartrap
	category = list("Equipment")

/////////////////////////////////////////
/////////////Holobarriers////////////////
/////////////////////////////////////////

/datum/design/holosign
	name = "Голопроектор уборщика"
	desc = "Удобный голографический проектор, который отображает предупреждение о скользком поле."
	id = "holosign"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_path = /obj/item/holosign_creator
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/holobarrier_jani
	name = "Модернизированный голопроектор уборщика"
	desc = "Удобный голографический проектор, который отображает предупреждение о скользком поле. Так же блокирует передвижение невнимательных прохожих."
	id = "holobarrier_jani"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/janibarrier
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE


/datum/design/holosignsec
	name = "Голопроектор СБ"
	desc = "Голографический проектор, создающий голографические защитные барьеры."
	id = "holosignsec"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/security
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/holosignengi
	name = "Инженерный голопроектор"
	desc = "Голографический проектор, который создает голографические инженерные барьеры. Зачастую устанавливаются перед зонами техногенной опасности. Препятствуют распространению радиации."
	id = "holosignengi"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/engineering
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/holosignatmos
	name = "Голопроектор АТМОСа"
	desc = "Голографический проектор, создающий барьеры, препятствующие прохождению газов, но не людей."
	id = "holosignatmos"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/atmos
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/holobarrier_med
	name = "Медицинский голопроектор PENLITE"
	desc = "Создает барьер который блокирует проход пациентам с опасными заболеваниями. Используется для контроля эпидемий."
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/holosign_creator/medical
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/silver = 100) //a hint of silver since it can troll 2 antags (bad viros and sentient disease)
	id = "holobarrier_med"
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/////////////////////////////////////////
////////////////Armour///////////////////
/////////////////////////////////////////

/datum/design/reactive_armour
	name = "Реактивная броня"
	desc = "Экспериментальный образец, в ожидании установки аномального ядра."
	id = "reactive_armour"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/diamond = 5000, /datum/material/uranium = 8000, /datum/material/silver = 4500, /datum/material/gold = 5000)
	build_path = /obj/item/reactive_armour_shell
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/knight_armour
	name = "Рыцарский доспех"
	desc = "Классический костюм доспехов, который может быть изготовлен из разных материалов."
	id = "knight_armour"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 10000)
	build_path = /obj/item/clothing/suit/armor/riot/knight/greyscale
	category = list("Imported")

/datum/design/knight_helmet
	name = "Рыцарский шлем"
	desc = "Классический средневековый шлем, если держать его вверх ногами, то можно увидеть, что на самом деле это ведро."
	id = "knight_helmet"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 5000)
	build_path = /obj/item/clothing/head/helmet/knight/greyscale
	category = list("Imported")



/////////////////////////////////////////
/////////////Security////////////////////
/////////////////////////////////////////

/datum/design/seclite
	name = "Крепкий фонарик"
	desc = "Надежный фонарик, используемый службой безопасности."
	id = "seclite"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2500)
	build_path = /obj/item/flashlight/seclite
	category = list("Equipment","Tool Designs")

/datum/design/detective_scanner
	name = "Судебно-медицинский сканер"
	desc = "Используется для удаленного сканирования объектов и биомассы на наличие ДНК и отпечатков пальцев. Может распечатать отчет со списком найденного."
	id = "detective_scanner"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 2500, /datum/material/silver = 2000)
	build_path = /obj/item/detective_scanner
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pepperspray
	name = "Перцовка"
	desc = "Изготовлено компанией UhangInc, используется для быстрого ослепления и унижения противника. Изготавливается пустой."
	id = "pepperspray"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path = /obj/item/reagent_containers/spray/pepper/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bola_energy
	name = "Энергобола"
	desc = "Специализированная бола сплетенная из волокон жесткого света, предназначенная для ловли убегающих преступников и помощи в арестах."
	id = "bola_energy"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/silver = 500, /datum/material/plasma = 500, /datum/material/titanium = 500)
	build_path = /obj/item/restraints/legcuffs/bola/energy
	category = list("Equipment","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/zipties
	name = "Стяжки"
	desc = "Одноразовые пластиковые стяжки, которые можно использовать для временного сдерживания. После снятия разрушаются."
	id = "zipties"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plastic = 250)
	build_path = /obj/item/restraints/handcuffs/cable/zipties
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/evidencebag
	name = "Пакетик для улик"
	desc = "Пустой пакетик для улик."
	id = "evidencebag"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plastic = 100)
	build_path = /obj/item/evidencebag
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/plumbing_rcd
	name = "Хим-фаб конструктор"
	desc = "Модификация РЦД для создания химических фабрик."
	id = "plumbing_rcd"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 75000, /datum/material/glass = 37500, /datum/material/plastic = 1000)
	build_path = /obj/item/construction/plumbing
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_ENGINEERING



/////////////////////////////////////////
/////////////////Tape////////////////////
/////////////////////////////////////////

/datum/design/electric_tape
	name = "Electrical Tape"
	id = "electric_tape"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 3000)
	build_path = /obj/item/stack/tape/industrial/electrical
	category = list("Equipment","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/super_tape
	name = "Professional Duct Tape"
	id = "super_tape"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1500, /datum/material/plastic = 1000)
	build_path = /obj/item/stack/tape/industrial/pro
	category = list("Equipment","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING



/////////////////////////////////////////
////////////Tackle Gloves////////////////
/////////////////////////////////////////

/datum/design/tackle_dolphin
	name = "Дельфиньи перчатки"
	desc = "Гладкие аэродиномичные перчатки перехвата, которые менее эффективны при бросках, но куда более эффективны при скольжении по корридорам и непреднамеренной порчи имущества и здоровья."
	id = "tackle_dolphin"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plastic = 2500)
	build_path = /obj/item/clothing/gloves/tackler/dolphin
	category = list("Equipment","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/tackle_rocket
	name = "Ракетные перчатки"
	desc = "Максимальный риск с максимальной отдачей, идеальны когда вам нужно остановить преступника с расстояния в 15 метров, или же умереть пытаясь. Запрещены в большинстфе футбольных и регбийных лиг."
	id = "tackle_rocket"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/plasma = 1000, /datum/material/plastic = 2000)
	build_path = /obj/item/clothing/gloves/tackler/rocket
	category = list("Equipment","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/////////////////////////////////////////
/////////Fishing Equipment///////////////
/////////////////////////////////////////

/datum/design/fishing_rod_tech
	name = "Продвинутая удочка"
	desc = "Встроенный универсальный синтезатор наживки позволяет этому чуду техники обходиться без в лишних запасов. Межзвездные соглашения запрещают использовать его за пределами любительского рыболовства. И вы можете ловить рыбу с помощью этого."
	id = "fishing_rod_tech"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	materials = list(/datum/material/uranium = 1000, /datum/material/plastic = 2000)
	build_path = /obj/item/fishing_rod/tech
	category = list("Equipment")
