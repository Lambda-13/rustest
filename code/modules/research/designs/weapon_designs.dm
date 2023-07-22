/////////////////////////////////////////
/////////////////Weapons/////////////////
/////////////////////////////////////////

//	РЕВОЛЬВЕР
/datum/design/c38/sec
	id = "sec_38"
	category = list("Ammo")
	build_type = PROTOLATHE | MECHFAB
	construction_time = 20

/datum/design/c38_trac
	name = "Скорозарядник .38 калибра: Следящий"
	desc = "Предназначен для быстрой перезарядки старомодных револьверов. Содержит в себе следящий микроимплант. Сильно слабее стандартных пуль."
	id = "c38_trac"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 10000, /datum/material/silver = 5000, /datum/material/gold = 1000)
	build_path = /obj/item/ammo_box/c38/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/c38_hotshot
	name = "Скорозарядник .38 калибра: Зажигательный"
	desc = "Предназначен для быстрой перезарядки старомодных револьверов. При удачном попадании поджигает цель. Немного слабее стандартных пуль."
	id = "c38_hotshot"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 10000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/c38_iceblox
	name = "Скорозарядник .38 калибра: Замораживающий"
	desc = "Предназначен для быстрой перезарядки старомодных револьверов. При удачном попадании замораживает цель. Немного слабее стандартных пуль."
	id = "c38_iceblox"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 20
	materials = list(/datum/material/iron = 10000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/iceblox
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

//  РУЖЬЯ
/datum/design/rubbershot/sec
	name = "12 Калибр: Резиновая картечь"
	id = "sec_rshot"
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10

/datum/design/beanbag_slug/sec
	name = "12 Калибр: Резиновая пуля"
	id = "sec_beanbag_slug"
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10

/datum/design/shotgun_slug/sec
	id = "sec_slug"
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10

/datum/design/shotgun_dart/sec
	id = "sec_dart"
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10

/datum/design/incendiary_slug/sec
	id = "sec_Islug"
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS
	build_type = PROTOLATHE | MECHFAB
	construction_time = 10

//  Ударники
/datum/design/pin_testing
	name = "Боек для практики"
	desc = "Данный ударник позволяет протестировать оружие на тестовой площадке. В ином месте это не будет работать."
	id = "pin_testing"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_mindshield
	name = "Боек с щитом разума"
	desc = "Этот защитный ударник позволяет использовать оружие только тем, кто имплантировал себе «щит разума»."
	id = "pin_loyalty"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin
	name = "Standard Firing Pin"
	desc = "A simple, electronic firing pin which is required in most standardized modern weapons."
	id = "pin_standard"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/stunrevolver
	name = "Комплект деталей пушки тесла"
	desc = "Кейс, содержащий необходимые детали для создания пушки тесла вокруг энергетической аномалии. Применять с соблюдением техники безопасности."
	id = "stunrevolver"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 10000, /datum/material/silver = 10000)
	build_path = /obj/item/gun/energy/tesla_cannon
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE//this weapon is an active threat to the user, I think we can safely refile it under "experimental"

/datum/design/nuclear_gun
	name = "Комплект деталей энергетической винтовки"
	desc = "Кейс, содержащий необходимые детали винтовки для преобразования стандартной энергетической винтовки в продвиную энергетическую винтовку."
	id = "nuclear_gun"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/uranium = 3000, /datum/material/titanium = 1000)
	build_path = /obj/item/gun/energy/e_gun/nuclear
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/tele_shield
	name = "Телескопический щит"
	desc = "Продвинутая версия пластикового щита Антибунт. Может складываться для уменьшения размеров. Значительная защита от ближнего боя, а так же может блокировать часть выстрелов."
	id = "tele_shield"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 4000, /datum/material/silver = 300, /datum/material/titanium = 200)
	build_path = /obj/item/shield/riot/tele
	category = list("Weapons","Imported")

