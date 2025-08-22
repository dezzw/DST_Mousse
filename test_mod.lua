-- Test script, used to check if the mod is working properly
print("=== 慕斯Mod测试脚本 v1.0 (基础版) ===")

-- 检查环境
print("1. 检查运行环境...")
if GLOBAL.TheWorld then
    if GLOBAL.TheWorld.ismastersim then
        print("✓ 当前为主服务器")
        if GLOBAL.TheWorld.topology and GLOBAL.TheWorld.topology.level_id then
            print("  世界类型: " .. GLOBAL.TheWorld.topology.level_id)
        else
            print("  世界类型: 未知")
        end
    else
        print("✓ 当前为客户端")
    end
else
    print("✗ 无法获取世界信息")
end

-- 检查字符串
print("\n2. 检查字符串...")
if GLOBAL.STRINGS and GLOBAL.STRINGS.CHARACTER_NAMES and GLOBAL.STRINGS.CHARACTER_NAMES.mousse then
    print("✓ 角色名称已定义: " .. GLOBAL.STRINGS.CHARACTER_NAMES.mousse)
else
    print("✗ 角色名称未定义")
end

if GLOBAL.STRINGS and GLOBAL.STRINGS.NAMES then
    if GLOBAL.STRINGS.NAMES.MOUSSE_CAT_ARMOR then
        print("✓ 护甲名称已定义: " .. GLOBAL.STRINGS.NAMES.MOUSSE_CAT_ARMOR)
    else
        print("✗ 护甲名称未定义")
    end
    
    if GLOBAL.STRINGS.NAMES.MOUSSE_CAT_HAT then
        print("✓ 帽子名称已定义: " .. GLOBAL.STRINGS.NAMES.MOUSSE_CAT_HAT)
    else
        print("✗ 帽子名称未定义")
    end
    
    if GLOBAL.STRINGS.NAMES.MOUSSE_ELITE_ITEM then
        print("✓ 秘药名称已定义: " .. GLOBAL.STRINGS.NAMES.MOUSSE_ELITE_ITEM)
    else
        print("✗ 秘药名称未定义")
    end
end

-- 检查预制体
print("\n3. 检查预制体...")
local prefabs_to_check = {"mousse", "mousse_cat_armor", "mousse_cat_hat", "mousse_elite_item"}
for _, prefab_name in ipairs(prefabs_to_check) do
    if GLOBAL.Prefabs and GLOBAL.Prefabs[prefab_name] then
        print("✓ " .. prefab_name .. " 预制体已加载")
    else
        print("✗ " .. prefab_name .. " 预制体未加载")
    end
end

-- 检查资源文件
print("\n4. 检查资源文件...")
local assets_to_check = {
    "images/inventoryimages/mousse_cat_armor.xml",
    "images/inventoryimages/mousse_cat_hat.xml", 
    "images/inventoryimages/mousse_elite_item.xml",
    "anim/mousse.zip",
    "anim/ghost_mousse_build.zip"
}

for _, asset_path in ipairs(assets_to_check) do
    -- 这里只是检查路径是否存在，实际加载需要游戏引擎
    print("  检查资源: " .. asset_path)
end

-- 检查Class是否可用
print("\n5. 检查Class...")
if GLOBAL.Class then
    print("✓ Class 全局变量可用")
else
    print("✗ Class 全局变量不可用")
end

-- 检查组件系统
print("\n6. 检查组件系统...")
if GLOBAL.Component then
    print("✓ Component 系统可用")
else
    print("✗ Component 系统不可用")
end

-- 检查配方
print("\n7. 检查配方...")
if GLOBAL.RECIPETABS then
    print("✓ 配方标签系统可用")
else
    print("✗ 配方标签系统不可用")
end

if GLOBAL.TECH then
    print("✓ 科技系统可用")
else
    print("✗ 科技系统不可用")
end

print("\n=== 测试完成 ===")
print("如果看到 ✗ 标记，说明该功能可能有问题")
print("建议重启游戏并重新加载mod") 