// Important documents and research exports.

/datum/export/papers
	include_subtypes = FALSE

/datum/export/papers/documents
	cost = 5000
	unit_name = "secret documents"
	export_types = list(/obj/item/documents)
	include_subtypes = TRUE

/datum/export/papers/research/tiny
	cost = 500
	unit_name = "secret documents"
	export_types = list(/obj/item/research_notes/loot/tiny)
	include_subtypes = FALSE

/datum/export/papers/research/small
	cost = 2000
	unit_name = "secret documents"
	export_types = list(/obj/item/research_notes/loot/small)
	include_subtypes = FALSE

/datum/export/papers/research/medium
	cost = 4000
	unit_name = "secret documents"
	export_types = list(/obj/item/research_notes/loot/medium)
	include_subtypes = FALSE

/datum/export/papers/research/big
	cost = 7500
	unit_name = "secret documents"
	export_types = list(/obj/item/research_notes/loot/big)
	include_subtypes = FALSE

/datum/export/papers/research/genius
	cost = 15000
	unit_name = "secret documents"
	export_types = list(/obj/item/research_notes/loot/genius)
	include_subtypes = FALSE