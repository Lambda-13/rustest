///Storage - Adds a storage component to the suit.
/obj/item/mod/module/storage
	name = "модуль хранилища"
	desc = "Модуль состоит из серии интегрированных отсеков и специализированных карманов по бокам костюма, для хранения ваших вещей."
	icon_state = "storage"
	complexity = 3
	incompatible_modules = list(/obj/item/mod/module/storage, /obj/item/mod/module/plate_compression)
	/// Max weight class of items in the storage.
	//var/max_w_class = WEIGHT_CLASS_NORMAL
	/// Max combined weight of all items in the storage.
	//var/max_combined_w_class = 15
	/// Max amount of items in the storage.
	//var/max_items = 7

/obj/item/mod/module/storage/Initialize()
	. = ..()
	PopulateContents()

/*obj/item/mod/module/storage/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = max_combined_w_class
	STR.max_w_class = max_w_class
	STR.max_items = max_items
	STR.allow_big_nesting = TRUE
	STR.locked = TRUE*/

/obj/item/mod/module/storage/on_install()
	var/datum/component/storage/modstorage = GetComponent(/datum/component/storage)
	//mod._AddComponent(/datum/component/storage)
	modstorage.max_combined_w_class = max_combined_w_class
	modstorage.max_w_class = max_w_class
	modstorage.max_items = max_items
	modstorage.locked = FALSE
	modstorage.change_master(mod)
	RegisterSignal(mod.chestplate, COMSIG_ITEM_PRE_UNEQUIP, PROC_REF(on_chestplate_unequip))

/obj/item/mod/module/storage/on_uninstall(deleting = FALSE)
	//var/datum/component/storage/modstorage = mod.GetComponent(/datum/component/storage)
	mod.locked = TRUE
	mod.max_combined_w_class = 0
	mod.max_items = 0
	//qdel(modstorage)
	//if(!deleting)
	//	mod.dump_content_at(get_dumping_location(mod, mod.wearer), mod.wearer)
	UnregisterSignal(mod.chestplate, COMSIG_ITEM_PRE_UNEQUIP)

/obj/item/mod/module/storage/proc/on_chestplate_unequip(obj/item/source, force, atom/newloc, no_move, invdrop, silent)
	var/datum/component/storage/modstorage = GetComponent(/datum/component/storage)
	if(QDELETED(source) || !mod.wearer || newloc == mod.wearer || !mod.wearer.s_store)
		return
	to_chat(mod.wearer, span_notice("[src] пытается положить [mod.wearer.s_store] внутрь себя."))
	if(modstorage?.handle_item_insertion(mod.wearer.s_store, mod.wearer))//, override = TRUE))
		mod.wearer.temporarilyRemoveItemFromInventory(mod.wearer.s_store)

/obj/item/mod/module/storage/normal_capacity
	name = "модуль хранилища"
	desc = "Модуль состоит из серии интегрированных отсеков и специализированных карманов по бокам костюма, для хранения ваших вещей."
	icon_state = "storage"

/obj/item/mod/module/storage/normal_capacity/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 15
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 7
	STR.use_sound = 'sound/items/storage/briefcase.ogg'

/obj/item/mod/module/storage/large_capacity
	name = "продвинутый модуль хранилища"
	desc = "Передовая разработка от Накамура Инженеринг - усовершенствованный контейнер для складирования предметов."
	icon_state = "storage_large"

/obj/item/mod/module/storage/large_capacity/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 21
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 14
	STR.use_sound = 'sound/items/storage/briefcase.ogg'

/obj/item/mod/module/storage/syndicate
	name = "модуль хранилища Синдиката"
	desc = "Система хранения с использованием нанотехнологий используемых контрабандистами. Разработка Киберсан Индастри."
	icon_state = "storage_syndi"

/obj/item/mod/module/storage/syndicate/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 30
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 21
	STR.use_sound = 'sound/items/storage/briefcase.ogg'

/obj/item/mod/module/storage/bluespace
	name = "модуль блюспейс хранилища"
	desc = "Экспериментальная система хранения использующая технологию блюспейс. Разработка НаноТрейзен."
	icon_state = "storage_large"

/obj/item/mod/module/storage/normal_capacity/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 60
	STR.max_w_class = WEIGHT_CLASS_GIGANTIC
	STR.max_items = 21
	STR.use_sound = 'sound/items/storage/briefcase.ogg'


/*obj/item/mod/module/storage/ComponentInitialize()
	AddComponent(component_type)*/

/obj/item/mod/module/storage/AllowDrop()
	return FALSE

/obj/item/mod/module/storage/contents_explosion(severity, target)
	for(var/atom/A in contents)
		switch(severity)
			if(EXPLODE_DEVASTATE)
				SSexplosions.highobj += A
			if(EXPLODE_HEAVY)
				SSexplosions.medobj += A
			if(EXPLODE_LIGHT)
				SSexplosions.lowobj += A

/*obj/item/mod/module/storage/canStrip(mob/who)
	. = ..()
	if(!. && rummage_if_nodrop)
		return TRUE*/

/*obj/item/storage/doStrip(mob/who)
	if(HAS_TRAIT(src, TRAIT_NODROP) && rummage_if_nodrop)
		var/datum/component/storage/CP = GetComponent(/datum/component/storage)
		CP.do_quick_empty()
		return TRUE
	return ..()*/

/obj/item/mod/module/storage/contents_explosion(severity, target)
//Cyberboss says: "USE THIS TO FILL IT, NOT INITIALIZE OR NEW"
