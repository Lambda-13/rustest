/obj/structure/lattice/indestructible
	indestruct = TRUE

/obj/structure/lattice/indestructible/Initialize(mapload)
	. = ..()
	resistance_flags += INDESTRUCTIBLE

/obj/structure/lattice/indestructible/blackclay
	name = "черепица"
	desc = "Покрытие на крыше."
	icon = 'lambda/sanecman/icons/turf/turf/black_roofs.dmi'
	icon_state = "blackclay-0"
	base_icon_state = "blackclay"
