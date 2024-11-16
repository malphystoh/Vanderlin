//dwarf tank with 2h axe or 2h hammer
//old only

/datum/advclass/combat/longbeard
	name = "Longbeard"
	tutorial = "You've earned your place as one of the old grumblers, a pinnacle of tradition, justice, and willpower. You've come to establish order in these lands, and with your hammer of grudges you'll see it through."
	allowed_ages = list( AGE_MIDDLEAGED, AGE_OLD)
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Dwarf")
	outfit = /datum/outfit/job/roguetown/adventurer/longbeard
	maximum_possible_slots = 1
	pickprob = 15
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 2
	cmode_music = 'sound/music/combat_dwarf.ogg'

/datum/outfit/job/roguetown/adventurer/longbeard/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/armorsmithing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/weaponsmithing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.change_stat("strength", 2) // Same stat spread as lancer/swordmaster, but no -1 speed at the cost of 1 point of endurance. A very powerful dwarf indeed
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 1)

	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/rogueweapon/mace/goden/steel/warhammer
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/roguetown/boots/rare/dwarfplate
	gloves = /obj/item/clothing/gloves/roguetown/rare/dwarfplate
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	armor = /obj/item/clothing/suit/roguetown/armor/rare/dwarfplate
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/rare/dwarfplate
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Nothing fazes a longbeard
