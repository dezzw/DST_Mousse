local Assets = {
    Asset("ATLAS", "images/inventoryimages/melantha_weapon.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_weapon.tex"),
    Asset("ANIM", "anim/swap_melantha_weapon.zip"),
}

-- 宝石效果数据
local GEM_EFFECTS = {
    redgem = {
        name = "红宝石",
        description = "每个提升伤害 5 点",
        damage_bonus = 5,
        max_count = 10,
        color = {1, 0.2, 0.2}
    },
    bluegem = {
        name = "蓝宝石", 
        description = "冰冻敌对生物",
        freeze_value = 1,  -- 每次攻击增加1点冰冻值
        max_count = 10,
        color = {0.2, 0.2, 1}
    },
    purplegem = {
        name = "紫宝石",
        description = "造成额外真实伤害(每个10点)",
        true_damage = 10,
        max_count = 5,
        color = {0.8, 0.2, 0.8}
    },
    orangegem = {
        name = "橙宝石",
        description = "增加移速 20%",
        speed_bonus = 0.2,
        max_count = 1,
        color = {1, 0.6, 0.2}
    },
    yellowgem = {
        name = "黄宝石",
        description = "提供发光效果(放入宝石越多光越大)",
        light_bonus = 0.5,
        max_count = 3,
        color = {1, 1, 0.2}
    },
    greengem = {
        name = "绿宝石",
        description = "造成 2% 百分比伤害",
        percent_damage = 0.02,
        max_count = 5,
        color = {0.2, 1, 0.2}
    },
    opalpreciousgem = {
        name = "彩虹宝石",
        description = "增加伤害 50, 暴击率 +25% (最多 3 个)",
        damage_bonus = 50,
        crit_chance = 0.25,
        max_count = 3,
        color = {1, 1, 1}
    }
}

-- 检查是否为Melantha角色
local function IsMelantha(wielder)
    return wielder and wielder.prefab == "melantha"
end

-- 装备时的效果
local function onequip(inst, owner)
    if not IsMelantha(owner) then
        return
    end
    
    -- 设置武器动画
    owner.AnimState:OverrideSymbol("swap_object", "swap_melantha_weapon", "swap_melantha_weapon")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    
    -- 添加速度加成
    local speed_bonus = 0.1  -- 10%速度加成
    owner.components.locomotor:SetExternalSpeedMultiplier(self.inst, "melantha_weapon_speed", 1 + speed_bonus)
end

-- 卸下装备时的效果
local function onunequip(inst, owner)
    if not IsMelantha(owner) then
        return
    end
    
    -- 移除武器动画
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    owner.AnimState:ClearOverrideSymbol("swap_object")
    
    -- 移除速度加成
    owner.components.locomotor:RemoveExternalSpeedMultiplier(self.inst, "melantha_weapon_speed")
end

-- 攻击时的特殊效果
local function onattack(inst, attacker, target)
    if not IsMelantha(attacker) then
        return
    end
    
    if target and target.components.health and not target.components.health:IsDead() then
        -- 真实伤害效果（无视护甲）
        local true_damage = 5
        target.components.health:DoDelta(-true_damage, true, "melantha_weapon_true_damage")
        
        -- 百分比伤害效果
        local max_health = target.components.health.maxhealth
        local damage = max_health * 0.05  -- 5%最大生命值伤害
        target.components.health:DoDelta(-damage, true, "melantha_weapon_percent_damage")
        
        -- 暴击效果（20%概率）
        if math.random() < 0.2 then
            local base_damage = 15
            target.components.health:DoDelta(-base_damage, true, "melantha_weapon_crit")
        end
    end
end

-- 宝石镶嵌组件
local MouthWeaponGems = Class(function(self, inst)
    self.inst = inst
    self.gems = {}  -- {gem_type = count}
    self.total_gems = 0
end)

function MouthWeaponGems:AddGem(gem_type, count)
    count = count or 1
    local gem_data = GEM_EFFECTS[gem_type]
    if not gem_data then
        return false
    end
    
    local current_count = self.gems[gem_type] or 0
    local new_count = math.min(current_count + count, gem_data.max_count)
    local actually_added = new_count - current_count
    
    if actually_added > 0 then
        self.gems[gem_type] = new_count
        self.total_gems = self.total_gems + actually_added
        self:UpdateStats()
        return true, actually_added
    end
    
    return false, 0
end

function MouthWeaponGems:UpdateStats()
    local weapon = self.inst.components.weapon
    if not weapon then return end
    
    -- 重置基础伤害
    weapon:SetDamage(50)  -- 基础伤害50
    
    -- 计算宝石加成
    local total_damage_bonus = 0
    
    for gem_type, count in pairs(self.gems) do
        local gem_data = GEM_EFFECTS[gem_type]
        if gem_data and gem_data.damage_bonus then
            total_damage_bonus = total_damage_bonus + (gem_data.damage_bonus * count)
        end
    end
    
    weapon:SetDamage(50 + total_damage_bonus)
    
    -- 更新描述
    self:UpdateDescription()
end

function MouthWeaponGems:UpdateDescription()
    local desc = "Melantha的专属武器\n基础伤害: 50"
    
    if self.total_gems > 0 then
        desc = desc .. "\n\n宝石效果:"
        for gem_type, count in pairs(self.gems) do
            local gem_data = GEM_EFFECTS[gem_type]
            if gem_data then
                desc = desc .. string.format("\n%s x%d - %s", gem_data.name, count, gem_data.description)
            end
        end
    else
        desc = desc .. "\n\n初始携带，可使用 2 草 + 2 枝技重新制作 (仅Melantha可用)"
    end
    
    if self.inst.components.inspectable then
        self.inst.components.inspectable:SetDescription(desc)
    end
