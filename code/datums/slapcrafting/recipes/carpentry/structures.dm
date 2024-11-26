/datum/slapcraft_recipe/carpentry/structure/barrel
	name = "wooden barrel"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer
		)
	result_type = /obj/structure/fermenting_barrel/crafted


/datum/slapcraft_recipe/carpentry/structure/door
	name = "wooden door"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/small_log_second,
		/datum/slapcraft_step/use_item/carpentry/hammer
		)
	result_type = /obj/structure/mineral_door/wood/deadbolt

/datum/slapcraft_recipe/carpentry/structure/roguebin
	name = "wooden bin"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/small_log_second,
		/datum/slapcraft_step/use_item/carpentry/hammer
		)
	result_type = /obj/item/roguebin

/datum/slapcraft_recipe/carpentry/structure/dye_bin
	name = "dye bin"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/jacksberry,
		/datum/slapcraft_step/item/dirtclod
		)
	result_type = /obj/machinery/simple_dye_bin

/datum/slapcraft_recipe/carpentry/structure/chair
	name = "wooden chair"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer
		)
	result_type = /obj/item/chair/rogue/crafted

/datum/slapcraft_recipe/carpentry/structure/stool
	name = "wooden stool"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer
		)
	result_type = /obj/item/chair/stool/bar/rogue/crafted

/datum/slapcraft_recipe/carpentry/structure/loom
	name = "loom"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/small_log_second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/stick,
		/datum/slapcraft_step/item/stick/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/fiber,
		/datum/slapcraft_step/item/fiber/second,
		)
	result_type = /obj/machinery/loom


/datum/slapcraft_recipe/carpentry/structure/handcart
	name = "handcart"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/small_log_second,
		/datum/slapcraft_step/item/small_log/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/rope,
		)
	result_type = /obj/structure/handcart


/datum/slapcraft_recipe/carpentry/structure/noose
	name = "noose"
	steps = list(
		/datum/slapcraft_step/item/rope,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/noose
	craftsound = 'sound/foley/noose_idle.ogg'

/datum/slapcraft_recipe/carpentry/structure/noose/check_craft_requirements(mob/user, turf/T)
	var/turf/checking = get_step_multiz(T, UP)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	return TRUE


/datum/slapcraft_recipe/carpentry/structure/psycrss
	name = "wooden cross"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/stake,
		/datum/slapcraft_step/item/stake/second,
		/datum/slapcraft_step/item/stake/third,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/fluff/psycross/crafted

/datum/slapcraft_recipe/carpentry/structure/pyre
	name = "wooden pyre"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/small_log/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/stake,
		/datum/slapcraft_step/item/stake/second,
		/datum/slapcraft_step/item/stake/third,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/machinery/light/rogue/campfire/pyre

/datum/slapcraft_recipe/carpentry/structure/stairsd
	name = "stairs"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/plank/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/stairs/d

/datum/slapcraft_recipe/carpentry/structure/stairsd/check_craft_requirements(mob/user, turf/T)
	var/turf/checking = get_step(T, user.dir)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step_multiz(checking, DOWN)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE

/datum/slapcraft_recipe/carpentry/structure/fence
	name = "palisade"
	steps = list(
		/datum/slapcraft_step/item/stake,
		/datum/slapcraft_step/item/stake/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/fluff/railing/fence

/datum/slapcraft_recipe/carpentry/structure/chest
	name = "chest"
	steps = list(
		/datum/slapcraft_step/item/stake,
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/small_log/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/closet/crate/chest/crafted

/datum/slapcraft_recipe/carpentry/structure/closet
	name = "closet"
	steps = list(
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/small_log/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/closet/crate/roguecloset/crafted

/datum/slapcraft_recipe/carpentry/structure/coffin
	name = "wooden coffin"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/plank/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/closet/crate/coffin
	craftdiff = 1

/datum/slapcraft_recipe/carpentry/structure/nicebed
	name = "nice bed"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/plank/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/cloth,
		/datum/slapcraft_step/use_item/sewing/needle,
		)
	result_type = /obj/structure/bed/rogue
	craftdiff = 2

/datum/slapcraft_recipe/carpentry/structure/sign
	name = "custom sign"
	steps = list(
		/datum/slapcraft_step/item/stick,
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/fluff/customsign
	craftdiff = 1

/datum/slapcraft_recipe/carpentry/structure/training_dummy
	name = "training dummy"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/stick,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/fluff/statue/tdummy
	craftdiff = 1

/datum/slapcraft_recipe/carpentry/structure/display_stand
	name = "display stand"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/item/stick,
		/datum/slapcraft_step/item/stick/second,
		/datum/slapcraft_step/item/stick/third,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/mannequin
	craftdiff = 2

/datum/slapcraft_recipe/carpentry/structure/mannequin_female
	name = "female maniquen"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/iron,
		/datum/slapcraft_step/item/cloth,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/mannequin/male/female
	craftdiff = 2

/datum/slapcraft_recipe/carpentry/structure/mannequin_male
	name = "male mannequin"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/small_log,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/iron,
		/datum/slapcraft_step/item/cloth,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/mannequin/male
	craftdiff = 2

/datum/slapcraft_recipe/carpentry/structure/wall_ladder
	name = "wall ladder"
	steps = list(
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/item/plank/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/stick,
		/datum/slapcraft_step/item/stick/second,
		/datum/slapcraft_step/item/stick/third,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/wallladder
	craftdiff = 0
	offset_forward = TRUE

/datum/slapcraft_recipe/carpentry/structure/wall_ladder/check_craft_requirements(mob/user, turf/T)
	if(!isclosedturf(T))
		return FALSE
	return TRUE


/datum/slapcraft_recipe/carpentry/structure/table
	name = "wooden table"
	steps = list(
		/datum/slapcraft_step/item/stick,
		/datum/slapcraft_step/item/stick/second,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		/datum/slapcraft_step/item/plank,
		/datum/slapcraft_step/use_item/carpentry/hammer,
		)
	result_type = /obj/structure/table/wood/crafted
	craftdiff = 0
