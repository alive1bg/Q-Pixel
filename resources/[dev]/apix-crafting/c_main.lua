local QBCore = exports['qb-core']:GetCoreObject()
local OpenUI = false
local labels = {}
local images = {}


CreateThread(function()
    for k, v in pairs(QBCore.Shared.Items) do
        labels[k] = v.label
        images[k] = v.image
    end

    local Entity = {
        -573669520
    }
    exports["qb-target"]:AddTargetModel(Entity, {
        options = {
            {
                type = "client",
                event = "apix-crafting:client:OpenMainCraft",
                data = Config.Crafting,
                icon = "fa fa-circle",
                label = "Craft Table",
                job = false,
            },
        },
    distance = 2.0
    })

    local Entity2 = {
        1917885559
    }

    exports["qb-target"]:AddTargetModel(Entity2, {
        options = {
            {
                type = "client",
                event = "apix-crafting:client:OpenMainCraft",
                data = Config.Tunershop,
                icon = "fa fa-circle",
                label = "Craft Table",
                job = 'tunershop',
            },
        },
    distance = 2.0
    })
    
    Peds = {
        "S_M_Y_Construct_02",
    }
    exports['qb-target']:AddTargetModel(Peds, {
        options = {
            {
                type = "client",
                event = "apix-crafting:client:OpenMainCraft",
                data = Config.TradeMat,
                icon = "fa fa-circle",
                label = "Trade Table",
                job = false,
            },
        },
        distance = 2.5,
    })

end)


local function CloseCrafting()
    TriggerScreenblurFadeOut(250.0)
    SendNUIMessage({
        action = "close",
    })
    SetNuiFocus(false, false)
    OpenUI = false
end

RegisterNetEvent('apix-crafting:client:OpenMainCraft', function(Items)
    if not OpenUI then
        OpenUI = true
        SendNUIMessage({
            action = "show",
            data = {
                items = Items.data,
                labels = labels,
                images = images,
                xp = QBCore.Functions.GetPlayerData().metadata.craftingrep,
            },
        })
        TriggerScreenblurFadeIn(250.0)
        SetNuiFocus(true, true)
    else
        QBCore.Functions.Notify("You are crafting", "error", 4000)
    end
end)

RegisterNUICallback('CloseCrafting', function(data, cb)
    CloseCrafting()
end)

RegisterNUICallback('CraftStarted', function(data, cb)
    if data.mat.isGun then
        data.amount = 1
        data.mat.NeedItems = data.mat.NeedItems
    else
        for k, v in pairs(data.mat.NeedItems) do
            data.mat.NeedItems[k] = data.mat.NeedItems[k] * data.amount
        end
    end

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
            CloseCrafting()
            OpenUI = true
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
            QBCore.Functions.Progressbar("crafting_new", "Crafting ... ", data.mat.Timer * data.amount, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {}, {}, {}, function()
                OpenUI = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                for k, v in pairs(data.mat.NeedItems) do
                    TriggerServerEvent("QBCore:Server:RemoveItem", k, v)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[k], "remove")
                    Wait(50)
                end
                if data.mat.isGun then
                    local info = {
                        serie = "Un licensed"
                    }
                    TriggerServerEvent("QBCore:Server:AddItem", data.mat.itemName, data.amount, false, info)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[data.mat.itemName], "add")
                else
                    local info = {
                        quality = 100
                    }
                    TriggerServerEvent("QBCore:Server:AddItem", data.mat.itemName, data.amount, false, info)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[data.mat.itemName], "add")
                end
                if data.mat.levelUp then
                    TriggerServerEvent("apix-crafting:Server:AddXP", data.mat.levelUp, data.amount)
                end
            end, function()
                OpenUI = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled", "error", 4000)
            end)
        else
            QBCore.Functions.Notify("You do not have the required items", "error")
        end
    end, data.mat.NeedItems)
end)

RegisterNUICallback('SendAlertcraft', function(data, cb)
    QBCore.Functions.Notify(data.text, data.type)
end)