/obj/item/sharpener
	name = "whetstone"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "sharpener"
	desc = ""
	force = 5
	var/used = 0
	var/increment = 4
	var/max = 30
	var/prefix = "sharpened"
	var/requires_sharpness = 1


/obj/item/sharpener/attackby(obj/item/I, mob/user, params)
	if(used)
		to_chat(user, "<span class='warning'>The sharpening block is too worn to use again!</span>")
		return
	if(I.force >= max || I.throwforce >= max)//no esword sharpening
		to_chat(user, "<span class='warning'>[I] is much too powerful to sharpen further!</span>")
		return
	if(requires_sharpness && !I.get_sharpness())
		to_chat(user, "<span class='warning'>I can only sharpen items that are already sharp, such as knives!</span>")
		return
	if(I.force > initial(I.force))
		to_chat(user, "<span class='warning'>[I] has already been refined before. It cannot be sharpened further!</span>")
		return
	user.visible_message("<span class='notice'>[user] sharpens [I] with [src]!</span>", "<span class='notice'>I sharpen [I], making it much more deadly than before.</span>")
	playsound(src, 'sound/blank.ogg', 25, TRUE)
	I.sharpness = IS_SHARP_ACCURATE
	I.force = CLAMP(I.force + increment, 0, max)
	I.throwforce = CLAMP(I.throwforce + increment, 0, max)
	I.name = "[prefix] [I.name]"
	name = "worn out [name]"
	desc = ""
	used = 1
	update_icon()

/obj/item/sharpener/super
	name = "super whetstone"
	desc = ""
	increment = 200
	max = 200
	prefix = "super-sharpened"
	requires_sharpness = 0
