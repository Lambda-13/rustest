/obj/item/assembly/control
	name = "контроллер бронеставней"
	desc = "Небольшое электронное устройство, способное дистанционно управлять бронированными ставнями."
	icon_state = "control"
	attachable = TRUE
	var/id = null
	var/can_change_id = 0
	var/cooldown = FALSE //Door cooldowns
	var/sync_doors = TRUE

/obj/item/assembly/control/examine(mob/user)
	. = ..()
	if(id)
		. += "<hr><span class='notice'>ID контроллера '[id]'.</span>"

/obj/item/assembly/control/multitool_act(mob/living/user)
	var/change_id = input("Установите ID [src]. Это должно быть число от 1 до 100.", "ID", id) as num|null
	if(change_id)
		id = clamp(round(change_id, 1), 1, 100)
		to_chat(user, "<span class='notice'>Новый ID теперь [id].</span>")

/obj/item/assembly/control/activate()
	var/openclose
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if(M.id == src.id)
			if(openclose == null || !sync_doors)
				openclose = M.density
			INVOKE_ASYNC(M, openclose ? /obj/machinery/door/poddoor.proc/open : /obj/machinery/door/poddoor.proc/close)
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 10)

/obj/item/assembly/control/airlock
	name = "контроллер шлюза"
	desc = "Небольшое электронное устройство, способное дистанционно управлять воздушным шлюзом."
	id = "badmin" // Set it to null for MEGAFUN.
	var/specialfunctions = OPEN
	/*
	Bitflag, 	1= open (OPEN)
				2= idscan (IDSCAN)
				4= bolts (BOLTS)
				8= shock (SHOCK)
				16= door safties (SAFE)
	*/

/obj/item/assembly/control/airlock/activate()
	if(cooldown)
		return
	cooldown = TRUE
	var/doors_need_closing = FALSE
	var/list/obj/machinery/door/airlock/open_or_close = list()
	for(var/obj/machinery/door/airlock/D in GLOB.airlocks)
		if(D.id_tag == src.id)
			if(specialfunctions & OPEN)
				open_or_close += D
				if(!D.density)
					doors_need_closing = TRUE
			if(specialfunctions & IDSCAN)
				D.aiDisabledIdScanner = !D.aiDisabledIdScanner
			if(specialfunctions & BOLTS)
				if(!D.wires.is_cut(WIRE_BOLTS) && D.hasPower())
					D.locked = !D.locked
					D.update_icon()
			if(specialfunctions & SHOCK)
				if(D.secondsElectrified)
					D.set_electrified(MACHINE_ELECTRIFIED_PERMANENT, usr)
				else
					D.set_electrified(MACHINE_NOT_ELECTRIFIED, usr)
			if(specialfunctions & SAFE)
				D.safe = !D.safe

	for(var/D in open_or_close)
		INVOKE_ASYNC(D, doors_need_closing ? /obj/machinery/door/airlock.proc/close : /obj/machinery/door/airlock.proc/open)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 10)


/obj/item/assembly/control/massdriver
	name = "контроллер массового привода"
	desc = "Небольшое электронное устройство, способное управлять массовым приводом."

/obj/item/assembly/control/massdriver/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if (M.id == src.id)
			INVOKE_ASYNC(M, /obj/machinery/door/poddoor.proc/open)

	sleep(10)

	for(var/obj/machinery/mass_driver/M in GLOB.machines)
		if(M.id == src.id)
			M.drive()

	sleep(60)

	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if (M.id == src.id)
			INVOKE_ASYNC(M, /obj/machinery/door/poddoor.proc/close)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 10)


/obj/item/assembly/control/igniter
	name = "контроллер зажигания"
	desc = "Пульт дистанционного управления для воспламенителя."

/obj/item/assembly/control/igniter/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/sparker/M in GLOB.machines)
		if (M.id == src.id)
			INVOKE_ASYNC(M, /obj/machinery/sparker.proc/ignite)

	for(var/obj/machinery/igniter/M in GLOB.machines)
		if(M.id == src.id)
			M.use_power(50)
			M.on = !M.on
			M.icon_state = "igniter[M.on]"

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 30)

/obj/item/assembly/control/flasher
	name = "контролер флэшера"
	desc = "Контролер дистанционного управления для активации настенного флэшера."

/obj/item/assembly/control/flasher/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/flasher/M in GLOB.machines)
		if(M.id == src.id)
			INVOKE_ASYNC(M, /obj/machinery/flasher.proc/flash)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 50)


/obj/item/assembly/control/crematorium
	name = "контролер крематория"
	desc = "Активирует крематорий."

/obj/item/assembly/control/crematorium/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for (var/obj/structure/bodycontainer/crematorium/C in GLOB.crematoriums)
		if (C.id == id)
			C.cremate(usr)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 50)

//how long it spends on each floor when moving somewhere, so it'd take 4 seconds to reach you if it had to travel up 2 floors
#define FLOOR_TRAVEL_TIME 2 SECONDS
/obj/item/assembly/control/elevator
	name = "контролер лифта"
	desc = "Небольшое устройство, используемое для вызова лифтов на текущий этаж."

/obj/item/assembly/control/elevator/activate()
	if(cooldown)
		return
	cooldown = TRUE
	var/obj/structure/industrial_lift/lift
	for(var/l in GLOB.lifts)
		var/obj/structure/industrial_lift/possible_lift = l
		if(possible_lift.id != id || possible_lift.z == z || possible_lift.controls_locked)
			continue
		lift = possible_lift
		break
	if(!lift)
		addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 2 SECONDS)
		return
	lift.visible_message("<span class='notice'>[src] звенит и жужжит, блокируя управление.</span")
	lift.lift_master_datum.set_controls(LOCKED)
	var/difference = abs(z - lift.z)
	var/direction = lift.z > z ? UP : DOWN
	var/travel_duration = FLOOR_TRAVEL_TIME * difference //100 / 2 floors up = 50 seconds on every floor, will always reach destination in the same time
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), travel_duration)
	for(var/i in 1 to difference)
		sleep(FLOOR_TRAVEL_TIME)//hey this should be alright... right?
		if(QDELETED(lift) || QDELETED(src))//elevator control or button gone = don't go up anymore
			return
		lift.lift_master_datum.MoveLift(direction, null)
	lift.visible_message("<span class='notice'>[src] щёлкает и готов к ручному управлению снова.</span")
	lift.lift_master_datum.set_controls(UNLOCKED)

#undef FLOOR_TRAVEL_TIME

/obj/item/assembly/control/shieldwallgen
	name = "контроллер голополя"
	desc = "Небольшое устройство, используемое для дистанционного управления генераторами голополя."

/obj/item/assembly/control/shieldwallgen/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/power/shieldwallgen/machine in GLOB.machines)
		if(machine.id == src.id)
			INVOKE_ASYNC(machine, /obj/machinery/power/shieldwallgen.proc/toggle)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 20)
