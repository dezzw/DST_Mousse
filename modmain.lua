-- 一些预设置，防止系统报错
env.RECIPETABS = GLOBAL.RECIPETABS 
env.TECH = GLOBAL.TECH
env.STRINGS = GLOBAL.STRINGS

-- 预制体文件
PrefabFiles = {
	"mousse",
	"mousse_none",
	"mousse_cat_armor",
	"mousse_cat_hat",
}

-- 资源文件
Assets = {
    -- 护甲相关资源
    Asset("ANIM", "anim/armor_grass.zip"),
    Asset("ATLAS", "images/inventoryimages/mousse_cat_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/mousse_cat_armor.tex"),

    -- 帽子相关资源
    Asset("ANIM", "anim/hat_straw.zip"),
    Asset("ATLAS", "images/inventoryimages/mousse_cat_hat.xml"),
    Asset("IMAGE", "images/inventoryimages/mousse_cat_hat.tex"),

    -- 角色相关资源
    Asset("IMAGE", "images/saveslot_portraits/mousse.tex"),
    Asset("ATLAS", "images/saveslot_portraits/mousse.xml"),
    
    -- 角色选择界面的立绘
    Asset("IMAGE", "images/selectscreen_portraits/mousse.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/mousse.xml"),
    
    -- 角色选择界面的剪影
    Asset("IMAGE", "images/selectscreen_portraits/mousse_silho.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/mousse_silho.xml"),

    -- 角色大头像
    Asset("IMAGE", "bigportraits/mousse.tex"),
    Asset("ATLAS", "bigportraits/mousse.xml"),
    
    -- 小地图上的角色图标
    Asset("IMAGE", "images/map_icons/mousse.tex"),
    Asset("ATLAS", "images/map_icons/mousse.xml"),
    
    -- 角色头像
    Asset("IMAGE", "images/avatars/avatar_mousse.tex"),
    Asset("ATLAS", "images/avatars/avatar_mousse.xml"),
    
    -- 角色灵魂状态头像
    Asset("IMAGE", "images/avatars/avatar_ghost_mousse.tex"),
    Asset("ATLAS", "images/avatars/avatar_ghost_mousse.xml"),
    
    -- 自我检查时的头像
    Asset("IMAGE", "images/avatars/self_inspect_mousse.tex"),
    Asset("ATLAS", "images/avatars/self_inspect_mousse.xml"),
    
    -- 角色名字显示
    Asset("IMAGE", "images/names_mousse.tex"),
    Asset("ATLAS", "images/names_mousse.xml"),
    
    -- 角色金色名字显示
    Asset("IMAGE", "images/names_gold_mousse.tex"),
    Asset("ATLAS", "images/names_gold_mousse.xml"),
}

-- 添加小地图图标（在 Assets 声明后添加）
AddMinimapAtlas("images/map_icons/mousse.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.mousse = "可爱猫猫"
STRINGS.CHARACTER_NAMES.mousse = "慕斯"
STRINGS.CHARACTER_DESCRIPTIONS.mousse = "*Perk 1\n*Perk 2\n*Perk 3"
STRINGS.CHARACTER_QUOTES.mousse = "\"Quote\""
STRINGS.CHARACTER_SURVIVABILITY.mousse = "建议"

-- Custom speech strings
STRINGS.CHARACTERS.MOUSSE = require "speech_mousse"

-- The character's name as appears in-game 
STRINGS.NAMES.MOUSSE = "慕斯"
STRINGS.SKIN_NAMES.mousse_none = "慕斯"

-- 护甲相关文本
STRINGS.NAMES.MOUSSE_CAT_ARMOR = "慕斯的护甲"
STRINGS.RECIPE_DESC.MOUSSE_CAT_ARMOR = "专属于慕斯的防护装备"

-- 添加帽子相关文本
STRINGS.NAMES.MOUSSE_CAT_HAT = "慕斯的草帽"
STRINGS.RECIPE_DESC.MOUSSE_CAT_HAT = "专属于慕斯的帽子"

-- The skins shown in the cycle view window on the character select screen.
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -25 } 
    },
}

-- 添加配方
local armor_config = {
    atlas = "images/inventoryimages/mousse_cat_armor.xml",
    image = "mousse_cat_armor.tex",
    builder_tag = "mousse",
}

local hat_config = {
    atlas = "images/inventoryimages/mousse_cat_hat.xml",
    image = "mousse_cat_hat.tex",
    builder_tag = "mousse",
}

-- 添加护甲配方
AddRecipe2("mousse_cat_armor", {Ingredient("log", 8), Ingredient("rope", 2)}, TECH.SCIENCE_ONE, armor_config)

-- 添加帽子配方
AddRecipe2("mousse_cat_hat", {Ingredient("cutgrass", 12)}, TECH.NONE, hat_config)

AddModCharacter("mousse", "FEMALE", skin_modes)
