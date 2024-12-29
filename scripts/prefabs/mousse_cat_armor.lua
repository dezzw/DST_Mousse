local assets = {
    Asset("ANIM", "anim/armor_grass.zip"),
    Asset("ATLAS", "images/inventoryimages/mousse_cat_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/mousse_cat_armor.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "armor_grass", "swap_body")
end

local function onunequip(inst, owner)
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

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mousse_cat_armor.xml"

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(500, 0.8)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    return inst
end

return Prefab("mousse_cat_armor", fn, assets)