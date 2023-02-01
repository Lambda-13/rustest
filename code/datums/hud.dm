/* HUD DATUMS */

GLOBAL_LIST_EMPTY(all_huds)

//GLOBAL HUD LIST
GLOBAL_LIST_INIT(huds, list(
	DATA_HUD_SECURITY_BASIC = new/datum/atom_hud/data/human/security/basic(),
	DATA_HUD_SECURITY_ADVANCED = new/datum/atom_hud/data/human/security/advanced(),
	DATA_HUD_MEDICAL_BASIC = new/datum/atom_hud/data/human/medical/basic(),
	DATA_HUD_MEDICAL_ADVANCED = new/datum/atom_hud/data/human/medical/advanced(),
	DATA_HUD_DIAGNOSTIC_BASIC = new/datum/atom_hud/data/diagnostic/basic(),
	DATA_HUD_DIAGNOSTIC_ADVANCED = new/datum/atom_hud/data/diagnostic/advanced(),
	DATA_HUD_ABDUCTOR = new/datum/atom_hud/abductor(),
	DATA_HUD_SENTIENT_DISEASE = new/datum/atom_hud/sentient_disease(),
	DATA_HUD_AI_DETECT = new/datum/atom_hud/ai_detector(),
	DATA_HUD_FAN = new/datum/atom_hud/data/human/fan_hud(),
	ANTAG_HUD_CULT = new/datum/atom_hud/antag(),
	ANTAG_HUD_REV = new/datum/atom_hud/antag(),
	ANTAG_HUD_OPS = new/datum/atom_hud/antag(),
	ANTAG_HUD_WIZ = new/datum/atom_hud/antag(),
	ANTAG_HUD_SHADOW = new/datum/atom_hud/antag(),
	ANTAG_HUD_TRAITOR = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_NINJA = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_CHANGELING = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_ABDUCTOR = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_DEVIL = new/datum/atom_hud/antag(),
	ANTAG_HUD_SINTOUCHED = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_SOULLESS = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_BROTHER = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_OBSESSED = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_FUGITIVE = new/datum/atom_hud/antag(),
	ANTAG_HUD_GANGSTER = new/datum/atom_hud/antag/hidden(),
	ANTAG_HUD_SPACECOP = new/datum/atom_hud/antag()
	))

/datum/atom_hud
	var/list/atom/hudatoms = list() //list of all atoms which display this hud
	var/list/hudusers = list() //list with all mobs who can see the hud
	var/list/hud_icons = list() //these will be the indexes for the atom's hud_list

	var/list/next_time_allowed = list() //mobs associated with the next time this hud can be added to them
	var/list/queued_to_see = list() //mobs that have triggered the cooldown and are queued to see the hud, but do not yet
	var/hud_exceptions = list() // huduser = list(ofatomswiththeirhudhidden) - aka everyone hates targeted invisiblity

	///associative list of the form: list(z level = list(hud user client mobs)).
	///tracks mobs that can "see" us
	// by z level so when they change z's we can adjust what images they see from this hud.
	var/list/hud_users = list()
	///used for signal tracking purposes, associative list of the form: list(hud user = number of times this hud was added to this user).
	///that isnt separated by z level
	var/list/mob/hud_users_all_z_levels = list()
	///the hud images that they can actually see.
	var/list/atom/hud_atoms = list()
	///used for signal tracking purposes, associative list of the form: list(hud atom = TRUE) that isnt separated by z level
	var/list/atom/hud_atoms_all_z_levels = list()
	

/datum/atom_hud/New()
	GLOB.all_huds += src

/datum/atom_hud/Destroy()
	for(var/v in hudusers)
		remove_hud_from(v, TRUE)
	for(var/v in hudatoms)
		remove_from_hud(v)
	GLOB.all_huds -= src
	return ..()

/datum/atom_hud/proc/remove_hud_from(mob/M, force = FALSE)
	if(!M || !hudusers[M])
		return
	if (force || !--hudusers[M])
		hudusers -= M
		if(next_time_allowed[M])
			next_time_allowed -= M
		if(queued_to_see[M])
			queued_to_see -= M
		else
			for(var/atom/A in hudatoms)
				remove_from_single_hud(M, A)

