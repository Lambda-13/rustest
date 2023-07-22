/datum/design/nanites
	name = "None"
	desc = "Warn a coder if you see this."
	id = "default_nanites"
	build_type = NANITE_COMPILER
	construction_time = 50
	category = list()
	research_icon = 'icons/obj/device.dmi'
	research_icon_state = "nanite_program"
	var/program_type = /datum/nanite_program

////////////////////UTILITY NANITES//////////////////////////////////////

/datum/design/nanites/metabolic_synthesis
	name = "Метаболический синтез"
	desc = "Наниты используют цикл метаболизма носителя для ускоренной репликации, перерабатывая лишнюю еду в топливо и ускоряя производство на +0,5 единиц. Носитель должен быть хорошо накормлен для работы программы."
	id = "metabolic_nanites"
	program_type = /datum/nanite_program/metabolic_synthesis
	category = list("Utility Nanites")

/datum/design/nanites/viral
	name = "Вирусное заражение"
	desc = "Наниты постоянно расслылают шифрованные сигналы, пытаясь насильно скопировать свои настройки в другие рои нанитов. Эта программа также установит ID облачного сохранения другого роя на установленный в программе."
	id = "viral_nanites"
	program_type = /datum/nanite_program/viral
	category = list("Utility Nanites")

/datum/design/nanites/research
	name = "Distributed Computing"
	desc = "The nanites aid the research servers by performing a portion of its calculations, increasing research point generation."
	id = "research_nanites"
	program_type = /datum/nanite_program/research
	category = list("Utility Nanites")

/datum/design/nanites/researchplus
	name = "Neural Network"
	desc = "The nanites link the host's brains together forming a neural research network, that becomes more efficient with the amount of total hosts. Can be overloaded to increase research output."
	id = "researchplus_nanites"
	program_type = /datum/nanite_program/researchplus
	category = list("Utility Nanites")

/datum/design/nanites/monitoring
	name = "Отслеживание"
	desc = "Наниты отслеживают состояние и местоположение носителя, отправляя их в сеть медицинских сенсоров. Также добавляет иконку нанитового интерфейса для медицинских сканеров, осматривающих носителя."
	id = "monitoring_nanites"
	program_type = /datum/nanite_program/monitoring
	category = list("Utility Nanites")

/datum/design/nanites/self_scan
	name = "Сканирование носителя"
	desc = "Наниты выводят детальный отчет о сканировании тела носителя при активации. Можно выбирать между медицинским, химическим и нанитовым сканированием, а также сканированием травм."
	id = "selfscan_nanites"
	program_type = /datum/nanite_program/self_scan
	category = list("Utility Nanites")

/datum/design/nanites/dermal_button
	name = "Кнопка на коже"
	desc = "Наниты формируют кнопку на руке носителя, позволяя ему отправлять сигнал программам при нажатии. Кнопку нельзя нажать, если носитель находится без сознания."
	id = "dermal_button_nanites"
	program_type = /datum/nanite_program/dermal_button
	category = list("Utility Nanites")

/datum/design/nanites/stealth
	name = "Скрытность"
	desc = "Наниты будут скрывать свою активность от поверхностного сканирования, становясь невидимыми для диагностических дисплеев и иммунными для Вирусных программ."
	id = "stealth_nanites"
	program_type = /datum/nanite_program/stealth
	category = list("Utility Nanites")

/datum/design/nanites/reduced_diagnostics
	name = "Reduced Diagnostics"
	desc = "Disables some high-cost diagnostics in the nanites, making them unable to communicate their program list to portable scanners. \
	Doing so saves some power, slightly increasing their replication speed."
	id = "red_diag_nanites"
	program_type = /datum/nanite_program/reduced_diagnostics
	category = list("Utility Nanites")

/datum/design/nanites/access
	name = "Подкожный ID"
	desc = "Наниты хранят доступы с карты носителя в магнитной ленте под кожей. Обновляется при активации, копируя текущий доступ носителя и стирая предидущий."
	id = "access_nanites"
	program_type = /datum/nanite_program/access
	category = list("Utility Nanites")

/datum/design/nanites/relay
	name = "Приемо-передатчик"
	desc = "Наниты принимают сигналы на огромных расстояниях. Необходимо настроить канал передатчика до передачи сигнала."
	id = "relay_nanites"
	program_type = /datum/nanite_program/relay
	category = list("Utility Nanites")

