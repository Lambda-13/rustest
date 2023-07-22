////////////////////////////////////////
//////////////MISC Boards///////////////
////////////////////////////////////////

/datum/design/board/smes
	name = "Сверхмощный аккумуляторный каскад (СМЕС)"
	desc = "Огромная батарея аккумуляторов, предназначеная для длительного хранения энергии, получаемой от источника питания и ее дальнейшего распределения по электрической сети."
	id = "smes"
	build_path = /obj/item/circuitboard/machine/smes
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40

/datum/design/board/circulator
	name = "Турбина ТЭГа"
	desc = "Газовый циркулятор с теплообменником."
	id = "circulator"
	build_path = /obj/item/circuitboard/machine/circulator
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/teg
	name = "Термоэлектрический генератор (ТЭГ)"
	desc = "Высокоэффективный газовый термоэлектрический генератор."
	id = "teg"
	build_path = /obj/item/circuitboard/machine/generator
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/announcement_system
	name = "Автоматизированная Система Оповещений"
	desc = "Автоматизированная Система Оповещений делает важные оповещения в радиоканалах, пока ты не трогаешь её своими грязными руками."
	id = "automated_announcement"
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/announcement_system
	category = list("Subspace Telecomms")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/turbine_computer
	name = "Консоль управления газовой турбиной"
	desc = "Компьютер для дистанционного управления газовой турбиной."
	id = "power_turbine_console"
	build_path = /obj/item/circuitboard/computer/turbine_computer
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/emitter
	name = "Излучатель"
	desc = "Мощный промышленный лазер, часто используемый в области силовых полей и производства электроэнергии."
	id = "emitter"
	build_path = /obj/item/circuitboard/machine/emitter
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/power_compressor
	name = "Компрессор турбины"
	desc = "Компрессорная ступень газотурбинного генератора."
	id = "power_compressor"
	build_path = /obj/item/circuitboard/machine/power_compressor
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/power_turbine
	name = "Газотурбинный генератор"
	desc = "Газовая турбина, используемая для резервного производства электроэнергии."
	id = "power_turbine"
	build_path = /obj/item/circuitboard/machine/power_turbine
	category = list ("Imported","Engineering Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/thermomachine
	name = "Термомашина"
	desc = "Нагревает или охлаждает газ в трубах. Потребляет очень много энергии."
	id = "thermomachine"
	build_type = PROTOLATHE | IMPRINTER | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/thermomachine
	category = list ("Imported","Engineering Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/space_heater
	name = "Обогреватель"
	desc = "Обогреватель/охладитель, сделанный космическими амишами с использованием традиционных космических технологий, гарантированно не подожжет станцию. Гарантия аннулируется при использовании в двигателях."
	id = "space_heater"
	build_path = /obj/item/circuitboard/machine/space_heater
	category = list ("Imported","Engineering Machinery")
	build_type = PROTOLATHE | IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = ALL

/datum/design/board/teleport_station
	name = "Machine Design (Teleportation Station Board)"
	desc = "The circuit board for a teleportation station."
	id = "tele_station"
	build_path = /obj/item/circuitboard/machine/teleporter_station
	category = list ("Imported","Teleportation Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/teleport_hub
	name = "Телепортационная арка"
	desc = "Открывает проход сквозь блюспейс пространство."
	id = "tele_hub"
	build_path = /obj/item/circuitboard/machine/teleporter_hub
	category = list ("Imported","Teleportation Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/quantumpad
	name = "Квантовый телепад"
	desc = "Квантовый блюспейс телепад, используемый для телепортации объектов на другие квантовые телепады."
	id = "quantumpad"
	build_path = /obj/item/circuitboard/machine/quantumpad
	category = list ("Imported","Teleportation Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/launchpad
	name = "Локальный блюспейс телепад"
	desc = "Блюспейс телепад, способный перемещать материю сквозь блюспейс. Не требует фактических координат, работает на смещении координат относительно консоли. Дальность работы зависит от деталей."
	id = "launchpad"
	build_path = /obj/item/circuitboard/machine/launchpad
	category = list ("Imported","Teleportation Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/launchpad_console
	name = "Консоль управления локального телепада"
	desc = "Используется для калибровки и управления блюспейс телепадом. Не требует фактических координат, работает на смещении координат относительно консоли. Дальность работы зависит от деталей."
	id = "launchpad_console"
	build_path = /obj/item/circuitboard/computer/launchpad_console
	category = list ("Imported","Teleportation Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/teleconsole
	name = "Консоль управления телепортом"
	desc = "Используется для управления связанными телепортационной аркой и станцией."
	id = "teleconsole"
	build_path = /obj/item/circuitboard/computer/teleporter
	category = list("Teleportation Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/cryotube
	name = "Криокамера"
	desc = "Огромная стеклянная колба использующая целительные свойства холода."
	id = "cryotube"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/cryo_tube
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_MEDICAL
	category = list ("Imported","Medical Machinery")

/datum/design/board/sleeper
	name = "Machine Design (Sleeper Board)"
	desc = "The circuit board for a sleeper."
	id = "sleeper"
	build_path = /obj/item/circuitboard/machine/sleeper
	category = list ("Imported","Medical Machinery")

/datum/design/board/chem_dispenser
	name = "Хим-раздатчик"
	desc = "Создает и выдает химикаты."
	id = "chem_dispenser"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/chem_dispenser
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_MEDICAL
	category = list ("Imported","Medical Machinery")

/datum/design/board/chem_master
	name = "ХимМастер 3000"
	desc = "Используется для разделения химикатов и их распределения в различных состояниях."
	id = "chem_master"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_MEDICAL
	build_path = /obj/item/circuitboard/machine/chem_master
	category = list ("Imported","Medical Machinery")

/datum/design/board/chem_heater
	name = "Реакционная камера"
	desc = "Миниатюрная термомашина способная быстро изменять и удерживать температуру состава, а так же мануально контролировать баланс ПШ."
	id = "chem_heater"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_MEDICAL
	build_path = /obj/item/circuitboard/machine/chem_heater
	category = list ("Imported","Medical Machinery")

/datum/design/board/smoke_machine
	name = "Дымогенератор"
	desc = "Аппарат с установленной внутри центрифугой. Производит дым с любыми реагентами, помещенными в него вами."
	id = "smoke_machine"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/smoke_machine
	category = list ("Imported","Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/reagentgrinder
	name = "Миксер"
	desc = "От BlenderTech. Замиксуется? Давайте узнаем!"
	id = "reagentgrinder"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/reagentgrinder
	category = list ("Imported","Medical Machinery")


/datum/design/board/dnascanner
	name = "Machine Design (DNA Scanner)"
	desc = "Allows for the construction of circuit boards used to build a Cloning Scanner."
	id = "dnascanner"
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
	build_path = /obj/item/circuitboard/machine/dnascanner
	category = list("Medical Machinery")

/datum/design/board/clonepod
	name = "Machine Design (Cloning Pod)"
	desc = "An electronically-lockable pod for growing organic tissue."
	id = "clonepod"
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
	build_path = /obj/item/circuitboard/machine/clonepod
	category = list("Medical Machinery")

/datum/design/board/hypnochair
	name = "Допросная камера"
	desc = "Устройство, используемое для проведения \"допроса с пристрастием\" при помощи инвазивного ментального внедрения."
	id = "hypnochair"
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	build_path = /obj/item/circuitboard/machine/hypnochair
	category = list("Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40

/datum/design/board/biogenerator
	name = "Биореактор"
	desc = "Превращает растения в биомассу, которую можно использовать для изготовления полезных предметов."
	id = "biogenerator"
	build_path = /obj/item/circuitboard/machine/biogenerator
	category = list ("Imported","Hydroponics Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/hydroponics
	name = "Лоток гидропоники"
	desc = "Это самая высокотехнологичная, автоматизированная, автономная грядка которую вы когда-либо видели."
	id = "hydro_tray"
	build_path = /obj/item/circuitboard/machine/hydroponics
	category = list ("Imported","Hydroponics Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/plantgenes
	name = "Манипулятор ДНК растений"
	desc = "Позволяет работать с генетическим кодом растений для увеличения их потенциала."
	id = "plantgenes"
	build_path = /obj/item/circuitboard/machine/plantgenes
	category = list ("Imported","Hydroponics Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/destructive_analyzer
	name = "Деструктивный анализатор"
	desc = "Если ты хочешь понять как работают вещи, тебе придется их сломать."
	id = "destructive_analyzer"
	build_path = /obj/item/circuitboard/machine/destructive_analyzer
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/experimentor
	name = "Э.К.С.П.Е.Р.И.Ментор"
	desc = "\"Альтернативная\" версия деструктивного анализатора с небольшой тенденцией к катастрофическому выходу из строя."
	id = "experimentor"
	build_path = /obj/item/circuitboard/machine/experimentor
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/bepis
	name = "Б.Е.П.И.С"
	desc = "Высокоточное тестирующее устройство, которое открывает секреты известной вселенной, используя два самых мощных вещества, доступных человеку: чрезмерное количество электричества и деньги."
	id = "bepis"
	build_path = /obj/item/circuitboard/machine/bepis
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/board/protolathe
	name = "Протолат"
	desc = "Превращает сырье в полезные предметы."
	id = "protolathe"
	build_path = /obj/item/circuitboard/machine/protolathe
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/circuit_imprinter
	name = "Схемопринтер"
	desc = "Производит печатные платы для создания оборудования."
	id = "circuit_imprinter"
	build_path = /obj/item/circuitboard/machine/circuit_imprinter
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/rdserver
	name = "Сервер РнД"
	desc = "Компьютерная система, работающая на развитой нейронной сети, которая обрабатывает произвольную информацию для получения данных, пригодных для разработки новых технологий. С точки зрения компьютерного ботана, оно производит очки исследований."
	id = "rdserver"
	build_path = /obj/item/circuitboard/machine/rdserver
	category = list("Research Machinery", "initial", "Equipment")

	build_type = IMPRINTER | MECHFAB
	construction_time = 40

/datum/design/board/mechfab
	name = "Фабрикатор экзокостюмов"
	desc = "Сложный производственный комплекс изготавливающий киборгов и огромные экзокостюмы."
	id = "mechfab"
	build_path = /obj/item/circuitboard/machine/mechfab
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40

/datum/design/board/cyborgrecharger
	name = "Станция зарядки киборгов"
	desc = "Устройство, заряжающее киборгов и переснаряжающая их материалами."
	id = "cyborgrecharger"
	build_path = /obj/item/circuitboard/machine/cyborgrecharger
	category = list("Research Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING
	build_type = IMPRINTER | MECHFAB
	construction_time = 40

/datum/design/board/mech_recharger
	name = "Порт питания мехдока"
	desc = "Порт, заряжающий внутреннюю силовую ячейку меха."
	id = "mech_recharger"
	build_path = /obj/item/circuitboard/machine/mech_recharger
	category = list("Research Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/board/augmanipulator
	name = "Machine Design (Augment Manipulator Board)"
	desc = "The circuit board for an Augment Manipulator."
	id = "augmanipulator"
	build_path = /obj/item/circuitboard/machine/aug_manipulator
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/nanite_chamber
	name = "Нанитная камера"
	desc = "Устройство для инъекции, мониторинга и базовой настройки нанитных облаков."
	id = "nanite_chamber"
	build_path = /obj/item/circuitboard/machine/nanite_chamber
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/public_nanite_chamber
	name = "Публичная нанитная камера"
	desc = "Устройство для автоматической инъекции нанитного облака с заданым номером. Объем вводимых нанитов значительно ниже чем у стандартной камеры."
	id = "public_nanite_chamber"
	build_path = /obj/item/circuitboard/machine/public_nanite_chamber
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/nanite_programmer
	name = "Программатор нанитов"
	desc = "Устройство для изменения настроек нанитных программ хранимых на дисках."
	id = "nanite_programmer"
	build_path = /obj/item/circuitboard/machine/nanite_programmer
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/nanite_program_hub
	name = "Программный центр нанитов"
	desc = "Компилирует нанитные программы с веб-серверов и записывает их на диски."
	id = "nanite_program_hub"
	build_path = /obj/item/circuitboard/machine/nanite_program_hub
	category = list("Research Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/microwave
	name = "Микроволновка"
	desc = "Готовит и варит штуки."
	id = "microwave"
	build_path = /obj/item/circuitboard/machine/microwave
	category = list ("Imported","Misc. Machinery")


/datum/design/board/gibber
	name = "Мясорубка"
	desc = "Полагаю в более подробном описании не нуждается."
	id = "gibber"
	build_path = /obj/item/circuitboard/machine/gibber
	category = list ("Imported","Misc. Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/smartfridge
	name = "Умный холодильник"
	desc = "Сохраняет холодные вещи холодными, а горячие... тоже холодными."
	id = "smartfridge"
	build_path = /obj/item/circuitboard/machine/smartfridge
	category = list ("Imported","Misc. Machinery")


/datum/design/board/monkey_recycler
	name = "Переработчик обезьян"
	desc = "Полезная машина, перерабатывающая мертвых обезьян в обезьяньи кубики."
	id = "monkey_recycler"
	build_path = /obj/item/circuitboard/machine/monkey_recycler
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/seed_extractor
	name = "Экстрактор семян"
	desc = "Извлекает и упаковывает семена из урожая."
	id = "seed_extractor"
	build_path = /obj/item/circuitboard/machine/seed_extractor
	category = list ("Imported","Hydroponics Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/processor
	name = "Кухонный комбайн"
	desc = "Промышленный измельчитель, используемый для обработки мяса и других продуктов. Во время работы держите руки подальше от приемника."
	id = "processor"
	build_path = /obj/item/circuitboard/machine/processor
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/soda_dispenser
	name = "Раздатчик газировки"
	desc = "Содержит большой резервуар с безалкогольными напитками."
	id = "soda_dispenser"
	build_path = /obj/item/circuitboard/machine/chem_dispenser/drinks
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
	category = list ("Imported","Misc. Machinery")

/datum/design/board/beer_dispenser
	name = "Раздатчик бухлишка"
	desc = "Содержит большой резервуар ништяков."
	id = "beer_dispenser"
	build_path = /obj/item/circuitboard/machine/chem_dispenser/drinks/beer
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
	category = list ("Imported","Misc. Machinery")

/datum/design/board/recycler
	name = "Мусоропереработчик"
	desc = "Большая дробильная машина, используемая для неэффективной переработки мелких предметов. Сбоку есть индикаторы."
	id = "recycler"
	build_path = /obj/item/circuitboard/machine/recycler
	category = list ("Imported","Misc. Machinery")

	build_type = IMPRINTER | MECHFAB
	construction_time = 40

/datum/design/board/scanner_gate
	name = "Сканирующая арка"
	desc = "Устройство сканирующее проходящих сквозь него пользователей и подающее звуковой сигнал при заданных параметрах."
	id = "scanner_gate"
	build_path = /obj/item/circuitboard/machine/scanner_gate
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40


/datum/design/board/holopad
	name = "Голопад ИИ"
	desc = "Напольное устройство для проецирования голографических изображений."
	id = "holopad"
	build_path = /obj/item/circuitboard/machine/holopad
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40


/datum/design/board/autolathe
	name = "Автолат"
	desc = "Производит изделия из металла и стекла."
	id = "autolathe"
	build_path = /obj/item/circuitboard/machine/autolathe
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40


/datum/design/board/recharger
	name = "Оружейный зарядник"
	desc = "Заряжает энергетическое оружие и энергозависимую экипировку."
	id = "recharger"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/circuitboard/machine/recharger
	category = list("Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40


/datum/design/board/vendor
	name = "Частный торговый автомат"
	desc = "Комерция в действии! Вид торгового автомата можно изменить при помощи отвертки."
	id = "vendor"
	build_path = /obj/item/circuitboard/machine/vendor
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40


/datum/design/board/ore_redemption
	name = "Шахтерская печь"
	desc = "Машина, которая принимает руду и мгновенно переплавляет ее в листы пригодного для обработки материала. При этом  генерируются баллы за руду, их количество зависит от редкости руды. Полученные балы можно обменять на полезную экипировку в торговом автомате шахтеров."
	id = "ore_redemption"
	build_path = /obj/item/circuitboard/machine/ore_redemption
	category = list ("Imported","Misc. Machinery")

/datum/design/board/bluespace_miner
	name = "Machine Design (Bluespace Miner)"
	desc = "The circuit board for a Bluespace Miner."
	id = "bluespace_miner"
	build_path = /obj/item/circuitboard/machine/bluespace_miner
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/mining_equipment_vendor
	name = "Торговый автомат шахтеров"
	desc = "Различное оборудование для бригады шахтеров. Очки добываются за сдачу руды в шахтерскую печь и начисляются на персональный счет шахтера."
	id = "mining_equipment_vendor"
	build_path = /obj/item/circuitboard/machine/vending/mining_equipment
	category = list ("Imported","Misc. Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO//bruh
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/board/tesla_coil
	name = "Катушка Теслы"
	desc = "Преобразует удары шаровой молнии в энергию. Используйте отвертку для переключения между режимами производства электроэнергии и очков исследования."
	id = "tesla_coil"
	build_path = /obj/item/circuitboard/machine/tesla_coil
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/rad_collector
	name = "Радиационный коллекторный массив"
	desc = "Устройство, которое использует излучение Хокинга и плазму для производства энергии."
	id = "rad_collector"
	build_path = /obj/item/circuitboard/machine/rad_collector
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/grounding_rod
	name = "Заземлитель"
	desc = "Защищает окружающее оборудование и людей от поджаривания Проклятием Эдисона."
	id = "grounding_rod"
	build_path = /obj/item/circuitboard/machine/grounding_rod
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/ntnet_relay
	name = "Квантовое реле NTNet"
	desc = "Очень сложный маршрутизатор и передатчик, способный соединять вместе беспроводные электронные устройства. Выглядит хрупким."
	id = "ntnet_relay"
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/ntnet_relay
	category = list("Subspace Telecomms")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/limbgrower
	name = "Биосинтезатор"
	desc = "Выращивает органы и конечности из синтетической плоти."
	id = "limbgrower"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/limbgrower
	category = list("Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/harvester
	name = "Авто-Потрошитель МК II"
	desc = "Извлекает из тела ВСЁ лишнее, включая органы, конечности и голову."
	id = "harvester"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/harvester
	category = list("Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/deepfryer
	name = "фритюрница"
	desc = "Жареное <i>всё</i>."
	id = "deepfryer"
	build_path = /obj/item/circuitboard/machine/deep_fryer
	category = list ("Imported","Misc. Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/donksofttoyvendor
	name = "Торговый автомат игрушек DonkSoft"
	desc = "Утвержденный поставщик игрушек в возрасте от 8 лет и старше."
	id = "donksofttoyvendor"
	build_path = /obj/item/circuitboard/machine/vending/donksofttoyvendor
	category = list ("Imported","Misc. Machinery")


/datum/design/board/cell_charger
	name = "Зарядник батарей"
	desc = "Заряжает аккумуляторные батареи, не подходит для вооружения."
	id = "cell_charger"
	build_path = /obj/item/circuitboard/machine/cell_charger
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40


/datum/design/board/dish_drive
	name = "утилизатор тарелок"
	desc = "Кулинарное чудо, которое использует преобразование вещества в энергию для хранения посуды и осколков. Удобно!"
	id = "dish_drive"
	build_path = /obj/item/circuitboard/machine/dish_drive
	category = list ("Imported","Misc. Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/board/stacking_unit_console
	name = "Консоль штабелирующей машины"
	desc = "Управляет штабелирующей машиной... в теории."
	id = "stack_console"
	build_path = /obj/item/circuitboard/machine/stacking_unit_console
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/stacking_machine
	name = "Штабелирующая машина"
	desc = "Машина, которая автоматически упаковывает проезжающие мимо материалы. Управляется консолью."
	id = "stack_machine"
	build_path = /obj/item/circuitboard/machine/stacking_machine
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/ore_silo
	name = "Ресурсный бункер"
	desc = "Универсальная блюспейс система хранения и передачи ресурсов на нужды станции."
	id = "ore_silo"
	build_path = /obj/item/circuitboard/machine/ore_silo
	category = list ("Imported","Research Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/board/selling_pad
	name = "Machine Design (Cargo Hold Pad)"
	desc = "The circuit board for a Cargo Hold Pad."
	id = "selling_pad"
	build_path = /obj/item/circuitboard/machine/selling_pad
	category = list ("Imported","Misc. Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/board/paystand
	name = "Терминал оплаты"
	desc = "Налоговый сбор проверен и одобрен корпорацией Нано-Трейзен."
	id = "paystand"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/paystand
	category = list ("Imported","Misc. Machinery")


/datum/design/board/fat_sucker
	name = "Авто-Экстрактор липидов МК IV"
	desc = "Безопасно и эффективно удаляет лишний жир."
	id = "fat_sucker"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/fat_sucker
	category = list ("Imported","Misc. Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/stasis
	name = "Стазисная кровать"
	desc = "Не очень комфортная кровать, которая постоянно жужжит, однако она помещает пациента в стазис с надеждой, что когда-нибудь он все-таки дождется помощи."
	id = "stasis"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/stasis
	category = list("Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/medical_kiosk
	name = "Медицинский киоск"
	desc = "За небольшую плату поможет продиагностировать пациента на основные виды повреждений и заболеваний."
	id = "medical_kiosk"
	build_path = /obj/item/circuitboard/machine/medical_kiosk
	category = list ("Imported","Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/medipen_refiller
	name = "Наполнитель медипенов"
	desc = "Машина, производящая пустые медипены, а так же перезаряжающая их химикатами. Внимание! Перезарядка осуществляется только для медипенов одобренных медицинской ассоциацией Нанотрейзен. Химический состав наполнителя должен строго соответствовать маркировке, в противном случае операция будет прервана."
	id = "medipen_refiller"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/circuitboard/machine/medipen_refiller
	category = list ("Imported","Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/sheetifier
	name = "Листопрокатная машина"
	desc = "Строительный материал из чего угодно."
	id = "sheetifier"
	build_path = /obj/item/circuitboard/machine/sheetifier
	category = list ("Imported","Misc. Machinery")

/datum/design/board/shieldwallgen
	name = "Machine Design (Shield Wall Generator)"
	desc = "A shield generator commonly used in xenobiology research."
	id = "shieldwallgen"
	build_path = /obj/item/circuitboard/machine/shieldwallgen
	category = list("Misc. Machinery")

/datum/design/board/shieldwallgen/atmos
	name = "Machine Design (Holofield Generator)"
	desc = "A specialized shield generator used to block airflow."
	id = "shieldwallgen_atmos"
	build_path = /obj/item/circuitboard/machine/shieldwallgen/atmos
	category = list("Misc. Machinery")

///////////////////////////////////////////
//////////////Shuttle Boards///////////////
///////////////////////////////////////////
/datum/design/board/shuttle/engine/plasma
	name = "Плазменный двигатель"
	desc = "Двигатель, который сжигает плазму, хранящуюся в располагающемся рядом предзажигателе плазменного двигателя."
	id = "engine_plasma"
	build_path = /obj/item/circuitboard/machine/shuttle/engine/plasma
	category = list ("Imported","Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/electric
	name = "Machine Design (Ion Thruster Board)"
	desc = "The circuit board for an ion thruster."
	id = "engine_ion"
	build_path = /obj/item/circuitboard/machine/shuttle/engine/electric
	category = list ("Imported","Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/expulsion
	name = "Machine Design (Expulsion Thruster Board)"
	desc = "The circuit board for an expulsion thruster."
	id = "engine_expulsion"
	build_path = /obj/item/circuitboard/machine/shuttle/engine/expulsion
	category = list ("Imported","Shuttle Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/void
	name = "Пустотный двигатель"
	desc = "Двигатель, использующий технологию для пространственного прорыва для движения."
	id = "engine_void"
	build_path = /obj/item/circuitboard/machine/shuttle/engine/void
	category = list ("Imported","Shuttle Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/heater
	name = "Предзажигатель двигателя"
	desc = "Направляет энергию в сжатые частицы для приведения в действие присоединенного двигателя."
	id = "engine_heater"
	build_path = /obj/item/circuitboard/machine/shuttle/heater
	category = list ("Imported","Shuttle Machinery")
	build_type = IMPRINTER | MECHFAB
	construction_time = 40
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/smes
	name = "Machine Design (Engine Heater Board)"
	desc = "The circuit board for an engine heater."
	id = "engine_smes"
	build_path = /obj/item/circuitboard/machine/shuttle/smes
	category = list ("Imported","Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE
