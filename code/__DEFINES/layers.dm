//Defines for atom layers and planes
//KEEP THESE IN A NICE ACSCENDING ORDER, PLEASE
#define LOWEST_EVER_PLANE -100

#define FIELD_OF_VISION_BLOCKER_PLANE -90
#define FIELD_OF_VISION_BLOCKER_RENDER_TARGET "*FIELD_OF_VISION_BLOCKER_RENDER_TARGET"

#define CLICKCATCHER_PLANE -99

#define PLANE_SPACE -95
#define PLANE_SPACE_RENDER_TARGET "PLANE_SPACE"
#define PLANE_SPACE_PARALLAX -90
#define PLANE_SPACE_PARALLAX_RENDER_TARGET "PLANE_SPACE_PARALLAX"

#define GRAVITY_PULSE_PLANE -12
#define GRAVITY_PULSE_RENDER_TARGET "*GRAVPULSE_RENDER_TARGET"

#define RENDER_PLANE_TRANSPARENT -9 //Transparent plane that shows openspace underneath the floor

#define OPENSPACE_LAYER 17 //Openspace layer over all
#define OPENSPACE_PLANE -4 //Openspace plane below all turfs
#define OPENSPACE_BACKDROP_PLANE -3 //Black square just over openspace plane to guaranteed cover all in openspace turf

#define RENDER_PLANE_GAME_WORLD -1

#define SEETHROUGH_PLANE 2
#define ABOVE_GAME_PLANE 1

#define FLOOR_PLANE -2
#define FLOOR_PLANE_RENDER_TARGET "FLOOR_PLANE"
#define GAME_PLANE -1
#define GAME_PLANE_RENDER_TARGET "GAME_PLANE"
#define GAME_PLANE_FOV_HIDDEN -0.5
#define BLACKNESS_PLANE 0 //To keep from conflicts with SEE_BLACKNESS internals
#define BLACKNESS_PLANE_RENDER_TARGET "BLACKNESS_PLANE"

//---------- LIGHTING -------------
///Normal 1 per turf dynamic lighting underlays
//#define LIGHTING_PLANE 10

///Lighting objects that are "free floating"
//#define O_LIGHTING_VISUAL_PLANE 11
//#define O_LIGHTING_VISUAL_RENDER_TARGET "O_LIGHT_VISUAL_PLANE"

/// This plane masks out lighting to create an "emissive" effect, ie for glowing lights in otherwise dark areas.
//#define EMISSIVE_PLANE 14

#define RENDER_PLANE_LIGHTING 15

///Things that should render ignoring lighting
//#define ABOVE_LIGHTING_PLANE 16

//-------------------- Rendering ---------------------
#define RENDER_PLANE_GAME 100
#define RENDER_PLANE_NON_GAME 101
#define RENDER_PLANE_MASTER 102

// Lummox I swear to god I will find you
// NOTE! You can only ever have planes greater then -10000, if you add too many with large offsets you will brick multiz
// Same can be said for large multiz maps. Tread carefully mappers
#define HIGHEST_EVER_PLANE RENDER_PLANE_MASTER
/// The range unique planes can be in
#define PLANE_RANGE (HIGHEST_EVER_PLANE - LOWEST_EVER_PLANE)

#define SPACE_LAYER 1.8
//#define TURF_LAYER 2 //For easy recordkeeping; this is a byond define
#define MID_TURF_LAYER 2.02
#define HIGH_TURF_LAYER 2.03
#define TURF_PLATING_DECAL_LAYER 2.031
#define TURF_DECAL_LAYER 2.039 //Makes turf decals appear in DM how they will look inworld.
#define ABOVE_OPEN_TURF_LAYER 2.04
#define CLOSED_TURF_LAYER 2.05
#define BULLET_HOLE_LAYER 2.06
#define ABOVE_NORMAL_TURF_LAYER 2.08
#define LATTICE_LAYER 2.2
#define DISPOSAL_PIPE_LAYER 2.3
#define GAS_PIPE_HIDDEN_LAYER 2.35
#define WIRE_LAYER 2.4
//#define WIRE_BRIDGE_LAYER 2.44 //WS - Smartwire Revert - I went slightly insane adding all these comments
#define WIRE_TERMINAL_LAYER 2.45
#define UNDER_CATWALK 2.454
#define CATWALK_LAYER 2.455
#define GAS_SCRUBBER_LAYER 2.46
#define GAS_PIPE_VISIBLE_LAYER 2.47
#define GAS_FILTER_LAYER 2.48
#define GAS_PUMP_LAYER 2.49
#define LOW_OBJ_LAYER 2.5
#define LOW_SIGIL_LAYER 2.52
#define SIGIL_LAYER 2.54
#define HIGH_SIGIL_LAYER 2.56

#define BELOW_OPEN_DOOR_LAYER 2.6
#define BLASTDOOR_LAYER 2.65
#define OPEN_DOOR_LAYER 2.7
#define DOOR_HELPER_LAYER 2.71 //keep this above OPEN_DOOR_LAYER
#define PROJECTILE_HIT_THRESHHOLD_LAYER 2.75 //projectiles won't hit objects at or below this layer if possible
#define TABLE_LAYER 2.8
#define GATEWAY_UNDERLAY_LAYER 2.85
#define BELOW_OBJ_LAYER 2.9
#define LOW_ITEM_LAYER 2.95
//#define OBJ_LAYER 3 //For easy recordkeeping; this is a byond define
#define CLOSED_BLASTDOOR_LAYER 3.05
#define UNDERDOOR 3.09 //Just under a closed door
#define CLOSED_DOOR_LAYER 3.1
#define CLOSED_FIREDOOR_LAYER 3.11
#define SHUTTER_LAYER 3.12 // HERE BE DRAGONS
#define ABOVE_OBJ_LAYER 3.2
#define ABOVE_WINDOW_LAYER 3.3
#define SIGN_LAYER 3.4
#define NOT_HIGH_OBJ_LAYER 3.5
#define HIGH_OBJ_LAYER 3.6

