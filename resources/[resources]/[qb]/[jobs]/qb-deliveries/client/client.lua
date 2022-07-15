local QBCore = exports['qb-core']:GetCoreObject()

local InStartOption = nil
local InShopOption = nil
local collected = false
local pedinveh = false
local GotJob = false
local prop = nil
local PackageDelivered = false
local deliveredboxes = 0
local InReturn = nil
local VehicleReturned = false
local data = {}
local PlayerJob = {}
local Zone
local ReturnZone

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

CreateThread(function()
    PedBlip = AddBlipForCoord(Config.JobPedLocation)
    SetBlipSprite(PedBlip, 304)
    SetBlipColour(PedBlip, 32)
    SetBlipAsShortRange(PedBlip, true)
    SetBlipScale(PedBlip, 0.75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.JobBlipName)
    EndTextCommandSetBlipName(PedBlip)
    QBCore.Functions.LoadModel(Config.JobPed)
    local startloc = Config.JobPedLocation
    local ped = CreatePed(0, Config.JobPed, startloc.x, startloc.y, startloc.z-1.0, startloc.w, false, false)
	TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)

    if Config.Interaction == 'target' then 
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    icon = 'fas fa-circle',
                    label = 'Check In',
                    canInteract = function()
                        if not GotJob then return true end
                        return false
                    end,
                    action = function()
                        Checkin()
                    end,
                },
                {
                    icon = 'fas fa-circle',
                    label = 'Collect Pay',
                    canInteract = function()
                        if VehicleReturned then return true end
                        return false
                    end,
                    action = function()
                        JobFinish()
                    end,
                },
                {
                    type = 'client',
                    icon = 'fas fa-circle',
                    label = 'Return Vehicle',
                    event = 'kevin-deliveries:Return',
                    canInteract = function()
                        if PackageDelivered then return true end
                        return false
                    end,
                },
            },
            distance = 2.0
        })
    elseif Config.Interaction == 'radialmenu' then
        StartZone = BoxZone:Create(vector3(startloc.x, startloc.y, startloc.z), 3.5, 2.0, {
            heading = startloc.w,
            name = 'Start',
            debugPoly = false,
            -- minZ = 53.64,
            -- maxZ = 56.24
        })
        StartZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                if not GotJob then
                    InStartOption = exports['qb-radialmenu']:AddOption({
                        id = 'deliver-package',
                        title = 'Check In',
                        icon = 'pen-square',
                        type = 'client',
                        event = 'kevin-deliveries:start',
                        shouldClose = true
                    }, InStartOption)
                end
                if VehicleReturned then
                    InStartOption = exports['qb-radialmenu']:AddOption({
                        id = 'deliver-package',
                        title = 'Collect Pay',
                        icon = 'coins',
                        type = 'client',
                        event = 'kevin-deliveries:finish',
                        shouldClose = true
                    }, InStartOption)
                end
            else
                collected = false
                if InStartOption ~= nil then
                    exports['qb-radialmenu']:RemoveOption(InStartOption)
                    InStartOption = nil
                    --print('option removed')
                end
            end
        end)
    end
end)

RegisterNetEvent('kevin-deliveries:start', function ()
    Checkin()
end)

RegisterNetEvent('kevin-deliveries:finish', function ()
    JobFinish()
end)

function Checkin()
    if Config.JobNeeded == 'true' then
        if PlayerJob.name == Config.JobName then
            if Config.UseCoolDown == 'true' then
                QBCore.Functions.TriggerCallback("kevin-deliveries:coolc",function(isCooldown)
                    if not isCooldown then
                        if not GotJob then
                            StartRun()
                        end
                    else
                        QBCore.Functions.Notify("No more deliveries at this time..check back later.", 'error')
                    end
                end)
            else
                if not GotJob then
                    StartRun()
                end
            end
        else
            QBCore.Functions.Notify('You are not employed here', 'error')
            Wait(500)
            exports['qb-menu']:openMenu({
                {
                    header = 'Kevin Deliveries',
                    txt = 'Would you like to work here?',
                    icon = 'fas fa-question',
                    isMenuHeader = true
                },
                {
                    header = 'Yes',
                    txt = 'Accept offer',
                    icon = 'fas fa-check',
                    params = {
                        isServer = true,
                        event = 'kevin-deliveries:TakeJob',
                    }
                },
                {
                    header = 'No',
                    txt = 'Decline offer',
                    icon = 'fas fa-xmark',
                    params = {
                        event = 'qb-menu:client:closeMenu',
                    }
                },
            })
        end
    else
        if Config.UseCoolDown == 'true' then
            QBCore.Functions.TriggerCallback("kevin-deliveries:coolc",function(isCooldown)
                if not isCooldown then
                    if not GotJob then
                        StartRun()
                    end
                else
                    QBCore.Functions.Notify("No more deliveries at this time..check back later.", 'error')
                end
            end)
        else
            if not GotJob then
                StartRun()
            end
        end
    end
