/obj/effect/decal/cleanable/cum
	name = "сметанка"
	desc = "Выглядит вкусно."
	density = 0
	layer = 3
	icon = 'lambda/ss7v/icons/exrp/smetanka.dmi'
	anchored = 1
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")
	mergeable_decal = TRUE

/obj/effect/decal/cleanable/cum/Initialize(mapload, list/datum/disease/diseases, prereagented = TRUE)
	. = ..()
	if(prereagented) // if we wanna to spawn it with some volume inside or not
		reagents.add_reagent(/datum/reagent/consumable/nutriment/protein/semen, 5)
	pixel_x = rand(-12, 12)
	pixel_y = rand(-12, 12)

/obj/effect/decal/cleanable/cum/replace_decal(obj/effect/decal/cleanable/cum/C)
	reagents.trans_to(C, reagents.total_volume)
	C.overlays += image(icon, src, pick(random_icon_states), pixel_x=rand(-12, 12), pixel_y=rand(-12, 12))
	return ..()

/obj/effect/decal/cleanable/cum/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		playsound(get_turf(src), 'sound/items/drink.ogg', 50, TRUE) //slurp
		H.visible_message(span_alert("[H] слизывает сметанку с пола."))
		if(reagents)
			for(var/datum/reagent/R in reagents.reagent_list)
				if (istype(R, /datum/reagent/consumable))
					var/datum/reagent/consumable/nutri_check = R
					if(nutri_check.nutriment_factor >0)
						H.adjust_nutrition(nutri_check.nutriment_factor * nutri_check.volume)
						reagents.remove_reagent(nutri_check.type,nutri_check.volume)
		reagents.trans_to(H, reagents.total_volume, transfered_by = user)
		qdel(src)
