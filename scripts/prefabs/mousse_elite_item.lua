local assets = {
    Asset("ANIM", "anim/blueprint.zip"),
    Asset("ATLAS", "images/inventoryimages/mousse_elite_item.xml"),
    Asset("IMAGE", "images/inventoryimages/mousse_elite_item.tex"),
}



local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    -- 使用蓝图的动画
    inst.AnimState:SetBank("blueprint")
    inst.AnimState:SetBuild("blueprint")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("mousse_elite_item")

    -- 网络同步结束
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mousse_elite_item.xml"

    -- 使物品可食用，这样就能右键使用了
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0  -- 设为0，避免冲突
    inst.components.edible.sanityvalue = 0  -- 设为0，避免冲突
    inst.components.edible.hungervalue = 0
    inst.components.edible:SetOnEatenFn(function(inst, eater)
        -- 显示使用效果
        if eater and eater.components.talker then
            eater.components.talker:Say("喵~ 这是一个神秘的道具！")
        end
        
        -- 手动恢复数值
        if eater and eater.components.health then
            print("恢复生命值前: " .. tostring(eater.components.health.currenthealth))
            eater.components.health:DoDelta(30)
            print("恢复生命值后: " .. tostring(eater.components.health.currenthealth))
        end
        
        if eater and eater.components.sanity then
            print("恢复精神值前: " .. tostring(eater.components.sanity.current))
            eater.components.sanity:DoDelta(15)
            print("恢复精神值后: " .. tostring(eater.components.sanity.current))
        end
    end)
    
    -- 添加堆叠组件，食物通常需要这个
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = 10

    return inst
end

return Prefab("mousse_elite_item", fn) 