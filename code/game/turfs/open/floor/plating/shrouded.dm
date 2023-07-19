/turf/open/floor/plating/asteroid/shroudedplanet
	name = "packed sand"
	icon = 'lambda/sanecman/icons/turf/shrouded.dmi'
	icon_state = "shrouded"
	desc = "Sand that has been packed in to solid earth."
	icon_state = "shrouded0"
	base_icon_state = "shrouded"
	max_icon_states = 8
	turf_type = /turf/open/floor/plating/asteroid/shroudedplanet
	floor_variance = 45
	initial_gas_mix = SHROUDEDPLANET_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/floor/plating/asteroid/shroudedplanet
	digResult = /obj/item/stack/ore/glass/shroudedplanet

/turf/open/water/tar/shrouded
	name = "tar"
	icon = 'lambda/sanecman/icons/turf/shrouded.dmi'
	icon_state = "shrouded_tar"
	desc = "A pool of viscous and sticky tar."
	color = "#FFFFFF"
	slowdown = 3
	reagent_to_extract = /datum/reagent/toxin/histamine
	extracted_reagent_visible_name = "histamine"
	baseturfs = /turf/open/floor/plating/asteroid/shroudedplanet
	planetary_atmos = TRUE
	initial_gas_mix = SHROUDEDPLANET_DEFAULT_ATMOS

/turf/open/floor/plating/shroudedplanet
	baseturfs = /turf/open/floor/plating/asteroid/shroudedplanet
	planetary_atmos = TRUE
	initial_gas_mix = SHROUDEDPLANET_DEFAULT_ATMOS

/turf/open/floor/plating/shroudedplanet/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

//open turfs then open lits.

/turf/open/floor/plating/shroudedplanet/lit
	light_range = 2
	light_power = 0.2
	light_color = LIGHT_COLOR_FLARE

/turf/open/floor/plating/shroudedplanet/rust/lit
	light_range = 2
	light_power = 0.2
	light_color = LIGHT_COLOR_FLARE

/turf/open/floor/plating/asteroid/shroudedplanet/lit
	light_range = 2
	light_power = 0.2
	light_color = LIGHT_COLOR_FLARE

/turf/open/water/tar/shrouded/lit
	light_range = 2
	light_power = 0.2
	light_color = LIGHT_COLOR_FLARE

