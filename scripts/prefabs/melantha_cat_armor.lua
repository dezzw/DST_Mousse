local Assets = {
    Asset("ATLAS", "images/inventoryimages/melantha_cat_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_cat_armor.tex"),
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

    inst:AddTag("melantha_cat_armor")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/melantha_cat_armor.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable.restrictedtag = "melantha"

    return inst
end

return Prefab("melantha_cat_armor", fn, Assets)