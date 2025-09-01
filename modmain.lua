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
	"melantha",
	"melantha_none",
	"melantha_cat_armor",
	"melantha_cat_hat",
	"melantha_elite_item",
	"melantha_weapon",
}

-- 资源文件
Assets = {
    -- 护甲相关资源
    Asset("ANIM", "anim/armor_grass.zip"),
    Asset("ATLAS", "images/inventoryimages/melantha_cat_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_cat_armor.tex"),

    -- 帽子相关资源
    Asset("ANIM", "anim/hat_straw.zip"),
    Asset("ATLAS", "images/inventoryimages/melantha_cat_hat.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_cat_hat.tex"),

    -- 精英物品资源
    Asset("ATLAS", "images/inventoryimages/melantha_elite_item.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_elite_item.tex"),

    -- 武器资源
    Asset("ATLAS", "images/inventoryimages/melantha_weapon.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_weapon.tex"),
    Asset("ANIM", "anim/swap_melantha_weapon.zip"),

    -- 角色相关资源
    Asset("IMAGE", "images/saveslot_portraits/melantha.tex"),
    Asset("ATLAS", "images/saveslot_portraits/melantha.xml"),
    
    -- 角色选择界面的立绘
    Asset("IMAGE", "images/selectscreen_portraits/melantha.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/melantha.xml"),
    
    -- 角色选择界面的剪影
    Asset("IMAGE", "images/selectscreen_portraits/melantha_silho.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/melantha_silho.xml"),

    -- 角色大头像
    Asset("IMAGE", "bigportraits/melantha.tex"),
    Asset("ATLAS", "bigportraits/melantha.xml"),

    -- 角色小头像
    Asset("IMAGE", "images/avatars/avatar_melantha.tex"),
    Asset("ATLAS", "images/avatars/avatar_melantha.xml"),

    -- 幽灵头像
    Asset("IMAGE", "images/avatars/avatar_ghost_melantha.tex"),
    Asset("ATLAS", "images/avatars/avatar_ghost_melantha.xml"),

    -- 自检头像
    Asset("IMAGE", "images/avatars/self_inspect_melantha.tex"),
    Asset("ATLAS", "images/avatars/self_inspect_melantha.xml"),

    -- 地图图标
    Asset("IMAGE", "images/map_icons/melantha.tex"),
    Asset("ATLAS", "images/map_icons/melantha.xml"),

    -- 角色动画
    Asset("ANIM", "anim/melantha.zip"),
    Asset("ANIM", "anim/ghost_melantha_build.zip"),

    -- 名称相关
    Asset("IMAGE", "images/names_melantha.tex"),
    Asset("ATLAS", "images/names_melantha.xml"),
    Asset("IMAGE", "images/names_gold_melantha.tex"),
    Asset("ATLAS", "images/names_gold_melantha.xml"),
}

-- 添加小地图图标
AddMinimapAtlas("images/map_icons/melantha.xml")

-- 角色名称和描述
STRINGS.CHARACTER_NAMES.melantha = "Melantha"
STRINGS.CHARACTER_DESCRIPTIONS.melantha = "* A mysterious character with unique abilities"
STRINGS.CHARACTER_QUOTES.melantha = "\"...\""

-- 角色对话
STRINGS.CHARACTERS.MELANTHA = require "speech_melantha"

-- 角色选择界面
STRINGS.CHARACTER_TITLES.melantha = "The Mysterious One"

-- 物品名称和描述
STRINGS.NAMES.MELANTHA_CAT_ARMOR = "Melantha's Armor"
STRINGS.RECIPE_DESC.MELANTHA_CAT_ARMOR = "Protective equipment exclusive to Melantha"

STRINGS.NAMES.MELANTHA_CAT_HAT = "Melantha's Hat"
STRINGS.RECIPE_DESC.MELANTHA_CAT_HAT = "A hat exclusive to Melantha"

STRINGS.NAMES.MELANTHA_ELITE_ITEM = "Melantha's Elixir"
STRINGS.RECIPE_DESC.MELANTHA_ELITE_ITEM = "Melantha's mysterious elixir, restores 30 health and 15 sanity"

STRINGS.NAMES.MELANTHA_WEAPON = "Melantha's Weapon"
STRINGS.RECIPE_DESC.MELANTHA_WEAPON = "Melantha's exclusive weapon, can be socketed with gems for special effects"

-- 添加制作栏
AddRecipe2("melantha_cat_armor", {Ingredient("log", 8), Ingredient("rope", 2)}, TECH.SCIENCE_ONE, {
    atlas = "images/inventoryimages/melantha_cat_armor.xml",
    image = "melantha_cat_armor.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

AddRecipe2("melantha_cat_hat", {Ingredient("cutgrass", 12)}, TECH.NONE, {
    atlas = "images/inventoryimages/melantha_cat_hat.xml",
    image = "melantha_cat_hat.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

AddRecipe2("melantha_elite_item", {Ingredient("ash", 2), Ingredient("spidergland", 1)}, TECH.SCIENCE_ONE, {
    atlas = "images/inventoryimages/melantha_elite_item.xml",
    image = "melantha_elite_item.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

AddRecipe2("melantha_weapon", {Ingredient("cutgrass", 2), Ingredient("twigs", 2)}, TECH.NONE, {
    atlas = "images/inventoryimages/melantha_weapon.xml",
    image = "melantha_weapon.tex",
    placer = nil,
    min_spacing = 1,
    no_deconstruction = false,
})

-- 注册角色
local skin_modes = {
    { type = "ghost_skin", anim_bank = "ghost_melantha_build", anim_build = "ghost_melantha_build", scale = 0.75 },
}

AddModCharacter("melantha", "FEMALE", skin_modes) 