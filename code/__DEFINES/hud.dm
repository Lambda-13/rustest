//HUD styles. Index order defines how they are cycled in F12.
/// Standard hud
#define HUD_STYLE_STANDARD 1
/// Reduced hud (just hands and intent switcher)
#define HUD_STYLE_REDUCED 2
/// No hud (for screenshots)
#define HUD_STYLE_NOHUD 3

/// Used in show_hud(); Please ensure this is the same as the maximum index.
#define HUD_VERSIONS 3

//1:1 HUD layout stuff
#define UI_BOXCRAFT "EAST-4:22,SOUTH+1:6"
#define UI_BOXAREA "EAST-4:6,SOUTH+1:6"
#define UI_BOXLANG "EAST-5:22,SOUTH+1:6"

/*
	These defines specificy screen locations.  For more information, see the byond documentation on the screen_loc var.
	The short version:
	Everything is encoded as strings because apparently that's how Byond rolls.
	"1,1" is the bottom left square of the user's screen.  This aligns perfectly with the turf grid.
	"1:2,3:4" is the square (1,3) with pixel offsets (+2, +4); slightly right and slightly above the turf grid.
	Pixel offsets are used so you don't perfectly hide the turf under them, that would be crappy.
	In addition, the keywords TOP, BOTTOM, RIGHT, LEFT and CENTER can be used to represent their respective
	screen borders. TOP-1, for example, is the row just below the upper edge. Useful if you want your
	UI to scale with screen size.
	The size of the user's screen is defined by client.view (indirectly by world.view), in our case "15x15".
	Therefore, the top right corner (except during admin shenanigans) is at "15,15"
*/

/*proc/ui_hand_position(i, retro = TRUE) //values based on old hand ui positions (CENTER:-/+16,BOTTOM:5)
	var/x_off = -(!(i % 2))
	var/y_off = round((i-1) / 2)
	if(!retro)
		if(i > 2)
			return "CENTER+[x_off + 1],BOTTOM+[y_off - 1]"
		return "bottom:LEFT+[x_off + 10],BOTTOM"
	return "CENTER+[x_off]:16,BOTTOM+[y_off]:5"

/proc/ui_equip_position(mob/M, retro = TRUE)
	var/y_off = round((M.held_items.len-1) / 2) //values based on old equip ui position (CENTER: +/-16,BOTTOM+1:5)
	return "CENTER:-[retro ? 16 : 0],BOTTOM+[y_off + retro]:[retro ? 5 : 0]"

/proc/ui_swaphand_position(mob/M, which = 1, retro = TRUE) //values based on old swaphand ui positions (CENTER: +/-16,BOTTOM+1:5)
	var/x_off = which == 1 ? -1 : 0
	var/y_off = round((M.held_items.len-1) / 2)
	return "CENTER+[x_off]:[retro ? 16 : 32],BOTTOM+[y_off + retro]:[retro ? 5 : 0]" */

//Lower left, persistent menu
#define UI_INVENTORY "LEFT+3,BOTTOM"

//Middle left indicators
#define UI_LINGCHEMDISPLAY  "LEFT,CENTER-1:15"
#define UI_LINGSTINGDISPLAY "LEFT:6,CENTER-3:11"

//Lower center, persistent menu
#define UI_SSTORE1  "bottom:LEFT+7,BOTTOM"
#define UI_ID 		"bottom:LEFT+13,BOTTOM"
#define UI_BELT 	"bottom:LEFT+6,BOTTOM"
#define UI_BACK 	"bottom:LEFT+8,BOTTOM"
#define UI_STORAGE1 "bottom:LEFT+11,BOTTOM"
#define UI_STORAGE2 "bottom:LEFT+12,BOTTOM"
#define UI_COMBO 	"hud:LEFT,TOP-11:22" //combo meter for martial arts

//Pop-up inventory
#define UI_SHOES 	 "bottom:LEFT,BOTTOM"
#define UI_ICLOTHING "bottom:LEFT+1,BOTTOM"
#define UI_OCLOTHING "bottom:LEFT+2,BOTTOM"
#define UI_GLOVES 	 "bottom:LEFT+3,BOTTOM"
#define UI_GLASSES 	 "LEFT+1,BOTTOM"
#define UI_MASK 	 "bottom:LEFT+4,BOTTOM"
#define UI_EARS 	 "LEFT+2,BOTTOM"
#define UI_NECK 	 "LEFT,BOTTOM"
#define UI_HEAD 	 "bottom:LEFT+5,BOTTOM"

