//NOT using the existing /obj/machinery/door type, since that has some complications on its own, mainly based on its
//machineryness
/proc/lockid_to_lockpick_difficulty(lockid)
	if(!lockid)
		return 5
	var/static/list/lock_difficulties = list(
		ACCESS_VAULT = 1,
		ACCESS_LORD = 1,
		ACCESS_MANOR = 2,
		ACCESS_GUEST = 2,
		ACCESS_DUNGEON = 2,
		ACCESS_FOREST = 2,
		ACCESS_GARRISON = 2,
		ACCESS_FARM = 4,
		ACCESS_WAREHOUSE = 3,
		ACCESS_CAPTAIN = 3,
		ACCESS_MERCHANT = 5,
		ACCESS_INN = 5,
		ACCESS_SMITH = 3,
		ACCESS_BUTCHER = 3,
		ACCESS_MANOR_GATE = 2,
		ACCESS_PRIEST = 2,
		ACCESS_CHURCH = 3,
		ACCESS_TOWER = 3,
		ACCESS_MAGE = 2,
		ACCESS_ARTIFICER = 4,
		ACCESS_HAND = 1,
		ACCESS_STEWARD = 2,
		ACCESS_FELDSHER = 3,
		"roomi" = 6,
		"roomii" = 6,
		"roomiii" = 6,
		"roomiv" = 6,
		"roomv" = 6,
		"roomvi" = 6,
		"medroomi" = 5,
		"medroomii" = 5,
		"medroomiii" = 5,
		"medroomiv" = 5,
		"medroomv" = 5,
		"medroomvi" = 5,
		"luxroomi" = 3,
		"luxroomii" = 3,
		"luxroomiii" = 3,
		"luxroomiv" = 3,
		"luxroomv" = 3,
		"luxroomvi" = 3
	)

	return lock_difficulties[lockid] || 5

/obj/structure/mineral_door
	name = "metal door"
	icon = 'icons/roguetown/misc/doors.dmi'
	icon_state = "wcg"
	density = TRUE
	anchored = TRUE
	opacity = TRUE
	layer = OPEN_DOOR_LAYER

	max_integrity = 1000
	integrity_failure = 0.5
	armor = list("blunt" = 10, "slash" = 10, "stab" = 10,  "piercing" = 0, "fire" = 50, "acid" = 50)
	CanAtmosPass = ATMOS_PASS_DENSITY

	var/ridethrough = FALSE

	var/door_opened = FALSE //if it's open or not.
	var/isSwitchingStates = FALSE //don't try to change stats if we're already opening

	var/close_delay = -1 //Time to close after opening. Negative number if does not auto close.
	var/openSound = 'sound/blank.ogg'
	var/closeSound = 'sound/blank.ogg'

	var/sheetAmount = 7 //how much we drop when deconstructed

	var/windowed = FALSE

	var/locked = FALSE
	var/last_bump = null
	var/brokenstate = 0
	var/keylock = FALSE
	var/lockid = null
	var/lockbroken = 0
	var/locksound = 'sound/foley/doors/woodlock.ogg'
	var/unlocksound = 'sound/foley/doors/woodlock.ogg'
	var/rattlesound = 'sound/foley/doors/lockrattle.ogg'
	var/masterkey = TRUE //if masterkey can open this regardless
	var/kickthresh = 15
	var/bump_closed = TRUE
	var/can_add_lock = TRUE
	var/can_knock = TRUE

	var/ghostproof = FALSE	// Set to true to stop dead players passing through closed ones. Only use this for special areas, not generally

	damage_deflection = 10

	var/repairable = FALSE
	var/repair_state = 0
	var/obj/item/repair_cost_first = null
	var/obj/item/repair_cost_second = null
	var/repair_skill = null

	var/animate_time = 10 // How long should it take for the door to change states? Ideally matches the icon's animation length

