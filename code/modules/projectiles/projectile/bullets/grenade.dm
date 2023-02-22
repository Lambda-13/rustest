// 40mm (Grenade Launcher

/obj/projectile/bullet/a40mm
	name ="40мм граната"
	desc = "USE A WEEL GUN"
	icon_state= "bolter"
	damage = 60
	min_hitchance = 20

/obj/projectile/bullet/a40mm/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 2, 1, 0, flame_range = 3)
	return BULLET_ACT_HIT