/datum/atom_hud/proc/remove_from_hud(atom/A)
	if(!A || !(A in hudatoms))
		return FALSE
	for(var/mob/M in hudusers)
		remove_from_single_hud(M, A)
	hudatoms -= A
	return TRUE

/datum/atom_hud/proc/remove_from_single_hud(mob/M, atom/A) //unsafe, no sanity apart from client
	if(!M || !M.client || !A)
		return
	for(var/i in hud_icons)
		M.client.images -= A.hud_list[i]

/datum/atom_hud/proc/on_atom_or_user_z_level_changed(atom/movable/moved_atom, turf/old_turf, turf/new_turf)
	SIGNAL_HANDLER

	if(old_turf)
		if(hud_users_all_z_levels[moved_atom])
			hud_users[old_turf.z] -= moved_atom

			for(var/atom/formerly_seen_hud_atom as anything in get_hud_atoms_for_z_level(old_turf.z))
				remove_atom_from_single_hud(moved_atom, formerly_seen_hud_atom)

		if(hud_atoms_all_z_levels[moved_atom])
			hud_atoms[old_turf.z] -= moved_atom

			for(var/mob/formerly_seeing as anything in get_hud_users_for_z_level(old_turf.z))//this wont include moved_atom since its removed
				remove_atom_from_single_hud(formerly_seeing, moved_atom)

	if(new_turf)
		if(hud_users_all_z_levels[moved_atom])
			hud_users[new_turf.z][moved_atom] = TRUE //hud users is associative, hud atoms isnt

			for(var/atom/newly_seen_hud_atom as anything in get_hud_atoms_for_z_level(new_turf.z))
				add_atom_to_single_mob_hud(moved_atom, newly_seen_hud_atom)

		if(hud_atoms_all_z_levels[moved_atom])
			hud_atoms[new_turf.z] |= moved_atom

			for(var/mob/newly_seeing as anything in get_hud_users_for_z_level(new_turf.z))
				add_atom_to_single_mob_hud(newly_seeing, moved_atom)

/datum/atom_hud/proc/add_hud_to(mob/M)
	if(!M)
		return
	if(!hudusers[M])
		hudusers[M] = 1
		if(next_time_allowed[M] > world.time)
			if(!queued_to_see[M])
				addtimer(CALLBACK(src, .proc/show_hud_images_after_cooldown, M), next_time_allowed[M] - world.time)
				queued_to_see[M] = TRUE
		else
			next_time_allowed[M] = world.time + ADD_HUD_TO_COOLDOWN
			for(var/atom/A in hudatoms)
				add_to_single_hud(M, A)
	else
		hudusers[M]++

/datum/atom_hud/proc/hide_single_atomhud_from(hud_user,hidden_atom)
	if(hudusers[hud_user])
		remove_from_single_hud(hud_user,hidden_atom)
	if(!hud_exceptions[hud_user])
		hud_exceptions[hud_user] = list(hidden_atom)
	else
		hud_exceptions[hud_user] += hidden_atom

/datum/atom_hud/proc/unhide_single_atomhud_from(hud_user,hidden_atom)
	hud_exceptions[hud_user] -= hidden_atom
	if(hudusers[hud_user])
		add_to_single_hud(hud_user,hidden_atom)

/datum/atom_hud/proc/show_hud_images_after_cooldown(M)
	if(queued_to_see[M])
		queued_to_see -= M
		next_time_allowed[M] = world.time + ADD_HUD_TO_COOLDOWN
		for(var/atom/A in hudatoms)
			add_to_single_hud(M, A)

/// add new_hud_atom to this hud
/datum/atom_hud/proc/add_atom_to_hud(atom/new_hud_atom)
	if(!new_hud_atom)
		return FALSE
	var/turf/atom_turf = get_turf(new_hud_atom)
	if(!atom_turf)
		return

	RegisterSignal(new_hud_atom, COMSIG_MOVABLE_Z_CHANGED, PROC_REF(on_atom_or_user_z_level_changed), override = TRUE)
	RegisterSignal(new_hud_atom, COMSIG_PARENT_QDELETING, PROC_REF(unregister_atom), override = TRUE) //both hud atoms and hud users use these signals

	hud_atoms[atom_turf.z] |= new_hud_atom
	hud_atoms_all_z_levels[new_hud_atom] = TRUE

	for(var/mob/mob_to_show as anything in get_hud_users_for_z_level(atom_turf.z))
		if(!queued_to_see[mob_to_show])
			add_atom_to_single_mob_hud(mob_to_show, new_hud_atom)
	return TRUE