/datum/design/nanites/repeater
	name = "Ретранслятор сигнала"
	desc = "При активации отправляет носителю сигнал, с настраиваемой задержкой. Используется при отправке нескольких кодов в одной программе."
	id = "repeater_nanites"
	program_type = /datum/nanite_program/sensor/repeat
	category = list("Utility Nanites")

/datum/design/nanites/relay_repeater
	name = "Ретранслятор - передатчик"
	desc = "При активации отправляет сигнал вовне по каналу передатчика, с настраиваемой задержкой."
	id = "relay_repeater_nanites"
	program_type = /datum/nanite_program/sensor/relay_repeat
	category = list("Utility Nanites")

/datum/design/nanites/emp
	name = "Электромагнитный резонанс"
	desc = "Наниты вызывают электромагнитный импульс рядом с носителем. Может повредить другие программы!"
	id = "emp_nanites"
	program_type = /datum/nanite_program/emp
	category = list("Utility Nanites")

/datum/design/nanites/spreading
	name = "Аурное распространение"
	desc = "Наниты получают возможность существовать снаружи тела носителя на короткие периоды времени, и способность создавать новые рои без процесса внедрения; создавая невероятно заразный штамм нанитов."
	id = "spreading_nanites"
	program_type = /datum/nanite_program/spreading
	category = list("Utility Nanites")

/datum/design/nanites/nanite_sting
	name = "Нанитное жало"
	desc = "При активации жалит случайного не-носителя рядом с самим носителем едва заметным скоплением нанитов, делая его новым носителем. Новый носитель почувствует это. Если жало не находит рядом цель, то оно возвращается в рой, \"возвращая\" стоимость активации."
	id = "nanite_sting_nanites"
	program_type = /datum/nanite_program/nanite_sting
	category = list("Utility Nanites")

/datum/design/nanites/mitosis
	name = "Митоз"
	desc = "Наниты получают способность к саморепликации, используя блюспейс для этого процесса вместо метаболизма носителя. Это очень сильно повышает скорость появления нанитов, но вызывает случайные ошибки в программах из-за бракованных копий нанитов, делая эту программу очень опасной без облачного сохранения."
	id = "mitosis_nanites"
	program_type = /datum/nanite_program/mitosis
	category = list("Utility Nanites")

////////////////////MEDICAL NANITES//////////////////////////////////////
/datum/design/nanites/regenerative
	name = "Ускоренная регенерация"
	desc = "Наниты ускоряют естественную регенерацию носителя, медленно исцеляя его (0.5 физического и термического урона). Не потребляет наниты, пока носитель не ранен."
	id = "regenerative_nanites"
	program_type = /datum/nanite_program/regenerative
	category = list("Medical Nanites")

/datum/design/nanites/regenerative_advanced
	name = "Био-реконструкция"
	desc = "Наниты вручную восстанавливают и заменяют клетки тела, делая это гораздо быстрее обычной регенерации. Лечит 2 физического и термического урона. Однако, эта программа не может отличить поврежденные клетки от неповрежденных, используя наниты, даже если организм цел."
	id = "regenerative_plus_nanites"
	program_type = /datum/nanite_program/regenerative_advanced
	category = list("Medical Nanites")

/datum/design/nanites/temperature
	name = "Регулировка температуры"
	desc = "Наниты регулируют температуру тела носителя до идеального уровня. Не потребляет наниты, пока температура на идеальном уровне."
	id = "temperature_nanites"
	program_type = /datum/nanite_program/temperature
	category = list("Medical Nanites")

/datum/design/nanites/purging
	name = "Очистка крови"
	desc = "Наниты очищают кровь носителя на 1 единицу токсического урона и на 1 единицу всех химикатов в крови. Непрерывно расходует наниты пока включена."
	id = "purging_nanites"
	program_type = /datum/nanite_program/purging
	category = list("Medical Nanites")

/datum/design/nanites/purging_advanced
	name = "Выборочная очистка крови"
	desc = "Наниты лечат 1 единицу токсического урона и выводят 1 единицу токсичных реагентов из крови носителя, игнорируя нетоксичные вещества. Для анализа состава крови требуется дополнительная вычислительная мощность, что сильно повышает потребление нанитов."
	id = "purging_plus_nanites"
	program_type = /datum/nanite_program/purging_advanced
	category = list("Medical Nanites")

