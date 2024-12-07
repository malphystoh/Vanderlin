/obj/effect/landmark/mapGenerator/rogue/roguetownfield
	mapGeneratorType = /datum/mapGenerator/roguetownfield
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/roguetownfield
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/roguetownfield/grass,/datum/mapGeneratorModule/roguetowngrass,/datum/mapGeneratorModule/roguetownfield,/datum/mapGeneratorModule/roguetownfield/road,/datum/mapGeneratorModule/roguetownswampwaterturf,/datum/mapGeneratorModule/roguetownwaterturf)


/datum/mapGeneratorModule/roguetownfield
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,
							/obj/structure/flora/roguegrass/bush_meagre = 13,
							/obj/structure/flora/roguegrass/herb/random = 30,
							/obj/structure/flora/roguegrass = 50,
							/obj/structure/flora/roguegrass/maneater = 1,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 7,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/closet/dirthole/closed/loot=0.75,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage=0.5)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/road
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 8,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 15)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetowngrass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 20,
						/obj/structure/flora/roguegrass/maneater = 1,
							/obj/item/natural/stone = 7,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/town,/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownwaterturf
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/cleanshallow)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
	                        /obj/structure/flora/roguegrass/water/reeds = 12,
	                        /obj/structure/kneestingers = 6)

/datum/mapGeneratorModule/roguetownswampwaterturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
		                    /obj/structure/flora/roguegrass/water/reeds = 12,
	                        /obj/structure/kneestingers = 3)
