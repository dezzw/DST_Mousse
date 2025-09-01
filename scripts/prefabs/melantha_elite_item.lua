local Assets = {
    Asset("ATLAS", "images/inventoryimages/melantha_elite_item.xml"),
    Asset("IMAGE", "images/inventoryimages/melantha_elite_item.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("ash")
    inst.AnimState:SetBuild("ash")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("melantha_elite_item")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/melantha_elite_item.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 30
    inst.components.edible.sanityvalue = 15
    inst.components.edible.hungervalue = 0

    return inst
end

return Prefab("melantha_elite_item", fn, Assets) 