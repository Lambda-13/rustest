/datum/wires/subverter
	holder_type = /obj/machinery/subverter
	proper_name = "ниспровергатель"

/datum/wires/subverter/New(atom/holder)
	wires = list(
		WIRE_HACK, WIRE_DISABLE,
		WIRE_SHOCK, WIRE_ZAP
	)
	add_duds(6)
	..()

/datum/wires/subverter/interactable(mob/user)
	var/obj/machinery/subverter/subv = holder
	if(subv.panel_open)
		return TRUE

/datum/wires/subverter/get_status()
	var/obj/machinery/subverter/subv = holder
	var/list/status = list()
	status += "Красный индикатор [subv.disabled ? "горит" : "не горит"]."
	status += "Синий индикатор [subv.hacked ? "горит" : "не горит"]."
	status += "Зелёный индикатор [!COOLDOWN_FINISHED(subv, subverter_cooldown) ? "мигает" : "не горит"]."
	return status

/datum/wires/subverter/on_pulse(wire)
	var/obj/machinery/subverter/subv = holder
	switch(wire)
		if(WIRE_HACK)
			if (!subv.hacked)
				subv.adjust_hacked(TRUE)
				addtimer(CALLBACK(subv, /obj/machinery/subverter.proc/reset, wire), 5)
		if(WIRE_SHOCK)
			subv.shocked = !subv.shocked
			addtimer(CALLBACK(subv, /obj/machinery/subverter.proc/reset, wire), 60)
		if(WIRE_DISABLE)
			subv.disabled = !subv.disabled
			addtimer(CALLBACK(subv, /obj/machinery/subverter.proc/reset, wire), 60)

/datum/wires/subverter/on_cut(wire, mend)
	var/obj/machinery/subverter/subv = holder
	switch(wire)
		if(WIRE_HACK)
			subv.shocked = !mend
		if(WIRE_DISABLE)
			subv.disabled = !mend
		if(WIRE_ZAP)
			subv.shock(usr, 50)
