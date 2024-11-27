/datum/anvil_recipe/armor
	appro_skill = /datum/skill/craft/armorsmithing
	i_type = "Armor"
	craftdiff = 1

// --------- COPPER -----------
/datum/anvil_recipe/armor/copper
	req_bar = /obj/item/ingot/copper

/datum/anvil_recipe/armor/copper/mask
	name = "Copper mask"
	recipe_name = "a mask of copper"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/mask/rogue/facemask/copper
	craftdiff = 0

/datum/anvil_recipe/armor/copper/bracers
	name = "Copper armbraces"
	recipe_name = "a couple of copper Vambraces"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/wrists/roguetown/bracers/copper
	craftdiff = 0

/datum/anvil_recipe/armor/copper/cap
	name = "Copper cap"
	recipe_name = "a copper cap"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/head/roguetown/helmet/coppercap
	craftdiff = 0

/datum/anvil_recipe/armor/copper/gorget
	name = "Copper neck protector"
	recipe_name = "a neck protector"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/neck/roguetown/gorget/copper
	craftdiff = 0

/datum/anvil_recipe/armor/copper/chest
	name = "Copper heart protector"
	recipe_name = "a very simple armor piece for the chest"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/copperchest
	craftdiff = 0

//For the sake of keeping the code modular with the introduction of new metals, each recipe has had it's main resource added to it's datum
//This way, we can avoid having to name things in strange ways and can simply have iron/cuirass, stee/cuirass, blacksteel/cuirass->
//-> and not messy names like ibreastplate and hplate

// --------- IRON RECIPES -----------


/datum/anvil_recipe/armor/iron
	req_bar = /obj/item/ingot/iron
	craftdiff = 0

/datum/anvil_recipe/armor/iron/chainleg
	name = "Chain chausses"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron
	craftdiff = 0

/datum/anvil_recipe/armor/iron/chaincoif
	name = "Chain coif"
	recipe_name = "a Chain Coif"
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron

/datum/anvil_recipe/armor/iron/chainglove
	name = "Chain gauntlets (x2)"
	recipe_name = "two pairs of Chain Gauntlets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/chainmail
	name = "Chainmail"
	recipe_name = "maille shirt"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron


/datum/anvil_recipe/armor/iron/plate
	name = "Plate armor (3)"
	recipe_name = "heavy armor made of iron plates"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/iron
	craftdiff = 1

/datum/anvil_recipe/armor/iron/platehelmet
	name = "Plate helmet (2)"
	recipe_name = "a heavy iron helmet"
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/ironplate
	craftdiff = 1

/datum/anvil_recipe/armor/iron/pothelmet
	name = "Pot helmet"
	recipe_name = "a sturdy iron helmet"
	created_item = /obj/item/clothing/head/roguetown/helmet/ironpot
	craftdiff = 1

/datum/anvil_recipe/armor/iron/platemask
	name = "Face mask"
	recipe_name = "a Face Mask"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/facemask
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/gorget
	name = "Gorget"
	recipe_name = "a gorget"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/gorget
	craftdiff = 0

/datum/anvil_recipe/armor/iron/platebootlight
	name = "Light plate boots"
	recipe_name = "a pair of Light Plate Boots"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/light

/datum/anvil_recipe/armor/iron/nasal_helmet
	name = "Nasal helmet"
	recipe_name = "a Nasal helmet"
	created_item = /obj/item/clothing/head/roguetown/helmet
	craftdiff = 2

/datum/anvil_recipe/armor/iron/skullcap
	name = "Skullcap"
	recipe_name = "a skullcap"
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap

/datum/anvil_recipe/armor/iron/splint
	name = "Splint Armor (2h)"
	recipe_name = "durable light armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/splint
	craftdiff = 1

// --------- STEEL -----------
/datum/anvil_recipe/armor/steel
	req_bar = /obj/item/ingot/steel
	craftdiff = 2

/datum/anvil_recipe/armor/steel/bevor
	name = "Bevor"
	recipe_name = "a Bevor"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/bevor
	craftdiff = 2

/datum/anvil_recipe/armor/steel/brigadine
	name = "Brigandine (3) (c)"
	recipe_name = "a Brigandine"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine
	craftdiff = 3

/datum/anvil_recipe/armor/steel/helmetbuc
	name = "Bucket helmet"
	recipe_name = "a Bucket Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket)
	craftdiff = 2

/datum/anvil_recipe/armor/steel/chainleg
	name = "Chain chausses"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs
	craftdiff = 2

/datum/anvil_recipe/armor/steel/chaincoif
	name = "Chain coif"
	recipe_name = "a Chain Coif"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif
	craftdiff = 2

/datum/anvil_recipe/armor/steel/chainglove
	name = "Chain gauntlets x2"
	recipe_name = "two pairs of Chain Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/steel/cuirass
	name = "Cuirass"
	recipe_name = "a Cuirass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass
	craftdiff = 2

/datum/anvil_recipe/armor/steel/platemask
	name = "Face mask"
	recipe_name = "a Face Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)
	craftdiff = 2

/datum/anvil_recipe/armor/steel/halfplate
	name = "Half-plate armor (3)"
	recipe_name = "a Half-Plate Armor"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate
	craftdiff = 3

