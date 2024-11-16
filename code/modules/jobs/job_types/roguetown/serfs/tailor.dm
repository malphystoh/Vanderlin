/datum/job/roguetown/tailor
	title = "Tailor"
	flag = TAILOR
	department_flag = SERFS
	faction = "Station"
	tutorial = "Cloth, linen, silk and leather. You've tirelessly studied and poured your life into \
				sewing articles of slight protection, padding, and fashion for serf and noble alike."
	total_positions = 0
	spawn_positions = 0
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	give_bank_account = TRUE
	bypass_lastclass = TRUE
	display_order = JDO_TAILOR

	outfit = /datum/outfit/job/roguetown/tailor


/datum/outfit/job/roguetown/tailor/pre_equip(mob/living/carbon/human/H)
	..()

	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	head = /obj/item/clothing/head/roguetown/courtierhat
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, pick(3,4), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/tanning, pick(3,4), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/red
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/red
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/red
		cloak = /obj/item/clothing/cloak/raincloak/red
	else
		cloak = /obj/item/clothing/cloak/raincloak/purple
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/purple
		pants = /obj/item/clothing/under/roguetown/tights/purple

