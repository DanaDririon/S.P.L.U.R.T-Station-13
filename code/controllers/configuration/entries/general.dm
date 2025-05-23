/datum/config_entry/number/lobby_countdown	// In between round countdown.
	default = 120
	min_val = 0

/datum/config_entry/number/round_end_countdown	// Post round murder death kill countdown
	default = 25
	min_val = 0


/datum/config_entry/flag/allow_metadata	// Metadata is supported.

/datum/config_entry/flag/allow_holidays

/datum/config_entry/number/id_console_jobslot_delay
	default = 30
	min_val = 0

/datum/config_entry/number/inactivity_period	//time in ds until a player is considered inactive
	default = 3000
	min_val = 0

/datum/config_entry/number/inactivity_period/ValidateAndSet(str_val)
	. = ..()
	if(.)
		config_entry_value *= 10 //documented as seconds in config.txt

/datum/config_entry/number/afk_period	//time in ds until a player is considered inactive
	default = 3000
	min_val = 0

/datum/config_entry/number/afk_period/ValidateAndSet(str_val)
	. = ..()
	if(.)
		config_entry_value *= 10 //documented as seconds in config.txt

/datum/config_entry/flag/kick_inactive	//force disconnect for inactive players

/datum/config_entry/flag/load_jobs_from_txt

/datum/config_entry/flag/show_irc_name

/datum/config_entry/string/default_view
	default = "15x15"

/datum/config_entry/string/default_view_square
	default = "15x15"


/datum/config_entry/flag/minimaps_enabled
	default = TRUE



/datum/config_entry/number/damage_multiplier
	default = 1
	integer = FALSE

/datum/config_entry/number/minimal_access_threshold	//If the number of players is larger than this threshold, minimal access will be turned on.
	min_val = 0

/datum/config_entry/flag/jobs_have_minimal_access	//determines whether jobs use minimal access or expanded access.

/datum/config_entry/flag/assistants_have_maint_access

/datum/config_entry/flag/security_has_maint_access

/datum/config_entry/flag/everyone_has_maint_access

/datum/config_entry/flag/sec_start_brig	//makes sec start in brig instead of dept sec posts

/datum/config_entry/flag/force_random_names

/datum/config_entry/flag/humans_need_surnames

/datum/config_entry/flag/allow_ai	// allow ai job

/datum/config_entry/flag/allow_ai_multicam //whether the AI can use their multicam

/datum/config_entry/flag/disable_human_mood

/datum/config_entry/flag/disable_borg_flash_knockdown //Should borg flashes be capable of knocking humanoid entities down?

/datum/config_entry/flag/weaken_secborg //Brings secborgs and k9s back in-line with the other borg modules

/datum/config_entry/flag/disable_secborg	// disallow secborg module to be chosen.

/datum/config_entry/flag/disable_peaceborg

/datum/config_entry/flag/economy	//money money money money money money money money money money money money

/datum/config_entry/flag/reactionary_explosions	//If we use reactionary explosions, explosions that react to walls and doors

/datum/config_entry/flag/enforce_human_authority	//If non-human species are barred from joining as a head of staff

/datum/config_entry/number/midround_antag_time_check	// How late (in minutes you want the midround antag system to stay on, setting this to 0 will disable the system)
	default = 60
	min_val = 0

/datum/config_entry/number/midround_antag_life_check	// A ratio of how many people need to be alive in order for the round not to immediately end in midround antagonist
	default = 0.7
	integer = FALSE
	min_val = 0
	max_val = 1

/datum/config_entry/number/suicide_reenter_round_timer
	default = 30
	min_val = 0

/datum/config_entry/number/roundstart_suicide_time_limit
	default = 30
	min_val = 0

/datum/config_entry/number/shuttle_refuel_delay
	default = 12000
	min_val = 0

/datum/config_entry/flag/show_game_type_odds	//if set this allows players to see the odds of each roundtype on the get revision screen

/datum/config_entry/keyed_list/roundstart_races	//races you can play as from the get go.
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_FLAG

/datum/config_entry/flag/join_with_mutant_humans	//players can pick mutant bodyparts for humans before joining the game

/datum/config_entry/flag/no_summon_guns		//No

/datum/config_entry/flag/no_summon_magic	//Fun

/datum/config_entry/flag/no_summon_events	//Allowed

/datum/config_entry/flag/no_summon_traumas	//!

/datum/config_entry/flag/no_intercept_report	//Whether or not to send a communications intercept report roundstart. This may be overridden by gamemodes.

/datum/config_entry/number/arrivals_shuttle_dock_window	//Time from when a player late joins on the arrivals shuttle to when the shuttle docks on the station
	default = 55
	min_val = 30

/datum/config_entry/flag/arrivals_shuttle_require_undocked	//Require the arrivals shuttle to be undocked before latejoiners can join

/datum/config_entry/flag/arrivals_shuttle_require_safe_latejoin	//Require the arrivals shuttle to be operational in order for latejoiners to join


/datum/config_entry/flag/revival_pod_plants

/datum/config_entry/flag/revival_cloning

/datum/config_entry/number/revival_brain_life
	default = -1
	min_val = -1

/datum/config_entry/flag/ooc_during_round

/datum/config_entry/flag/emojis

/datum/config_entry/flag/roundstart_away	//Will random away mission be loaded.

/datum/config_entry/flag/roundstart_vr 		//Will virtual reality missions be loaded?