/obj/structure/mineral_door/onkick(mob/user)
	if(isSwitchingStates)
		return
	if(door_opened)
		playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
		user.visible_message(span_warning("[user] kicks [src] shut!"), \
			span_notice("I kick [src] shut!"))
		force_closed()
	else
		if(locked)
			if(isliving(user))
				var/mob/living/L = user
				if(L.STASTR >= initial(kickthresh))
					kickthresh--
				if((prob(L.STASTR * 0.5) || kickthresh == 0) && (L.STASTR >= initial(kickthresh)))
					playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
					user.visible_message(span_warning("[user] kicks open [src]!"), \
						span_notice("I kick open [src]!"))
					locked = 0
					force_open()
				else
					playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
					user.visible_message(span_warning("[user] kicks [src]!"), \
						span_notice("I kick [src]!"))
			//try to kick open, destroy lock
		else
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message(span_warning("[user] kicks open [src]!"), \
				span_notice("I kick open [src]!"))
			force_open()

/obj/structure/mineral_door/proc/force_open()
	isSwitchingStates = TRUE
	if(!windowed)
		set_opacity(FALSE)
	density = FALSE
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

	if(close_delay >= 0)
		addtimer(CALLBACK(src, PROC_REF(Close)), close_delay)

/obj/structure/mineral_door/proc/force_closed()
	isSwitchingStates = TRUE
	if(!windowed)
		set_opacity(TRUE)
	density = TRUE
	door_opened = FALSE
	layer = CLOSED_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/mineral_door/proc/set_init_layer()
	if(density)
		layer = CLOSED_DOOR_LAYER
	else
		layer = initial(layer)

/obj/structure/mineral_door/Initialize()
	. = ..()
	set_init_layer()
	air_update_turf(TRUE)
	if(keylock)
		AddElement(/datum/element/lockpickable, list(/obj/item/lockpick), list(/obj/item/lockpick), lockid_to_lockpick_difficulty(lockid))

/obj/structure/mineral_door/Move()
	var/turf/T = loc
	. = ..()
	move_update_air(T)

/obj/structure/mineral_door/attack_ghost(mob/dead/observer/user)	// lets ghosts click on windows to transport across
	if(!ghostproof)
		density = FALSE
		. = step(user,get_dir(user,src.loc))
		density = TRUE

/obj/structure/mineral_door/Bumped(atom/movable/AM)
	..()
	if(door_opened)
		return
	if(world.time < last_bump+20)
		return
	last_bump = world.time
	if(ismob(AM))
		var/mob/user = AM
		if(HAS_TRAIT(user, TRAIT_BASHDOORS))
			if(locked)
				user.visible_message(span_warning("[user] bashes into [src]!"))
				take_damage(200, "brute", "blunt", 1)
			else
				playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
				force_open()
				user.visible_message(span_warning("[user] smashes through [src]!"))
			return
		if(HAS_TRAIT(user, TRAIT_ROTMAN))
			if(locked)
				user.visible_message(span_warning("The deadite bashes into [src]!"))
				take_damage(50, "brute", "blunt", 1)
			else
				playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 90)
				force_open()
				user.visible_message(span_warning("The deadite smashes through [src]!"))
			return
		if(locked)
			door_rattle()
			return
		if(TryToSwitchState(AM))
			if(bump_closed)
				if(isliving(AM))
					var/mob/living/M = AM
					var/delay = (close_delay >= 0) ? close_delay : 25
					if(M.m_intent == MOVE_INTENT_SNEAK)
						addtimer(CALLBACK(src, PROC_REF(Close), TRUE), delay)
					else
						addtimer(CALLBACK(src, PROC_REF(Close), FALSE), delay)


