-- 在文件开头，获取配置数据
local LANG = GetModConfigData("LANG")

-- 获取全局变量
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local TUNING = GLOBAL.TUNING
local TheWorld = GLOBAL.TheWorld
local TheNet = GLOBAL.TheNet
local Class = GLOBAL.Class

-- 预制体文件
PrefabFiles = {
	"mousse",
	"mousse_none",
	"mousse_cat_armor",
	"mousse_cat_hat",
	"mousse_elite_item",
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

    -- 精英物品资源
    Asset("ATLAS", "images/inventoryimages/mousse_elite_item.xml"),
    Asset("IMAGE", "images/inventoryimages/mousse_elite_item.tex"),

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

    -- 角色小头像
    Asset("IMAGE", "images/avatars/avatar_mousse.tex"),
    Asset("ATLAS", "images/avatars/avatar_mousse.xml"),

    -- 幽灵头像
    Asset("IMAGE", "images/avatars/avatar_ghost_mousse.tex"),
    Asset("ATLAS", "images/avatars/avatar_ghost_mousse.xml"),

    -- 自检头像
    Asset("IMAGE", "images/avatars/self_inspect_mousse.tex"),
    Asset("ATLAS", "images/avatars/self_inspect_mousse.xml"),

    -- 地图图标
    Asset("IMAGE", "images/map_icons/mousse.tex"),
    Asset("ATLAS", "images/map_icons/mousse.xml"),

    -- 角色动画
    Asset("ANIM", "anim/mousse.zip"),
    Asset("ANIM", "anim/ghost_mousse_build.zip"),

    -- 名称相关
    Asset("IMAGE", "images/names_mousse.tex"),
    Asset("ATLAS", "images/names_mousse.xml"),
    Asset("IMAGE", "images/names_gold_mousse.tex"),
    Asset("ATLAS", "images/names_gold_mousse.xml"),
}

-- 添加小地图图标
AddMinimapAtlas("images/map_icons/mousse.xml")

-- 角色名称和描述
STRINGS.CHARACTER_NAMES.mousse = "慕斯"
STRINGS.CHARACTER_DESCRIPTIONS.mousse = "* 可爱的猫猫"
STRINGS.CHARACTER_QUOTES.mousse = "\"喵~\""

-- 角色对话
STRINGS.CHARACTERS.MOUSSE = require "speech_mousse"

-- 角色选择界面
STRINGS.CHARACTER_TITLES.mousse = "可爱的猫猫"

-- 物品名称和描述
STRINGS.NAMES.MOUSSE_CAT_ARMOR = "慕斯的护甲"
STRINGS.RECIPE_DESC.MOUSSE_CAT_ARMOR = "专属于慕斯的防护装备"

STRINGS.NAMES.MOUSSE_CAT_HAT = "慕斯的草帽"
STRINGS.RECIPE_DESC.MOUSSE_CAT_HAT = "专属于慕斯的帽子"

STRINGS.NAMES.MOUSSE_ELITE_ITEM = "慕斯的秘药"
STRINGS.RECIPE_DESC.MOUSSE_ELITE_ITEM = "慕斯的神秘药剂，可以恢复30点生命值和15点精神值"

-- 添加制作栏
AddRecipe2("mousse_cat_armor", {Ingredient("log", 8), Ingredient("rope", 2)}, TECH.SCIENCE_ONE, {
    atlas = "images/inventoryimages/mousse_cat_armor.xml",
    image = "mousse_cat_armor.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

AddRecipe2("mousse_cat_hat", {Ingredient("cutgrass", 12)}, TECH.NONE, {
    atlas = "images/inventoryimages/mousse_cat_hat.xml",
    image = "mousse_cat_hat.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

AddRecipe2("mousse_elite_item", {Ingredient("ash", 2), Ingredient("spidergland", 1)}, TECH.SCIENCE_ONE, {
    atlas = "images/inventoryimages/mousse_elite_item.xml",
    image = "mousse_elite_item.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

-- 注册角色
local skin_modes = {
    { type = "ghost_skin", anim_bank = "ghost_mousse_build", anim_build = "ghost_mousse_build", scale = 0.75 },
}

AddModCharacter("mousse", "FEMALE", skin_modes) 