/// remove this atom from this hud completely
/datum/atom_hud/proc/remove_atom_from_hud(atom/hud_atom_to_remove)
	if(!hud_atom_to_remove || !hud_atoms_all_z_levels[hud_atom_to_remove])
		return FALSE

	//make sure we arent unregistering a hud atom thats also a hud user mob
	if(!hud_users_all_z_levels[hud_atom_to_remove])
		UnregisterSignal(hud_atom_to_remove, COMSIG_MOVABLE_Z_CHANGED)
		UnregisterSignal(hud_atom_to_remove, COMSIG_PARENT_QDELETING)

	for(var/mob/mob_to_remove as anything in hud_users_all_z_levels)
		remove_atom_from_single_hud(mob_to_remove, hud_atom_to_remove)

	var/turf/atom_turf = get_turf(hud_atom_to_remove)
	if(!atom_turf)
		return

	hud_atoms[atom_turf.z] -= hud_atom_to_remove
	hud_atoms_all_z_levels -= hud_atom_to_remove

	return TRUE

///returns a list of all hud users in the given z level and linked upper z levels (because hud users in higher z levels can see below)
/datum/atom_hud/proc/get_hud_users_for_z_level(z_level)
	if(z_level > length(hud_users) || z_level <= 0)
		stack_trace("get_hud_atoms_for_z_level() was given a z level index [z_level] out of bounds 1->[length(hud_users)] of hud_atoms!")
		return FALSE

	. = list()
	. += hud_users[z_level]

	/*var/max_number_of_linked_z_levels_i_care_to_support_here = 10

	while(max_number_of_linked_z_levels_i_care_to_support_here)
		var/upper_level_exists = SSmapping.level_trait(z_level, ZTRAIT_UP)

		if(upper_level_exists)
			z_level++
			. += hud_users[z_level]
			max_number_of_linked_z_levels_i_care_to_support_here--
			continue

		else
			break*/

///show this hud to the passed in user
/datum/atom_hud/proc/show_to(mob/new_viewer)
	if(!new_viewer)
		return

	var/turf/their_turf = get_turf(new_viewer)
	if(!their_turf)
		return

	if(!hudusers[their_turf.z][new_viewer])
		hudusers[their_turf.z][new_viewer] = TRUE
		hud_users_all_z_levels[new_viewer] = 1

		RegisterSignal(new_viewer, COMSIG_PARENT_QDELETING, PROC_REF(unregister_atom), override = TRUE) //both hud users and hud atoms use these signals
		RegisterSignal(new_viewer, COMSIG_MOVABLE_Z_CHANGED, PROC_REF(on_atom_or_user_z_level_changed), override = TRUE)

		if(next_time_allowed[new_viewer] > world.time)
			if(!queued_to_see[new_viewer])
				addtimer(CALLBACK(src, PROC_REF(show_hud_images_after_cooldown), new_viewer), next_time_allowed[new_viewer] - world.time)
				queued_to_see[new_viewer] = TRUE

		else
			next_time_allowed[new_viewer] = world.time + ADD_HUD_TO_COOLDOWN
			for(var/atom/hud_atom_to_add as anything in get_hud_atoms_for_z_level(their_turf.z))
				add_atom_to_single_mob_hud(new_viewer, hud_atom_to_add)
	else
		hud_users_all_z_levels[new_viewer] += 1 //increment the number of times this hud has been added to this hud user