//Lower right, persistent menu
#define UI_ABOVE_MOVEMENT "RIGHT-2:26,BOTTOM+1:7"
#define UI_PULL 		 "bottom:RIGHT-1,BOTTOM"
#define UI_REST 		 "bottom:RIGHT-2,BOTTOM"
#define UI_RESIST 		 "bottom:RIGHT-1,BOTTOM:16"
#define UI_THROW 		 "bottom:RIGHT,BOTTOM:16"
#define UI_DROP 		 "bottom:RIGHT,BOTTOM"
#define UI_MOVI 		 "bottom:RIGHT-2,BOTTOM:16"
#define UI_ACTI 		 "hud:LEFT,BOTTOM"
#define UI_ZONESEL 		 "hud:LEFT,TOP"
#define UI_ACTI_ALT 	 "RIGHT-1:28,BOTTOM:5"	//alternative intent switcher for when the interface is hidden (F12)

#define UI_PULL_ALIEN 	 "hud:LEFT,BOTTOM+1:16"
#define UI_REST_ALIEN    "hud:LEFT,BOTTOM+2"
#define UI_RESIST_ALIEN  "hud:LEFT,BOTTOM+1"
#define UI_THROW_ALIEN 	 "hud:LEFT,BOTTOM+2:16"
#define UI_DROP_ALIEN 	 "hud:LEFT,BOTTOM+3"

//Upper-middle right (alerts)
#define UI_ALERT1 "hud:LEFT,TOP-2"
#define UI_ALERT2 "hud:LEFT,TOP-3"
#define UI_ALERT3 "hud:LEFT,TOP-4"
#define UI_ALERT4 "hud:LEFT,TOP-5"
#define UI_ALERT5 "hud:LEFT,TOP-6"

//Middle right (status indicators)
#define UI_HEALTHDOLL 	 "hud:LEFT,TOP-10"
#define UI_STAMINA 		 "hud:LEFT,TOP-8"
#define UI_HEALTH 		 "hud:LEFT,TOP-8"
#define UI_MOOD 		 "hud:LEFT,TOP-7"
#define UI_SPACESUIT 	 "hud:LEFT,TOP-11"
#define UI_FIXEYE 		 "bottom:RIGHT-3,BOTTOM"
#define UI_RELATIVE_TEMP "hud:LEFT,BOTTOM+2"

//Generic living
#define UI_LIVING_PULL 		 "hud:LEFT,BOTTOM"
#define UI_LIVING_HEALTHDOLL "hud:LEFT,TOP-10"

//Drones
#define UI_DRONE_DROP 	 "hud:LEFT,BOTTOM+1"
#define UI_DRONE_PULL 	 "hud:LEFT,BOTTOM+1:16"
#define UI_DRONE_STORAGE "hud:LEFT,BOTTOM+2"
#define UI_DRONE_HEAD 	 "hud:LEFT,BOTTOM+3"

//Cyborgs
#define UI_BORG_HEALTH 			"hud:LEFT:-3,TOP-8"
#define UI_BORG_PULL 			"hud:LEFT,TOP-12"
#define UI_BORG_RADIO 			"hud:LEFT,BOTTOM+1"
#define UI_BORG_INTENTS 		"hud:LEFT,BOTTOM"
#define UI_BORG_LAMP 			"hud:LEFT,TOP-7"
#define UI_BORG_TABLET 			"hud:LEFT,BOTTOM+2"
#define UI_INV1 				"CENTER-2:16,BOTTOM:5"
#define UI_INV2 				"CENTER-1:16,BOTTOM:5"
#define UI_INV3 				"CENTER:16,BOTTOM:5"
#define UI_BORG_MODULE 			"CENTER+1:16,BOTTOM:5"
#define UI_BORG_STORE 			"CENTER+2:16,BOTTOM:5"
#define UI_BORG_CAMERA 			"hud:LEFT,BOTTOM+6"
#define UI_BORG_ALERTS 			"hud:LEFT,BOTTOM+5"
#define UI_BORG_LANGUAGE_MENU 	"hud:LEFT:16,BOTTOM+4:16"

