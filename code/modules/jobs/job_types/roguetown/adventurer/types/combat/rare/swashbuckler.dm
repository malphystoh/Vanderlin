//rapier/sabre

/datum/advclass/combat/swashbuckler
	name = "Swashbuckler"
	tutorial = "Woe the Sea King! You awake, dazed from a true festivity of revelry and feasting. The last thing you remember? Your mateys dumping you over the side of the boat as a joke. Now on some Gods foresaken rock, Abyssor will present you with booty and fun, no doubt."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/swashbuckler
	maximum_possible_slots = 1
	min_pq = 0
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/swashbuckler
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/quiver/bolts
	beltl = /obj/item/rogueweapon/sword/sabre/cutlass
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/clothing/neck/roguetown/chaincoif

/datum/outfit/job/roguetown/adventurer/swashbuckler/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3)
		H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_SOOT_BLACK
		H.update_body()
	shirt = pick(/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor, /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("strength", 1)
	H.change_stat("speed", 2)