/obj/structure/mineral_door/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/mineral_door/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(brokenstate)
		return
	if(isSwitchingStates)
		return
	if(locked)
		if( user.used_intent.type == /datum/intent/unarmed/claw )
			user.changeNext_move(CLICK_CD_MELEE)
			to_chat(user, "<span class='warning'>[src] is damaged by the claws!!</span>")
			take_damage(40, "brute", "slash", 1)
			return
		if(isliving(user))
			var/mob/living/L = user
			if(L.m_intent == MOVE_INTENT_SNEAK)
				to_chat(user, span_warning("This door is locked."))
				return
		if(world.time >= last_bump+20 && can_knock)
			last_bump = world.time
			if(user.a_intent.name == "punch")
				playsound(src, 'sound/foley/doors/knocking.ogg', 100)
				user.visible_message(span_warning("[user] knocks on [src]."), \
					span_notice("I knock on [src]."))
				return
			door_rattle()
			user.visible_message(span_warning("[user] tries the handle, but the door does not move."), \
					span_notice("I try the handle, but the door does not move."))
			return
		return
	return TryToSwitchState(user)

/obj/structure/mineral_door/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /mob/camera))
		return TRUE
	if(istype(mover, /obj/effect/beam))
		return !opacity
	return !density

/obj/structure/mineral_door/proc/TryToSwitchState(atom/user)
	if(isSwitchingStates || !anchored)
		return
	if(isliving(user))
		var/mob/living/M = user
		if(world.time - M.last_bumped <= 60)
			return //NOTE do we really need that?
		if(M.client)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(!C.handcuffed)
					if(C.m_intent == MOVE_INTENT_SNEAK)
						SwitchState(TRUE)
					else
						SwitchState()
			else
				SwitchState()
	return TRUE

/obj/structure/mineral_door/proc/SwitchState(silent = FALSE)
	if(door_opened)
		Close(silent)
	else
		Open(silent)

/obj/structure/mineral_door/proc/Open(silent = FALSE)
	isSwitchingStates = TRUE
	if(!silent)
		playsound(src, openSound, 90)
	if(!windowed)
		set_opacity(FALSE)
	flick("[initial(icon_state)]opening",src)
	sleep(animate_time)
	density = FALSE
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

	if(close_delay >= 0)
		addtimer(CALLBACK(src, PROC_REF(Close), silent), close_delay)

/obj/structure/mineral_door/proc/Close(silent = FALSE)
	if(isSwitchingStates || !door_opened)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	isSwitchingStates = TRUE
	if(!silent)
		playsound(src, closeSound, 90)
	flick("[initial(icon_state)]closing",src)
	sleep(animate_time)
	density = TRUE
	if(!windowed)
		set_opacity(TRUE)
	door_opened = FALSE
	layer = initial(layer)
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/mineral_door/update_icon()
	icon_state = "[initial(icon_state)][door_opened ? "open":""]"

/obj/structure/mineral_door/proc/door_rattle()
	playsound(src, rattlesound, 100)
	var/oldx = pixel_x
	animate(src, pixel_x = oldx+1, time = 0.5)
	animate(pixel_x = oldx-1, time = 0.5)
	animate(pixel_x = oldx, time = 0.5)

/obj/structure/mineral_door/examine(mob/user)
	. = ..()
	if(repairable)
		var/obj/cast_repair_cost_first = repair_cost_first
		var/obj/cast_repair_cost_second = repair_cost_second
		if((repair_state == 0) && (obj_integrity < max_integrity))
			. += span_notice("A [initial(cast_repair_cost_first.name)] can be used to repair it.")
			if(brokenstate)
				. += span_notice("An additional [initial(cast_repair_cost_second.name)] is needed to finish repairs.")
		if(repair_state == 1)
			. += span_notice("An additional [initial(cast_repair_cost_second.name)] is needed to finish repairs.")

/obj/structure/mineral_door/attackby(obj/item/I, mob/user)
	user.changeNext_move(CLICK_CD_FAST)
	if(istype(I, /obj/item/key) || istype(I, /obj/item/storage/keyring))
		if(!locked)
			to_chat(user, span_warning("It won't turn this way. Try turning to the right."))
			door_rattle()
			return
		trykeylock(I, user)
	if(repairable && (user.mind.get_skill_level(repair_skill) > 0) && ((istype(I, repair_cost_first)) || (istype(I, repair_cost_second)))) // At least 1 skill level needed
		repairdoor(I,user)
	else
		return ..()