/datum/design/nanites/brain_heal
	name = "Восстановление нейронов"
	desc = "Наниты исправляют нейронные соединения в мозге носителя, излечивая повреждения мозга и легкие мозговые травмы. Лечит 1 единицу повреждений мозга и имеет 10% шанс на исцеление небольших травм мозга. Не потребляет наниты, если мозг носителя цел."
	id = "brainheal_nanites"
	program_type = /datum/nanite_program/brain_heal
	category = list("Medical Nanites")

/datum/design/nanites/brain_heal_advanced
	name = "Нейронная пересборка"
	desc = "Наниты становятся способны сохранять и восстанавливать нейронные соединения, теоретически даже восстанавливая отсутствующие или поврежденные участки мозга. Лечит 2 единицы урона мозгу и с 10% шансом могут исцелить даже самые тяжелые травмы мозга. Непрерывно расходует наниты пока включена."
	id = "brainheal_plus_nanites"
	program_type = /datum/nanite_program/brain_heal_advanced
	category = list("Medical Nanites")

/datum/design/nanites/blood_restoring
	name = "Восстановление крови"
	desc = "Наниты ускоряют процесс создания кровяных клеток в организме носителя. Не потребляет наниты, если крови в теле носителя достаточно."
	id = "bloodheal_nanites"
	program_type = /datum/nanite_program/blood_restoring
	category = list("Medical Nanites")

/datum/design/nanites/repairing
	name = "Реконструкция механики"
	desc = "Наниты чинят механические части тела носителя. Чинит 1 единицу физического и термического урона равномерно во всех конечностях. Не потребляет наниты, если конечности не повреждены."
	id = "repairing_nanites"
	program_type = /datum/nanite_program/repairing
	category = list("Medical Nanites")

/datum/design/nanites/defib
	name = "Дефибрилляция"
	desc = "При активации дает разряд тока в сердце носителя, запуская его, если тело может это выдержать. Реанимация такого плана имеет такие же требования, как и обычная дефибрилляция. Не вызывает удушье."
	id = "defib_nanites"
	program_type = /datum/nanite_program/defib
	category = list("Medical Nanites")


////////////////////AUGMENTATION NANITES//////////////////////////////////////

/datum/design/nanites/nervous
	name = "Поддержка нервов"
	desc = "Наниты действуют как вторичная нервная система, сокращая время оглушения носителя в два раза."
	id = "nervous_nanites"
	program_type = /datum/nanite_program/nervous
	category = list("Augmentation Nanites")

/datum/design/nanites/hardening
	name = "Укрепление кожи"
	desc = "Наниты формируют сеть под кожей носителя, защищая его от пулевых ранений и ранений от холодного оружия. Дает 25 брони от холодного оружия и 20 брони от пуль."
	id = "hardening_nanites"
	program_type = /datum/nanite_program/hardening
	category = list("Augmentation Nanites")

/datum/design/nanites/refractive
	name = "Отражающая кожа"
	desc = "Наниты формируют мембрану под кожей носителя, уменьшая урон от лазеров и энергетического оружия. Добавляет 25 лазерной и 20 энергетической брони."
	id = "refractive_nanites"
	program_type = /datum/nanite_program/refractive
	category = list("Augmentation Nanites")

/datum/design/nanites/coagulating
	name = "Ускоренное свертывание"
	desc = "Наниты вызывают быстрое свертывание крови при ранении носителя, невероятно сильно снижая шансы истечь кровью."
	id = "coagulating_nanites"
	program_type = /datum/nanite_program/coagulating
	category = list("Augmentation Nanites")

/datum/design/nanites/conductive
	name = "Электропроводимость"
	desc = "Наниты действуют как заземлитель для тока, защищая носителя. Однако удары током повреждают самих нанитов."
	id = "conductive_nanites"
	program_type = /datum/nanite_program/conductive
	category = list("Augmentation Nanites")

/datum/design/nanites/adrenaline
	name = "Всплеск адреналина"
	desc = "Наниты вызывают всплеск адреналина при активации, вкалывая 3 единицы Экспериментальных стимуляторов, пробуждая носителя и временно ускоряя его, из-за чего он может уронить вещи из рук."
	id = "adrenaline_nanites"
	program_type = /datum/nanite_program/adrenaline
	category = list("Augmentation Nanites")

/datum/design/nanites/mindshield
	name = "Ментальный барьер"
	desc = "Наниты формируют защитную оболочку вокруг мозга носителя, защищая его от аномального влияния, аналогично импланту щита разума."
	id = "mindshield_nanites"
	program_type = /datum/nanite_program/mindshield
	category = list("Augmentation Nanites")

////////////////////DEFECTIVE NANITES//////////////////////////////////////