/datum/anvil_recipe/armor/steel/haubergeon
	name = "Haubergeon"
	recipe_name = "a Haubergeon"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail
	craftdiff = 2

/datum/anvil_recipe/armor/steel/hauberk
	name = "Hauberk (2)"
	recipe_name = "a Hauberk"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	craftdiff = 3

/datum/anvil_recipe/armor/steel/helmetkettle
	name = "Kettle helmet"
	recipe_name = "a Kettle Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetslitkettle
	name = "Slitted Kettle helmet"
	recipe_name = "a slitted kettle helmets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle/slit
	craftdiff = 2

/datum/anvil_recipe/armor/steel/froghelmet
	name = "Frog helmet"
	recipe_name = "a frog helmet"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/frog)
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetknight
	name = "Knight's helmet (2)"
	recipe_name = "a Knight's Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/knight)
	craftdiff = 3


/datum/anvil_recipe/armor/steel/hounskull
	name = "Hounskull helmet (3)"
	recipe_name = "a Hounskull Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/hounskull)
	craftdiff = 4

/datum/anvil_recipe/armor/steel/platefull
	name = "Plate armor (4)"
	recipe_name = "a Full-Plate Armor"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full
	craftdiff = 4

/datum/anvil_recipe/armor/steel/platebracer
	name = "Plate vambraces"
	recipe_name = "Plate Vambraces"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers
	craftdiff = 3

/datum/anvil_recipe/armor/steel/plateleg
	name = "Plate chausses x2"
	recipe_name = "a couple of Plate Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/platelegs
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/armor/steel/plateglove
	name = "Plate gauntlets"
	recipe_name = "a pair of Plate Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate
	craftdiff = 3

/datum/anvil_recipe/armor/steel/plateboot
	name = "Plated boots"
	recipe_name = "some Plated Boots"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor
	craftdiff = 3

/datum/anvil_recipe/armor/steel/helmetsall
	name = "Sallet"
	recipe_name = "a Sallet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet
	craftdiff = 2

/datum/anvil_recipe/armor/steel/bascinet
	name = "Bascinet"
	recipe_name = "a bascinet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/bascinet
	craftdiff = 2

/datum/anvil_recipe/armor/steel/scalemail
	name = "Scalemail"
	recipe_name = "a Scalemail"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/medium/scale
	craftdiff = 3

/datum/anvil_recipe/armor/steel/helmetsallv
	name = "Visored sallet (2)"
	recipe_name = "a Visored Sallet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/sallet)
	craftdiff = 3

/datum/anvil_recipe/armor/steel/decoratedhelmetknight
	name = "Decorated Knight's Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/knight
	craftdiff = 4

/datum/anvil_recipe/armor/steel/decoratedhelmetpig
	name = "Decorated Pigface Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/hounskull
	craftdiff = 3

/datum/anvil_recipe/armor/steel/decoratedhelmetbuc
	name = "Decorated Bucket Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/bucket
	craftdiff = 3

/datum/anvil_recipe/armor/steel/decoratedhelmetbucgold
	name = "Decorated Gold-Trimmed Bucket Helmet (3) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/gold,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/golden
	craftdiff = 3

/datum/anvil_recipe/armor/steel/decoratedbascinet
	name = "Decorated Bascinet (c)"
	recipe_name = "a decorated bascinet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/bascinet
	craftdiff = 2

/datum/anvil_recipe/armor/gold
	req_bar = /obj/item/ingot/gold
	craftdiff = 1

/datum/anvil_recipe/armor/gold/mask
	name = "Gold Mask"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/clothing/mask/rogue/facemask/goldmask

// --------- BLACKSTEEL RECIPES-----------
/datum/anvil_recipe/armor/blacksteel
	req_bar = /obj/item/ingot/blacksteel
	craftdiff = 3

/datum/anvil_recipe/armor/blacksteel/platechest
	name = "Blacksteel Plate Armor (4)"
	req_bar = /obj/item/ingot/blacksteel
	additional_items = list(/obj/item/ingot/blacksteel, /obj/item/ingot/blacksteel, /obj/item/ingot/blacksteel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/blkknight

/datum/anvil_recipe/armor/blacksteel/platelegs
	name = "Blacksteel Plate Chausses (2)"
	req_bar = /obj/item/ingot/blacksteel
	additional_items = list(/obj/item/ingot/blacksteel)
	created_item = /obj/item/clothing/under/roguetown/platelegs/blk

/datum/anvil_recipe/armor/blacksteel/bucket
	name = "Blacksteel Bucket Helmet (2)"
	req_bar = /obj/item/ingot/blacksteel
	additional_items = list(/obj/item/ingot/blacksteel)
	created_item = /obj/item/clothing/head/roguetown/helmet/blacksteel/bucket

/datum/anvil_recipe/armor/blacksteel/plategloves
	name = "Blacksteel Plate Gauntlets"
	req_bar = /obj/item/ingot/blacksteel
	created_item = /obj/item/clothing/gloves/roguetown/plate/blk

/datum/anvil_recipe/armor/blacksteel/plateboots
	name = "Blacksteel Plate Boots"
	req_bar = /obj/item/ingot/blacksteel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/blkknight
