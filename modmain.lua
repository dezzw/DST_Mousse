local require = GLOBAL.require

PrefabFiles = {
    "mousse",
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
	
    Asset( "IMAGE", "images/mapicon/minimap.tex" ),
    Asset( "ATLAS", "images/mapicon/minimap.xml" ),
}

AddMinimapAtlas("images/mapicon/minimap.xml")

-- strings! Any "DPL" below would have to be replaced by the prefab name of your character.

-- The character select screen lines
-- note: these are lower-case character name
GLOBAL.STRINGS.CHARACTER_TITLES.mousse = "慕斯 -- Mousse"
GLOBAL.STRINGS.CHARACTER_NAMES.mousse = "Mousse"  -- Note! This line is especially important as some parts of the game require
                                            -- the character to have a valid name.
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.mousse = "*有升级系统\n*初始携带绒球"
GLOBAL.STRINGS.CHARACTER_QUOTES.mousse = "\"你好......请、请叫我慕斯......那个，我的手，请您不要盯着我的手看......\""

-- You can also add any kind of custom dialogue that you would like. Don't forget to make
-- categores that don't exist yet using = {}
-- note: these are UPPER-CASE charcacter name
GLOBAL.STRINGS.CHARACTERS.MOUSSE = {}
GLOBAL.STRINGS.CHARACTERS.MOUSSE.DESCRIBE = {}
GLOBAL.STRINGS.CHARACTERS.MOUSSE = require "speech_mousse"

-- Let the game know Dpl is a male, for proper pronouns during the end-game sequence.
-- Possible genders here are MALE, FEMALE, or ROBOT
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "mousse")

AddModCharacter("mousse")