#define BELOW_MOB_LAYER 3.7
#define LYING_MOB_LAYER 3.8
#define VEHICLE_LAYER 3.9
#define SPACEPOD_LAYER 3.9 //WS - Spess pods
//#define MOB_LAYER 4 //For easy recordkeeping; this is a byond define
#define ABOVE_MOB_LAYER 4.1
#define WALL_OBJ_LAYER 4.25
#define EDGED_TURF_LAYER 4.3
#define ON_EDGED_TURF_LAYER 4.35
#define LARGE_MOB_LAYER 4.4
#define ABOVE_ALL_MOB_LAYER 4.5

#define SPACEVINE_LAYER 4.8
#define SPACEVINE_MOB_LAYER 4.9
//#define FLY_LAYER 5 //For easy recordkeeping; this is a byond define
#define GASFIRE_LAYER 5.05
#define RIPPLE_LAYER 5.1

#define GHOST_LAYER 6
#define LOW_LANDMARK_LAYER 9
#define MID_LANDMARK_LAYER 9.1
#define HIGH_LANDMARK_LAYER 9.2
#define AREA_LAYER 10
#define MASSIVE_OBJ_LAYER 11
#define POINT_LAYER 12

#define EMISSIVE_BLOCKER_PLANE 12
#define EMISSIVE_BLOCKER_LAYER 12
#define EMISSIVE_BLOCKER_RENDER_TARGET "*EMISSIVE_BLOCKER_PLANE"

#define CHAT_LAYER 12.0001 // Do not insert layers between these two values
#define CHAT_LAYER_MAX 12.9999

#define EMISSIVE_PLANE 13
#define EMISSIVE_LAYER 13
#define EMISSIVE_RENDER_TARGET "*EMISSIVE_PLANE"

#define EMISSIVE_UNBLOCKABLE_PLANE 14
#define EMISSIVE_UNBLOCKABLE_LAYER 14
#define EMISSIVE_UNBLOCKABLE_RENDER_TARGET "*EMISSIVE_UNBLOCKABLE_PLANE"

#define LIGHTING_PLANE 15
#define LIGHTING_LAYER 15
#define LIGHTING_RENDER_TARGET "LIGHT_PLANE"

#define RAD_TEXT_LAYER 15.1

#define O_LIGHTING_VISUAL_PLANE 16
#define O_LIGHTING_VISUAL_LAYER 16
#define O_LIGHTING_VISUAL_RENDER_TARGET "O_LIGHT_VISUAL_PLANE"

#define ABOVE_LIGHTING_PLANE 17
#define ABOVE_LIGHTING_LAYER 17
#define ABOVE_LIGHTING_RENDER_TARGET "ABOVE_LIGHTING_PLANE"

#define BYOND_LIGHTING_PLANE 18
#define BYOND_LIGHTING_LAYER 18
#define BYOND_LIGHTING_RENDER_TARGET "BYOND_LIGHTING_PLANE"

#define CAMERA_STATIC_PLANE 19
#define CAMERA_STATIC_LAYER 19
#define CAMERA_STATIC_RENDER_TARGET "CAMERA_STATIC_PLANE"

#define RUNECHAT_PLANE 20

/// Plane for balloon text (text that fades up)
#define BALLOON_CHAT_PLANE 21

//HUD layer defines

#define FULLSCREEN_PLANE 31
#define FLASH_LAYER 31
#define FULLSCREEN_LAYER 31.1
#define UI_DAMAGE_LAYER 31.2
#define BLIND_LAYER 31.3
#define CRIT_LAYER 31.4
#define CURSE_LAYER 31.5
#define FULLSCREEN_RENDER_TARGET "FULLSCREEN_PLANE"

#define HUD_PLANE 42
#define HUD_LAYER 42
#define HUD_RENDER_TARGET "HUD_PLANE"
#define ABOVE_HUD_PLANE 43
#define ABOVE_HUD_LAYER 43
#define ABOVE_HUD_RENDER_TARGET "ABOVE_HUD_PLANE"

#define SPLASHSCREEN_LAYER 54
#define SPLASHSCREEN_PLANE 54
#define SPLASHSCREEN_RENDER_TARGET "SPLASHSCREEN_PLANE"

//Plane master critical flags
//Describes how different plane masters behave when they are being culled for performance reasons
/// This plane master will not go away if its layer is culled. useful for preserving effects
#define PLANE_CRITICAL_DISPLAY (1<<0)
/// This plane master will temporarially remove relays to non critical planes if it's layer is culled (and it's critical)
/// This is VERY hacky, but needed to ensure that some instances of BLEND_MULITPLY work as expected (fuck you god damn parallax)
/// It also implies that the critical plane has a *'d render target, making it mask itself
#define PLANE_CRITICAL_NO_EMPTY_RELAY (1<<1)

#define PLANE_CRITICAL_FUCKO_PARALLAX (PLANE_CRITICAL_DISPLAY|PLANE_CRITICAL_NO_EMPTY_RELAY)

/// A value of /datum/preference/numeric/multiz_performance that disables the option
#define MULTIZ_PERFORMANCE_DISABLE -1
