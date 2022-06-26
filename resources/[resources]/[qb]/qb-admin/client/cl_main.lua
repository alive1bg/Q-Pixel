LoggedIn, QBCore, Group = false, exports['qb-core']:GetCoreObject(), nil
 
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        RefreshMenu('All')
        QBCore.Functions.TriggerCallback('qb-admin/server/get-permission', function(PGroup)
            Group = PGroup
        end)
        exports['qb-admin']:CreateLog('Player Logged In', 'Player Logged In')
        LoggedIn = true
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    QBCore.Functions.TriggerCallback('qb-admin/server/get-permission', function(PGroup)
        Group = PGroup
    end)
    exports['qb-admin']:CreateLog('Player Logged Out', 'Player Logged Out')
    LoggedIn = false
end)

-- [ Code ] --

-- [ Threads ] --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LoggedIn then
            if BlipsEnabled then
                if BlipData ~= nil then
                    DeletePlayerBlips()
                    local ServerId = GetPlayerServerId(PlayerId())
                    for k, v in pairs(BlipData) do
                        if tonumber(v.ServerId) ~= tonumber(ServerId) then
                            local PlayerPed = GetPlayerPed(GetPlayerFromServerId(v.ServerId))
                            local PlayerBlip = AddBlipForEntity(PlayerPed) 
                            SetBlipSprite(PlayerBlip, 1)
                            SetBlipColour(PlayerBlip, 0)
                            SetBlipScale(PlayerBlip, 0.75)
                            SetBlipAsShortRange(PlayerBlip, true)
                            BeginTextCommandSetBlipName("STRING")
                            AddTextComponentString('['..v.ServerId..'] '..v.Name)
                            EndTextCommandSetBlipName(PlayerBlip)
                            table.insert(AllPlayerBlips, PlayerBlip)
                        end
                    end    
                end
                Citizen.Wait(5000)
            else
                if AllPlayerBlips ~= nil then
                    DeletePlayerBlips()
                    Citizen.Wait(450)
                end
            end
        else
            Citizen.Wait(450)
        end
    end
end)

-- [ Mapping ] --

RegisterKeyMapping('menu', Lang:t('info.keymapping_desc'), 'keyboard', Config.Settings['DefaultOpenKeybind'])
--RegisterCommand('menu', function(source, args, RawCommand) TriggerServerEvent('qb-admin/server/try-open-menu', true) end, false)

-- [ Events ] --

RegisterNetEvent('qb-admin/client/try-open-menu', function(KeyPress)
    if not IsPlayerAdmin() then return end
    if KeyPress then if not CanBind() then return end end

    local Bans = GetBans()
    local Players = GetPlayers()
    local Logs = GetLogs()

    SetCursorLocation(0.87, 0.15)
    SetNuiFocus(true, true)
    SendNUIMessage({
        Action = 'Open',
        Debug = Config.Settings['Debug'],

        Bans = Bans,
        AllPlayers = Players,
        Logs = Logs,
        AdminItems = Config.AdminMenus,
        Favorited = Config.FavoritedItems,
        PinnedPlayers = Config.PinnedTargets,
        MenuOptions = Config.AdminOptions,
        BanTypes = Config.BanTimeCategories,
    })
end)

RegisterNetEvent('qb-admin/client/force-close', function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        Action = 'Close',
    })
end)

RegisterNetEvent("qb-admin/client/reset-menu", function()
    if not IsPlayerAdmin() then return end

    ResetMenuKvp()
end)

-- [ NUI Callbacks ] --

RegisterNUICallback('Admin/ToggleFavorite', function(Data, Cb)
    Config.FavoritedItems[Data.Id] = Data.Toggle
    SetKvp("qb-admin-favorites", json.encode(Config.FavoritedItems), "Favorites")
    Cb('Ok')
end)

RegisterNUICallback('Admin/TogglePinnedTarget', function(Data, Cb)
    Config.PinnedTargets[Data.Id] = Data.Toggle
    SetKvp("qb-admin-pinned_targets", json.encode(Config.PinnedTargets), "Targets")
    Cb('Ok')
end)

RegisterNUICallback('Admin/ToggleOption', function(Data, Cb)
    Config.AdminOptions[Data.Id] = Data.Toggle
    SetKvp("qb-admin-options", json.encode(Config.AdminOptions), "Options")
    Cb('Ok')
end)

RegisterNUICallback("Admin/UnbanPlayer", function(Data, Cb)
    TriggerServerEvent('qb-admin/server/unban-player', Data.PData.BanId)
    SetTimeout(500, function()
        UpdateMenu()
    end)
    Cb('Ok')
end)

RegisterNUICallback('Admin/GetCharData', function(Data, Cb)
    QBCore.Functions.TriggerCallback('qb-admin/server/get-player-data', function(PlayerData)
        Cb(PlayerData)
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

RegisterNUICallback("Admin/GetDateDifference", function(Data, Cb)
    QBCore.Functions.TriggerCallback('qb-admin/server/get-date-difference', function(FBans, CAmount)
        Cb({
            Bans = FBans, 
            Amount = CAmount,
        })
    end, Data.BanList, Data.CType)
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

local performanceModIndices = {11,12,13,15,16}
function PerformanceUpgradeVehicle(vehicle, customWheels)
    customWheels = customWheels or false
    local max
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        for _, modType in ipairs(performanceModIndices) do
            max = GetNumVehicleMods(vehicle, modType) - 1
            SetVehicleMod(vehicle, modType, max, customWheels)
        end
        ToggleVehicleMod(vehicle, 18, true) -- Turbo
        SetVehicleFixed(vehicle)
    end
end

local vehicles = {}
for k, v in pairs(QBCore.Shared.Vehicles) do
    local category = v["category"]
    if vehicles[category] == nil then
        vehicles[category] = { }
    end
    vehicles[category][k] = v
end

function getVehicleFromVehList(hash)
	for _, v in pairs(QBCore.Shared.Vehicles) do
		if hash == v.hash then
			return v.model
		end
	end
end

RegisterNetEvent('Admin:Tuning:Vehicle', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    PerformanceUpgradeVehicle(vehicle)
    QBCore.Functions.Notify("Max Upgraded this Vehicle", "success")
end)

RegisterNetEvent('Admin:Save:Vehicle', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)

    if veh ~= nil and veh ~= 0 then
        local plate = QBCore.Functions.GetPlate(veh)
        local props = QBCore.Functions.GetVehicleProperties(veh)
        local hash = props.model
        local vehname = GetDisplayNameFromVehicleModel(hash):lower()
        if QBCore.Shared.Vehicles[vehname] ~= nil and next(QBCore.Shared.Vehicles[vehname]) ~= nil then
            TriggerServerEvent('Admin:Server:SaveCar', props, QBCore.Shared.Vehicles[vehname], GetHashKey(veh), plate)
        else
            QBCore.Functions.Notify("You cant store this vehicle in your garage..", 'error')
        end
    else
        QBCore.Functions.Notify("You are not in a vehicle..", 'error')
    end
end)