/obj/structure/mineral_door/attack_right(mob/user)
	user.changeNext_move(CLICK_CD_FAST)
	var/obj/item = user.get_active_held_item()
	if(istype(item, /obj/item/key) || istype(item, /obj/item/storage/keyring))
		if(locked)
			to_chat(user, span_warning("It won't turn this way. Try turning to the left."))
			door_rattle()
			return
		trykeylock(item, user)
		return
	else
		return ..()

/obj/structure/mineral_door/proc/repairdoor(obj/item/I, mob/user)
	if(brokenstate)
		switch(repair_state)
			if(0)
				if(istype(I, repair_cost_first))
					user.visible_message(span_notice("[user] starts repairing [src]."), \
					span_notice("I start repairing [src]."))
					playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
					if(do_after(user, (30 SECONDS / user.mind.get_skill_level(repair_skill)), src)) // 1 skill = 30 secs, 2 skill = 15 secs etc.
						qdel(I)
						playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
						repair_state = 1
						var/obj/cast_repair_cost_second = repair_cost_second
						to_chat(user, span_notice("An additional [initial(cast_repair_cost_second.name)] is needed to finish the job."))
			if(1)
				if(istype(I, repair_cost_second))
					user.visible_message(span_notice("[user] starts repairing [src]."), \
					span_notice("I start repairing [src]."))
					playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
					if(do_after(user, (30 SECONDS / user.mind.get_skill_level(repair_skill)), src)) // 1 skill = 30 secs, 2 skill = 15 secs etc.
						qdel(I)
						playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
						icon_state = "[initial(icon_state)]"
						density = TRUE
						opacity = TRUE
						brokenstate = FALSE
						obj_broken = FALSE
						obj_integrity = max_integrity
						repair_state = 0
						user.visible_message(span_notice("[user] repaired [src]."), \
						span_notice("I repaired [src]."))
	else
		if(obj_integrity < max_integrity && istype(I, repair_cost_first))
			to_chat(user, span_warning("[obj_integrity]"))
			user.visible_message(span_notice("[user] starts repairing [src]."), \
			span_notice("I start repairing [src]."))
			playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
			if(do_after(user, (30 SECONDS / user.mind.get_skill_level(repair_skill)), src)) // 1 skill = 30 secs, 2 skill = 15 secs etc.
				qdel(I)
				playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
				obj_integrity = obj_integrity + (max_integrity/2)
				if(obj_integrity > max_integrity)
					obj_integrity = max_integrity
				user.visible_message(span_notice("[user] repaired [src]."), \
				span_notice("I repaired [src]."))

/obj/structure/mineral_door/proc/trykeylock(obj/item/I, mob/user, is_right = FALSE)
	if(door_opened || isSwitchingStates)
		return
	if(!keylock)
		return
	if(lockbroken)
		to_chat(user, "<span class='warning'>The lock to this door is broken.</span>")
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(I, /obj/item/storage/keyring))
		var/obj/item/storage/keyring/R = I
		if(!length(R.contents))
			to_chat(user, span_info("You have no keys."))
			return
		for(var/obj/item/key/K as anything in shuffle(R.contents.Copy()))
			var/combat = user.cmode
			if(combat && !do_after(user, 1 SECONDS, src))
				door_rattle()
				break
			if(K.lockid == lockid)
				lock_toggle(user)
				break
			if(combat)
				door_rattle()
		return
	var/obj/item/key/K = I
	if(K.lockid != lockid)
		door_rattle()
		return
	lock_toggle(user)

/obj/structure/mineral_door/proc/lock_toggle(mob/user)
	if(isSwitchingStates || door_opened)
		return
	if(locked)
		user.visible_message(span_warning("[user] unlocks [src]."), \
			span_notice("I unlock [src]."))
		playsound(src, unlocksound, 100)
		locked = FALSE
	else
		user.visible_message(span_warning("[user] locks [src]."), \
			span_notice("I lock [src]."))
		playsound(src, locksound, 100)
		locked = TRUE