/datum/design/beamrifle
	name = "Комплект деталей винтовки ускорения частиц"
	desc = "Переворот в изготовлении оружия. В этом кейсе находится высокоэкспериментальная установка для винтовки ускорения частиц. Требуется энергетическая пушка, стабилизированная энергетическая аномалия и стабилизированная гравитационная аномалия."
	id = "beamrifle"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000, /datum/material/diamond = 5000, /datum/material/uranium = 8000, /datum/material/silver = 4500, /datum/material/gold = 5000)
	build_path = /obj/item/gun/energy/beam_rifle
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/decloner
	name = "Комплект деталей клеточного дестабилизатора"
	desc = "Комплект деталей для преобразования лазерной пушки в клеточный дестабилизатор."
	id = "decloner"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/gold = 5000,/datum/material/uranium = 10000)
	reagents_list = list(/datum/reagent/toxin/mutagen = 40)
	build_path = /obj/item/gun/energy/decloner
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/rapidsyringe
	name = "Многозарядный шприцемет"
	desc = "Модификация шприцевого пистолета с использованием вращающегося барабана, способного вместить до шести шприцов."
	id = "rapidsyringe"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 100
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path = /obj/item/gun/syringe/rapidsyringe
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL		//uwu

/datum/design/temp_gun
	name = "Комплект деталей температурной винтовки"
	desc = "Кейс, содержащий необходимые детали винтовки для преобразования стандартной энергетической винтовки в температурный винтовку. Незаменим при противодействии быстро двигающимся противникам и существам чувствительным к перепадам температур."
	id = "temp_gun"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 500, /datum/material/silver = 3000)
	build_path = /obj/item/gun/energy/temperature
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/flora_gun
	name = "Цветочный луч"
	desc = "Инструмент, который выпускает контролируемое излучение, которое вызывает мутацию в растительных клетках."
	id = "flora_gun"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 500, /datum/material/uranium = 2000)
	build_path = /obj/item/gun/energy/floragun
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/large_grenade
	name = "Большая химическая граната"
	desc = "Большой каркас химической гранаты. В отличие от обычных каркасов, этот имеет больший радиус взрыва и поддерживает блюспейс или различные экзотичные носители. При детонации нагревает состав на 25°K."
	id = "large_Grenade"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/pyro_grenade
	name = "Пиро граната"
	desc = "Экспериментальный каркас химической гранаты. После активации резко нагревает реагенты внутри себя."
	id = "pyro_Grenade"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/plasma = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/cryo_grenade
	name = "Крио граната"
	desc = "Экспериментальный каркас химической гранаты. После активации резко охлаждает реагенты внутри себя."
	id = "cryo_Grenade"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/adv_grenade
	name = "Инжекторная граната"
	desc = "Экспериментальный каркас химической гранаты. Может использоваться больше одного раза. При помощи мультитула можно настроить количество выбрасываемого вещества."
	id = "adv_Grenade"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/xray
	name = "Комплект деталей рентгеновской лазерной винтовки"
	desc = "Кейс с необходимыми деталями для преобразования лазерной винтовки в рентгеновскую лазерную винтовку. ВНИМАНИЕ! РАДИОАКТИВНО! Избегать близкого контакта кейса с паховой областью во время работы!"
	id = "xray_laser"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/gold = 5000, /datum/material/uranium = 4000, /datum/material/iron = 5000, /datum/material/titanium = 2000, /datum/material/bluespace = 2000)
	build_path = /obj/item/gun/energy/xray
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ioncarbine
	name = "Комплект деталей ионного карабина"
	desc = "Лучшее средство для борьбы с техникой противника."
	id = "ioncarbine"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/silver = 6000, /datum/material/iron = 8000, /datum/material/uranium = 2000)
	build_path = /obj/item/gun/energy/ionrifle/carbine
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/wormhole_projector
	name = "Портальная пушка"
	desc = "Проектор, который излучает квантовые блюспейс порталы. Требуется ядро блюспейс аномалии для функционирования."
	id = "wormholeprojector"
	materials = list(/datum/material/silver = 2000, /datum/material/iron = 5000, /datum/material/diamond = 2000, /datum/material/bluespace = 3000, /datum/material/uranium = 1000)
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	build_path = /obj/item/gun/energy/wormhole_projector
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

//WT550 Mags

/datum/design/mag_oldsmg
	name = "WT-550 Auto Gun Magazine (4.6x30mm)"
	desc = "A 20 round magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/wt550m9
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mag_oldsmg/ap_mag
	name = "WT-550 Auto Gun Armour Piercing Magazine (4.6x30mm AP)"
	desc = "A 20 round armour piercing magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg_ap"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 600)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtap
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mag_oldsmg/ic_mag
	name = "WT-550 Auto Gun Incendiary Magazine (4.6x30mm IC)"
	desc = "A 20 round armour piercing magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg_ic"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 600, /datum/material/glass = 1000)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtic
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//WS edit - free lethals

