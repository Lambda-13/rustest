/////////////////////////////////////
//////////Limb Grower Designs ///////
/////////////////////////////////////

/datum/design/leftarm
	id = "l_arm"
	name = "Левая Рука"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 25)
	build_path = /obj/item/bodypart/l_arm
	category = list("initial",SPECIES_HUMAN,SPECIES_LIZARD,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ETHEREAL,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_GOLEM,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL)

/datum/design/rightarm
	id = "r_arm"
	name = "Правая Рука"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 25)
	build_path = /obj/item/bodypart/r_arm
	category = list("initial",SPECIES_HUMAN,SPECIES_LIZARD,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ETHEREAL,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_GOLEM,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL)

/datum/design/leftleg
	id = "l_leg"
	name = "Левая Нога"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/left
	category = list("initial",SPECIES_HUMAN,SPECIES_LIZARD,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ETHEREAL,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_GOLEM,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL)

/datum/design/rightleg
	id = "r_leg"
	name = "Правая Нога"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/right
	category = list("initial",SPECIES_HUMAN,SPECIES_LIZARD,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ETHEREAL,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_GOLEM,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL)

/datum/design/digitigrade/leftleg
	id = "digi_l_leg"
	name = "Чешуйчатая Левая Нога"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/left/lizard/digitigrade
	category = list("initial",SPECIES_LIZARD)

/datum/design/digitigrade/rightleg
	id = "digi_r_leg"
	name = "Чешуйчатая Правая Нога"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/right/lizard/digitigrade
	category = list("initial",SPECIES_LIZARD)

//Non-limb limb designs

/datum/design/heart
	name = "Сердце"
	id = "heart"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 30)
	build_path = /obj/item/organ/heart
	category = list("initial", SPECIES_HUMAN)

/datum/design/lungs
	name = "Легкие"
	id = "lungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/lungs
	category = list("initial",SPECIES_HUMAN)

/datum/design/liver
	name = "Печень"
	id = "liver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/liver
	category = list("initial",SPECIES_HUMAN)

/datum/design/stomach
	name = "Желудок"
	id = "stomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 15)
	build_path = /obj/item/organ/stomach
	category = list("initial",SPECIES_HUMAN)

/datum/design/appendix
	name = "Аппендикс"
	id = "appendix"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 5) //why would you need this
	build_path = /obj/item/organ/appendix
	category = list("initial",SPECIES_HUMAN)

/datum/design/eyes
	name = "Глаза"
	id = "eyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/eyes
	category = list("initial",SPECIES_HUMAN)

/datum/design/ears
	name = "Уши"
	id = "ears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/ears
	category = list("initial",SPECIES_HUMAN)

/datum/design/tongue
	name = "Язык"
	id = "tongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue
	category = list("initial",SPECIES_HUMAN)

// Grows a fake lizard tail - not usable in lizard wine and other similar recipes.
/datum/design/lizard_tail
	name = "Хвост Ящера"
	id = "liztail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tail/lizard/fake
	category = list("initial",SPECIES_LIZARD)

/datum/design/lizard_tongue
	name = "Раздвоенный Язык"
	id = "liztongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/lizard
	category = list("initial",SPECIES_LIZARD)

/datum/design/monkey_tail
	name = "Обезьяний Хвост"
	id = "monkeytail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/tail/monkey
	category = list("other","initial")

/datum/design/cat_tail
	name = "Кошачий Хвост"
	id = "cattail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tail/cat
	category = list("initial",SPECIES_HUMAN)

/datum/design/cat_ears
	name = "Кошачьи Уши"
	id = "catears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/ears/cat
	category = list("initial",SPECIES_HUMAN)

/datum/design/fox_tail
	name = "Fox Tail"
	id = "foxtail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tail/fox
	category = list("initial",SPECIES_HUMAN)

/datum/design/fox_ears
	name = "Fox Ears"
	id = "foxears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/ears/fox
	category = list("initial",SPECIES_HUMAN)

/datum/design/lizard_tongue
	name = "Lizard Tongue"
	id = "lizardtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/lizard
	category = list("initial",SPECIES_LIZARD)

/datum/design/plasmaman_lungs
	name = "Плазменный Фильтр"
	id = "plasmamanlungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/lungs/plasmaman
	category = list("initial",SPECIES_PLASMAMAN)

/datum/design/plasmaman_tongue
	name = "Плазменный Костяной Язык"
	id = "plasmamantongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10, /datum/reagent/toxin/plasma = 10)
	build_path = /obj/item/organ/tongue/bone/plasmaman
	category = list("initial",SPECIES_PLASMAMAN)

