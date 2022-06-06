LoggedIn, Mercy = false, exports['qb-core']:GetCoreObject()
 
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        RefreshMenu('All')
        LoggedIn = true
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    LoggedIn = false
end)

-- [ Code ] --

-- [ Events ] --

RegisterNetEvent('qb-admin:client:try-open-menu', function(OnPress)
    if not OnPress or not IsPlayerAdmin() then return end
    local Bans = GetBans()
    local Players = GetPlayers()
    SetCursorLocation(0.87, 0.15)
    SetNuiFocus(true, true)
    SendNUIMessage({
        Action = 'Open',
        Debug = Config.MenuDebug,
        Bans = Bans,
        AllPlayers = Players,
        AdminItems = Config.AdminMenus,
        Favorited = Config.FavoritedItems,
        PinnedPlayers = Config.PinnedTargets,
        MenuSettings = Config.AdminSettings
    })
end)

RegisterNetEvent('qb-admin:client:force-close', function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        Action = 'Close',
    })
end)

-- [ NUI Callbacks ] --

RegisterNUICallback('Admin/ToggleFavorite', function(Data, Cb)
    Config.FavoritedItems[Data.Id] = Data.Toggle
    SetKvp("qb-admin:favorites", json.encode(Config.FavoritedItems), "Favorites")
    Cb('Ok')
end)

RegisterNUICallback('Admin/TogglePinnedTarget', function(Data, Cb)
    Config.PinnedTargets[Data.Id] = Data.Toggle
    SetKvp("qb-admin:pinned_targets", json.encode(Config.PinnedTargets), "Targets")
    Cb('Ok')
end)

RegisterNUICallback('Admin/ToggleSetting', function(Data, Cb)
    Config.AdminSettings[Data.Id] = Data.Toggle
    SetKvp("qb-admin:settings", json.encode(Config.AdminSettings), "Settings")
    Cb('Ok')
end)

RegisterNUICallback('Admin/GetCharData', function(Data, Cb)
    Mercy.Functions.TriggerCallback('qb-admin:server:get-chardata', function(CharData)
        Cb(CharData)
    end, Data.License)
end)

RegisterNUICallback("Admin/Close", function(Data, Cb)
   SetNuiFocus(false, false)
   Cb('Ok')
end)

RegisterNUICallback("Admin/DevMode", function(Data, Cb)
    local Bool = Data.Toggle
    ToggleDevMode(Bool)
    Cb('Ok')
end)

RegisterNUICallback('Admin/TriggerAction', function(Data, Cb) 
    if IsPlayerAdmin() then
        if Data.EventType == nil then Data.EventType = 'Client' end
        if Data.Event ~= nil and Data.EventType ~= nil then
            if Data.EventType == 'Client' then
                TriggerEvent(Data.Event, Data.Result)
            else
                TriggerServerEvent(Data.Event, Data.Result)
            end
        end
    end
    Cb('Ok')
end)