/obj/structure/mineral_door/setAnchored(anchorvalue) //called in default_unfasten_wrench() chain
	. = ..()
	set_opacity(anchored ? !door_opened : FALSE)
	air_update_turf(TRUE)

/obj/structure/mineral_door/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 40)
	return TRUE


/obj/structure/mineral_door/obj_break(damage_flag, mapload)
	if(!brokenstate)
		icon_state = "[initial(icon_state)]br"
		density = FALSE
		opacity = FALSE
		brokenstate = TRUE
	..()

/obj/structure/mineral_door/OnCrafted(dirin, user)
	. = ..()
	keylock = FALSE

/////////////////////// TOOL OVERRIDES ///////////////////////


/obj/structure/mineral_door/proc/pickaxe_door(mob/living/user, obj/item/I) //override if the door isn't supposed to be a minable mineral.
	return/*
	if(!istype(user))
		return
	if(I.tool_behaviour != TOOL_MINING)
		return
	. = TRUE
	to_chat(user, "<span class='notice'>I start digging [src]...</span>")
	if(I.use_tool(src, user, 40, volume=50))
		to_chat(user, "<span class='notice'>I finish digging.</span>")
		deconstruct(TRUE)*/

/obj/structure/mineral_door/welder_act(mob/living/user, obj/item/I) //override if the door is supposed to be flammable.
	..()
	. = TRUE
	if(anchored)
		to_chat(user, span_warning("[src] is still firmly secured to the ground!"))
		return

	user.visible_message(span_notice("[user] starts to weld apart [src]!"), span_notice("I start welding apart [src]."))
	if(!I.use_tool(src, user, 60, 5, 50))
		to_chat(user, span_warning("I failed to weld apart [src]!"))
		return

	user.visible_message(span_notice("[user] welded [src] into pieces!"), span_notice("I welded apart [src]!"))
	deconstruct(TRUE)

/obj/structure/mineral_door/proc/crowbar_door(mob/living/user, obj/item/I) //if the door is flammable, call this in crowbar_act() so we can still decon it
	. = TRUE
	if(anchored)
		to_chat(user, span_warning("[src] is still firmly secured to the ground!"))
		return

	user.visible_message(span_notice("[user] starts to pry apart [src]!"), span_notice("I start prying apart [src]."))
	if(!I.use_tool(src, user, 60, volume = 50))
		to_chat(user, span_warning("I failed to pry apart [src]!"))
		return

	user.visible_message(span_notice("[user] pried [src] into pieces!"), span_notice("I pried apart [src]!"))
	deconstruct(TRUE)

//ROGUEDOOR

/obj/structure/mineral_door/wood
	name = "door"
	icon_state = "woodhandle"
	openSound = list('sound/foley/doors/creak.ogg')
	closeSound = 'sound/foley/doors/shut.ogg'
	resistance_flags = FLAMMABLE
	max_integrity = 1000
	damage_deflection = 12
	keylock = TRUE
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	repairable = TRUE
	repair_cost_first = /obj/item/grown/log/tree/small
	repair_cost_second = /obj/item/grown/log/tree/small
	repair_skill = /datum/skill/craft/carpentry
	metalizer_result = /obj/structure/mineral_door/wood/donjon

/obj/structure/mineral_door/wood/Initialize()
	if(icon_state =="woodhandle")
		if(prob(10))
			icon_state = "wcg"
		else if(prob(10))
			icon_state = "wcr"
	. = ..()

/obj/structure/mineral_door/wood/green
	icon_state = "wcg"
/obj/structure/mineral_door/wood/red
	icon_state = "wcr"
/obj/structure/mineral_door/wood/violet
	icon_state = "wcv"