/datum/design/nanites/glitch
	name = "Сбой"
	desc = "Сильное повреждение программы, вызывающее стремительное разрушение нанитов."
	id = "glitch_nanites"
	program_type = /datum/nanite_program/glitch
	category = list("Defective Nanites")

/datum/design/nanites/necrotic
	name = "Некроз"
	desc = "Наниты атакуют внутренние ткани организма, вызывая сильный и распространенный по всему телу урон."
	id = "necrotic_nanites"
	program_type = /datum/nanite_program/necrotic
	category = list("Defective Nanites")

/datum/design/nanites/toxic
	name = "Интоксикация"
	desc = "Наниты начинают медленное, но непрерывное создание токсинов в организме носителя."
	id = "toxic_nanites"
	program_type = /datum/nanite_program/toxic
	category = list("Defective Nanites")

/datum/design/nanites/suffocating
	name = "Гипоксия"
	desc = "Наниты нарушают естественное усваивание кислорода в организме носителя."
	id = "suffocating_nanites"
	program_type = /datum/nanite_program/suffocating
	category = list("Defective Nanites")

/datum/design/nanites/brain_misfire
	name = "Церебральный сбой"
	desc = "Наниты вмешиваются в нейронные соединения, вызывая небольшие психические расстройства.."
	id = "brainmisfire_nanites"
	program_type = /datum/nanite_program/brain_misfire
	category = list("Defective Nanites")

/datum/design/nanites/skin_decay
	name = "Дермализис"
	desc = "Наниты атакуют клетки кожи, вызывая раздражение, сыпь и небольшой урон."
	id = "skindecay_nanites"
	program_type = /datum/nanite_program/skin_decay
	category = list("Defective Nanites")

/datum/design/nanites/nerve_decay
	name = "Разрушение нервов"
	desc = "Наниты разрушают нервы носителя, вызывая проблемы с координацией и небольшие приступы паралича."
	id = "nervedecay_nanites"
	program_type = /datum/nanite_program/nerve_decay
	category = list("Defective Nanites")

/datum/design/nanites/brain_decay
	name = "Нейро-Некроз"
	desc = "Наниты ищут и атакуют клетки мозга, вызывая масштабный урон мозгу."
	id = "braindecay_nanites"
	program_type = /datum/nanite_program/brain_decay
	category = list("Defective Nanites")

////////////////////WEAPONIZED NANITES/////////////////////////////////////

/datum/design/nanites/flesh_eating
	name = "Клеточный распад"
	desc = "Наниты разрушают клеточные структуры в организме носителя, причиняя сильный физический урон."
	id = "flesheating_nanites"
	program_type = /datum/nanite_program/flesh_eating
	category = list("Weaponized Nanites")

/datum/design/nanites/poison
	name = "Отравление"
	desc = "Наниты доставляют ядовитые химикаты во внутренние органы носителя, вызывая токсический урон и рвоту."
	id = "poison_nanites"
	program_type = /datum/nanite_program/poison
	category = list("Weaponized Nanites")

/datum/design/nanites/memory_leak
	name = "Сбой базы данных"
	desc = "Эта программа внедряется в память, используемую другими программами, вызывая частые ошибки и глюки."
	id = "memleak_nanites"
	program_type = /datum/nanite_program/memory_leak
	category = list("Weaponized Nanites")

/datum/design/nanites/aggressive_replication
	name = "Агрессивная репликация"
	desc = "Наниты поглощают органическую материю для ускорения процесса репликации, повреждая клетки носителя."
	id = "aggressive_nanites"
	program_type = /datum/nanite_program/aggressive_replication
	category = list("Weaponized Nanites")

/datum/design/nanites/meltdown
	name = "Расплавление"
	desc = "Наниты начинают плавиться, вызывая внутренние ожоги и быстро уничтожая рой нанитов. Уменьшает порог безопасности нанитов до 0 при активации."
	id = "meltdown_nanites"
	program_type = /datum/nanite_program/meltdown
	category = list("Weaponized Nanites")

/datum/design/nanites/cryo
	name = "Криогенная обработка"
	desc = "Наниты быстро выпускают тепло через кожу носителя, понижая свою температуру."
	id = "cryo_nanites"
	program_type = /datum/nanite_program/cryo
	category = list("Weaponized Nanites")

