// .45 (M1911 & C20r)

/obj/projectile/bullet/c45
	name = "пуля .45 калибра"
	damage = 30

/obj/projectile/bullet/c45_ap
	name = "бронебойная пуля .45 калибра"
	damage = 25
	armour_penetration = 30

/obj/projectile/bullet/incendiary/c45
	name = "зажигательная пуля .45 калибра"
	damage = 20
	fire_stacks = 2

// 4.6x30mm (Autorifles)

/obj/projectile/bullet/c46x30mm
	name = "пуля калибра 4.6x30мм"
	damage = 20
	min_hitchance = 5 //WT-550 balance

/obj/projectile/bullet/c46x30mm_ap
	name = "бронебойная пуля калибра 4.6x30мм"
	damage = 15
	armour_penetration = 30
	min_hitchance = 5 //WT-550 balance

/obj/projectile/bullet/incendiary/c46x30mm
	name = "зажигательная пуля калибра 4.6x30мм"
	damage = 10
	fire_stacks = 1
	min_hitchance = 5 //WT-550 balance

/obj/projectile/bullet/c47x33mm
	name = "4.73x33mm bullet"
	damage = 30
	armour_penetration = 40

/obj/projectile/bullet/c556mm
	name = "5.56mm HITP bullet"
	damage = 20
	armour_penetration = 0

/obj/projectile/bullet/c556mm_surplus
	name = "5.56mm HITP surplus bullet"
	damage = 15

/obj/projectile/bullet/c556mm_ap
	name = "5.56mm HITP AP bullet"
	damage = 15
	armour_penetration = 40

/obj/projectile/bullet/c556mm_hp
	name = "5.56mm HITP hollow-point bullet"
	damage = 30
	armour_penetration = -50

/obj/projectile/bullet/c556mm/rubbershot
	name = "5.56mm HITP rubber bullet"
	damage = 5
	stamina = 20
