
/datum/map_template/ruin/station
	prefix = "_maps/r_ruins/station/"
	cost = 0

/datum/map_template/ruin/station/brig
	id = "default_brig"
	suffix = "brig_default.dmm"
	name = "Default Brig"

/datum/map_template/ruin/station/brig/loose
	id = "loose_brig"
	suffix = "brig_loose.dmm"
	name = "Loose Brig"

/datum/map_template/ruin/station/brig/armored
	id = "armored_brig"
	suffix = "brig_armored.dmm"
	name = "Armored Brig"

/datum/map_template/ruin/station/bar
	id = "default_bar"
	suffix = "bar_default.dmm"
	name = "Default Bar"

/datum/map_template/ruin/station/bar/neon
	id = "neon_bar"
	suffix = "bar_neon.dmm"
	name = "Neon Bar"

/datum/map_template/ruin/station/bar/lava
	id = "lava_bar"
	suffix = "bar_lava.dmm"
	name = "Lava Bar"

/datum/map_template/ruin/station/bar/theatre
	id = "theatre_bar"
	suffix = "bar_theatre.dmm"
	name = "Theatre Bar"

/datum/map_template/ruin/station/bridge
	id = "default_Bridge"
	suffix = "bridge_default.dmm"
	name = "Default Bridge"
	always_spawn_with = list(/datum/map_template/ruin/station/bridge/bottom = PLACE_BELOW)

/datum/map_template/ruin/station/bridge/bottom
	id = "default_Bridge_bottom"
	suffix = "bridge_default_bottom.dmm"
	name = "Default Bridge Bottom"

/datum/map_template/ruin/station/bridge/compact
	id = "compact_Bridge"
	suffix = "bridge_compact.dmm"
	name = "Compact Bridge"
	always_spawn_with = list(/datum/map_template/ruin/station/bridge/compact/bottom = PLACE_BELOW)

/datum/map_template/ruin/station/bridge/compact/bottom
	id = "compact_Bridge_bottom"
	suffix = "bridge_compact_bottom.dmm"
	name = "Compact Bridge Bottom"

/datum/map_template/ruin/station/bridge/interesting
	id = "interesting_Bridge"
	suffix = "bridge_interesting.dmm"
	name = "Interesting Bridge"

/datum/map_template/ruin/station/bridge/hall
	id = "hall_Bridge"
	suffix = "bridge_hall.dmm"
	name = "Hall Bridge"
	always_spawn_with = list(/datum/map_template/ruin/station/bridge/hall/bottom = PLACE_BELOW)

/datum/map_template/ruin/station/bridge/hall/bottom
	id = "hall_Bridge_bottom"
	suffix = "bridge_hall_bottom.dmm"
	name = "Hall Bridge Bottom"

/datum/map_template/ruin/station/engine
	id = "engine_sm"
	suffix = "engine_supermatter.dmm"
	name = "Supermatter Engine"
	always_spawn_with = list(/datum/map_template/ruin/station/engine/bottom = PLACE_BELOW)

/datum/map_template/ruin/station/engine/bottom
	id = "engine_sm_bottom"
	suffix = "engine_supermatter_bottom.dmm"
	name = "Supermatter Bottom"

/datum/map_template/ruin/station/engine/singulotesla
	id = "engine_singulo_tesla"
	suffix = "engine_particle_accelerator.dmm"
	name = "Particle Accelerator Engine"
	always_spawn_with = list(/datum/map_template/ruin/station/engine/bottom/singulotesla = PLACE_BELOW)

/datum/map_template/ruin/station/engine/bottom/singulotesla
	id = "engine_singulo_tesla_bottom"
	suffix = "engine_particle_accelerator_bottom.dmm"
	name = "Particle Accelerator Engine Bottom"

/datum/map_template/ruin/station/engine/antimatter
	id = "engine_am"
	suffix = "engine_antimatter.dmm"
	name = "Antimatter Engine"
	always_spawn_with = list(/datum/map_template/ruin/station/engine/bottom/default = PLACE_BELOW)

/datum/map_template/ruin/station/engine/budget
	id = "engine_budget"
	suffix = "engine_budget.dmm"
	name = "Budget Engine"
	always_spawn_with = list(/datum/map_template/ruin/station/engine/bottom/default = PLACE_BELOW)

/datum/map_template/ruin/station/engine/teg
	id = "engine_teg"
	suffix = "engine_teg.dmm"
	name = "TEG Engine"
	always_spawn_with = list(/datum/map_template/ruin/station/engine/bottom/teg = PLACE_BELOW)

/datum/map_template/ruin/station/engine/bottom/teg
	id = "engine_teg_bottom"
	suffix = "engine_teg_bottom.dmm"
	name = "TEG Engine Bottom"

/datum/map_template/ruin/station/engine/bottom/default
	id = "engine_default_bottom"
	suffix = "engine_default_bottom.dmm"
	name = "Default Engine Bottom"

/datum/map_template/ruin/station/maint_sw
	id = "default_maint_sw"
	suffix = "maint_sw_default.dmm"
	name = "Default Maint SW"

/datum/map_template/ruin/station/maint_sw/arena
	id = "arena_maint_sw"
	suffix = "maint_sw_arena.dmm"
	name = "Arena Maint SW"

/datum/map_template/ruin/station/maint_sw/chess
	id = "chess_maint_sw"
	suffix = "maint_sw_chess.dmm"
	name = "Chess Maint SW"

/datum/map_template/ruin/station/med
	id = "default_med"
	suffix = "medbay_default.dmm"
	name = "Default Medbay"

/datum/map_template/ruin/station/med/durka
	id = "durka_med2"
	suffix = "medbay_psych_v2.dmm"
	name = "Durka Fortress"
	always_spawn_with = list(/datum/map_template/ruin/station/med/durka/bottom = PLACE_BELOW)

/datum/map_template/ruin/station/med/durka/bottom
	id = "durka_med_bottom"
	suffix = "medbay_psych_v2_bottom.dmm"
	name = "Durka Fortress Bottom"

/datum/map_template/ruin/station/med/old
	id = "old_med"
	suffix = "medbay_old.dmm"
	name = "Old Medbay"

/datum/map_template/ruin/station/med/panopticon
	id = "panopticon_med"
	suffix = "medbay_panopticon.dmm"
	name = "Panopticon Medbay"

////	////	МЕТА	////	////

/datum/map_template/ruin/station/meta/engine/tesla
	id = "meta_engine_tesla"
	suffix = "meta_engine_tesla.dmm"
	name = "Meta Tesla"

/datum/map_template/ruin/station/meta/engine/supermatter
	id = "meta_engine_supermatter"
	suffix = "meta_engine_supermatter.dmm"
	name = "Meta Supermatter"
