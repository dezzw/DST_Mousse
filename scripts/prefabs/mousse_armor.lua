local assets = {}

-- Import from game globals
GLOBAL.setfenv(1, GLOBAL)

local function OnEquip(inst, owner)
    -- Check if the wearer is your character
    if owner.prefab ~= "mousse" then
        -- If not your character, unequip immediately and drop
        owner.components.inventory:DropItem(inst)
        if owner.components.talker then
            owner.components.talker:Say("I can't wear this!")
        end
        return
    end
    
    -- 使用草甲的动画
    owner.AnimState:OverrideSymbol("swap_body", "armor_grass", "swap_body")
    inst.components.armor:SetCondition(inst.components.armor.maxcondition)
end

local function OnUnequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("armor_grass")
    inst.AnimState:SetBuild("armor_grass")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("armor")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "grassarmor"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/grassarmor.xml"

    inst:AddComponent("armor")
    -- InitCondition(durability, absorption)
    -- durability: 耐久度，这里是400点
    -- absorption: 伤害吸收率，这里是0.9，意味着能够吸收90%的伤害
    -- 例如：受到100点伤害时，实际只受到10点伤害，护甲会损失100点耐久
    inst.components.armor:InitCondition(400, 0.9)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

    return inst
end

return Prefab("mousse_armor", fn, assets) 