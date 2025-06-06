#define INSULTS_FILE "insult.json"

/mob
	var/nextsoundemote = 1

/datum/emote/living/insult
	key = "insult"
	key_third_person = "insults"
	message = "spews insults."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/insult/run_emote(mob/living/user, params)
	if(user.mind?.miming)
		message = "creatively gesticulates."
	else if(!user.is_muzzled())
		message = pick_list_replacements(INSULTS_FILE, "insult_gen")
	else
		message = "muffles something."
	. = ..()

/datum/emote/living/scream/run_emote(mob/living/user, params) //I can't not port this shit, come on.
	if(user.nextsoundemote >= world.time || user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(!user.is_muzzled() && !miming)
		user.nextsoundemote = world.time + 7
		if(issilicon(user))
			sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(iscyborg(user))
				var/mob/living/silicon/robot/S = user
				if(S.cell?.charge < 20)
					to_chat(S, "<span class='warning'>Scream module deactivated. Please recharge.</span>")
					return
				S.cell.use(200)
		if(ismonkey(user))
			sound = 'modular_citadel/sound/voice/scream_monkey.ogg'
		if(istype(user, /mob/living/simple_animal/hostile/gorilla))
			sound = 'sound/creatures/gorilla.ogg'
		if(ishuman(user))
			user.adjustOxyLoss(5)
			sound = pick('modular_citadel/sound/voice/scream_m1.ogg', 'modular_citadel/sound/voice/scream_m2.ogg')
			if(user.gender == FEMALE)
				sound = pick('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
			if(is_species(user, /datum/species/jelly))
				if(user.gender == FEMALE)
					sound = pick('modular_citadel/sound/voice/scream_jelly_f1.ogg', 'modular_citadel/sound/voice/scream_jelly_f2.ogg')
				else
					sound = pick('modular_citadel/sound/voice/scream_jelly_m1.ogg', 'modular_citadel/sound/voice/scream_jelly_m2.ogg')
			if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
				sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(is_species(user, /datum/species/lizard))
				sound = 'modular_citadel/sound/voice/scream_lizard.ogg'
			if(is_species(user, /datum/species/skeleton))
				sound = 'modular_citadel/sound/voice/scream_skeleton.ogg'
			if (is_species(user, /datum/species/fly) || is_species(user, /datum/species/insect))
				sound = 'modular_citadel/sound/voice/scream_moth.ogg'
		if(isalien(user))
			sound = 'sound/voice/hiss6.ogg'
		LAZYINITLIST(user.alternate_screams)
		if(LAZYLEN(user.alternate_screams))
			sound = pick(user.alternate_screams)
		playsound(user.loc, sound, 50, 1, 4, 1.2)
		message = "screams!"
	else if(miming)
		message = "acts out a scream."
	else
		message = "makes a very loud noise."
	. = ..()

/datum/emote/sound/human/snap
	key = "snap"
	key_third_person = "snaps"
	message = "snaps their fingers."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_pitch_variance = FALSE
	sound = 'modular_citadel/sound/voice/snap.ogg'

/datum/emote/sound/human/snap2
	key = "snap2"
	key_third_person = "snaps twice"
	name = "snap twice"
	message = "snaps twice."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_pitch_variance = FALSE
	sound = 'modular_citadel/sound/voice/snap2.ogg'

/datum/emote/sound/human/snap3
	key = "snap3"
	key_third_person = "snaps thrice"
	name = "snap thrice"
	message = "snaps thrice."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_pitch_variance = FALSE
	sound = 'modular_citadel/sound/voice/snap3.ogg'

/datum/emote/sound/human/awoo
	key = "awoo"
	key_third_person = "lets out an awoo"
	message = "lets out an awoo!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/awoo.ogg'

/datum/emote/sound/human/hiss
	key = "hiss"
	key_third_person = "hisses"
	message = "hisses!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/hiss.ogg'

/datum/emote/sound/human/purr
	key = "purr"
	key_third_person = "purrs softly"
	message = "purrs softly."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/purr.ogg'

/datum/emote/sound/human/nya
	key = "nya"
	key_third_person = "lets out a nya"
	message = "lets out a nya!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/nya.ogg'

/datum/emote/sound/human/weh
	key = "weh"
	key_third_person = "lets out a weh"
	message = "lets out a weh!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/weh.ogg'

/datum/emote/sound/human/peep
	key = "peep"
	key_third_person = "peeps like a bird"
	message = "peeps like a bird!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/peep.ogg'

/datum/emote/sound/human/dab
	key = "dab"
	key_third_person = "suddenly hits a dab"
	message = "suddenly hits a dab!"
	emote_type = EMOTE_AUDIBLE
	restraint_check = TRUE

/datum/emote/sound/human/mothsqueak
	key = "msqueak"
	key_third_person = "lets out a tiny squeak"
	message = "lets out a tiny squeak!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'modular_citadel/sound/voice/mothsqueak.ogg'

/datum/emote/sound/human/merp
	key = "merp"
	key_third_person = "merps"
	message = "merps!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	emote_cooldown = 0.6 SECONDS
	sound = 'modular_citadel/sound/voice/merp.ogg'

/datum/emote/sound/human/bark
	key = "bark"
	key_third_person = "barks"
	message = "barks!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	emote_cooldown = 0.6 SECONDS

/datum/emote/sound/human/bark/run_emote(mob/user, params)
	sound = pick('modular_citadel/sound/voice/bark1.ogg', 'modular_citadel/sound/voice/bark2.ogg')
	. = ..()

/datum/emote/sound/human/squish
	key = "squish"
	key_third_person = "squishes"
	message = "squishes!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	sound = 'sound/voice/slime_squish.ogg'

/datum/emote/sound/human/pain
	key = "pain"
	key_third_person = "cries out in pain!"
	message = "cries out in pain!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	emote_pitch_variance = FALSE

/datum/emote/sound/human/pain/run_emote(mob/user, params)
	if(user.gender == MALE)
		sound = pick('modular_citadel/sound/voice/human_male_pain_1.ogg', 'modular_citadel/sound/voice/human_male_pain_2.ogg', 'modular_citadel/sound/voice/human_male_pain_3.ogg', 'modular_citadel/sound/voice/human_male_pain_rare.ogg', 'modular_citadel/sound/voice/human_male_scream_1.ogg', 'modular_citadel/sound/voice/human_male_scream_2.ogg', 'modular_citadel/sound/voice/human_male_scream_3.ogg', 'modular_citadel/sound/voice/human_male_scream_4.ogg')
	else
		sound = pick('modular_citadel/sound/voice/human_female_pain_1.ogg', 'modular_citadel/sound/voice/human_female_pain_2.ogg', 'modular_citadel/sound/voice/human_female_pain_3.ogg', 'modular_citadel/sound/voice/human_female_scream_2.ogg', 'modular_citadel/sound/voice/human_female_scream_3.ogg', 'modular_citadel/sound/voice/human_female_scream_4.ogg')
	. = ..()

/datum/emote/sound/human/clap1
	key = "clap1"
	key_third_person = "clap1s"
	name = "clap once"
	message = "claps their hands together."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE
	sound = 'modular_citadel/sound/voice/clap.ogg'
