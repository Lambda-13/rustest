/obj/item/reagent_containers/food/bay12
	name = "БАГ"
	icon = 'lambda/sanecman/icons/obj/food.dmi'

/obj/item/reagent_containers/food/snacks/proteinbar
	name = "протеиновый батончик"
	desc = "Протеиновые батончики торговой марки SwoleMAX гарантированно заставят вас чувствовать себя совершенно уверенно."
	icon_state = "proteinbar"
	item_state = "proteinbar"
	trash = /obj/item/trash/bay12/proteinbar
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("протеин" = 1, "шоколад" = 1)
	bitesize = 6
//	foodtype = ATOM_FLAG_OPEN_CONTAINER | ATOM_FLAG_NO_REACT

/obj/item/reagent_containers/food/snacks/tastybread
	name = "хлеб в трубочке"
	desc = "Хлеб в трубочке. Жевательный... и на удивление вкусный."
	icon_state = "tastybread"
	item_state = "tastybread"
	trash = /obj/item/trash/bay12/tastybread
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("хлеб" = 2, "сахар" = 3)
	bitesize = 2
//	foodtype = ATOM_FLAG_OPEN_CONTAINER | ATOM_FLAG_NO_REACT
