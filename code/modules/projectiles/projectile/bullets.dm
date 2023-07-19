/obj/projectile/bullet
	name = "пуля"
	icon_state = "gauss"
	damage = 60
	speed = 0.4
	damage_type = BRUTE
	nodamage = FALSE
	light_system = MOVABLE_LIGHT
	light_color = COLOR_VERY_SOFT_YELLOW
	flag = "bullet"
	hitsound_wall = "ricochet"
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	min_hitchance = 15 //Пуля дура
/obj/projectile/bullet/smite
	name = "божественное воздаяние"
	damage = 10