///Hides the images in this hud from former_viewer
///If absolute is set to true, this will forcefully remove the hud, even if sources in theory remain
/datum/atom_hud/proc/hide_from(mob/former_viewer, absolute = FALSE)
	if(!former_viewer || !hud_users_all_z_levels[former_viewer])
		return

	var/turf/their_turf = get_turf(former_viewer)
	if(!their_turf)
		return

	hud_users_all_z_levels[former_viewer] -= 1//decrement number of sources for this hud on this user (bad way to track i know)

	if (absolute || hud_users_all_z_levels[former_viewer] <= 0)//if forced or there arent any sources left, remove the user

		if(!hud_atoms_all_z_levels[former_viewer])//make sure we arent unregistering changes on a mob thats also a hud atom for this hud
			UnregisterSignal(former_viewer, COMSIG_MOVABLE_Z_CHANGED)
			UnregisterSignal(former_viewer, COMSIG_PARENT_QDELETING)

		hudusers[their_turf.z] -= former_viewer
		hud_users_all_z_levels -= former_viewer

		if(next_time_allowed[former_viewer])
			next_time_allowed -= former_viewer

		if(queued_to_see[former_viewer])
			queued_to_see -= former_viewer
		else
			for(var/atom/hud_atom as anything in get_hud_atoms_for_z_level(their_turf.z))
				remove_atom_from_single_hud(former_viewer, hud_atom)

///returns a list of all hud atoms in the given z level and linked lower z levels (because hud users in higher z levels can see below)
/datum/atom_hud/proc/get_hud_atoms_for_z_level(z_level)
	if(z_level <= 0)
		return FALSE
	if(z_level > length(hud_atoms))
		stack_trace("get_hud_atoms_for_z_level() was given a z level index out of bounds of hud_atoms!")
		return FALSE

	. = list()
	. += hud_atoms[z_level]

	/*var/max_number_of_linked_z_levels_i_care_to_support_here = 10

	while(max_number_of_linked_z_levels_i_care_to_support_here)
		var/lower_z_level_exists = SSmapping.level_trait(z_level, ZTRAIT_DOWN)

		if(lower_z_level_exists)
			z_level--
			. += hud_atoms[z_level]
			max_number_of_linked_z_levels_i_care_to_support_here--
			continue

		else
			break*/

/// add just hud_atom's hud images (that are part of this atom_hud) to requesting_mob's client.images list
/datum/atom_hud/proc/add_atom_to_single_mob_hud(mob/requesting_mob, atom/hud_atom) //unsafe, no sanity apart from client
	if(!requesting_mob || !requesting_mob.client || !hud_atom)
		return

	for(var/hud_category in (hud_icons & hud_atom.active_hud_list))
		if(!hud_exceptions[requesting_mob] || !(hud_atom in hud_exceptions[requesting_mob]))
			requesting_mob.client.images |= hud_atom.active_hud_list[hud_category]

/datum/atom_hud/proc/unregister_atom(datum/source, force)
	SIGNAL_HANDLER
	hide_from(source, TRUE)
	remove_atom_from_hud(source)

/datum/atom_hud/proc/add_to_hud(atom/A)
	if(!A)
		return FALSE
	hudatoms |= A
	for(var/mob/M in hudusers)
		if(!queued_to_see[M])
			add_to_single_hud(M, A)
	return TRUE

/datum/atom_hud/proc/add_to_single_hud(mob/M, atom/A) //unsafe, no sanity apart from client
	if(!M || !M.client || !A)
		return
	for(var/i in hud_icons)
		if(A.hud_list[i] && (!hud_exceptions[M] || !(A in hud_exceptions[M])))
			M.client.images |= A.hud_list[i]

/// remove every hud image for this hud on atom_to_remove from client_mob's client.images list
/datum/atom_hud/proc/remove_atom_from_single_hud(mob/client_mob, atom/atom_to_remove)
	if(!client_mob || !client_mob.client || !atom_to_remove?.active_hud_list)
		return
	for(var/hud_image in hud_icons)
		client_mob.client.images -= atom_to_remove.active_hud_list[hud_image]

//MOB PROCS
/mob/proc/reload_huds()
	for(var/datum/atom_hud/hud in GLOB.all_huds)
		if(hud && hud.hudusers[src])
			for(var/atom/A in hud.hudatoms)
				hud.add_to_single_hud(src, A)

/mob/dead/new_player/reload_huds()
	return

/mob/proc/add_click_catcher()
	client.screen += client.void

/mob/dead/new_player/add_click_catcher()
	return