end

function MouthWeaponGems:ApplyEffects(owner)
    -- 移速效果
    if self.gems.orangegem and owner.components.locomotor then
        local speed_bonus = GEM_EFFECTS.orangegem.speed_bonus * self.gems.orangegem
        owner.components.locomotor:SetExternalSpeedMultiplier(self.inst, "melantha_weapon_speed", 1 + speed_bonus)
    end
    
    -- 发光效果
    if self.gems.yellowgem then
        local light_radius = GEM_EFFECTS.yellowgem.light_bonus * self.gems.yellowgem
        if not self.inst.Light then
            self.inst.entity:AddLight()
        end
        self.inst.Light:SetRadius(light_radius)
        self.inst.Light:SetIntensity(0.8)
        self.inst.Light:SetFalloff(0.7)
        self.inst.Light:SetColour(1, 1, 0.2)
        self.inst.Light:Enable(true)
    end
end

function MouthWeaponGems:RemoveEffects(owner)
    -- 移除移速效果
    if owner.components.locomotor then
        owner.components.locomotor:RemoveExternalSpeedMultiplier(self.inst, "melantha_weapon_speed")
    end
    
    -- 移除发光效果
    if self.inst.Light then
        self.inst.Light:Enable(false)
    end
end

function MouthWeaponGems:OnAttack(attacker, target)
    -- 冰冻效果
    if self.gems.bluegem and target.components.freezable then
        local freeze_value = GEM_EFFECTS.bluegem.freeze_value * self.gems.bluegem
        target.components.freezable:AddColdness(freeze_value)
        -- 如果冰冻值足够高，会触发冰冻特效
        if target.components.freezable:IsFrozen() then
            target.components.freezable:SpawnShatterFX()
        end
    end
    
    -- 真实伤害
    if self.gems.purplegem and target.components.health then
        local true_damage = GEM_EFFECTS.purplegem.true_damage * self.gems.purplegem
        target.components.health:DoDelta(-true_damage, true, "melantha_weapon_true_damage")
    end
    
    -- 百分比伤害
    if self.gems.greengem and target.components.health then
        local percent_damage = GEM_EFFECTS.greengem.percent_damage * self.gems.greengem
        local max_health = target.components.health.maxhealth
        local damage = max_health * percent_damage
        target.components.health:DoDelta(-damage, true, "melantha_weapon_percent_damage")
    end
    
    -- 暴击效果 (彩虹宝石)
    if self.gems.opalpreciousgem and attacker.components.combat then
        local crit_chance = GEM_EFFECTS.opalpreciousgem.crit_chance * self.gems.opalpreciousgem
        if math.random() < crit_chance then
            -- 造成2倍伤害
            local base_damage = self.inst.components.weapon.damage
            target.components.health:DoDelta(-base_damage, true, "melantha_weapon_crit")
            
            -- 暴击特效
            if target.Transform then
                local fx = SpawnPrefab("sparks")
                if fx then
                    fx.Transform:SetPosition(target.Transform:GetWorldPosition())
                end
            end
        end
    end
end

-- 右键使用宝石镶嵌
local function OnUseGem(inst, data)
    if not data or not data.doer then return end
    
    local doer = data.doer
    if not IsMelantha(doer) then
        if doer.components.talker then
            doer.components.talker:Say("我不知道怎么使用这把武器...")
        end
        return
    end
    
    -- 检查手中是否有宝石
    local inventory = doer.components.inventory
    if not inventory then return end
    
    local active_item = inventory:GetActiveItem()
    if not active_item then
        if doer.components.talker then
            doer.components.talker:Say("需要手持宝石来镶嵌")
        end
        return
    end
    
    -- 检查是否为有效宝石
    local gem_type = active_item.prefab
    local gem_data = GEM_EFFECTS[gem_type]
    if not gem_data then
        if doer.components.talker then
            doer.components.talker:Say("这不是可以镶嵌的宝石")
        end
        return
    end
    
    -- 尝试镶嵌宝石
    local success, added_count = inst.components.mouthweapon_gems:AddGem(gem_type, 1)
    if success then
        active_item:Remove()
        if doer.components.talker then
            doer.components.talker:Say(string.format("成功镶嵌了 %s!", gem_data.name))
        end
    else
        if doer.components.talker then
            doer.components.talker:Say(string.format("%s 已达到最大数量!", gem_data.name))
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("swap_melantha_weapon")
    inst.AnimState:SetBuild("swap_melantha_weapon")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("melantha_weapon")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("Melantha的专属武器\n基础伤害: 50\n\n初始携带，可使用 2 草 + 2 枝技重新制作 (仅Melantha可用)")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/melantha_weapon.xml"

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(25)
    inst.components.weapon:SetOnAttack(onattack)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HANDS
    inst.components.equippable.restrictedtag = "melantha"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    -- 添加宝石镶嵌组件
    inst:AddComponent("mouthweapon_gems", MouthWeaponGems)
    inst.components.mouthweapon_gems:UpdateDescription()

    -- 添加右键使用功能
    inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUseGem)

    MakeInventoryFloatable(inst, "med", 0.05, 0.68)

    return inst
end

return Prefab("melantha_weapon", fn, Assets)
