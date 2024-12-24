PrefabFiles = {
	"mousse",
	"mousse_armor",
	"catchest"
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

	Asset("ANIM", "anim/mousse.zip"),
	Asset("ANIM", "anim/ghost_mousse_build.zip"),
}

AddMinimapAtlas("images/map_icons/mousse.xml")

STRINGS.CHARACTERS.MOUSSE = require("speech_mousse")

-- 修改字符串
STRINGS.CHARACTER_TITLES.mousse = "慕斯 -- Mousse"
STRINGS.CHARACTER_NAMES.mousse = "Mousse"
STRINGS.CHARACTER_DESCRIPTIONS.mousse = "*有升级系统\n*初始携带绒球*\n是个可爱猫猫"
STRINGS.CHARACTER_QUOTES.mousse = "\"你好......请、请叫我慕斯......那个，我的手，请您不要盯着我的手看......\""
STRINGS.CHARACTER_SURVIVABILITY.mousse = "Slim"

-- 护甲相关字符串
STRINGS.NAMES.MOUSSE_ARMOR = "慕斯的特制护甲"
STRINGS.RECIPE_DESC.MOUSSE_ARMOR = "只有慕斯才能穿戴的护甲"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MOUSSE_ARMOR = "我不能穿这个！"

-- 添加配方
AddRecipe("mousse_armor",
{
	Ingredient("log", 4),
	Ingredient("rope", 2),
},
RECIPETABS.SURVIVAL,
TECH.SCIENCE_ONE,
nil, -- placer
nil, -- min_spacing
nil, -- nounlock
nil, -- numtogive
nil, -- builder_tag
"images/inventoryimages/grassarmor.xml",
"grassarmor.tex"
)

-- 添加角色到mod列表
AddModCharacter("mousse", "FEMALE")