end

function SetTrunkItemInfo()
    local items = {}
	for k, item in pairs(Config.TrunkItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo['name'],
			amount = givenboxes,
			info = item.info,
			label = itemInfo['label'],
			description = itemInfo['description'] and itemInfo['description'] or '',
			weight = itemInfo['weight'],
			type = itemInfo['type'],
			unique = itemInfo['unique'],
			useable = itemInfo['useable'],
			image = itemInfo['image'],
			slot = item.slot,
		}
	end
	Config.TrunkItems = items
end

function StartRun()
    local vehspawn = Config.VehicleSpawn
    givenboxes = Config.Packages
    if not IsAnyVehicleNearPoint(vehspawn.x, vehspawn.y, vehspawn.z, 3.0) then
        GotJob = true
        data = Config.ShopLocations[math.random(#Config.ShopLocations)]
        TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', 'You got '..givenboxes..' packages to deliver', 'fas fa-truck', '#83a9f7', 5500)
        QBCore.Functions.LoadModel('mule2')
        JobVeh = CreateVehicle('mule2', vehspawn.x, vehspawn.y, vehspawn.z, vehspawn.w, true, true)
        SetVehicleLivery(JobVeh, data.VehicleLivery)
        SetVehicleDirtLevel(JobVeh, 0)
        exports['qb-fuel']:SetFuel(JobVeh, 100)
        TaskWarpPedIntoVehicle(PlayerPedId(), JobVeh, -1)
        SetTrunkItemInfo()
        TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(JobVeh)) 
        SetVehicleEngineOn(JobVeh, true, true)
        SetVehicleDoorsLocked(JobVeh, 1)
        TriggerServerEvent('inventory:server:addTrunkItems', QBCore.Functions.GetPlate(JobVeh), Config.TrunkItems)
        TriggerServerEvent("kevin-deliveries:coolout")
    else
        QBCore.Functions.Notify('Vehicle blocking garage', 'error')
    end

    if DoesEntityExist(JobVeh) and not pedinveh then
        Wait(2500)
        local dest = data.Zone[math.random(#data.Zone)]
        DestBlip = AddBlipForCoord(dest.x, dest.y, dest.y)
        SetBlipSprite(DestBlip, 304)
        SetBlipColour(DestBlip, 32)
        SetBlipRoute(DestBlip, true)
        SetBlipRouteColour(DestBlip, 32)
        SetBlipAsShortRange(DestBlip, false)
        SetBlipScale(DestBlip, 0.75)
        pedinveh = true
        Deliver(dest)
    end
end

CreateThread(function()
    while true do
        if GotJob then
            QBCore.Functions.TriggerCallback('kevin-deliveries:hasPackage', function(Package)
                local ped = PlayerPedId()
                local boxhash = data.BoxModel[math.random(#data.BoxModel)]
                if Package then
                    if prop == nil then
                        HasBox = true
                        CarryAnimation()
                        prop = CreateObject(boxhash, 0, 0, 0, true, true, true)
                        AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 0xEB95), 0.075, -0.10, 0.255, -130.0, 105.0, 0.0, true, true, false, false, 0, true)
                        DisableControls()
                    end
                else
                    if prop ~= nil then
                        DeleteEntity(prop)
                        HasBox = false
                        prop = nil
                        ClearPedTasks(ped)
                    end
                end
            end)
        end
        Wait(1000)
    end
end)

function DisableControls()
    while true do
        if HasBox then
            DisableControlAction(0, 21, true ) -- sprinting
            DisableControlAction(0, 22, true) -- Jumping
        end
        Wait(1)
    end
end

function CarryAnimation()
    LoadAnim('anim@heists@box_carry@')
    TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
    CreateThread( function ()
        while HasBox do
            if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3) then
                TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
            end
            Wait(1000)
        end
    end)
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

function Deliver(dest)
    if GotJob then
        if Config.Interaction == 'target' then
            exports['qb-target']:AddBoxZone('BoxZoneName', vector3(dest.x, dest.y, dest.z), 3.5, 2.0, {
                name='BoxZoneName',
                heading= dest.w,
                debugPoly= false,
                -- minZ = 6.04,
                -- maxZ = 7.64,
                }, {
                    options = {
                        {
                            type = 'client',
                            event = 'kevin-deliveries:Deliver',
                            icon = 'fas fa-circle',
                            label = 'Deliver Package',
                            canInteract = function()
                                if not PackageDelivered and HasBox then return true end
                                return false
                            end,
                        },
                    },
                distance = 2.0
            })
        elseif Config.Interaction == 'radialmenu' then
            Zone = BoxZone:Create(vector3(dest.x, dest.y, dest.y), 3.5, 2.0, {
                heading = dest.w,
                name = 'Shop',
                debugPoly = false,
                -- minZ = 53.64,
                -- maxZ = 56.24
            })
            Zone:onPlayerInOut(function(isPointInside)
                if isPointInside and not PackageDelivered then
                    if HasBox then
                        InShopOption = exports['qb-radialmenu']:AddOption({
                            id = 'deliver-package',
                            title = 'Deliver',
                            icon = 'box',
                            type = 'client',
                            event = 'kevin-deliveries:Deliver',
                            shouldClose = true
                        }, InShopOption)
                        --print('option added')
                    end
                else
                    if InShopOption ~= nil then
                        exports['qb-radialmenu']:RemoveOption(InShopOption)
                        InShopOption = nil
                        --print('option removed')
                    end
                end
            end)
        end
    end
end

RegisterNetEvent('kevin-deliveries:Deliver', function ()
    if not PackageDelivered then
        deliveredboxes = deliveredboxes + 1
        --print(deliveredboxes)
        TriggerServerEvent('kevin-deliveries:RemovePackage')
        TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', deliveredboxes..' / '.. givenboxes..' Packages Delivered', 'fas fa-truck', '#83a9f7', 5500)
        
        if deliveredboxes == givenboxes then
            PackageDelivered = true
            Wait(2000)
            TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', givenboxes..' Packages Delivered', 'fas fa-truck', '#83a9f7', 5500)
            Wait(2000)
            TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', 'Return to the docks and return the truck', 'fas fa-truck', '#83a9f7', 5500)
            --print('no more packages')
            RemoveBlip(DestBlip)
            Return()
        end
    else
        QBCore.Functions.Notify('You have no more packages', 'error', 5000)
    end
end)

function Return()
    local Retarea = Config.VehicleReturnCoords
    RetBlip = AddBlipForCoord(Retarea.x, Retarea.y, Retarea.y)
    SetBlipSprite(RetBlip, 50)
    SetBlipColour(RetBlip, 32)
    SetBlipRoute(RetBlip, true)
    SetBlipRouteColour(RetBlip, 32)
    SetBlipAsShortRange(RetBlip, false)
    SetBlipScale(RetBlip, 0.75)

    ReturnZone = BoxZone:Create(vector3(Retarea.x, Retarea.y, Retarea.y), 10.5, 35.0, {
        heading = Retarea.w,
        name = 'Shop',
        debugPoly = false,
        -- minZ = 53.64,
        -- maxZ = 56.24
    })
    ReturnZone:onPlayerInOut(function(isPointInside)
        if isPointInside and PackageDelivered then
            InReturn = exports['qb-radialmenu']:AddOption({
                id = 'deliver-package',
                title = 'Return',
                icon = 'truck',
                type = 'client',
                event = 'kevin-deliveries:Return',
                shouldClose = true
            }, InReturn)
            --print('option added')
        else
            if InReturn ~= nil then
                exports['qb-radialmenu']:RemoveOption(InReturn)
                InReturn = nil
                --print('option removed')
            end
        end
    end)
end

RegisterNetEvent('kevin-deliveries:Return', function()
    if Config.Interaction == 'target' then
        doreturn()
    elseif Config.Interaction == 'radialmenu' then
        if DoesEntityExist(JobVeh) and IsPedInVehicle(PlayerPedId(), JobVeh) then
            doreturn()
        else
            QBCore.Functions.Notify('You are not in a vehicle', 'error')
        end
    end
end)

function doreturn()
    QBCore.Functions.DeleteVehicle(JobVeh)
    Wait(1000)
    RemoveBlip(RetBlip)
    TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', 'Return to to dock and return the truck', 'fas fa-truck', '#83a9f7', 5500)
    VehicleReturned = true
end

function JobFinish()
    if Config.Interaction == 'target' then
        TriggerServerEvent('kevin-deliveries:Payouts', data)
        TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', 'Get into the vehicle and deliver package/s', 'fas fa-truck', '#83a9f7', 5500)
        InShopOption = nil
        pedinveh = false
        GotJob = false
        prop = nil
        PackageDelivered = false
        deliveredboxes = 0
        InReturn = nil
        VehicleReturned = false
        deliveredboxes = 0
    elseif Config.Interaction == 'radialmenu' then
        if not collected then
            Zone:destroy()
            ReturnZone:destroy()
            TriggerServerEvent('kevin-deliveries:Payouts', data)
            TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', 'Get into the vehicle and deliver package/s', 'fas fa-truck', '#83a9f7', 5500)
            InShopOption = nil
            pedinveh = false
            GotJob = false
            prop = nil
            PackageDelivered = false
            deliveredboxes = 0
            InReturn = nil
            VehicleReturned = false
            deliveredboxes = 0
            collected = true
        end
    end
end