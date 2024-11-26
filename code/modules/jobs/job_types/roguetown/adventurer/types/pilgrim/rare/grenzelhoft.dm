/datum/advclass/pilgrim/rare/grenzelhoft
	name = "Grenzelhoft Count"
	tutorial = "A Count hailing from the Grenzelhoft Imperiate, here on an official visit to the Isle of the Enigma."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Dwarf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/grenzelhoft
	category_tags = list(CTAG_PILGRIM)
	maximum_possible_slots = 1
	pickprob = 30
	min_pq = 0

	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/outfit/job/roguetown/adventurer/grenzelhoft/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzel
	wrists = /obj/item/clothing/neck/roguetown/psycross/g
	head = /obj/item/clothing/head/roguetown/helmet/skullcap/grenzelhoft
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/rogueweapon/sword/sabre/dec
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	pants = /obj/item/clothing/under/roguetown/grenzelpants
	neck = /obj/item/clothing/neck/roguetown/gorget
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/veryrich)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt
		beltl = /obj/item/rogueweapon/sword/rapier/dec
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Count"
		if(H.gender == FEMALE)
			honorary = "Countess"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"
		if(!H.has_language(/datum/language/oldpsydonic))
			H.grant_language(/datum/language/oldpsydonic)
			to_chat(H, "<span class='info'>I can speak Old Psydonic with ,m before my speech.</span>")
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 2)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
