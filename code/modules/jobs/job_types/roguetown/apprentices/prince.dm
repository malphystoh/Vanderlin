/datum/job/roguetown/prince
	title = "Prince"
	flag = PRINCE
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	f_title = "Princess"
	allowed_races = list(
		"Humen",
		"Half-Elf"
	)
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	cmode_music = 'sound/music/combat_noble.ogg'

	tutorial = "You’ve never felt the gnawing of the winter, never known the bite of hunger and certainly have never known a honest day's work. You are as free as any bird in the sky, and you may revel in your debauchery for as long as your parents remain upon the throne: But someday you’ll have to grow up, and that will be the day your carelessness will cost you more than a few mammons."

	outfit = /datum/outfit/job/roguetown/prince
	display_order = JDO_PRINCE
	give_bank_account = TRUE
	bypass_lastclass = TRUE
	min_pq = 2

/datum/job/roguetown/prince/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	SSfamilytree.AddRoyal(L, FAMILY_PROGENY)

/datum/outfit/job/roguetown/prince/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/roguekey/manor
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(H.mind)
			H.mind?.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("endurance", -1)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)
			if(H.dna?.species)
				H.dna.species.soundpack_m = new /datum/voicepack/male/squire()
	else
		head = /obj/item/clothing/head/roguetown/hennin
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		beltl = /obj/item/roguekey/manor
		backr = /obj/item/storage/backpack/rogue/satchel
		if(H.mind)
			H.mind?.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("endurance", -1)
			H.change_stat("strength", -1)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