/datum/design/commanderammo
	name = "Commander magazine (9mm)"
	desc = "A single stack M1911 reproduction magazine, modified to chamber 9mm and fit into Commander sidearms."
	id = "commanderammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/magazine/co9mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/stechkinammo
	name = "Stechkin magazine (10mm)"
	desc = "A single stack Stechkin magazine, designed to chamber 10mm and fit into the Syndicate's Stechkin sidearms."
	id = "stechkinammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/magazine/m10mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m1911ammo
	name = "M1911 magazine (.45)"
	desc = "A single stack M1911 magazine, faithfully designed to chamber .45 and fit into the popular M1911 sidearms."
	id = "m1911ammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/magazine/m45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/m9cammo
	name = "M9C magazine (5.56mm HITP caseless)"
	desc = "A double stack M9C magazine, designed to chamber 5.56mm HITP caseless and fit into SolGov's M9C sidearms."
	id = "m9cammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 18000)
	build_path = /obj/item/ammo_box/magazine/pistol556mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//Shiptest edit - standard ammunition

/datum/design/buckshot_shell
	name = "Buckshot Shell"
	id = "buckshot_shell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/shotgun/buckshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c9mm
	name = "Ammo Box (9mm)"
	id = "c9mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c9mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c10mm
	name = "Ammo Box (10mm)"
	id = "c10mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c10mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45
	name = "Ammo Box (.45)"
	id = "c45"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c556mmHITP
	name = "Ammo Box (5.56mm HITP caseless)"
	id = "c556mmHITP"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c556mmHITP
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

// WS edit - not so free rubbershot

/datum/design/rubbershot9mm
	name = "Rubbershot 9mm ammo box"
	desc = "A box full of less-than-lethal 9mm ammunition."
	id = "rubbershot9mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c9mm/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/rubbershot10mm
	name = "Rubbershot 10mm ammo box"
	desc = "A box full of less-than-lethal 10mm ammunition."
	id = "rubbershot10mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c10mm/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/rubbershot45
	name = "Rubbershot .45 ammo box"
	desc = "A box full of less-than-lethal .45 ammunition."
	id = "rubbershot45"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/c45/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/rubbershot556mmHITP
	name = "Rubbershot 5.56mm HITP caseless ammo box"
	desc = "A box full of less-than-lethal 5.56mm HITP ammunition."
	id = "rubbershot556mmHITP"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 18000)
	build_path = /obj/item/ammo_box/c556mmHITP/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ap9mm
	name = "AP 9mm ammo box"
	desc = "A box full of armor piercing 9mm ammunition."
	id = "ap9mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/uranium = 1000)
	build_path = /obj/item/ammo_box/c9mm/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ap10mm
	name = "AP 10mm ammo box"
	desc = "A box full of armor piercing 10mm ammunition."
	id = "ap10mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/uranium = 1000)
	build_path = /obj/item/ammo_box/c10mm/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ap45
	name = "AP .45 ammo box"
	desc = "A box full of armor piercing .45 ammunition."
	id = "ap45"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/uranium = 1000)
	build_path = /obj/item/ammo_box/c45/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/ap556mmHITP
	name = "AP 5.56mm HITP caseless ammo box"
	desc = "A box full of armor piercing 5.56mm HITP caseless ammunition."
	id = "ap556mmHITP"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 18000, /datum/material/uranium = 1000)
	build_path = /obj/item/ammo_box/c556mmHITP/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/hp9mm
	name = "HP 9mm ammo box"
	desc = "A box full of hollow point 9mm ammunition."
	id = "hp9mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/c9mm/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/hp10mm
	name = "HP 10mm ammo box"
	desc = "A box full of hollow point 10mm ammunition."
	id = "hp10mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/c10mm/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/hp45
	name = "HP .45 ammo box"
	desc = "A box full of hollow point .45 ammunition."
	id = "hp45"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/c45/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/hp556mmHITP
	name = "HP 5.56mm HITP caseless ammo box"
	desc = "A box full of hollow point 5.56mm HITP caseless ammunition."
	id = "hp556mmHITP"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 18000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/c556mmHITP/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/inc9mm
	name = "Incendiary 9mm ammo box"
	desc = "A box full of incendiary 9mm ammunition."
	id = "inc9mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c9mm/fire
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/inc10mm
	name = "Incendiary 10mm ammo box"
	desc = "A box full of incendiary 10mm ammunition."
	id = "inc10mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c10mm/fire
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/inc45
	name = "Incendiary .45 ammo box"
	desc = "A box full of incendiary .45 ammunition."
	id = "inc45"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c45/fire
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/rubbershot
	name = "Rubber Shot"
	id = "rubber_shot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/shotgun/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/shotgun_slug
	name = "Shotgun Slug"
	id = "shotgun_slug"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/shotgun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/shotgun_dart
	name = "Shotgun Dart"
	id = "shotgun_dart"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/shotgun/dart
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/incendiary_slug
	name = "Incendiary Slug"
	id = "incendiary_slug"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/shotgun/incendiary
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/ammo_casing/shotgun/stunslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/techshell
	name = "Unloaded Technological Shotshell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshotshell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 200)
	build_path = /obj/item/ammo_casing/shotgun/techshell
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/suppressor
	name = "Глушитель"
	desc = "Маленький глушитель для большого шпионажа."
	id = "suppressor"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/gravitygun
	name = "Гравитационная пушка"
	desc = "Экспериментальное многорежимное устройство, которое запускает заряд энергии нулевой точки, вызывая локальные искажения в гравитации. Требуется ядро гравитационной аномалии для функционирования."
	id = "gravitygun"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/silver = 8000, /datum/material/uranium = 8000, /datum/material/glass = 12000, /datum/material/iron = 12000, /datum/material/diamond = 3000, /datum/material/bluespace = 3000)
	build_path = /obj/item/gun/energy/gravity_gun
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/largecrossbow
	name = "Комплект деталей энергетического арбалета"
	desc = "Нелегальный набор для модификации оружия. Позволяет модифицировать стандартный протокинетический ускоритель для создания подобия энергетического арбалета. Почти как настоящий!"
	id = "largecrossbow"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1500, /datum/material/uranium = 1500, /datum/material/silver = 1500)
	build_path = /obj/item/gun/energy/kinetic_accelerator/crossbow/large
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cleric_mace
	name = "Cleric Mace"
	desc = "A mace fit for a cleric. Useful for bypassing plate armor, but too bulky for much else."
	id = "cleric_mace"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 12000)
	build_path = /obj/item/melee/cleric_mace
	category = list("Imported")

