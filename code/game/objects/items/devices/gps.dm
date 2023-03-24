
/obj/item/gps
	name = "глобальная поисковая система"
	desc = "Помогает искать людям дорогу с 2016 года."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "gps-c"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	obj_flags = UNIQUE_RENAME
	var/gpstag

/obj/item/gps/Initialize()
	. = ..()
	AddComponent(/datum/component/gps/item, gpstag)

/obj/item/gps/science
	icon_state = "gps-s"
	gpstag = "НАУЧ0"

/obj/item/gps/engineering
	icon_state = "gps-e"
	gpstag = "ИНЖ0"

/obj/item/gps/mining
	icon_state = "gps-m"
	gpstag = "ШАХТ0"
	desc = "Глобальная поисковая система, полезная для спасения застрявших или раненых шахтеров, всегда держите одну при себе, пока копаете - это может просто спасти вашу жизнь."

/obj/item/gps/cyborg
	icon_state = "gps-b"
	gpstag = "БОРГ0"
	desc = "Глобальная поисковая система киборга-шахтёра. Используется в качестве маяка для восстановления поврежденных активов киборгов или инструмента совместной работы для команд шахтёров."

/obj/item/gps/cyborg/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CYBORG_ITEM_TRAIT)

/obj/item/gps/mining/internal
	icon_state = "gps-m"
	gpstag = "ШАХТА"
	desc = "A positioning system helpful for rescuing trapped or injured miners, keeping one on you at all times while mining might just save your life."

/obj/item/gps/visible_debug
	name = "visible GPS"
	gpstag = "ПЕДАЛЬ"
	desc = "Этот созданный администратором модуль GPS оставляет координаты видимыми на любой территории, которую он пересекает, для отладки. Особенно полезно для маркировки области вокруг краев перехода."
	var/list/turf/tagged

/obj/item/gps/visible_debug/Initialize()
	. = ..()
	tagged = list()
	START_PROCESSING(SSfastprocess, src)

/obj/item/gps/visible_debug/process()
	var/turf/T = get_turf(src)
	if(T)
		// I assume it's faster to color,tag and OR the turf in, rather
		// then checking if its there
		T.color = RANDOM_COLOUR
		T.maptext = "[T.x],[T.y],[T.virtual_z()]"
		tagged |= T

/obj/item/gps/visible_debug/proc/clear()
	while(tagged.len)
		var/turf/T = pop(tagged)
		T.color = initial(T.color)
		T.maptext = initial(T.maptext)

/obj/item/gps/visible_debug/Destroy()
	if(tagged)
		clear()
	tagged = null
	STOP_PROCESSING(SSfastprocess, src)
	. = ..()