//Aliens
#define UI_ALIEN_HEALTH 		"hud:LEFT,BOTTOM+7"
#define UI_ALIENPLASMADISPLAY 	"hud:LEFT,TOP-9"
#define UI_ALIEN_QUEEN_FINDER 	"hud:LEFT,TOP-7"
#define UI_ALIEN_STORAGE_R 		"hud:LEFT,TOP-10"
#define UI_ALIEN_LANGUAGE_MENU 	"hud:LEFT:16,BOTTOM+3:16"

//Constructs
#define UI_CONSTRUCT_PULL 	"RIGHT,CENTER-2:15"
#define UI_CONSTRUCT_HEALTH "RIGHT,CENTER:15"

// AI
#define UI_AI_CORE 			 "hud:LEFT,TOP"
#define UI_AI_CAMERA_LIST 	 "hud:LEFT,TOP-1"
#define UI_AI_TRACK_WITH_CAMERA "hud:LEFT,TOP-2"
#define UI_AI_CAMERA_LIGHT 	 "hud:LEFT,TOP-3"
#define UI_AI_CREW_MONITOR 	 "hud:LEFT,TOP-4"
#define UI_AI_CREW_MANIFEST  "hud:LEFT,TOP-5"
#define UI_AI_ALERTS 		 "hud:LEFT,TOP-6"
#define UI_AI_ANNOUNCEMENT 	 "hud:LEFT,TOP-7"
#define UI_AI_SHUTTLE 		 "hud:LEFT,TOP-8"
#define UI_AI_STATE_LAWS 	 "hud:LEFT,TOP-9"
#define UI_AI_MOD_INT 		 "hud:LEFT,TOP-10"
#define UI_AI_TAKE_PICTURE 	 "hud:LEFT,TOP-11"
#define UI_AI_VIEW_IMAGES 	 "hud:LEFT,TOP-12"
#define UI_AI_SENSOR 		 "hud:LEFT,TOP-13"
#define UI_AI_MULTICAM 		 "hud:LEFT,TOP-14"
#define UI_AI_ADD_MULTICAM 	 "hud:LEFT,TOP-15"
#define UI_AI_LANGUAGE_MENU  "RIGHT:10,BOTTOM:4"

// pAI
#define UI_PAI_SOFTWARE 	 "hud:LEFT,TOP"
#define UI_PAI_SHELL 		 "hud:LEFT,TOP-1"
#define UI_PAI_CHASSIS 		 "hud:LEFT,TOP-2"
#define UI_PAI_REST 		 "hud:LEFT,TOP-3"
#define UI_PAI_LIGHT 		 "hud:LEFT,TOP-4"
#define UI_PAI_NEWSCASTER 	 "hud:LEFT,TOP-5"
#define UI_PAI_HOST_MONITOR  "hud:LEFT,TOP-6"
#define UI_PAI_CREW_MANIFEST "hud:LEFT,TOP-7"
#define UI_PAI_STATE_LAWS 	 "hud:LEFT,TOP-8"
#define UI_PAI_MOD_INT 		 "hud:LEFT,TOP-9"
#define UI_PAI_INTERNAL_GPS  "hud:LEFT,TOP-10"
#define UI_PAI_TAKE_PICTURE  "hud:LEFT,TOP-13"
#define UI_PAI_VIEW_IMAGES 	 "hud:LEFT,TOP-14"
#define UI_PAI_RADIO 		 "hud:LEFT,TOP-15"
#define UI_PAI_LANGUAGE_MENU "hud:LEFT:16,TOP-11"
#define UI_PAI_NAVIGATE_MENU "hud:LEFT:16,TOP-12:16"

//Ghosts
#define UI_GHOST_JUMPTOMOB 		"hud:LEFT,BOTTOM"
#define UI_GHOST_ORBIT 			"hud:LEFT,BOTTOM+1"
#define UI_GHOST_REENTER_CORPSE "hud:LEFT,BOTTOM+2"
#define UI_GHOST_TELEPORT 		"hud:LEFT,BOTTOM+3"
#define UI_GHOST_LANGUAGE_MENU 	"hud:LEFT,BOTTOM+4:16"
#define UI_GHOST_PAI 			"hud:LEFT,BOTTOM+4:16"
#define UI_GHOST_SPAWNERS 		"hud:LEFT,BOTTOM+5"
#define UI_GHOST_MINIGAMES 		"hud:LEFT,BOTTOM+6"

