/datum/anvil_recipe/weapons
	appro_skill = /datum/skill/craft/weaponsmithing
	craftdiff = 1
	i_type = "Weapons"

// SILVER - Harder to craft, does less damage and has less durability than steel, but banes undead.

/datum/anvil_recipe/weapons/silver/dagger
	name = "Silver Dagger"
	recipe_name = "a Silver Dagger"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/knife/dagger/silver
	craftdiff = 2

/datum/anvil_recipe/weapons/silver/sword_silver
	name = "Silver Sword"
	recipe_name = "a Silver Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/sword/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/rapier_silver
	name = "Silver Rapier"
	recipe_name = "a Silver Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/sword/rapier/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/forgotten
	name = "Forgotten Blade (2)"
	recipe_name = "a Forgotten Blade"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/forgotten
	craftdiff = 4

// COPPER TIER - TODO: Move these to redsmithing in future

/datum/anvil_recipe/weapons/copper/caxe
	name = "Axe (2)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = /obj/item/rogueweapon/axe/copper
	craftdiff = 0

/datum/anvil_recipe/weapons/copper/cbludgeon
	name = "Bludgeon (+s)"
	recipe_name = "a Bludgeon"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/copperbludgeon
	craftdiff = 0

/datum/anvil_recipe/weapons/copper/cdagger
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/rogueweapon/knife/copper
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

//datum/anvil_recipe/weapons/copper/cmace
//	name = "Mace (2)"
//	recipe_name = "a Mace"
//	appro_skill = /datum/skill/craft/weaponsmithing
//	req_bar = /obj/item/ingot/copper
//	additional_items = list(/obj/item/ingot/copper)
//	created_item = (/obj/item/rogueweapon/mace/coppermace)
//	craftdiff = 0

/datum/anvil_recipe/weapons/copper/cmesser
	name = "Messer (+1s)"
	recipe_name = "a Messer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sword/coppermesser
	craftdiff = 0

/datum/anvil_recipe/weapons/copper/cspears
	name = "Spear x2 (+w)"
	recipe_name = "two Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/stone/copper
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/weapons/copper/cfalx
	name = "Copper Falx (2)"
	recipe_name = "a great copper sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = /obj/item/rogueweapon/sword/long/rider/copper
	craftdiff = 0

// IRON GEAR - Middle Tier, what most disgusting Men at Arms have

/datum/anvil_recipe/weapons/iron/arrows
	name = "Arrows x5 (+s)"
	recipe_name = "five Arrows"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/arrow
	createmultiple = TRUE
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/axe_iron
	name = "Axe (+s)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/axe/iron

/datum/anvil_recipe/weapons/iron/bardiche
	name = "Bardiche (2) (+w)"
	recipe_name = "a Bardiche"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/woodcutter
	name = "woodcutter great axe (+w)"
	recipe_name = "a great axe for woodcutters"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter
	craftdiff = 1

/datum/anvil_recipe/weapons/iron/warcutter
	name = "War axe (2) (+w)"
	recipe_name = "a war greataxe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/warcutter
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/bolts
	name = "Crossbow Bolt x5 (+s)"
	recipe_name = "five Crossbow Bolts"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/bolt
	createmultiple = TRUE
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 1

/datum/anvil_recipe/weapons/iron/bullets
	name = "Lead Bullets x5 (+s)"
	recipe_name = "five Lead Bullets"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/ammo_casing/caseless/rogue/bullet
	createmultiple = TRUE
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/dagger_iron
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/dagger
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0 // To train with

/datum/anvil_recipe/weapons/iron/dagger_iron
	name = "peasant knife x3"
	recipe_name = "three peasantry knives"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/villager
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/flail_iron
	name = "Militia flail (+c) (+s)"
	recipe_name = "a militia flail"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/militia


/datum/anvil_recipe/weapons/iron/lucerne
	name = "Lucerne (2) (+w)"
	recipe_name = "a Lucerne"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/eaglebeak/lucerne
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/sledgehammer
	name = "Sledgehammer(+s)"
	recipe_name = "a big hammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = 	/obj/item/rogueweapon/hammer/sledgehammer

/datum/anvil_recipe/weapons/iron/mace_iron
	name = "Mace (+s)"
	recipe_name = "a Mace"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace

/datum/anvil_recipe/weapons/iron/messer_iron
	name = "Messer"
	recipe_name = "a Messer"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/scimitar/messer

/datum/anvil_recipe/weapons/iron/spear_iron
	name = "Spear x2 (+w)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/iron/shortsword_iron
	name = "Short sword"
	recipe_name = "a Short Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/short
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/sword_iron
	name = "Sword"
	recipe_name = "a Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron

