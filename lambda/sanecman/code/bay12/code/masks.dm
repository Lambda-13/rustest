/obj/item/clothing/mask/gas/alt
	name = "панорамный противогаз (UNUSED)"
	desc = "Маска для лица, которая может быть подключена к источнику воздуха. Не очень блокирует потоки газа." //More accurate
	icon = 'lambda/sanecman/icons/bay12/clothing/obj_mask.dmi'
	mob_overlay_icon = 'lambda/sanecman/icons/bay12/mob/onmob/onmob_mask.dmi'
	icon_state = "gas_alt"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	item_state = "gas_alt"
	flags_cover = MASKCOVERSMOUTH | PEPPERPROOF

/obj/item/clothing/mask/breath/scba
	name = "маска А.Д.А. (UNUSED)"
	desc = "Плотно прилегающая маска Автономного Дыхательного Аппарата. Может быть подключен к системе подачи воздуха."
//"scba_mask" и затем ещё _up
	icon_state = "scba_mask"
	item_state = "scba_mask"
//	down_icon_state = "scba_maskdown" //На бэе это означает спущенная маска с лица, на ТГ работает всё по другому
	permeability_coefficient = 0.01
	equip_delay_other = 10
