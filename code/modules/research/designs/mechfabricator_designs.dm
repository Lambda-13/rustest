//Cyborg
/datum/design/borg
	build_type = MECHFAB
	category = list("Cyborg")
	research_icon = 'icons/mob/augmentation/augments.dmi'

/datum/design/borg/suit
	name = "Эндоскелет киборга"
	desc = "Сложный металлический каркас со стандартными гнездами для конечностей и креплениями синтетических псевдо-мышц."
	id = "borg_suit"
	research_icon_state = "robo_suit"
	build_path = /obj/item/robot_suit
	materials = list(/datum/material/iron=15000)
	construction_time = 500

/datum/design/borg/chest
	name = "Туловище киборга"
	desc = "Тяжело укрепленный корпус, содержащий логические платы киборга, с отверстием под стандартную ячейку питания."
	id = "borg_chest"
	research_icon_state = "borg_chest"
	build_path = /obj/item/bodypart/chest/robot
	materials = list(/datum/material/iron=40000)
	construction_time = 350

/datum/design/borg/head
	name = "Голова киборга"
	desc = "Стандартная укрепленная черепная коробка, с подключаемой к позвоночнику нейронным сокетом и сенсорными стыковочными узлами."
	id = "borg_head"
	research_icon_state = "borg_head"
	build_path = /obj/item/bodypart/head/robot
	materials = list(/datum/material/iron=5000)
	construction_time = 350

/datum/design/borg/l_arm
	name = "Левая рука киборга"
	desc = "Скелетная конечность, обернутая в псевдомышцы с низкопроводимостью."
	id = "borg_l_arm"
	research_icon_state = "borg_l_arm"
	build_path = /obj/item/bodypart/l_arm/robot
	materials = list(/datum/material/iron=10000)
	construction_time = 200

/datum/design/borg/r_arm
	name = "Правая рука киборга"
	desc = "Скелетная конечность, обернутая в псевдомышцы с низкопроводимостью."
	id = "borg_r_arm"
	research_icon_state = "borg_r_arm"
	build_path = /obj/item/bodypart/r_arm/robot
	materials = list(/datum/material/iron=10000)
	construction_time = 200

/datum/design/borg/l_leg
	name = "Левая нога киборга"
	desc = "Скелетная конечность, обернутая в псевдомышцы с низкопроводимостью."
	id = "borg_l_leg"
	research_icon_state = "borg_l_leg"
	build_path = /obj/item/bodypart/leg/left/robot
	materials = list(/datum/material/iron=10000)
	construction_time = 200

/datum/design/borg/r_leg
	name = "Правая нога киборга"
	desc = "Скелетная конечность, обернутая в псевдомышцы с низкопроводимостью."
	id = "borg_r_leg"
	research_icon_state = "borg_r_leg"
	build_path = /obj/item/bodypart/leg/right/robot
	materials = list(/datum/material/iron=10000)


//Prosthetics
/datum/design/prosthetic
	research_icon = 'icons/mob/augmentation/augments.dmi'
	build_type = PROTOLATHE | MECHFAB
	construction_time = 5 SECONDS
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
	materials = list(/datum/material/iron=3000)
	category = list("Misc", "Medical Designs")

/datum/design/prosthetic/l_arm
	name = "Surplus Prosthetic Left Arm"
	id = "prosthetic_l_arm"
	research_icon_state = "borg_l_arm"
	build_path = /obj/item/bodypart/l_arm/robot/surplus

/datum/design/prosthetic/r_arm
	name = "Surplus Prosthetic Right Arm"
	id = "prosthetic_r_arm"
	research_icon_state = "borg_r_arm"
	build_path = /obj/item/bodypart/r_arm/robot/surplus

/datum/design/prosthetic/l_leg
	name = "Surplus Prosthetic Left Leg"
	id = "prosthetic_l_leg"
	research_icon_state = "borg_l_leg"
	build_path = /obj/item/bodypart/leg/left/robot/surplus

/datum/design/prosthetic/r_leg
	name = "Surplus Prosthetic Right Leg"
	id = "prosthetic_r_leg"
	research_icon_state = "borg_r_leg"
	build_path = /obj/item/bodypart/leg/right/robot/surplus

