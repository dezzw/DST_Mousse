PrefabFiles = {
	"mousse",
	"mousse_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/mousse.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/mousse.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/mousse.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mousse.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/mousse_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mousse_silho.xml" ),

    Asset( "IMAGE", "bigportraits/mousse.tex" ),
    Asset( "ATLAS", "bigportraits/mousse.xml" ),
	
	Asset( "IMAGE", "images/map_icons/mousse.tex" ),
	Asset( "ATLAS", "images/map_icons/mousse.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_mousse.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_mousse.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_mousse.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_mousse.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_mousse.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_mousse.xml" ),
	
	Asset( "IMAGE", "images/names_mousse.tex" ),
    Asset( "ATLAS", "images/names_mousse.xml" ),
	
	Asset( "IMAGE", "images/names_gold_mousse.tex" ),
    Asset( "ATLAS", "images/names_gold_mousse.xml" ),
}

AddMinimapAtlas("images/map_icons/mousse.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.mousse = "The Sample Character"
STRINGS.CHARACTER_NAMES.mousse = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.mousse = "*Perk 1\n*Perk 2\n*Perk 3"
STRINGS.CHARACTER_QUOTES.mousse = "\"Quote\""
STRINGS.CHARACTER_SURVIVABILITY.mousse = "Slim"

-- Custom speech strings
STRINGS.CHARACTERS.MOUSSE = require "speech_mousse"

-- The character's name as appears in-game 
STRINGS.NAMES.MOUSSE = "Esc"
STRINGS.SKIN_NAMES.mousse_none = "Esc"

-- The skins shown in the cycle view window on the character select screen.
-- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -25 } 
    },
}

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("mousse", "FEMALE", skin_modes)
