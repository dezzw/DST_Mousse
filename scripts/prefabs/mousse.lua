local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
  -- Don't forget to include your character's custom assets!
  -- Asset( "ANIM", "anim/dpl.zip" ),
}

local prefabs = {
}


local start_inv = {
    -- "katana",
    -- "food_taco",
    -- "food_chimi",

}

local function customfn(inst)
	
	-- choose which sounds this character will play
	inst.soundsname = "wolfgang"

	-- a minimap icon must be specified
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "minimap.tex" )

	-- todo: Add an example special power here.
	inst.components.hunger:SetMax(150)
	inst.components.eater.ignoresspoilage = true
	inst.components.health:SetMaxHealth(250)
	-- inst.components.health:StartRegen(3,6)
	inst.components.combat.damagemultiplier = 1.1
	inst.components.sanity:SetMax(100)
	inst.components.locomotor.walkspeed = (4)
	inst.components.locomotor.runspeed = (7)
end



return MakePlayerCharacter("mousse", prefabs, assets, customfn, start_inv)
