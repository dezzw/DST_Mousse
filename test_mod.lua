-- 测试mod功能
print("=== Melantha Mod Test ===")

-- 检查角色名称是否正确定义
if GLOBAL.STRINGS and GLOBAL.STRINGS.CHARACTER_NAMES and GLOBAL.STRINGS.CHARACTER_NAMES.melantha then
    print("✓ 角色名称已定义: " .. GLOBAL.STRINGS.CHARACTER_NAMES.melantha)
else
    print("✗ 角色名称未定义")
end

-- 检查护甲名称是否正确定义
if GLOBAL.STRINGS.NAMES.MELANTHA_CAT_ARMOR then
    print("✓ 护甲名称已定义: " .. GLOBAL.STRINGS.NAMES.MELANTHA_CAT_ARMOR)
else
    print("✗ 护甲名称未定义")
end

-- 检查帽子名称是否正确定义
if GLOBAL.STRINGS.NAMES.MELANTHA_CAT_HAT then
    print("✓ 帽子名称已定义: " .. GLOBAL.STRINGS.NAMES.MELANTHA_CAT_HAT)
else
    print("✗ 帽子名称未定义")
end

-- 检查秘药名称是否正确定义
if GLOBAL.STRINGS.NAMES.MELANTHA_ELITE_ITEM then
    print("✓ 秘药名称已定义: " .. GLOBAL.STRINGS.NAMES.MELANTHA_ELITE_ITEM)
else
    print("✗ 秘药名称未定义")
end

-- 检查武器名称是否正确定义
if GLOBAL.STRINGS.NAMES.MELANTHA_WEAPON then
    print("✓ 武器名称已定义: " .. GLOBAL.STRINGS.NAMES.MELANTHA_WEAPON)
else
    print("✗ 武器名称未定义")
end

-- 检查预制体是否正确定义
local prefabs_to_check = {"melantha", "melantha_cat_armor", "melantha_cat_hat", "melantha_elite_item", "melantha_weapon"}
for _, prefab_name in ipairs(prefabs_to_check) do
    if GLOBAL.Prefabs[prefab_name] then
        print("✓ 预制体已定义: " .. prefab_name)
    else
        print("✗ 预制体未定义: " .. prefab_name)
    end
end

-- 检查资源文件是否存在
local assets_to_check = {
    "images/inventoryimages/melantha_cat_armor.xml",
    "images/inventoryimages/melantha_cat_hat.xml",
    "images/inventoryimages/melantha_elite_item.xml",
    "images/inventoryimages/melantha_weapon.xml",
    "anim/melantha.zip",
    "anim/ghost_melantha_build.zip",
    "anim/swap_melantha_weapon.zip"
}

for _, asset_path in ipairs(assets_to_check) do
    if GLOBAL.TheSim:FileExists(asset_path) then
        print("✓ 资源文件存在: " .. asset_path)
    else
        print("✗ 资源文件不存在: " .. asset_path)
    end
end

print("=== 测试完成 ===") 