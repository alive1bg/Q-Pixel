local QBCore = exports['qb-core']:GetCoreObject()
local CurrentCops = 0


local BankRobberyCD = false

RegisterNetEvent('qb-dongle:client:AvailableRobberies', function()
    local header = {
        {
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
            header = "Robbery Situations",
        }
    }
    for k, v in pairs(Config.Dongle) do
        if CurrentCops >= v.minCops then
            if not v.bank or (v.bank and not BankRobberyCD) then
                header[#header+1] = {
                    header = v.Header,
                    txt = "✔️ Available",
                    icon = v.icon,
                    isMenuHeader = true,
                }
            else
                header[#header+1] = {
                    header = v.Header,
                    txt = "❌ Not Available",
                    icon = v.icon,
                    isMenuHeader = true,
                }
            end
        else
            header[#header+1] = {
                header = v.Header,
                txt = "❌ Not Available",
                icon = v.icon,
                isMenuHeader = true,
            }
        end
    end
    header[#header+1] = {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-dongle:client:MainMenu",
        }
    }

    exports['qb-menu']:openMenu(header)
end)

RegisterNetEvent('qb-dongle:client:OpenShop', function()
    local header = {
        {
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
            header = "Welcome to my little shop"
        }
    }
    for k, v in pairs(Config.Shop) do
        if QBCore.Shared.Items[v.item].label then
            header[#header+1] = {
                header = QBCore.Shared.Items[v.item].label,
                txt = "Price: "..v.price.. " Shung",
                icon = v.icon,
                params = {
                    isServer = true,
                    event = "qb-dongle:server:buyshit",
                    args = k
                }
            }
        end
    end
    header[#header+1] = {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-dongle:client:MainMenu",
        }
    }

    exports['qb-menu']:openMenu(header)
end)

RegisterNetEvent('qb-dongle:client:MainMenu', function()
    local header = {
        {
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
            header = "I heard you seek information"
        },
        {
            icon = "fas fa-question",
            header = "Robbery Situations",
            txt = "Here you can find info about all Robberies",
            params = {
                event = "qb-dongle:client:AvailableRobberies",
            }
        },
        {
            icon = "fab fa-shopify",
            header = "Buy Goods",
            txt = "Buy and rob",
            params = {
                event = "qb-dongle:client:OpenShop",
            }
        },
        {
            icon = "fas fa-x",
            header = "Close",
            params = {
                event = "",
            }
        },
    }

    exports['qb-menu']:openMenu(header)
end)

for i = 1, #Config.Peds do
    exports['qb-target']:SpawnPed({
        model = Config.Peds[i].model,
        coords = Config.Peds[i].coords,
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
        target = {
            options = {
            {
                type = "client",
                icon = 'fa-solid fa-question',
                label = 'Talk to Wade',

                action = function()
                    TriggerEvent('qb-dongle:client:MainMenu')
                end,
            }
            },
            distance = 2.5,
        },
    })
end

-- do something like when a TriggerClientEvent('qb-dongle:client:SetBankCD', -1, true) when a bank is being robbed
-- do something like TriggerClientEvent('qb-dongle:client:SetBankCD', -1, false) when a bank can be hit again

RegisterNetEvent('qb-dongle:client:SetBankCD', function(bool)
    BankRobberyCD = bool
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)