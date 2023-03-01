/client/verb/reset_hotkeys_please()
	set name = "ПОЧИНИТЬ УПРАВЛЕНИЕ"
	set category = "Особенное"
	set desc = "Чинит \"нерабочие\" хоткеи."

	var/choice = tgalert(usr, "ПЕРЕКЛЮЧИТЕСЬ НА АНГЛИЙСКУЮ РАСКЛАДКУ ПЕРЕД ВЫБОРОМ", "Настройка хоткеев", "Подтвердить", "Отмена")
	if(choice == "Отмена")
		return
	update_special_keybinds()

	SSblackbox.record_feedback("nested tally", "preferences_verb", 1, list("Resetted Keys")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
