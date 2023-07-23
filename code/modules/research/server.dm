/obj/machinery/rnd/server
	name = "Сервер РнД"
	desc = "Компьютерная система, работающая на развитой нейронной сети, которая обрабатывает произвольную информацию для получения данных, пригодных для разработки новых технологий. С точки зрения компьютерного ботана, оно производит очки исследований."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "RD-server-on"
	var/datum/techweb/stored_research

/obj/machinery/rnd/server/Initialize()
	. = ..()
	if (circuit)
		return
	circuit = new /obj/item/circuitboard/machine/rdserver() // For servers on maps
	circuit.apply_default_parts(src)
	create_research_server()

/obj/machinery/rnd/server/on_construction()
	. = ..()
	create_research_server()

/obj/machinery/rnd/server/proc/create_research_server()
	var/obj/item/circuitboard/machine/rdserver/board = circuit
	name = "сервер РнД ([board.server_id])"
	SSresearch.servers |= src
	stored_research = new(board.server_id)

/obj/machinery/rnd/server/Destroy()
	SSresearch.servers -= src
	return ..()

/obj/machinery/rnd/server/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/multitool))
		var/obj/item/multitool/multi = O
		multi.buffer = src
		to_chat(user, "<span class='notice'>Записываю данные [src] в [O].</span>")
		return TRUE

	return ..()