/datum/design/stun_boomerang
	name = "ОЗТек Бумеранг"
	desc = "Устройство, изобретенное в 2486 году для великой войны в Космическом Эму конфедерацией Австраликуса, эти высокотехнологичные бумеранги также отлично работают на потрясающих членов экипажа. Просто будьте осторожны, чтобы поймать его, когда брошено!"
	id = "stun_boomerang"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 30
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 4000, /datum/material/silver = 10000, /datum/material/gold = 2000)
	build_path = /obj/item/melee/baton/boomerang
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/gun_cell
	name = "Weapon Power Cell"
	desc = "A power cell for weapons holds 10 MJ of energy."
	id = "gun_cell"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 70)
	construction_time=100
	build_path = /obj/item/stock_parts/cell/gun/empty
	category = list("Misc","Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SECURITY

/datum/design/gun_cell_upgraded
	name = "Upgraded Weapon Power Cell"
	desc = "A upgraded power cell for weapons holds 20 MJ of energy."
	id = "gun_cell_upgraded"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/gold = 150, /datum/material/silver = 150, /datum/material/glass = 80)
	construction_time=100
	build_path = /obj/item/stock_parts/cell/gun/upgraded/empty
	category = list("Misc","Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SECURITY

/datum/design/gun_cell_large
	name = "Large Weapon Power Cell"
	desc = "A huge weapon power cell, holding 50 MJ of energy."
	id = "gun_cell_large"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/gold = 200, /datum/material/glass = 400, /datum/material/diamond = 160, /datum/material/titanium = 300, /datum/material/bluespace = 100)
	construction_time=100
	build_path = /obj/item/stock_parts/cell/gun/large/empty
	category = list("Misc","Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SECURITY

/datum/design/colt_1911_magazine
	name = "Colt 1911 Magazine"
	id = "ammo_1911"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/m45
	category = list("Imported")

/datum/design/c38_hunting
	name = "Ammo Box (.38 hunting)"
	id = "c38_hunting"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c38_box/hunting
	category = list("Imported")

/datum/design/n762
	name = "Ammo Holder (7.62x38mmR)"
	id = "n762"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/n762
	category = list("Imported")

/datum/design/disposable_gun
	name = "Disposable Gun"
	id = "disposable"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 4000)
	build_path = /obj/item/gun/ballistic/automatic/pistol/disposable
	category = list("Imported")

