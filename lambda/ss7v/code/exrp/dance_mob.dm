/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	dancing_potency = (prob(80) ? rand(9, 14) : pick(rand(5, 13), rand(15, 20)))
	dancing_tolerance = (prob(80) ? rand(150, 300) : pick(rand(10, 100), rand(350,600)))

/mob/proc/do_dancing_animation(dancedir)

	dir = dancedir

	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	if(dancedir & NORTH)
		pixel_y_diff = 8
	else if(dancedir & SOUTH)
		pixel_y_diff = -8

	if(dancedir & EAST)
		pixel_x_diff = 8
	else if(dancedir & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)

/mob/living/carbon/human/proc/is_literally_ready_to_dance()
	return (!wear_suit || !(wear_suit.body_parts_covered)) && (!w_uniform || !(w_uniform.body_parts_covered))
