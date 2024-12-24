local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset( "ANIM", "anim/mousse.zip" ),
    Asset( "ANIM", "anim/ghost_mousse_build.zip" ),
}

-- 基础数值设定
TUNING.MOUSSE_HEALTH = 250
TUNING.MOUSSE_HUNGER = 150
TUNING.MOUSSE_SANITY = 100

-- 初始物品
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.MOUSSE = {
    "flint",
    "flint",
    "twigs",
    "twigs",
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.MOUSSE
end
local prefabs = FlattenTree(start_inv, true)

-- 复活后的速度修改
local function onbecamehuman(inst)
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "mousse_speed_mod", 1.05)
end

local function onbecameghost(inst)
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "mousse_speed_mod")
end

-- 加载和重生时的处理
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- 客户端初始化
local function common_postinit(inst) 
    inst.MiniMapEntity:SetIcon( "mousse.tex" )
end

-- 服务器端初始化
local function master_postinit(inst)
    -- 设置初始物品
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
    
    -- 设置声音
    inst.soundsname = "wolfgang"
    
    -- 设置基础属性
    inst.components.health:SetMaxHealth(TUNING.MOUSSE_HEALTH)
    inst.components.hunger:SetMax(TUNING.MOUSSE_HUNGER)
    inst.components.sanity:SetMax(TUNING.MOUSSE_SANITY)
    
    -- 其他属性设置
    inst.components.combat.damagemultiplier = 1.1
    inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
    inst.components.eater.ignoresspoilage = true
    inst.components.locomotor.walkspeed = 4
    inst.components.locomotor.runspeed = 7
    
    inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("mousse", prefabs, assets, common_postinit, master_postinit)