/datum/design/nanites/pyro
	name = "Подкожное возгорание"
	desc = "Наниты перестраивают жировые клетки в горючую жидкость под кожей носителя, а потом поджигают её."
	id = "pyro_nanites"
	program_type = /datum/nanite_program/pyro
	category = list("Weaponized Nanites")

/datum/design/nanites/heart_stop
	name = "Остановка сердца"
	desc = "Останавливает сердце носителя, повторная активация запускает его вновь."
	id = "heartstop_nanites"
	program_type = /datum/nanite_program/heart_stop
	category = list("Weaponized Nanites")

/datum/design/nanites/explosive
	name = "Цепная детонация"
	desc = "Взрывает все наниты в организме носителя при активации."
	id = "explosive_nanites"
	program_type = /datum/nanite_program/explosive
	category = list("Weaponized Nanites")

/datum/design/nanites/mind_control
	name = "Контроль разума"
	desc = "Наниты впечатывают в мозг носителя абсолютную инструкцию на 60 секунд при активации. Можно использовать с пультом отправки сообщений."
	id = "mindcontrol_nanites"
	program_type = /datum/nanite_program/comm/mind_control
	category = list("Weaponized Nanites")

////////////////////SUPPRESSION NANITES//////////////////////////////////////

/datum/design/nanites/shock
	name = "Удар током"
	desc = "При активации бьют носителя током. Этот удар всё еще повреждает наниты, вызывая потерю в количестве и возможное повреждение программ!"
	id = "shock_nanites"
	program_type = /datum/nanite_program/shocking
	category = list("Suppression Nanites")

/datum/design/nanites/stun
	name = "Нейронный шок"
	desc = "Наниты пускают сигнал по нервам носителя, оглушая его на короткий период времени."
	id = "stun_nanites"
	program_type = /datum/nanite_program/stun
	category = list("Suppression Nanites")

/datum/design/nanites/sleepy
	name = "Усыпление"
	desc = "Наниты вызывают быстрый, но не моментальный приступ нарколепсии при активации."
	id = "sleep_nanites"
	program_type = /datum/nanite_program/sleepy
	category = list("Suppression Nanites")

/datum/design/nanites/paralyzing
	name = "Парализация"
	desc = "Наниты активно подавляют нервные сигналы, эффективно парализуя носителя."
	id = "paralyzing_nanites"
	program_type = /datum/nanite_program/paralyzing
	category = list("Suppression Nanites")

/datum/design/nanites/fake_death
	name = "Симуляция смерти"
	desc = "Наниты вызывают кому, близкую к смерти, способную обмануть большинство медицинских сканеров."
	id = "fakedeath_nanites"
	program_type = /datum/nanite_program/fake_death
	category = list("Suppression Nanites")

/datum/design/nanites/pacifying
	name = "Усмирение"
	desc = "Наниты подавляют зону мозга, отвечающую за агрессию, препятствуя нанесению носителем прямого вреда другим."
	id = "pacifying_nanites"
	program_type = /datum/nanite_program/pacifying
	category = list("Suppression Nanites")

/datum/design/nanites/blinding
	name = "Слепота"
	desc = "Наниты подавляют зрительные нервы носителя, тем самым ослепляя его."
	id = "blinding_nanites"
	program_type = /datum/nanite_program/blinding
	category = list("Suppression Nanites")

/datum/design/nanites/mute
	name = "Немота"
	desc = "Наниты подавляют речевой центр носителя, тем самым делая его немым."
	id = "mute_nanites"
	program_type = /datum/nanite_program/mute
	category = list("Suppression Nanites")

/datum/design/nanites/voice
	name = "Черепной резонанс"
	desc = "Наниты синтезируют голос внутри головы носителя."
	id = "voice_nanites"
	program_type = /datum/nanite_program/comm/voice
	category = list("Suppression Nanites")

/datum/design/nanites/speech
	name = "Принудительная речь"
	desc = "Наниты заставляют носителя сказать предустановленную фразу при активации."
	id = "speech_nanites"
	program_type = /datum/nanite_program/comm/speech
	category = list("Suppression Nanites")

/datum/design/nanites/hallucination
	name = "Галлюцинации"
	desc = "Наниты вызывают у носителя галлюцинации при активации."
	id = "hallucination_nanites"
	program_type = /datum/nanite_program/comm/hallucination
	category = list("Suppression Nanites")

/datum/design/nanites/good_mood
	name = "Усилитель счастья"
	desc = "Наниты синтезируют серотонин в мозге носителя, создавая искусственное ощущение счастья."
	id = "good_mood_nanites"
	program_type = /datum/nanite_program/good_mood
	category = list("Suppression Nanites")