/datum/design/pizza_disposable_gun
	name = "Pizza Disposable Gun"
	id = "disposable_pizza"
	build_type = AUTOLATHE
	materials = list(/datum/material/pizza = 4000)
	build_path = /obj/item/gun/ballistic/automatic/pistol/disposable/pizza
	category = list("Imported")

//SRM Ballistics
/datum/design/doublebarrel
	name = "Double Barrel Shotgun"
	desc = "A shotgun of the double barreled variety."
	id = "doublebarrel"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 1000, /datum/material/silver = 4000)
	build_path = /obj/item/gun/ballistic/shotgun/doublebarrel
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/m1911
	name = "M1911 Pistol"
	desc = "A classic pistol."
	id = "m1911"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 8000, /datum/material/silver = 3000, /datum/material/titanium = 2000)
	build_path = /obj/item/gun/ballistic/automatic/pistol/m1911/no_mag
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/derringer
	name = ".38 Derringer"
	desc = "An easily concealable gun that uses .38 rounds."
	id = "derringer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 8500, /datum/material/glass = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/gun/ballistic/derringer
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/winchestermk2
	name = "Winchester Mk2 Rifle"
	desc = "A newer model of Winchester Rifle, sturdy and lever action."
	id = "winchmk2"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 3000, /datum/material/silver = 4000, /datum/material/gold = 500)
	build_path = /obj/item/gun/ballistic/shotgun/winchester
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/srmrevolver
	name = "SRM Standard Issue .357 Revolver"
	desc = "A trusty revolver common amongst hunters and Montagnes."
	id = "srmrevolver"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 9000, /datum/material/glass = 1000, /datum/material/silver = 1000, /datum/material/uranium = 1000)
	build_path = /obj/item/gun/ballistic/revolver/srm
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/pepperbox
	name = "Pepperbox Handgun"
	desc = "A very old and outdated type of gun."
	id = "pepperbox"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 7000, /datum/material/glass = 1000)
	build_path = /obj/item/gun/ballistic/revolver/pepperbox
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/nagantrevolver
	name = "Nagant Revolver"
	desc = "An old model of revolver. Uses 7.62."
	id = "nagantrevolver"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 90000, /datum/material/glass = 1500, /datum/material/silver = 1500)
	build_path = /obj/item/gun/ballistic/revolver/nagant
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/stripper762
	name = "7.62x54mm Stripperclip"
	desc = "A stripperclip of 7.62x54mm."
	id = "stripper762"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000)
	build_path = /obj/item/ammo_box/a762
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/speedload357
	name = ".357 revolver speedloader"
	desc = "A speedloader of .357 ammo for use in revolvers."
	id = "speedload357"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000)
	build_path = /obj/item/ammo_box/a357
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/nagantrifle
	name = "Nagant Rifle"
	desc = "An old model of rifle. Uses 7.62."
	id = "nagantrifle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 85000, /datum/material/glass = 1500, /datum/material/silver = 1500)
	build_path = /obj/item/gun/ballistic/rifle/boltaction
	category = list("Weapons","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/speedload12gauge
	name = "Ускоритель заряжания для дробовиков"
	desc = "Ускоритель заряжания дробовиков под 12 патрон"
	id = "speedload_12_gauge"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/ammo_box/magazine/shotgun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/shotgunbox
	name = "Коробка c пулевыми для дробовика"
	desc = "Коробка с патронами 12 калибра(пулевой)"
	id = "slug_box"
	build_path = /obj/item/ammo_box/shotgunbox
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 80000)
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/shotgunbox/buckshot
	name = "Коробка c картечью для дробовика"
	desc = "Коробка с патронами 12 калибра(картечь)"
	id = "buckshot_box"
	build_path = /obj/item/ammo_box/shotgunbox/buckshot

/datum/design/shotgunbox/beanbag
	name = "Коробка с резиновыми пулями для дробовика"
	desc = "Коробка с патронами 12 калибра(резиновый пулевой)"
	materials = list(/datum/material/iron = 40000)
	id = "beanbag_box"
	build_path = /obj/item/ammo_box/shotgunbox/beanbag

/datum/design/shotgunbox/rubber
	name = "Коробка c резиновой картечью для дробовика"
	desc = "Коробка с патронами 12 калибра(резиновая картечь)"
	id = "rubber_box"
	build_path = /obj/item/ammo_box/shotgunbox/rubber

/datum/design/shotgunbox/incendiary
	name = "Коробка c зажигательными"
	desc = "Коробка с патронами 12 калибра(зажигательный)"
	id = "incendiary_box"
	build_path = /obj/item/ammo_box/shotgunbox/incendiary