/datum/design/plasmaman_liver
	name = "Кристалл для обработки реагентов"
	id = "plasmamanliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/liver/plasmaman
	category = list("initial",SPECIES_PLASMAMAN)

/datum/design/plasmaman_stomach
	name = "Пищеварительный кристалл"
	id = "plasmamanstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/stomach/plasmaman
	category = list("initial",SPECIES_PLASMAMAN)

/datum/design/ethereal_stomach
	name = "Биохимическая батарея"
	id = "etherealstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20, /datum/reagent/consumable/liquidelectricity = 20)
	build_path = /obj/item/organ/stomach/ethereal
	category = list("initial",SPECIES_ETHEREAL)

/datum/design/ethereal_tongue
	name = "Электрический разрядник"
	id = "etherealtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10, /datum/reagent/consumable/liquidelectricity = 10)
	build_path = /obj/item/organ/tongue/ethereal
	category = list("initial",SPECIES_ETHEREAL)

/datum/design/moth_eyes
	name = "Moth Eyes"
	id = "motheyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/eyes/compound
	category = list("initial",SPECIES_MOTH)

/datum/design/moth_tongue
	name = "Moth Tongue"
	id = "mothtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/moth
	category = list("initial",SPECIES_MOTH)

/datum/design/moth_wings
	name = "Moth Wings"
	id = "mothwings"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/moth_wings
	category = list("initial",SPECIES_MOTH)


/datum/design/spider_tongue
	name = "Spider Tongue"
	id = "spidertongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/spider
	category = list("initial",SPECIES_RACHNID)

/datum/design/spider_eyes
	name = "Spider Eyes"
	id = "spidereyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/eyes/night_vision/spider
	category = list("initial",SPECIES_RACHNID)

/datum/design/kepori_tongue
	name = "Kepori Tongue"
	id = "keporitongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/kepori
	category = list("initial",SPECIES_KEPORI)

/datum/design/vox_tongue
	name = "Vox Tongue"
	id = "voxtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/vox
	category = list("initial",SPECIES_VOX)

/datum/design/abductor_tongue
	name = "Abductor Tongue"
	id = "abductortongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/abductor
	category = list("initial",SPECIES_ABDUCTOR)

/datum/design/fly_tongue
	name = "Flyperson Tongue"
	id = "flytongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/fly
	category = list("initial",SPECIES_FLYPERSON)

/datum/design/fly_liver
	name = "Flyperson Liver"
	id = "flyliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/liver/fly
	category = list("initial",SPECIES_FLYPERSON)

/datum/design/fly_stomach
	name = "Flyperson Stomach"
	id = "flystomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/stomach/fly
	category = list("initial",SPECIES_FLYPERSON)

/datum/design/golem_tongue
	name = "Golem Tongue"
	id = "golemtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/golem_base
	category = list("initial",SPECIES_GOLEM)

/datum/design/golem_vocal_chords
	name = "Adamantine Vocal Chords"
	id = "golemvocalchords"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/vocal_cords/adamantine
	category = list("initial",SPECIES_GOLEM)

/datum/design/golem_resonator
	name = "Adamantine Resonator"
	id = "golemresonator"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/adamantine_resonator
	category = list("initial",SPECIES_GOLEM)

/datum/design/golem_vocal_chords
	name = "Adamantine Vocal Chords"
	id = "golemvocalchords"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/vocal_cords/adamantine
	category = list("initial",SPECIES_GOLEM)

/datum/design/skeleton_tongue
	name = "Skeleton... Tongue?"
	id = "skeletontongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10, /datum/reagent/consumable/milk = 20)
	build_path = /obj/item/organ/tongue/bone
	category = list("initial",SPECIES_SKELETON)

/datum/design/snail_tongue
	name = "Snail Tongue"
	id = "snailtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/snail
	category = list("initial",SPECIES_SNAIL)

/datum/design/snail_eyes
	name = "Snail Eyes"
	id = "snaileyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/eyes/snail
	category = list("initial",SPECIES_SNAIL)

/datum/design/xeno_tongue
	name = "Xenomorph Tongue"
	id = "xenotongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tongue/alien
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/xeno_eyes
	name = "Xenomorph Eyes"
	id = "xenoeyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 40)
	build_path = /obj/item/organ/eyes/night_vision/alien
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/xeno_liver
	name = "Xenomorph Liver"
	id = "xenoliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/liver/alien
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/xeno_vessel
	name = "Xenomorph Plasma Vessel"
	id = "xenovessel"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 40, /datum/reagent/toxin/acid = 20, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/alien/plasmavessel
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/xeno_resin
	name = "Xenomorph Resin Spinner"
	id = "xenoresin"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 40, /datum/reagent/toxin/acid = 20)
	build_path = /obj/item/organ/alien/resinspinner
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/xeno_acid
	name = "Xenomorph Acid Gland"
	id = "xenoacid"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 40, /datum/reagent/toxin/acid = 20)
	build_path = /obj/item/organ/alien/acid
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/xeno_neurotoxin
	name = "Xenomorph Neurotoxin Gland"
	id = "xenoneurotoxin"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 40, /datum/reagent/toxin/acid = 20)
	build_path = /obj/item/organ/alien/neurotoxin
	category = list("initial",SPECIES_XENOMORPH)

