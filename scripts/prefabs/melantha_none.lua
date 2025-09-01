local Assets = {
    Asset( "ANIM", "anim/melantha.zip" ),
    Asset( "ANIM", "anim/ghost_melantha_build.zip" ),
}

local skin_modes = {
    normal_skin = "melantha",
    ghost_skin = "ghost_melantha_build",
}

return CreatePrefabSkin("melantha_none",
{
    base_prefab = "melantha",
    skin_tags = {"MELANTHA", "CHARACTER", "BASE"},
    build_name_override = "melantha",
    assets = Assets,
    skin_modes = skin_modes,
})
