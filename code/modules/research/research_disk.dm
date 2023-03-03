
/obj/item/disk/tech_disk
	name = "технологический диск"
	desc = "Диск для переноса технологических веток с одного сервера на другой. Вставляется в консоль РнД."
	random_color = FALSE
	color = "#973328"
	custom_materials = list(/datum/material/iron=300, /datum/material/glass=100)
	var/datum/techweb/stored_research

/obj/item/disk/tech_disk/Initialize()
	. = ..()
	pixel_x = base_pixel_x + rand(-5, 5)
	pixel_y = base_pixel_y + rand(-5, 5)
	stored_research = new /datum/techweb

/obj/item/disk/tech_disk/debug
	name = "технологический диск - всё"
	desc = "Многие ветки в одном диске - что может пойти не так."
	illustration = "nt_n"
	custom_materials = null

/obj/item/disk/tech_disk/debug/Initialize()
	. = ..()
	stored_research = new /datum/techweb/admin

/obj/item/disk/tech_disk/major
	name = "технологический диск - реформированный"
	desc = "Диск с новыми ветками получеными из Б.Е.П.И.С. Загружается в РнД консоль."
	color = "#FFBAFF"
	illustration = "bepis"
	custom_materials = list(/datum/material/iron=300, /datum/material/glass=100)

/obj/item/disk/tech_disk/major/Initialize()
	. = ..()
	stored_research = new /datum/techweb/bepis

/obj/item/research_notes
	name = "научные записи"
	desc = "Изучения учёных. Вставляется в РнД консоль для преоброзования в очки изучений."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "paper"
	item_state = "paper"
	w_class = WEIGHT_CLASS_SMALL
	///research points it holds
	var/value = 69
	///origin of the research
	var/origin_type = "debug"
	///if it ws merged with different origins to apply a bonus
	var/mixed = FALSE

/obj/item/research_notes/Initialize(mapload, _value, _origin_type)
	. = ..()
	if(_value)
		value = _value
	if(_origin_type)
		origin_type = _origin_type
	change_vol()

/obj/item/research_notes/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Тут [value] очков изучений.</span>"

/// proc that changes name and icon depending on value
/obj/item/research_notes/proc/change_vol()
	if(value >= 10000)
		name = "революционные изучения в области [origin_type]"
		icon_state = "docs_verified"
		return
	else if(value >= 2500)
		name = "записи и заметки в области [origin_type]"
		icon_state = "paper_words"
		return
	else if(value >= 100)
		name = "заметки в области [origin_type]"
		icon_state = "paperslip_words"
		return
	else
		name = "обрывки записей в области [origin_type]"
		icon_state = "scrap"
		return

///proc when you slap research notes into another one, it applies a bonus if they are of different origin (only applied once)
/obj/item/research_notes/proc/merge(obj/item/research_notes/new_paper)
	var/bonus = min(value , new_paper.value)
	value = value + new_paper.value
	if(origin_type != new_paper.origin_type && !mixed)
		value += bonus * 0.3
		origin_type = "[origin_type] и [new_paper.origin_type]"
		mixed = TRUE
	change_vol()
	qdel(new_paper)

/obj/item/research_notes/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/research_notes))
		var/obj/item/research_notes/R = I
		merge(R)
		return TRUE

//research notes for ruins
/obj/item/research_notes/loot
	origin_type = "физика экзотических частиц"

/obj/item/research_notes/loot/tiny
	value = 1000

/obj/item/research_notes/loot/small
	value = 4000

/obj/item/research_notes/loot/medium
	value = 8000

/obj/item/research_notes/loot/big
	value = 15000

/obj/item/research_notes/loot/genius
	value = 30000

/datum/export/research_notes
	unit_name = "research note"
	cost = 0.25
	export_types = /obj/item/research_notes

/datum/export/research_notes/get_amount(obj/O)
	var/obj/item/research_notes/value = O
	return value.value
