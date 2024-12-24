-- This information tells other players more about the mod
name = "慕斯"
description = "一只可爱猫猫"
author = "Desmond&Arthur"
version = "0.5" -- This is the version of the template. Change it to your own number.
version_compatible = version
-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10
api_version_dst = 10

priority=0

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = true
shipwrecked_compatible = true

-- Character mods are required by all clients
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
    "character",
}

configuration_options = 
{
    {
        name = "LANG",
        label = "Language",
        options =
        {
            {description = "简体中文", data = "zh_cn"}, -- dscripttion是显示在设置面板上的值，data是实际对应的取值
            {description = "English", data = "eng"},--还可以添加hover，是对于选项的描述
        },
        default = "zh_cn", -- 选项的默认值，在选项面板点击Reset时，会把该选项的值设置为默认值
    },
}