// Kepori
/datum/design/prosthetic/l_arm/kepori
	name = "Surplus Prosthetic Kepori Left Arm"
	id = "kprosthetic_l_arm"
	build_path = /obj/item/bodypart/l_arm/robot/surplus/kepori

/datum/design/prosthetic/r_arm/kepori
	name = "Surplus Prosthetic Kepori Right Arm"
	id = "kprosthetic_r_arm"
	build_path = /obj/item/bodypart/r_arm/robot/surplus/kepori

/datum/design/prosthetic/l_leg/kepori
	name = "Surplus Prosthetic Kepori Left Leg"
	id = "kprosthetic_l_leg"
	build_path = /obj/item/bodypart/leg/left/robot/surplus/kepori

/datum/design/prosthetic/r_leg/kepori
	name = "Surplus Prosthetic Kepori Right Leg"
	id = "kprosthetic_r_leg"
	build_path = /obj/item/bodypart/leg/right/robot/surplus/kepori

// Vox
/datum/design/prosthetic/l_arm/vox
	name = "Surplus Prosthetic Vox Left Arm"
	id = "vprosthetic_l_arm"
	build_path = /obj/item/bodypart/l_arm/robot/surplus/vox

/datum/design/prosthetic/r_arm/vox
	name = "Surplus Prosthetic Vox Right Arm"
	id = "vprosthetic_r_arm"
	build_path = /obj/item/bodypart/r_arm/robot/surplus/vox

/datum/design/prosthetic/l_leg/vox
	name = "Surplus Prosthetic Vox Left Leg"
	id = "vprosthetic_l_leg"
	build_path = /obj/item/bodypart/leg/left/robot/surplus/vox

/datum/design/prosthetic/r_leg/vox
	name = "Surplus Prosthetic Vox Right Leg"
	id = "vprosthetic_r_leg"
	build_path = /obj/item/bodypart/leg/right/robot/surplus/vox

/datum/design/prosthetic_l_arm/lizard
	name = "Surplus Prosthetic Lizard Left Arm"
	id = "lprosthetic_l_arm"
	build_path = /obj/item/bodypart/l_arm/robot/surplus/lizard

/datum/design/prosthetic_r_arm/lizard
	name = "Surplus Prosthetic Lizard Right Arm"
	id = "lprosthetic_r_arm"
	build_path = /obj/item/bodypart/r_arm/robot/surplus/lizard

/datum/design/prosthetic_l_leg/lizard
	name = "Surplus Prosthetic Lizard Left Leg"
	id = "lprosthetic_l_leg"
	build_path = /obj/item/bodypart/leg/left/robot/surplus/lizard

/datum/design/prosthetic_r_leg/lizard
	name = "Surplus Prosthetic Lizard Right Leg"
	id = "lprosthetic_r_leg"
	build_path = /obj/item/bodypart/leg/right/robot/surplus/lizard

//Ripley
/datum/design/ripley_chassis
	name = "Каркас экзокостюма (АПЛУ \"Рипли\")"
	id = "ripley_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/ripley
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("Ripley")

//firefighter subtype
/datum/design/firefighter_chassis
	name = "Exosuit Chassis (APLU \"Firefighter\")"
	id = "firefighter_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/firefighter
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("Firefighter")

/datum/design/ripley_torso
	name = "Торс экзокостюма (АПЛУ \"Рипли\")"
	desc = "Центральная часть АПЛУ Рипли. Содержит блок питания, процессорное ядро и системы жизнеобеспечения."
	id = "ripley_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_torso
	materials = list(/datum/material/iron=20000,/datum/material/glass = 7500)
	construction_time = 200
	category = list("Ripley","Firefighter")

/datum/design/ripley_left_arm
	name = "Левая рука экзокостюма (АПЛУ \"Рипли\")"
	id = "ripley_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_left_arm
	materials = list(/datum/material/iron=15000)
	construction_time = 150
	category = list("Ripley","Firefighter")

/datum/design/ripley_right_arm
	name = "Правая рука экзокостюма (АПЛУ \"Рипли\")"
	id = "ripley_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_right_arm
	materials = list(/datum/material/iron=15000)
	construction_time = 150
	category = list("Ripley","Firefighter")

