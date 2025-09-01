-- This information tells other players more about the mod
name = "Melantha"
description = "A mysterious character with unique abilities"
author = "Desmond&Arthur"
version = "0.7" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = "/files/file/950-extended-sample-character/"

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

-- Character mods are required by all clients
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
}

--configuration_options = {}
configuration_options = {
    {
        name = "LANG",
        label = "Language",
        hover = "选择语言/Select Language",
        options =
        {
            {description = "简体中文", data = "zh_cn", hover = "使用简体中文"}, 
            {description = "English", data = "eng", hover = "Use English"}
        },
        default = "zh_cn"
    }
}