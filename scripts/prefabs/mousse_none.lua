local assets =
{
	Asset( "ANIM", "anim/mousse.zip" ),
	Asset( "ANIM", "anim/ghost_mousse_build.zip" ),
}

local skins =
{
	normal_skin = "mousse",
	ghost_skin = "ghost_mousse_build",
}

return CreatePrefabSkin("mousse_none",
{
	base_prefab = "mousse",
	type = "base",
	assets = assets,
	skins = skins, 
	skin_tags = {"MOUSSE", "CHARACTER", "BASE"},
	build_name_override = "mousse",
	rarity = "Character",
})