/datum/design/ripley_left_leg
	name = "Левая нога экзокостюма (АПЛУ \"Рипли\")"
	id = "ripley_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_left_leg
	materials = list(/datum/material/iron=15000)
	construction_time = 150
	category = list("Ripley","Firefighter")

/datum/design/ripley_right_leg
	name = "Правая нога экзокостюма (АПЛУ \"Рипли\")"
	id = "ripley_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_right_leg
	materials = list(/datum/material/iron=15000)
	construction_time = 150
	category = list("Ripley","Firefighter")

//Odysseus
/datum/design/odysseus_chassis
	name = "Каркас экзокостюма (\"Одиссей\")"
	id = "odysseus_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/odysseus
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("Odysseus")

/datum/design/odysseus_torso
	name = "Торс экзокостюма (\"Одиссей\")"
	id = "odysseus_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_torso
	materials = list(/datum/material/iron=12000)
	construction_time = 180
	category = list("Odysseus")

/datum/design/odysseus_head
	name = "Голова экзокостюма (\"Одиссей\")"
	id = "odysseus_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_head
	materials = list(/datum/material/iron=6000,/datum/material/glass = 10000)
	construction_time = 100
	category = list("Odysseus")

/datum/design/odysseus_left_arm
	name = "Левая рука экзокостюма (\"Одиссей\")"
	id = "odysseus_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_left_arm
	materials = list(/datum/material/iron=6000)
	construction_time = 120
	category = list("Odysseus")

/datum/design/odysseus_right_arm
	name = "Правая рука экзокостюма (\"Одиссей\")"
	id = "odysseus_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_right_arm
	materials = list(/datum/material/iron=6000)
	construction_time = 120
	category = list("Odysseus")

/datum/design/odysseus_left_leg
	name = "Левая нога экзокостюма (\"Одиссей\")"
	id = "odysseus_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_left_leg
	materials = list(/datum/material/iron=7000)
	construction_time = 130
	category = list("Odysseus")

/datum/design/odysseus_right_leg
	name = "Правая нога экзокостюма (\"Одиссей\")"
	id = "odysseus_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_right_leg
	materials = list(/datum/material/iron=7000)
	construction_time = 130
	category = list("Odysseus")

//Gygax
/datum/design/gygax_chassis
	name = "Каркас экзокостюма (\"Гигакс\")"
	id = "gygax_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/gygax
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("Gygax")

/datum/design/gygax_torso
	name = "Торс экзокостюма (\"Гигакс\")"
	id = "gygax_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_torso
	materials = list(/datum/material/iron=20000,/datum/material/glass = 10000,/datum/material/gold=2000, /datum/material/silver=2000)
	construction_time = 300
	category = list("Gygax")

/datum/design/gygax_head
	name = "Голова экзокостюма (\"Гигакс\")"
	id = "gygax_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_head
	materials = list(/datum/material/iron=10000,/datum/material/glass = 5000, /datum/material/gold=2000, /datum/material/silver=2000)
	construction_time = 200
	category = list("Gygax")

/datum/design/gygax_left_arm
	name = "Левая рука экзокостюма (\"Гигакс\")"
	id = "gygax_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_left_arm
	materials = list(/datum/material/iron=15000, /datum/material/gold=1000, /datum/material/silver=1000)
	construction_time = 200
	category = list("Gygax")

/datum/design/gygax_right_arm
	name = "Правая рука экзокостюма (\"Гигакс\")"
	id = "gygax_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_right_arm
	materials = list(/datum/material/iron=15000, /datum/material/gold=1000, /datum/material/silver=1000)
	construction_time = 200
	category = list("Gygax")

/datum/design/gygax_left_leg
	name = "Левая нога экзокостюма (\"Гигакс\")"
	id = "gygax_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_left_leg
	materials = list(/datum/material/iron=15000, /datum/material/gold=2000, /datum/material/silver=2000)
	construction_time = 200
	category = list("Gygax")

/datum/design/gygax_right_leg
	name = "Правая нога экзокостюма (\"Гигакс\")"
	id = "gygax_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_right_leg
	materials = list(/datum/material/iron=15000, /datum/material/gold=2000, /datum/material/silver=2000)
	construction_time = 200
	category = list("Gygax")

