/obj/projectile/bullet/neurotoxin
	name = "нейротоксиновый плевок"
	icon_state = "neurotoxin"
	damage = 5
	damage_type = TOX
	flag = "bio"
	nodamage = FALSE
	knockdown = 100
	stamina = 60

/obj/projectile/bullet/neurotoxin/on_hit(atom/target, blocked = FALSE)
	if(isalien(target))
		knockdown = 0
		stamina = 0
		nodamage = TRUE
	return ..()
