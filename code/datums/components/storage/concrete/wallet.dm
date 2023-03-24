/datum/component/storage/concrete/wallet/on_alt_click_async(datum/source, mob/user)
	if(!isliving(user) || !user.CanReach(parent) || user.incapacitated())
		return
	if(locked)
		to_chat(user, "<span class='warning'>[parent] выглядит закрытым!</span>")
		return

	var/obj/item/storage/wallet/A = parent
	if(istype(A) && A.front_id && !issilicon(user) && !(A.item_flags & IN_STORAGE)) //if it's a wallet in storage seeing the full inventory is more useful
		var/obj/item/I = A.front_id
		A.add_fingerprint(user)
		remove_from_storage(I, get_turf(user))
		if(!user.put_in_hands(I))
			to_chat(user, "<span class='notice'>Скидываю [I] на пол.</span>")
			return
		user.visible_message("<span class='warning'>[user] складывает [I] в [parent]!</span>", "<span class='notice'>Ложу [I] в [parent].</span>")
		return
	..()