/obj/structure/mineral_door/wood/pickaxe_door(mob/living/user, obj/item/I)
	return

/obj/structure/mineral_door/wood/welder_act(mob/living/user, obj/item/I)
	return

/obj/structure/mineral_door/wood/crowbar_act(mob/living/user, obj/item/I)
	return crowbar_door(user, I)

/obj/structure/mineral_door/wood/attackby(obj/item/I, mob/living/user)
	return ..()

/obj/structure/mineral_door/wood/fire_act(added, maxstacks)
	testing("added [added]")
	if(!added)
		return FALSE
	if(added < 10)
		return FALSE
	..()

/obj/structure/mineral_door/swing_door
	name = "swing door"
	desc = "A door that swings."
	icon = 'icons/roguetown/misc/doors.dmi'
	icon_state = "swing"
	openSound = 'sound/foley/doors/creak.ogg'
	closeSound = 'sound/foley/doors/shut.ogg'
	resistance_flags = FLAMMABLE
	max_integrity = 1000
	damage_deflection = 12
	opacity = FALSE
	windowed = TRUE
	keylock = FALSE
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	repairable = TRUE
	repair_cost_first = /obj/item/grown/log/tree/small
	repair_cost_second = /obj/item/grown/log/tree/small
	repair_skill = /datum/skill/craft/carpentry
	metalizer_result = null
	close_delay = 1 SECONDS
	animate_time = 4

/obj/structure/mineral_door/wood/window
	icon_state = "woodwindow"
	opacity = FALSE
	windowed = TRUE

/obj/structure/mineral_door/wood/fancywood
	icon_state = "fancy_wood"

/obj/structure/mineral_door/wood/deadbolt
	desc = "This door comes with a deadbolt."
	icon_state = MAP_SWITCH("wood", "wooddir")
	var/lockdir
	keylock = FALSE
	max_integrity = 500
	kickthresh = 10
	openSound = 'sound/foley/doors/shittyopen.ogg'
	closeSound = 'sound/foley/doors/shittyclose.ogg'

/obj/structure/mineral_door/wood/deadbolt/OnCrafted(dirin, mob/user)
	dir = turn(dirin, 180)
	lockdir = dir
	. = ..()

/obj/structure/mineral_door/wood/deadbolt/Initialize()
	. = ..()
	lockdir = dir

/obj/structure/mineral_door/wood/deadbolt/attack_right(mob/user)
	user.changeNext_move(CLICK_CD_FAST)
	var/obj/item = user.get_active_held_item()
	if(istype(item, /obj/item/key) || istype(item, /obj/item/storage/keyring))
		if(locked)
			to_chat(user, span_warning("It won't turn this way. Try turning to the left."))
			door_rattle()
			return
		trykeylock(item, user)
		return
	if(door_opened || isSwitchingStates)
		return
	if(lockbroken)
		to_chat(user, span_warning("The lock to this door is broken."))
		return
	if(brokenstate)
		to_chat(user, span_warning("There isn't much left of this door."))
		return
	if(get_dir(src,user) == lockdir)
		lock_toggle(user)
	else
		to_chat(user, span_warning("The door doesn't lock from this side."))

/obj/structure/mineral_door/wood/donjon
	desc = "This door has a built-in viewport."
	icon_state = MAP_SWITCH("donjon", "donjondir")
	keylock = TRUE
	max_integrity = 2000
	var/viewportdir
	kickthresh = 15
	locksound = 'sound/foley/doors/lockmetal.ogg'
	unlocksound = 'sound/foley/doors/lockmetal.ogg'
	rattlesound = 'sound/foley/doors/lockrattlemetal.ogg'
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")
	repair_cost_second = /obj/item/ingot/iron
	repair_skill = /datum/skill/craft/carpentry
	metalizer_result = null
	smeltresult = /obj/item/ingot/iron