/datum/design/gygax_armor
	name = "Броня экзокостюма (\"Гигакс\")"
	id = "gygax_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_armor
	materials = list(/datum/material/iron=15000,/datum/material/gold=10000, /datum/material/silver=10000, /datum/material/titanium=10000)
	construction_time = 600
	category = list("Gygax")

//Durand
/datum/design/durand_chassis
	name = "Каркас экзокостюма (\"Дюранд\")"
	id = "durand_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/durand
	materials = list(/datum/material/iron=25000)
	construction_time = 100
	category = list("Durand")

/datum/design/durand_torso
	name = "Торс экзокостюма (\"Дюранд\")"
	id = "durand_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_torso
	materials = list(/datum/material/iron=25000, /datum/material/glass = 10000,/datum/material/silver=10000)
	construction_time = 300
	category = list("Durand")

/datum/design/durand_head
	name = "Голова экзокостюма (\"Дюранд\")"
	id = "durand_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_head
	materials = list(/datum/material/iron=10000,/datum/material/glass = 15000,/datum/material/silver=2000)
	construction_time = 200
	category = list("Durand")

/datum/design/durand_left_arm
	name = "Левая рука экзокостюма (\"Дюранд\")"
	id = "durand_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_left_arm
	materials = list(/datum/material/iron=10000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Durand")

/datum/design/durand_right_arm
	name = "Правая рука экзокостюма (\"Дюранд\")"
	id = "durand_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_right_arm
	materials = list(/datum/material/iron=10000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Durand")

/datum/design/durand_left_leg
	name = "Левая нога экзокостюма (\"Дюранд\")"
	id = "durand_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_left_leg
	materials = list(/datum/material/iron=15000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Durand")

/datum/design/durand_right_leg
	name = "Правая нога экзокостюма (\"Дюранд\")"
	id = "durand_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_right_leg
	materials = list(/datum/material/iron=15000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Durand")

/datum/design/durand_armor
	name = "Броня экзокостюма (\"Дюранд\")"
	id = "durand_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_armor
	materials = list(/datum/material/iron=30000,/datum/material/uranium=25000,/datum/material/titanium=20000)
	construction_time = 600
	category = list("Durand")

//H.O.N.K
/datum/design/honk_chassis
	name = "Каркас экзокостюма (\"Х.О.Н.К\")"
	id = "honk_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/honker
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("H.O.N.K")

/datum/design/honk_torso
	name = "Торс экзокостюма (\"Х.О.Н.К\")"
	id = "honk_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_torso
	materials = list(/datum/material/iron=20000,/datum/material/glass = 10000,/datum/material/bananium=10000)
	construction_time = 300
	category = list("H.O.N.K")

/datum/design/honk_head
	name = "Голова экзокостюма (\"Х.О.Н.К\")"
	id = "honk_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_head
	materials = list(/datum/material/iron=10000,/datum/material/glass = 5000,/datum/material/bananium=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_left_arm
	name = "Левая рука экзокостюма (\"Х.О.Н.К\")"
	id = "honk_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_left_arm
	materials = list(/datum/material/iron=15000,/datum/material/bananium=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_right_arm
	name = "Правая рука экзокостюма (\"Х.О.Н.К\")"
	id = "honk_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_right_arm
	materials = list(/datum/material/iron=15000,/datum/material/bananium=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_left_leg
	name = "Левая нога экзокостюма (\"Х.О.Н.К\")"
	id = "honk_left_leg"
	build_type = MECHFAB
	build_path =/obj/item/mecha_parts/part/honker_left_leg
	materials = list(/datum/material/iron=20000,/datum/material/bananium=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_right_leg
	name = "Правая нога экзокостюма (\"Х.О.Н.К\")"
	id = "honk_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_right_leg
	materials = list(/datum/material/iron=20000,/datum/material/bananium=5000)
	construction_time = 200
	category = list("H.O.N.K")


//Phazon
/datum/design/phazon_chassis
	name = "Каркас экзокостюма (\"Фазон\")"
	id = "phazon_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/phazon
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("Phazon")

/datum/design/phazon_torso
	name = "Торс экзокостюма (\"Фазон\")"
	id = "phazon_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_torso
	materials = list(/datum/material/iron=35000,/datum/material/glass = 10000,/datum/material/plasma=20000)
	construction_time = 300
	category = list("Phazon")

/datum/design/phazon_head
	name = "Голова экзокостюма (\"Фазон\")"
	id = "phazon_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_head
	materials = list(/datum/material/iron=15000,/datum/material/glass = 5000,/datum/material/plasma=10000)
	construction_time = 200
	category = list("Phazon")

/datum/design/phazon_left_arm
	name = "Левая рука экзокостюма (\"Фазон\")"
	id = "phazon_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_left_arm
	materials = list(/datum/material/iron=20000,/datum/material/plasma=10000)
	construction_time = 200
	category = list("Phazon")

/datum/design/phazon_right_arm
	name = "Правая рука экзокостюма (\"Фазон\")"
	id = "phazon_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_right_arm
	materials = list(/datum/material/iron=20000,/datum/material/plasma=10000)
	construction_time = 200
	category = list("Phazon")

/datum/design/phazon_left_leg
	name = "Левая нога экзокостюма (\"Фазон\")"
	id = "phazon_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_left_leg
	materials = list(/datum/material/iron=20000,/datum/material/plasma=10000)
	construction_time = 200
	category = list("Phazon")

/datum/design/phazon_right_leg
	name = "Правая нога экзокостюма (\"Фазон\")"
	id = "phazon_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_right_leg
	materials = list(/datum/material/iron=20000,/datum/material/plasma=10000)
	construction_time = 200
	category = list("Phazon")

/datum/design/phazon_armor
	name = "Броня экзокостюма (\"Фазон\")"
	id = "phazon_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_armor
	materials = list(/datum/material/iron=25000,/datum/material/plasma=20000,/datum/material/titanium=20000)
	construction_time = 300
	category = list("Phazon")

//Exosuit Equipment
/datum/design/cmm_ripley_upgrade
	name = "Ripley MK-I to MK-IV conversion kit"
	id = "cmm_ripley_upgrade"
	build_type = AUTOLATHE
	build_path = /obj/item/mecha_parts/mecha_equipment/conversion_kit/ripley/cmm
	materials = list(/datum/material/iron=10000,/datum/material/plasma=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/cmm_durand_upgrade
	name = "Durand to Paladin conversion kit"
	id = "cmm_durand_upgrade"
	build_type = AUTOLATHE
	build_path = /obj/item/mecha_parts/mecha_equipment/conversion_kit/paladin
	materials = list(/datum/material/iron=10000,/datum/material/plasma=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/ripleyupgrade
	name = "Комплект модернизации Рипли МК-2"
	desc = "Комплект модернизации корпуса АПЛУ \"Рипли\" МК-1 в МК-2, предоставляет полную защиту от окружающей среды, в том числе космического вакуума, ценой замедления ходовой части. Модернизация не подлежит деконструкции."
	id = "ripleyupgrade"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/conversion_kit/ripley
	materials = list(/datum/material/iron=10000,/datum/material/plasma=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_hydraulic_clamp
	name = "Exosuit Engineering Equipment (Hydraulic Clamp)"
	id = "mech_hydraulic_clamp"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/hydraulic_clamp
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_drill
	name = "Бур экзокостюма"
	desc = "Оборудование для инженерных и боевых экзокостюмов. Для бурения породы и прочего."
	id = "mech_drill"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/drill
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_mining_scanner
	name = "Рудный сканер для экзокостюма"
	desc = "Оборудование для рабочих экзокостюмов. Он автоматически проверит окружающую породу на наличие полезных ископаемых."
	id = "mech_mscanner"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/mining_scanner
	materials = list(/datum/material/iron=5000,/datum/material/glass = 2500)
	construction_time = 50
	category = list("Exosuit Equipment")

/datum/design/mech_extinguisher
	name = "Огнетушитель экзокостюма"
	desc = "Оборудование для инженерных экзокостюмов. Быстродействующий огнетушитель большой мощности."
	id = "mech_extinguisher"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/extinguisher
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")

//WS Edit Begin - Smartwire Revert - Donut TG Marge this
/datum/design/mech_cable_layer
	name = "Exosuit Engineering Equipment (Cable Layer)"
	id = "mech_cable_layer"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/cable_layer
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Exosuit Equipment")
//WS Edit End - Smartwire Revert - Donut TG Marge this

/datum/design/mech_generator
	name = "Плазменный реактор экзокостюма"
	desc = "Модуль экзокостюма, который вырабатывает энергию, используя твердую плазму в качестве топлива. Загрязняет окружающую среду."
	id = "mech_generator"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/generator
	materials = list(/datum/material/iron=10000,/datum/material/glass = 1000,/datum/material/silver=2000,/datum/material/plasma=5000)
	construction_time = 100
	category = list("Exosuit Equipment")

/datum/design/mech_mousetrap_mortar
	name = "Мышеловкометатель"
	desc = "Оборудование для клоунских экзокостюмов. Запускает заряженные мышеловки."
	id = "mech_mousetrap_mortar"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/mousetrap_mortar
	materials = list(/datum/material/iron=20000,/datum/material/bananium=5000)
	construction_time = 300
	category = list("Exosuit Equipment")

/datum/design/mech_banana_mortar
	name = "Бананомет"
	desc = "Оборудование для клоунских экзокостюмов. Запускает банановую кожуру."
	id = "mech_banana_mortar"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/banana_mortar
	materials = list(/datum/material/iron=20000,/datum/material/bananium=5000)
	construction_time = 300
	category = list("Exosuit Equipment")

/datum/design/mech_honker
	name = "ХоНкЕР БлАсТ 5000"
	desc = "Оборудование для клоунских экзокостюмов. Распространяет веселье и радость среди всех окружающих. Хонк!"
	id = "mech_honker"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/honker
	materials = list(/datum/material/iron=20000,/datum/material/bananium=10000)
	construction_time = 500
	category = list("Exosuit Equipment")

/datum/design/mech_punching_glove
	name = "Оинго-Боинго-Лице-Ломатель"
	desc = "Оборудование для клоунских экзокостюмов. Доставляет удовольствие прямо вам в лицо!"
	id = "mech_punching_face"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/punching_glove
	materials = list(/datum/material/iron=20000,/datum/material/bananium=7500)
	construction_time = 400
	category = list("Exosuit Equipment")

/////////////////////////////////////////
//////////////Borg Upgrades//////////////
/////////////////////////////////////////

/datum/design/borg_upgrade_rename
	name = "Модуль смены имени"
	desc = "Используется для смены позывного у киборга."
	id = "borg_upgrade_rename"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/rename
	materials = list(/datum/material/iron = 5000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_restart
	name = "Модуль аварийной перезагрузки"
	desc = "Используется для форсированной перезагрузки киборга после критических повреждений и запуска операционной системы."
	id = "borg_upgrade_restart"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/restart
	materials = list(/datum/material/iron = 20000 , /datum/material/glass = 5000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_thrusters
	name = "Ионные двигатели"
	desc = "Модернизация которая позволяет перемещатся в безгравитационном пространстве при помощи миниатюрных двигателей. Потребляет энергию при использовании."
	id = "borg_upgrade_thrusters"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/thrusters
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 6000, /datum/material/plasma = 5000, /datum/material/uranium = 6000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_disablercooler
	name = "Радиатор Усмирителя"
	desc = "Устанавливает дополнительные системы охлаждения, тем самым повышая скорострельность."
	id = "borg_upgrade_disablercooler"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/disablercooler
	materials = list(/datum/material/iron = 20000 , /datum/material/glass = 6000, /datum/material/gold = 2000, /datum/material/diamond = 2000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_diamonddrill
	name = "Алмазный бур"
	desc = "Заменяет стандартный бур на его продвинутый аналог."
	id = "borg_upgrade_diamonddrill"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/ddrill
	materials = list(/datum/material/iron=10000, /datum/material/glass = 6000, /datum/material/diamond = 2000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_holding
	name = "Безразмерная сумка для руды"
	desc = "Снимает ограничение емкости для Рудной Сумки."
	id = "borg_upgrade_holding"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/soh
	materials = list(/datum/material/iron = 10000, /datum/material/gold = 2000, /datum/material/uranium = 1000)
	construction_time = 40
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_lavaproof
	name = "Лава-стойкие траки"
	desc = "Дает возможность перемещаться по лаве."
	id = "borg_upgrade_lavaproof"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/lavaproof
	materials = list(/datum/material/iron = 10000, /datum/material/plasma = 4000, /datum/material/titanium = 5000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_syndicate_module
	name = "Модуль нелегальной модернизации"
	desc = "Разблокирует Киборгу нелегальные модернизации, это действие не меняет его Законы, но может нарушить работу других устройств (не обязательно)."
	id = "borg_syndicate_module"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/syndicate
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/diamond = 10000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_transform_clown
	name = "Модуль специализации (Клоун)"
	desc = "Модуль специа@#$# HOONK!"
	id = "borg_transform_clown"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/clown
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/bananium = 1000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_selfrepair
	name = "Модуль саморемонта"
	desc = "Позволяет медленно восстанавливать текущую прочность за счет энергии."
	id = "borg_upgrade_selfrepair"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/selfrepair
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_expandedsynthesiser
	name = "Расширенный медицинский гипоспрей"
	desc = "Значительно увеличивает диапазон синтезируемых Медицинский Киборгаментов."
	id = "borg_upgrade_expandedsynthesiser"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/hypospray/expanded
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/plasma = 8000, /datum/material/uranium = 8000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_piercinghypospray
	name = "Пробивающий гипоспрей"
	desc = "Позволяет колоть химикаты из Гипоспрея сквозь РИГи или другие прочные материалы. Так же поддерживает другие модели киборгов."
	id = "borg_upgrade_piercinghypospray"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/piercing_hypospray
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/titanium = 5000, /datum/material/diamond = 3000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_defibrillator
	name = "Дефибриллятор"
	desc = "Позволяет реанимировать людей."
	id = "borg_upgrade_defibrillator"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/defib
	materials = list(/datum/material/iron = 8000, /datum/material/glass = 5000, /datum/material/silver = 4000, /datum/material/gold = 3000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_surgicalprocessor
	name = "Хирургический процессор"
	desc = "После синхронизации с Операционный Компьютером позволяет проводить все операции которые были загружены в него"
	id = "borg_upgrade_surgicalprocessor"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/processor
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 4000, /datum/material/silver = 4000)
	construction_time = 40
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_trashofholding
	name = "Безразмерный мешок для мусора"
	desc = "Снимает ограничение емкости для Мусорного Мешка."
	id = "borg_upgrade_trashofholding"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/tboh
	materials = list(/datum/material/gold = 2000, /datum/material/uranium = 1000)
	construction_time = 40
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_advancedmop
	name = "Экспериментальная швабра"
	desc = "Заменяет швабру на продвинутую, при активации та начинает со временем собирать влагу из воздуха."
	id = "borg_upgrade_advancedmop"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/amop
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 2000)
	construction_time = 40
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_expand
	name = "Модуль расширения"
	desc = "Визуально увеличивает Киборга."
	id = "borg_upgrade_expand"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/expand
	materials = list(/datum/material/iron = 200000, /datum/material/titanium = 5000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/boris_ai_controller
	name = "Модуль Б.О.Р.И.С."
	desc = "Подключает модуль удаленного управления для ИИ. Занимает слот Позитронного Мозга и MMI. Киборг становится оболочкой ИИ с открытым каналом связи."
	id = "borg_ai_control"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/ai
	materials = list(/datum/material/iron = 1200, /datum/material/glass = 1500, /datum/material/gold = 200)
	construction_time = 50
	category = list("Misc")

/datum/design/borg_upgrade_rped
	name = "Кибернетический РПЕД"
	desc = "позволяет переносить 50 электронных компонентов, а так же устанавливать их в каркас Машины или Консоли."
	id = "borg_upgrade_rped"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/rped
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_circuit_app
	name = "Манипулятор плат"
	desc = "Позволяет переносить 1 плату, а так же устанавливать ее в каркас Машины или Консоли."
	id = "borg_upgrade_circuitapp"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/circuit_app
	materials = list(/datum/material/iron = 2000, /datum/material/titanium = 500)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_beaker_app
	name = "Дополнительный манипулятор хим посуды"
	desc = "Если одного недостаточно."
	id = "borg_upgrade_beakerapp"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/beaker_app
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 2250) //Need glass for the new beaker too
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_pinpointer
	name = "Монитор жизненных показателей экипажа"
	desc = "Позволяет наблюдать данные с датчиков жизнеобеспечения аналогично Консоли наблюдения за Экипажем, а так же добавляет трекер для поиска Экипажа."
	id = "borg_upgrade_pinpointer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/pinpointer
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

//Misc
/datum/design/mecha_tracking
	name = "Сигнальный маяк экзокостюма"
	desc = "Устройство, используемое для передачи данных о состоянии экзокостюма и удаленного отключения."
	id = "mecha_tracking"
	build_type = MECHFAB
	build_path =/obj/item/mecha_parts/mecha_tracking
	materials = list(/datum/material/iron=500)
	construction_time = 50
	category = list("Misc")

/datum/design/mecha_tracking_ai_control
	name = "Маяк удаленного доступа экзокостюма для ИИ"
	desc = "Устройство, используемое для передачи данных экзокостюма. Позволяет ИИ взять экзокостюм под прямой контроль."
	id = "mecha_tracking_ai_control"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_tracking/ai_control
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/silver = 200)
	construction_time = 50
	category = list("Misc")

/datum/design/synthetic_flash
	name = "Вспышка"
	desc = "Мощное и универсальное устройство со вспышкой, предназначенное для различных применений - от дезориентации злоумышленников до использования их в качестве сенсорных рецепторов при производстве роботов."
	id = "sflash"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 750, /datum/material/glass = 750)
	construction_time = 100
	build_path = /obj/item/assembly/flash/handheld
	category = list("Misc")

// IPC Replacement Parts

/datum/design/robotic_liver
	name = "Substance Processor"
	id = "robotic_liver"
	build_type = MECHFAB
	build_path = /obj/item/organ/liver/cybernetic/upgraded/ipc
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	construction_time = 100
	category = list("IPC Components","Imported")

/datum/design/robotic_eyes
	name = "Basic Robotic Eyes"
	id = "robotic_eyes"
	build_type = MECHFAB
	build_path = /obj/item/organ/eyes/robotic
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 2000)
	construction_time = 100
	category = list("IPC Components","Imported")

/datum/design/robotic_tongue
	name = "Robotic Voicebox"
	id = "robotic_tongue"
	build_type = MECHFAB
	build_path = /obj/item/organ/tongue/robot
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	construction_time = 100
	category = list("IPC Components","Imported")

/datum/design/robotic_heart
	name = "Coolant Pump"
	id = "robotic_heart"
	build_type = MECHFAB
	build_path = /obj/item/organ/heart/cybernetic/ipc
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 2000, /datum/material/silver = 500)
	construction_time = 100
	category = list("IPC Components")

/datum/design/robotic_stomach
	name = "Micro-cell"
	id = "robotic_stomach"
	build_type = MECHFAB
	build_path = /obj/item/organ/stomach/cell
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 2000, /datum/material/plasma = 200)
	construction_time = 100
	category = list("IPC Components","Imported")

/datum/design/robotic_ears
	name = "Auditory Sensors"
	id = "robotic_ears"
	build_type = MECHFAB
	build_path = /obj/item/organ/ears/robot
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	construction_time = 100
	category = list("IPC Components","Imported")

/datum/design/power_cord
	name = "Recharging Electronics"
	id = "power_cord"
	build_type = MECHFAB
	build_path = /obj/item/organ/cyberimp/arm/power_cord
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	construction_time = 100
	category = list("IPC Components","Imported")

/datum/design/maint_drone
	name = "Maintenance Drone"
	desc = "\"Repairs the ship without bothering you!\" is what the marketing says."
	id = "maint_drone"
	build_type = MECHFAB | AUTOLATHE
	materials = list(/datum/material/iron = 800, /datum/material/glass = 350)
	construction_time = 150
	build_path = /obj/effect/mob_spawn/drone
	category = list("initial", "Misc")
