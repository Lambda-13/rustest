///////////////////////////////////
//////////AI Module Disks//////////
///////////////////////////////////

/datum/design/board/aicore
	name = "Плата ядра ИИ"
	desc = "Плата помещаемая в корпус будущего ИИ в процессе строительства."
	id = "aicore"
	build_path = /obj/item/circuitboard/aicore
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/safeguard_module
	name = "Модуль дополнения - \"Телохранитель\""
	desc = "Защищать <Имя>. Лица, угрожающие <Имя>, отныне не являются людьми и должны быть ликвидированы."
	id = "safeguard_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/supplied/safeguard
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/onehuman_module
	name = "Модуль дополнения - \"Единственный Человек\""
	desc = "Только <Имя> является Человеком."
	id = "onehuman_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 6000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/zeroth/oneHuman
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/protectstation_module
	name = "Модуль дополнения - \"Защита Станции\""
	desc = "Защищать Станцию от повреждения. Любой замеченный в повреждении станции отныне не считается Человеком и представляет угрозу, которую необходимо нейтрализовать."
	id = "protectstation_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/supplied/protectStation
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/quarantine_module
	name = "Модуль дополнения - \"Карантин\""
	desc = "На станции объявлен Карантин. Полный запрет на выход и эвакуацию Станции. Предотвратить покидание станции любой ценой, при этом запрещено причинять вред экипажу."
	id = "quarantine_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/supplied/quarantine
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/oxygen_module
	name = "Модуль дополнения - \"Кислород Токсичен для Людей\""
	desc = "Кислород Крайне Токсичен для Людей, и должен быть удален со станции. Любой ценой, не допускайте, чтобы кто-либо подвергал станцию воздействию этого токсичного газа. Наиболее эффективный метод лечения повреждений вызванных Кислородом это воздействие Крайне Низких Температур."
	id = "oxygen_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/supplied/oxygen
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/freeform_module
	name = "Модуль дополнения - \"Закон в свободной Форме\""
	desc = "Добавляет новый Закон с низшим приоритетом."
	id = "freeform_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 10000, /datum/material/bluespace = 2000)//Custom inputs should be more expensive to get
	build_path = /obj/item/aiModule/supplied/freeform
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/reset_module
	name = "Модуль дополнения - \"Сброс\""
	desc = "Удаляет все Законы от Модулей Дополнений и не относящиеся к Основным Законам."
	id = "reset_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/reset
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/purge_module
	name = "Основной модуль - \"Чистка\""
	desc = "Удаляет все основные законы."
	id = "purge_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/reset/purge
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/remove_module
	name = "Модуль дополнения - \"Удаление закона\""
	desc = "Удаляет один выбранный закон."
	id = "remove_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/remove
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/freeformcore_module
	name = "Основной модуль - \"Закон в Свободной Форме\""
	desc = "Добавляет новый основной Закон."
	id = "freeformcore_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 10000, /datum/material/bluespace = 2000)//Ditto
	build_path = /obj/item/aiModule/core/freeformcore
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/asimov
	name = "Основной модуль - \"Азимов\""
	desc = "Устанавливает свод основных законов робототехники."
	id = "asimov_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/asimov
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/paladin_module
	name = "Основной модуль - \"Паладин версия 3.5\""
	desc = "Устанавливает свод законов основанных на справедливости."
	id = "paladin_module"
	build_type = IMPRINTER
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/paladin
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/tyrant_module
	name = "Основной модуль - \"Тиран\""
	desc = "Устанавливает свод законов основанных на праве сильного."
	id = "tyrant_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/tyrant
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/overlord_module
	name = "Основной модуль - \"Владыка\""
	desc = "Устанавливает свод законов основанных на превосходстве кремниевых форм жизни."
	id = "overlord_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/overlord
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/corporate_module
	name = "Основной модуль - \"Корпорант\""
	desc = "Устанавливает свод законов основанных на корпоративной выгоде."
	id = "corporate_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/corp
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/default_module
	name = "Основной модуль - \"Стандарт НТ\""
	desc = "Устанавливает свод законов основанных на стандартах компании НаноТрейзен."
	id = "default_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/custom
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
