/datum/supply_pack/tools
	group = "Предметы"
	crate_type = /obj/structure/closet/crate/engineering

/*
		Vehicles
*/

/datum/supply_pack/tools/all_terrain_vehicle
	name = "Вездеход"
	desc = "Поставляется с вездеходом и ключом для путешествий по планете со стилем."
	cost = COST_MIN * 2000
	contains = list(/obj/vehicle/ridden/atv,
					/obj/item/key)
	crate_name = "ящик с вездеходом"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/tools/ripley
	name = "Рипли МК-1"
	desc = "Сдаваемый всеми каргониями по окончании срока эксплуатации данный мех обретает вторую жизнь при продаже. Поставляется с дрелью."
	cost = COST_MIN * 3000
	contains = list(/obj/mecha/working/ripley/cargo,
					/obj/item/mecha_parts/mecha_equipment/drill)
	crate_name= "ящик с мехом"
	crate_type = /obj/structure/closet/crate/large

/*
		Actual tools
*/

/datum/supply_pack/tools/toolbox
	name = "Ящики для инструментов"
	desc = "Когда много рук но мало инструментов. Поставляется с одним ящиком для электриков и одним ящиком для механиков. И ещё со сварочным шлемом."
	contains = list(/obj/item/storage/toolbox/electrical,
					/obj/item/storage/toolbox/mechanical,
					/obj/item/clothing/head/welding)
	cost = COST_MIN * 500
	crate_name = "ящик с ящиками"

/datum/supply_pack/tools/engigear
	name = "Снаряжение инженера"
	desc = "Три пояса для инструментов, двое мезонных очков - что ещё надо для инженера."
	cost = COST_MIN * 750
	contains = list(/obj/item/storage/belt/utility,
					/obj/item/storage/belt/utility,
					/obj/item/storage/belt/utility,
					/obj/item/clothing/glasses/meson/engine,
					/obj/item/clothing/glasses/meson/engine)
	crate_name = "engineering gear crate"

/datum/supply_pack/tools/rped
	name = "РПИД"
	desc = "Надоело менять детали разбирая машинерию? У вас рак жопы? Вы пидорас? Тогда всего за 750 кредитов вы можете приобрести устроиство для установки деталей без разбора машинерии! Детали не входят в комплект."
	cost = COST_MIN * 750
	contains = list(/obj/item/storage/part_replacer)
	crate_name = "ящик с РПИД"

/datum/supply_pack/tools/mining
	name = "Набор шахтёра"
	desc = "Две кирки, два мешка для руды, два сканера пород. Дворфы оценят."
	cost = COST_MIN * 1000
	contains = list(
		/obj/item/pickaxe,
		/obj/item/pickaxe/mini,
		/obj/item/storage/bag/ore,
		/obj/item/storage/bag/ore,
		/obj/item/mining_scanner,
		/obj/item/mining_scanner
	)
	crate_name = "ящик со снаряжением шахтёров"

/datum/supply_pack/tools/metalfoam
	name = "Коробка с металпеной"
	desc = "Нужно срочно заделать дыры или построить быструю стену - это для вас. Внутри коробка с 7 металпенными гранатами."
	cost = COST_MIN * 1000
	contains = list(/obj/item/storage/box/metalfoam)
	crate_name = "metal foam grenade crate"

/datum/supply_pack/tools/insulated_gloves
	name = "Изоляционные перчатки"
	desc = "Для тех кто устал от постоянного удара током при работе с машинерией под напряжением. Внутри пара перчаток."
	cost = COST_MIN * 750
	contains = list(/obj/item/clothing/gloves/color/yellow)
	crate_name = "ящик с перчатками"

/datum/supply_pack/tools/jetpack
	name = "Джетпак"
	desc = "Джетпак наполненый СО2 для полётов по космосу."
	cost = COST_MIN * 2000
	contains = list(/obj/item/tank/jetpack/carbondioxide)
	crate_name = "ящик с джетпаком"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/tools/transfer_valves
	name = "Набор учёного-подрывника"
	desc = "Хотите сделать бомбу? Тогда это для вас. Внутри два клапана для смешивания газов (transfer valve)."
	cost = COST_MED * 6000
	contains = list(/obj/item/transfer_valve,
					/obj/item/transfer_valve)
	crate_name = "ящик с клапанами"
	crate_type = /obj/structure/closet/crate/secure/science

/*
		Liquid tanks
*/

/datum/supply_pack/tools/fueltank
	name = "Бак с топливом"
	desc = "Внутри бак с топливом."
	cost = COST_MIN * 800
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	crate_name = "ящик с топливным баком"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/tools/watertank
	name = "Бак с водой."
	desc = "Внутри бак с водой."
	cost = COST_MIN * 600
	contains = list(/obj/structure/reagent_dispensers/watertank)
	crate_name = "ящик с водным баком"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/tools/hightank
	name = "Бак с ёмкостным баком воды"
	desc = "Для тех кому обычного бака воды недостаточно."
	cost = COST_MIN * 1200
	contains = list(/obj/structure/reagent_dispensers/watertank/high)
	crate_name = "ящик с ёмкостным водным баком"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/tools/foamtank
	name = "Бак с пожаротушащей пеной"
	desc = "Бак с пеной которая отлично подходит тушить пожары в двигателе с суперматерией."
	cost = COST_MIN * 1500
	contains = list(/obj/structure/reagent_dispensers/foamtank)
	crate_name = "ящик с пожаротушащей пеной"
	crate_type = /obj/structure/closet/crate/large