/datum/config_entry/number/gateway_delay	//How long the gateway takes before it activates. Default is half an hour. Only matters if roundstart_away is enabled.
	default = 18000
	min_val = 0

/datum/config_entry/flag/ghost_interaction

/datum/config_entry/flag/silent_ai
/datum/config_entry/flag/silent_borg

/datum/config_entry/flag/sandbox_autoclose	// close the sandbox panel after spawning an item, potentially reducing griff

/datum/config_entry/number/default_laws //Controls what laws the AI spawns with.
	default = 0
	min_val = 0
	max_val = 3

/datum/config_entry/number/silicon_max_law_amount
	default = 12
	min_val = 0

/datum/config_entry/keyed_list/random_laws
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_FLAG

/datum/config_entry/keyed_list/law_weight
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_NUM
	splitter = ","

/datum/config_entry/number/overflow_cap
	default = -1
	min_val = -1

/datum/config_entry/string/overflow_job
	default = "Assistant"

/datum/config_entry/flag/starlight
/datum/config_entry/flag/grey_assistants

/datum/config_entry/number/lavaland_budget
	default = 60
	min_val = 0

/datum/config_entry/number/space_budget
	default = 16
	min_val = 0

/datum/config_entry/number/icemoon_budget
	default = 90
	integer = FALSE
	min_val = 0

/datum/config_entry/number/station_space_budget
	default = 10
	min_val = 0

/datum/config_entry/flag/allow_random_events	// Enables random events mid-round when set

/datum/config_entry/number/events_min_time_mul	// Multipliers for random events minimal starting time and minimal players amounts
	default = 1
	min_val = 0
	integer = FALSE

/datum/config_entry/number/events_min_players_mul
	default = 1
	min_val = 0
	integer = FALSE

/datum/config_entry/number/mice_roundstart
	default = 10
	min_val = 0

/datum/config_entry/number/bombcap
	default = 14
	min_val = 4

/datum/config_entry/number/bombcap/ValidateAndSet(str_val)
	. = ..()
	if(.)
		GLOB.MAX_EX_DEVESTATION_RANGE = round(config_entry_value / 4)
		GLOB.MAX_EX_HEAVY_RANGE = round(config_entry_value / 2)
		GLOB.MAX_EX_LIGHT_RANGE = config_entry_value
		GLOB.MAX_EX_FLASH_RANGE = config_entry_value
		GLOB.MAX_EX_FLAME_RANGE = config_entry_value

/datum/config_entry/number/emergency_shuttle_autocall_threshold
	min_val = 0
	max_val = 1
	integer = FALSE

/datum/config_entry/flag/ic_printing

/datum/config_entry/flag/roundstart_traits

/datum/config_entry/flag/enable_night_shifts

/datum/config_entry/number/night_shift_public_areas_only
	default = NIGHTSHIFT_AREA_PUBLIC

/datum/config_entry/flag/nightshift_toggle_requires_auth
	default = FALSE

/datum/config_entry/flag/nightshift_toggle_public_requires_auth
	default = TRUE

/datum/config_entry/flag/randomize_shift_time

/datum/config_entry/flag/shift_time_realtime

/datum/config_entry/number/monkeycap
	default = 64
	min_val = 0

/datum/config_entry/number/ratcap
	default = 64
	min_val = 0

/datum/config_entry/keyed_list/box_random_engine
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_NUM
	lowercase_key = FALSE
	splitter = ","

/datum/config_entry/flag/pai_custom_holoforms

/datum/config_entry/number/marauder_delay_non_reebe
	default = 1800
	min_val = 0

/datum/config_entry/flag/allow_clockwork_marauder_on_station
	default = TRUE

/datum/config_entry/flag/suicide_allowed


//Allows players to set a hexadecimal color of their choice as skin tone, on top of the standard ones.
/datum/config_entry/flag/allow_custom_skintones

///Initial loadout points
/datum/config_entry/number/initial_gear_points
	default = 10

/**
  * Enables the FoV component, which hides objects and mobs behind the parent from their sight, unless they turn around, duh.
  * Camera mobs, AIs, ghosts and some other are of course exempt from this. This also doesn't influence simplemob AI, for the best.
  */
/datum/config_entry/flag/use_field_of_vision

//Shuttle size limiter
/datum/config_entry/number/max_shuttle_count
	default = 6

/datum/config_entry/number/max_shuttle_size
	default = 500

//wound config stuff (increases the max injury roll, making injuries more likely)
/datum/config_entry/number/wound_exponent
	default = WOUND_DAMAGE_EXPONENT
	min_val = 0
	integer = FALSE

//adds a set amount to any injury rolls on a limb using get_damage() multiplied by this number
/datum/config_entry/number/wound_damage_multiplier
	default = 0.333
	min_val = 0
	integer = FALSE

/datum/config_entry/number/hard_deletes_overrun_threshold
	integer = FALSE
	min_val = 0
	default = 0.5

/datum/config_entry/number/hard_deletes_overrun_limit
	default = 0
	min_val = 0

/datum/config_entry/flag/atmos_equalize_enabled
	default = FALSE

/datum/config_entry/flag/dynamic_config_enabled

/datum/config_entry/flag/station_name_needs_approval

//ambition start
/datum/config_entry/number/max_ambitions	// Maximum number of ambitions a mind can store.
	default = 5
//ambition end

/datum/config_entry/str_list/randomizing_station_name_message
	default = list()

/datum/config_entry/flag/toast_notification_on_init

/// Gives the ability to send players a maptext popup.
/datum/config_entry/flag/popup_admin_pm