/datum/anvil_recipe/weapons/iron/sword_iron
	name = "Estoc"
	recipe_name = "a Duelist Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/rapier/ironestoc

/datum/anvil_recipe/weapons/iron/towershield
	name = "Tower Shield (+w)"
	recipe_name = "a Tower Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/shield/tower
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/ironbuckler
	name = "Buckler"
	recipe_name = "a small Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/shield/tower/buckleriron
	craftdiff = 1

/datum/anvil_recipe/weapons/iron/warclub
	name = "Warclub (+w)"
	recipe_name = "a Warclub"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/zweihander
	name = "Zweihander (3)"
	recipe_name = "a Zweihander"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/sword/long/greatsword/zwei
	craftdiff = 3

// STEEL GEAR - Fancy shit for Knights

/datum/anvil_recipe/weapons/steel/axe_steel
	name = "Axe (+s)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/axe/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/warhammer
	name = "Warhammer(+s)"
	recipe_name = "a big warhammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = 	/obj/item/rogueweapon/hammer/sledgehammer/war


/datum/anvil_recipe/weapons/steel/battleaxe
	name = "Battle Axe (2)"
	recipe_name = "a Battle Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/axe/battle
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/billhook
	name = "Billhook (+w)"
	recipe_name = "a Billhook"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/billhook
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/cleaver
	name = "Cleaver"
	recipe_name = "a Cleaver"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/cleaver
	craftdiff = 1

/datum/anvil_recipe/weapons/steel/crossbow_eng
	name = "Crossbow (+w) (+f)"
	recipe_name = "a Crossbow"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/natural/fibers)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	craftdiff = 1 // Minimal engineering needed

/datum/anvil_recipe/weapons/steel/cutlass_steel
	name = "Cutlass"
	recipe_name = "a Cutlass"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre/cutlass
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/dagger_steel
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/dagger/steel
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/decsaber
	name = "Decorated sabre (+g)"
	recipe_name = "a Decorated Sabre"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/decsword
	name = "Decorated sword (+g)"
	recipe_name = "a Decorated Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/decorated
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/decrapier
	name = "Decorated rapier (+g)"
	recipe_name = "a Decorated Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/rapier/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/eaglebeak
	name = "Eagle's Beak (2) (+w)"
	recipe_name = "an Eagle's Beak"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/eaglebeak
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/flail_steel
	name = "Flail (+c) (+s)"
	recipe_name = "a Flail"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/sflail
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/grandmace
	name = "Grand Mace (+w)"
	recipe_name = "a Grand Mace"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/greatsword
	name = "Greatsword (3)"
	recipe_name = "a Greatsword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/greatsword
	craftdiff = 4

/datum/anvil_recipe/weapons/steel/halberd
	name = "Halberd (2) (+w)"
	recipe_name = "a Halberd"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd
	craftdiff = 4

/datum/anvil_recipe/weapons/steel/huntknife
	name = "Hunting knife"
	recipe_name = "a Hunting Knife"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/hunting
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/kiteshield
	name = "Kite Shield (2) (+h)"
	recipe_name = "a Kite Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/hide)
	created_item = /obj/item/rogueweapon/shield/tower/metal
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/longsword
	name = "Longsword (2)"
	recipe_name = "a Longsword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/mace_steel
	name = "Mace (2)"
	recipe_name = "a Mace"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/peasant_flail
	name = "Peasant Flail (+c) (+w)"
	recipe_name = "a two-handed flail"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/flail/peasant
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/paxe
	name = "Pick-Axe (2) (+s)"
	recipe_name = "a Pick that is also an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pick/paxe
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/rapier_steel
	name = "Rapier"
	recipe_name = "a Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/rapier
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/saber_steel
	name = "Sabre"
	recipe_name = "a Sabre"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/shortsword
	name = "Shortsword"
	recipe_name = "a Short Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short
	craftdiff = 1

/datum/anvil_recipe/weapons/steel/sword_steel
	name = "Sword"
	recipe_name = "a Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/arming
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/scimitar_steel
	name = "Scimitar"
	recipe_name = "a Zybean Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/scimitar
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/falchion
	name = "Falchion"
	recipe_name = "a heavy one handed sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/scimitar/falchion
	craftdiff = 2

/datum/anvil_recipe/weapons/bronze/gladius
	name = "Gladius"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/rogueweapon/sword/gladius
	craftdiff = 2

/datum/anvil_recipe/weapons/bronze/spear
	name = "Bronze Spear (+1 Bronze, +1 Small Log)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/bronze
	craftdiff = 0
