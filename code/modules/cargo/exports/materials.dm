/datum/export/material
	cost = 5 // Cost per MINERAL_MATERIAL_AMOUNT, which is 2000cm3 as of April 2016.
	message = "cm3 of developer's tears. Please, report this on github"
	var/material_id = null
	export_types = list(
		/obj/item/stack/sheet, /obj/item/stack/tile,
		/obj/item/stack/ore, /obj/item/coin)
// Yes, it's a base type containing export_types.
// But it has no material_id, so any applies_to check will return false, and these types reduce amount of copypasta a lot

/datum/export/material/get_amount(obj/O)
	if(!material_id)
		return 0
	if(!isitem(O))
		return 0
	var/obj/item/I = O
	if(!(SSmaterials.GetMaterialRef(material_id) in I.custom_materials))
		return 0

	var/amount = I.custom_materials[SSmaterials.GetMaterialRef(material_id)]

	if(istype(I, /obj/item/stack/ore))
		amount *= 0.8 // Station's ore redemption equipment is really goddamn good.

	return round(amount/MINERAL_MATERIAL_AMOUNT)

// Materials. Prices have been heavily nerfed from the original values; mining is boring, so it shouldn't be a good way to make money.

/datum/export/material/bananium
	cost = 350
	material_id = /datum/material/bananium
	message = "cm3 of bananium"

/datum/export/material/diamond
	cost = 200
	material_id = /datum/material/diamond
	message = "cm3 of diamonds"

/datum/export/material/plasma
	cost = 20
	k_elasticity = 0
	material_id = /datum/material/plasma
	message = "cm3 of plasma"

/datum/export/material/uranium
	cost = 60
	material_id = /datum/material/uranium
	message = "cm3 of uranium"

/datum/export/material/gold
	cost = 50
	material_id = /datum/material/gold
	message = "cm3 of gold"

/datum/export/material/silver
	cost = 25
	material_id = /datum/material/silver
	message = "cm3 of silver"

/datum/export/material/titanium
	cost = 20
	material_id = /datum/material/titanium
	message = "cm3 of titanium"

/datum/export/material/adamantine
	cost = 300
	material_id = /datum/material/adamantine
	message = "cm3 of adamantine"

/datum/export/material/mythril
	cost = 375
	material_id = /datum/material/mythril
	message = "cm3 of mythril"

/datum/export/material/bscrystal
	cost = 250
	message = "of bluespace crystals"
	material_id = /datum/material/bluespace

/datum/export/material/plastic
	cost = 5
	message = "cm3 of plastic"
	material_id = /datum/material/plastic

/datum/export/material/cardboard
	cost = 5
	message = "cm3 of cardboard"
	material_id = /datum/material/cardboard

/datum/export/material/wood
	cost = 5
	message = "cm3 of wood"
	material_id = /datum/material/wood

/datum/export/material/sandstone
	cost = 5
	message = "cm3 of sandstone"
	material_id = /datum/material/sandstone

/datum/export/material/runite
	cost = 350
	message = "cm3 of runite"
	material_id = /datum/material/runite

/datum/export/material/runedmetal
	cost = 100
	message = "cm3 of runed metal"
	material_id = /datum/material/runedmetal

/datum/export/material/metal
	cost = 2
	message = "cm3 of metal"
	material_id = /datum/material/iron
	export_types = list(
		/obj/item/stack/sheet/metal, /obj/item/stack/tile/plasteel,
		/obj/item/stack/rods, /obj/item/stack/ore, /obj/item/coin)

/datum/export/material/glass
	cost = 2
	message = "cm3 of glass"
	material_id = /datum/material/glass
	export_types = list(/obj/item/stack/sheet/glass, /obj/item/stack/ore,
		/obj/item/shard)

/datum/export/material/hot_ice
	cost = 300
	message = "cm3 of Hot Ice"
	material_id = /datum/material/hot_ice
	export_types = /obj/item/stack/sheet/hot_ice
