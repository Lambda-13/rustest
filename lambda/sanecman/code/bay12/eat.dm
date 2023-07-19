/obj/item/reagent_containers/food/snacks/proteinbar
	name = "протеиновый батончик"
	desc = "Протеиновые батончики торговой марки SwoleMAX гарантированно заставят вас чувствовать себя совершенно уверенно."
	icon_state = "proteinbar_1"
	item_state = "proteinbar"
	trash = /obj/item/trash/energybar
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("протеин" = 1, "шоколад" = 1)
	bitesize = 6
//	foodtype = ATOM_FLAG_OPEN_CONTAINER | ATOM_FLAG_NO_REACT