/datum/design/nanites/bad_mood
	name = "Подавитель счастья"
	desc = "Наниты подавляют синтез серотонина в мозге носителя, создавая искусственное ощущение депрессии."
	id = "bad_mood_nanites"
	program_type = /datum/nanite_program/bad_mood
	category = list("Suppression Nanites")

////////////////////SENSOR NANITES//////////////////////////////////////

/datum/design/nanites/sensor_health
	name = "Сенсор здоровья"
	desc = "Наниты отправляют сигнал, когда здоровье носителя выше или ниже установленного процента (носитель в критическом состоянии расценивается как 0%)."
	id = "sensor_health_nanites"
	program_type = /datum/nanite_program/sensor/health
	category = list("Sensor Nanites")

/datum/design/nanites/sensor_damage
	name = "Сенсор урона"
	desc = "Наниты отправляют сигнал, когда количество определенного типа уровна становится выше или ниже заданного значения."
	id = "sensor_damage_nanites"
	program_type = /datum/nanite_program/sensor/damage
	category = list("Sensor Nanites")

/datum/design/nanites/sensor_crit
	name = "Сенсор критического состояния"
	desc = "Наниты отправляют сигнал, когда здоровье носителя достигает критического состояния."
	id = "sensor_crit_nanites"
	program_type = /datum/nanite_program/sensor/crit
	category = list("Sensor Nanites")

/datum/design/nanites/sensor_death
	name = "Сенсор смерти"
	desc = "Наниты отправляют сигнал при смерти носителя."
	id = "sensor_death_nanites"
	program_type = /datum/nanite_program/sensor/death
	category = list("Sensor Nanites")

/datum/design/nanites/sensor_voice
	name = "Сенсор голоса"
	desc = "Отправляет сигнал, когда наниты слышат заданную фразу или слово."
	id = "sensor_voice_nanites"
	program_type = /datum/nanite_program/sensor/voice
	category = list("Sensor Nanites")

/datum/design/nanites/sensor_nanite_volume
	name = "Сенсор количества нанитов"
	desc = "Наниты отпраляют сигнал, когда их количество становится выше или ниже заданного процента, за 0% взят заданный порог безопасности."
	id = "sensor_nanite_volume"
	program_type = /datum/nanite_program/sensor/nanite_volume
	category = list("Sensor Nanites")

/datum/design/nanites/sensor_species
	name = "Сенсор вида"
	desc = "При активации, наниты сканируют носителя и отправляют сигнал, если вид носителя соответствует заданному в настройках."
	id = "sensor_species_nanites"
	program_type = /datum/nanite_program/sensor/species
	category = list("Sensor Nanites")

////////////////////NANITE PROTOCOLS//////////////////////////////////////
//Note about the category name: The UI cuts the last 8 characters from the category name to remove the " Nanites" in the other categories
//Because of this, Protocols was getting cut down to "P", so i had to add some padding
/datum/design/nanites/kickstart
	name = "Протокол репликации: Быстрый старт"
	desc = "Наниты сосредатачиваются на репликации, сильно повышая темп прироста на +3.5 единиц в первые две минуты после внедрения роя."
	id = "kickstart_nanites"
	program_type = /datum/nanite_program/protocol/kickstart
	category = list("Protocols_Nanites")

/datum/design/nanites/factory
	name = "Протокол репликации: Фабрика"
	desc = "Наниты создают матрицу фабрики репликации внутри носителя, медленно увеличивая скорость репликации. Фабрика выходит на максимальную мощность в +2 единиц через 16,4 минут. Фабрика распадается если протокол отключается, а так же может быть повреждена ЭМИ и ударами тока."
	id = "factory_nanites"
	program_type = /datum/nanite_program/protocol/factory
	category = list("Protocols_Nanites")

/datum/design/nanites/tinker
	name = "Tinker Protocol"
	desc = "Replication Protocol: the nanites learn to use metallic material in the host's bloodstream to speed up the replication process."
	id = "tinker_nanites"
	program_type = /datum/nanite_program/protocol/tinker
	category = list("Protocols_Nanites")

/datum/design/nanites/offline
	name = "Протокол репликации: Затмение"
	desc = "Пока носитель спит или находится без сознания, использует освободившиеся ресурсы мозга для ускорения репликации на +3 единицы."
	id = "offline_nanites"
	program_type = /datum/nanite_program/protocol/offline
	category = list("Protocols_Nanites")
