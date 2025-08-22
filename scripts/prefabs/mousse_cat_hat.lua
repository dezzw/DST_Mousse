local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "hat_straw", "swap_hat")
    owner.AnimState:Show("HAT")  -- 显示帽子
    owner.AnimState:Show("HAIR_HAT")  -- 显示戴帽子时的头发
    owner.AnimState:Hide("HAIR_NOHAT")  -- 隐藏不戴帽子时的头发
    owner.AnimState:Hide("HAIR")  -- 隐藏普通头发
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")  -- 隐藏帽子
    owner.AnimState:Hide("HAIR_HAT")  -- 隐藏戴帽子时的头发
    owner.AnimState:Show("HAIR_NOHAT")  -- 显示不戴帽子时的头发
    owner.AnimState:Show("HAIR")  -- 显示普通头发
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    -- 使用兔子帽动画（确定存在）
    inst.AnimState:SetBank("rabbithat")
    inst.AnimState:SetBuild("hat_rabbit")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mousse_cat_hat.xml"

    -- 添加护甲组件
    inst:AddComponent("armor")
    inst.components.armor:InitCondition(600, 0.8)  -- 600点耐久，80%伤害吸收

    -- 添加浮动效果
    MakeInventoryFloatable(inst, "med", 0.05, 0.68)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    return inst
end

return Prefab("mousse_cat_hat", fn)
