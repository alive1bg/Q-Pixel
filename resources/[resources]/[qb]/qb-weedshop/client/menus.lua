local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fp-weedshop:client:jointcraftingtable', function()
    exports['qb-menu']:openMenu({
        {
            header = "Joint Crafting ",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["og_kush"].image.." width=30px>".. "• OG-Kush Joint",
            txt = "- 1x OG-Kush 2g <br> - 1x Rolling Paper",
            params = {
                event = "fp-weedshop:client:RollOGKushh"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["purple_haze"].image.." width=30px>".. "• Purple-Haze Joint",
            txt = "- 1x Purple Haze 2g <br> - 1x Rolling Paper",
            params = {
                event = "fp-weedshop:client:RollPurpleHaze"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["ak47"].image.." width=30px>".. "• AK47 Joint",
            txt = "- 1x AK47 2g <br> - 1x Rolling Paper",
            params = {
                event = "fp-weedshop:client:RollAK47"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["skunk"].image.." width=30px>".. "• Skunk Joint",
            txt = "- 1x Skunk 2g <br> - 1x Rolling Paper",
            params = {
                event = "fp-weedshop:client:RollSkunk"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["white_widow"].image.." width=30px>".. "• White-Widow Joint",
            txt = "- 1x White Widow 2g <br> - 1x Rolling Paper",
            params = {
                event = "fp-weedshop:client:RollWhiteWidow"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["amnesia"].image.." width=30px>".. "• Amnesia Joint",
            txt = "- 1x Amnesia 2g <br> - 1x Rolling Paper",
            params = {
                event = "fp-weedshop:client:RollAmnesia"
            }
        },
    })
end)

RegisterNetEvent('fp-weedshop:client:browniecraftingtable', function()
    exports['qb-menu']:openMenu({
        {
            header = "Brownie Crafting ",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["og_kushbrownie"].image.." width=30px>".. "• OG-Kush Brownie",
            txt = "- 1x Ground OG-Kush <br> - 1x Brownie Mix",
            params = {
                event = "fp-weedshop:client:BrownieOG-Kush"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["purple_hazebrownie"].image.." width=30px>".. "• Purple-Haze Brownie",
            txt = "- 1x Ground Purple-Haze <br> - 1x Brownie Mix",
            params = {
                event = "fp-weedshop:client:BrowniePurple-Haze"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["ak47brownie"].image.." width=30px>".. "• AK47 Brownie",
            txt = "- 1x Ground AK47 <br> - 1x Brownie Mix",
            params = {
                event = "fp-weedshop:client:BrownieAK47"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["skunkbrownie"].image.." width=30px>".. "• Skunk Brownie",
            txt = "- 1x Ground Skunk <br> - 1x Brownie Mix",
            params = {
                event = "fp-weedshop:client:BrownieSkunk"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["white_widowbrownie"].image.." width=30px>".. "• White-Widow Brownie",
            txt = "- 1x Ground White-Widow <br> - 1x Brownie Mix",
            params = {
                event = "fp-weedshop:client:BrownieWhite-Widow"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["amnesiabrownie"].image.." width=30px>".. "• Amnesia Brownie",
            txt = "- 1x Ground Amnesia <br> - 1x Brownie Mix",
            params = {
                event = "fp-weedshop:client:BrownieAmnesia"
            }
        },
    })
end)

RegisterNetEvent('fp-weedshop:client:weedgridingtable', function()
    exports['qb-menu']:openMenu({
        {
            header = "Grinding Station",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["groundog_kush"].image.." width=30px>".. "• Ground OG-Kush",
            txt = "- 1x OG-Kush 2g <br> - Weed Grinder",
            params = {
                event = "fp-weedshop:client:GrindOGKushh"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["groundpurple_haze"].image.." width=30px>".. "• Ground Purple-Haze",
            txt = "- 1x Purple Haze 2g <br> - Weed Grinder",
            params = {
                event = "fp-weedshop:client:GrindPurpleHaze"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["groundak47"].image.." width=30px>".. "• Ground AK47",
            txt = "- 1x AK47 2g <br> - Weed Grinder",
            params = {
                event = "fp-weedshop:client:GrindAK47"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["groundskunk"].image.." width=30px>".. "• Ground Skunk",
            txt = "- 1x Skunk 2g <br> - Weed Grinder",
            params = {
                event = "fp-weedshop:client:GrindSkunk"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["groundwhite_widow"].image.." width=30px>".. "• Ground White-Widow",
            txt = "- 1x White Widow 2g <br> - Weed Grinder",
            params = {
                event = "fp-weedshop:client:GrindWhiteWidow"
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items["groundamnesia"].image.." width=30px>".. "• Ground Amnesia",
            txt = "- 1x Amnesia 2g <br> - Weed Grinder",
            params = {
                event = "fp-weedshop:client:GrindAmnesia"
            }
        },
    })
end)