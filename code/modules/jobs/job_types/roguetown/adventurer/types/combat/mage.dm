/datum/advclass/combat/mage
	name = "Mage"
	tutorial = "Mages are usually grown-up apprentices of wizards. They are seeking adventure, using their arcyne knowledge to aid other adventurers."
	allowed_sexes = list(MALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Half-Orc"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/mage
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/adventurer/mage
	allowed_patrons = list(/datum/patron/divine/noc)

/datum/outfit/job/roguetown/adventurer/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/polearm/woodstaff
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
		if(H.age == AGE_OLD)
			head = /obj/item/clothing/head/roguetown/wizhat/gen
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/plain
			backl = /obj/item/storage/backpack/rogue/backpack
			H.mind?.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.change_stat("intelligence", 1)
		H.change_stat("strength", -2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -2)
		H.change_stat("endurance", -1)
		H.change_stat("speed", -2)
		H.mind.adjust_spellpoints(7)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/learnspell)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