/datum/design/armblade
	name = "Рука-лезвие"
	id = "armblade"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 75)
	build_path = /obj/item/melee/synthetic_arm_blade
	category = list("other","emagged")

/// Design disks and designs - for adding limbs and organs to the limbgrower.
/obj/item/disk/design_disk/limbs
	name = "Limb Design Disk"
	desc = "A disk containing limb and organ designs for a limbgrower."
	var/species = "debug"

/obj/item/disk/design_disk/limbs/Initialize()
	.=..()
	var/race
	switch(species)
		if(SPECIES_ABDUCTOR)
			race = "Abductor"
		if(SPECIES_FLYPERSON)
			race = "Flyperson"
		if(SPECIES_GOLEM)
			race = "Golem"
		if(SPECIES_POD)
			race = "Phytosian"
		if(SPECIES_SKELETON)
			race = "Skeleton"
		if(SPECIES_SNAIL)
			race = "Snailperson"
		if(SPECIES_XENOMORPH)
			race = "Xenomorph"
		else
			race = "Alien"
	desc += " This one contains designs for [race] anatomy."

/datum/design/limb_disk
	name = "Диск для Биосинтезатора"
	desc = "Диск, содержащий данные для выращивания конечностей и органов для Биосинтезатора."
	id = "limbdesign_parent"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/design_disk/limbs
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/obj/item/disk/design_disk/limbs/abductor
	name = "Abductor Limb Design Disk"
	species = SPECIES_ABDUCTOR

/datum/design/limb_disk/abductor
	name = "Abductor Limb Design Disk"
	desc = "Contains designs for abductor bodyparts and organs for the limbgrower."
	id = "limbdesign_abductor"
	build_path = /obj/item/disk/design_disk/limbs/abductor

/obj/item/disk/design_disk/limbs/fly
	name = "Flyperson Limb Design Disk"
	species = SPECIES_FLYPERSON

/datum/design/limb_disk/fly
	name = "Fly Limb Design Disk"
	desc = "Contains designs for flyperson bodyparts and organs for the limbgrower."
	id = "limbdesign_fly"
	build_path = /obj/item/disk/design_disk/limbs/fly

/obj/item/disk/design_disk/limbs/golem
	name = "Golem Limb Design Disk"
	species = SPECIES_GOLEM

/datum/design/limb_disk/golem
	name = "Golem Limb Design Disk"
	desc = "Contains designs for golem bodyparts and organs for the limbgrower."
	id = "limbdesign_golem"
	build_path = /obj/item/disk/design_disk/limbs/golem

/obj/item/disk/design_disk/limbs/pod
	name = "Phytosian Limb Design Disk"
	species = SPECIES_POD

/datum/design/limb_disk/pod
	name = "Phytosian Limb Design Disk"
	desc = "Contains designs for phytosian bodyparts and organs for the limbgrower."
	id = "limbdesign_pod"
	build_path = /obj/item/disk/design_disk/limbs/pod

/obj/item/disk/design_disk/limbs/skeleton
	name = "Skeleton Limb Design Disk"
	species = SPECIES_SKELETON

/datum/design/limb_disk/skeleton
	name = "Skeleton Limb Design Disk"
	desc = "Contains designs for skeleton bodyparts and organs for the limbgrower."
	id = "limbdesign_skeleton"
	build_path = /obj/item/disk/design_disk/limbs/skeleton

/obj/item/disk/design_disk/limbs/snail
	name = "Snail Limb Design Disk"
	species = SPECIES_SNAIL

/datum/design/limb_disk/snail
	name = "Snail Limb Design Disk"
	desc = "Contains designs for snail bodyparts and organs for the limbgrower."
	id = "limbdesign_snail"
	build_path = /obj/item/disk/design_disk/limbs/snail

/obj/item/disk/design_disk/limbs/xeno
	name = "Xenomorph Limb Design Disk"
	species = SPECIES_XENOMORPH

/datum/design/limb_disk/xeno
	name = "Xenomorph Limb Design Disk"
	desc = "Contains designs for xenomorph bodyparts and organs for the limbgrower."
	id = "limbdesign_xenomorph"
	build_path = /obj/item/disk/design_disk/limbs/xeno