/obj/structure/mineral_door/wood/donjon/stone
	name = "stone door"
	icon_state = "stone"
	keylock = TRUE
	max_integrity = 1000
	openSound = 'sound/foley/doors/stoneopen.ogg'
	closeSound = 'sound/foley/doors/stoneclose.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	repair_cost_first = /obj/item/natural/stone
	repair_cost_second = /obj/item/natural/stone
	repair_skill = /datum/skill/craft/masonry
	smeltresult = null

/obj/structure/mineral_door/wood/donjon/stone/attack_right(mob/user)
	user.changeNext_move(CLICK_CD_FAST)
	var/obj/item = user.get_active_held_item()
	if(istype(item, /obj/item/key) || istype(item, /obj/item/storage/keyring))
		if(locked)
			to_chat(user, span_warning("It won't turn this way. Try turning to the left."))
			door_rattle()
			return
		trykeylock(item, user)
		return
	return

/obj/structure/mineral_door/wood/donjon/stone/view_toggle(mob/user)
	return

/obj/structure/mineral_door/wood/donjon/stone/OnCrafted(dirin, mob/user)
	return ..()

/obj/structure/mineral_door/wood/donjon/Initialize()
	viewportdir = dir
	..()

/obj/structure/mineral_door/wood/donjon/OnCrafted(dirin, mob/user)
	dir = turn(dirin, 180)
	viewportdir = dir
	. = ..()

/obj/structure/mineral_door/wood/donjon/attack_right(mob/user)
	user.changeNext_move(CLICK_CD_FAST)
	var/obj/item = user.get_active_held_item()
	if(istype(item, /obj/item/key) || istype(item, /obj/item/storage/keyring))
		if(locked)
			to_chat(user, span_warning("It won't turn this way. Try turning to the left."))
			door_rattle()
			return
		trykeylock(item, user)
		return
	if(door_opened || isSwitchingStates)
		return
	if(brokenstate)
		to_chat(user, span_warning("There isn't much left of this door."))
		return
	if(get_dir(src,user) == viewportdir)
		view_toggle(user)
	else
		to_chat(user, span_warning("The viewport can't be moved from this side."))
		return

/obj/structure/mineral_door/wood/donjon/proc/view_toggle(mob/user)
	if(door_opened)
		return
	if(opacity)
		to_chat(user, span_info("I slide the viewport open."))
		opacity = FALSE
		playsound(src, 'sound/foley/doors/windowup.ogg', 100, FALSE)
	else
		to_chat(user, span_info("I slide the viewport closed."))
		opacity = TRUE
		playsound(src, 'sound/foley/doors/windowup.ogg', 100, FALSE)


/obj/structure/mineral_door/bars
	name = "iron door"
	icon_state = "bars"
	openSound = 'sound/foley/doors/ironopen.ogg'
	closeSound = 'sound/foley/doors/ironclose.ogg'
	resistance_flags = null
	max_integrity = 1000
	damage_deflection = 15
	keylock = TRUE
	blade_dulling = DULLING_BASH
	opacity = FALSE
	windowed = TRUE
	keylock = TRUE
	locksound = 'sound/foley/doors/lock.ogg'
	unlocksound = 'sound/foley/doors/unlock.ogg'
	rattlesound = 'sound/foley/doors/lockrattlemetal.ogg'
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")
	ridethrough = TRUE
	bump_closed = FALSE
	repair_cost_first = /obj/item/ingot/iron
	repair_cost_second = /obj/item/ingot/iron
	repair_skill = /datum/skill/craft/blacksmithing
	animate_time = 6

/obj/structure/mineral_door/bars/onkick(mob/user)
	user.visible_message("<span class='warning'>[user] kicks [src]!</span>")
	return

/obj/structure/mineral_door/wood/deadbolt/shutter
	name = "serving hatch"
	desc = "Can be locked from the inside."
	icon_state = "serving"
	max_integrity = 250
	openSound = 'sound/foley/blindsopen.ogg'
	closeSound = 'sound/foley/blindsclose.ogg'
	dir = NORTH
	locked = TRUE
	animate_time = 21