//1:1 HUD layout stuff
//#define UI_BOXCRAFT 			"bottom:RIGHT-3,BOTTOM:16"
//#define UI_BOXAREA 				"bottom:RIGHT-3:16,BOTTOM:16"
//#define UI_BOXLANG 				"bottom:RIGHT-4:16,BOTTOM:16"
#define UI_MULTIZ_UP 			"hud:LEFT,BOTTOM+4:16"
#define UI_MULTIZ_UP_HUMAN 		"bottom:RIGHT-4,BOTTOM:16"
#define UI_MULTIZ_UP_OBSERVER 	"hud:LEFT,BOTTOM+4"
#define UI_MULTIZ_UP_AI 		"RIGHT:10,BOTTOM+1:12"
#define UI_MULTIZ_DOWN 			"hud:LEFT,BOTTOM+4"
#define UI_MULTIZ_DOWN_HUMAN 	"bottom:RIGHT-4,BOTTOM"
#define UI_MULTIZ_DOWN_OBSERVER "hud:LEFT:16,BOTTOM+4"
#define UI_MULTIZ_DOWN_AI 		"RIGHT:10,BOTTOM:24"
#define UI_EMOTES 				"hud:LEFT:16,BOTTOM+4"
#define UI_EMOTES_HUMAN 		"bottom:RIGHT-4:16,BOTTOM"
#define UI_SKILLS 				"hud:LEFT,BOTTOM+3"

//Blob
#define UI_BLOB_HELP 		 "hud:LEFT,TOP"
#define UI_BLOB_HEALTH 		 "hud:LEFT,TOP-1"
#define UI_BLOB_JUMP_TO_CORE "hud:LEFT,TOP-2"
#define UI_BLOB_BLOBBERNAUT  "hud:LEFT,TOP-3"
#define UI_BLOB_RESOURCE 	 "hud:LEFT,TOP-4"
#define UI_BLOB_NODE 		 "hud:LEFT,TOP-5"
#define UI_BLOB_FACTORY 	 "hud:LEFT,TOP-6"
#define UI_BLOB_RESOURCES 	 "hud:LEFT,TOP-7"
#define UI_BLOB_READAPT 	 "hud:LEFT,TOP-8"
#define UI_BLOB_RELOCATE 	 "hud:LEFT,TOP-9"
#define UI_BLOB_JUMP_TO_NODE "hud:LEFT,BOTTOM"

//Blobbernauts
#define UI_BLOBBERNAUT_OVERMIND_HEALTH "hud:LEFT,BOTTOM"

//Families
#define UI_WANTED_LVL "TOP,11"

//Ammo HUD
#define UI_AMMOCOUNTER "hud:LEFT,BOTTOM+1"

//Ruination
#define UI_STATION_HEIGHT "BOTTOM, RIGHT"

//Bloodsucker
#define UI_SUNLIGHT_DISPLAY "LEFT:6,CENTER-0:0"
#define UI_BLOOD_DISPLAY "LEFT:6,CENTER-1:0"
#define UI_VAMPRANK_DISPLAY "LEFT:6,CENTER-2:-5"

// Defines relating to action button positions

/// Whatever the base action datum thinks is best
#define SCRN_OBJ_DEFAULT "default"
/// Floating somewhere on the hud, not in any predefined place
#define SCRN_OBJ_FLOATING "floating"
/// In the list of buttons stored at the top of the screen
#define SCRN_OBJ_IN_LIST "list"

///Inserted first in the list
#define SCRN_OBJ_INSERT_FIRST "first"

// Plane group keys, used to group swaths of plane masters that need to appear in subwindows
/// The primary group, holds everything on the main window
#define PLANE_GROUP_MAIN "main"
/// A secondary group, used when a client views a generic window
#define PLANE_GROUP_POPUP_WINDOW(screen) "popup-[REF(screen)]"

/// The filter name for the hover outline
#define HOVER_OUTLINE_FILTER "hover_outline"

#define NEOHUD_RIGHT  (1<<0)
#define NEOHUD_BOTTOM (1<<1)
