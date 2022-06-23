local QBCore = exports['qb-core']:GetCoreObject()

local CurrentCops = 0
local InHouse = false
local NeedAccess1 = false
local NeedAccess2 = false
local SystemHacked = false
local GuardSpawned = false
local BodySearched = false
local GotTruck = false
local NearTruck = false
local KeyPressed = false
local KeyPressed2 = false
local GuardsSpawned = false
local CanLoot = false

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

local Zone = BoxZone:Create(vector3(1271.02, -1714.98, 59.24), 13.0, 13.2, {
    heading = 25,
    name="Lester",
    debugPoly = false,
    minZ = 53.64,
    maxZ = 56.24
})
Zone:onPlayerInOut(function(isPointInside)
    if isPointInside then
        if not InHouse then
            EnterHouse()
        end
    else
        InHouse = false
    end
end)

function EnterHouse()
    QBCore.Functions.Notify("Looks like Lester isn't home...", 'primary')
    InHouse = true
    exports['qb-target']:AddBoxZone('lester-computer', vector3(1276.24, -1710.27, 54.77), 1.2, 1, {
        name='lester-computer',
        heading=28,
        debugPoly = false,
        minZ=54.47,
        maxZ=55.27,
        }, {
            options = {
                {
                    icon = 'fas fa-laptop-code',
                    label = 'Access Computer',
                    canInteract = function()
                        if InHouse and not NeedAccess1 then return true end
                        return false
                    end,
                    action = function()
                        Access()
                    end,
                },
                {
                    icon = 'fas fa-laptop-code',
                    label = 'Connect Laptop',
                    canInteract = function()
                        if NeedAccess2 then return true end
                        return false
                    end,
                    action = function()
                        Connect()
                    end,
                },
                {
                    icon = 'fas fa-laptop-code',
                    label = 'Browse Computer',
                    canInteract = function()
                        if SystemHacked then return true end
                        return false
                    end,
                    action = function()
                        Browse()
                    end,
                },
            },
        distance = 2.0
    })
end

function Access()
    if CurrentCops >= Config.PoliceNeeded then
        QBCore.Functions.TriggerCallback("qb-banktrucks:server:coolc",function(isCooldown)
            if not isCooldown then
                TriggerEvent('animations:client:EmoteCommandStart', {"type"})
                QBCore.Functions.Progressbar("start_job", "Accessing", 6000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                }, {}, {}, function() -- Done
                    QBCore.Functions.Notify("Security lock to difficult, need brute force!", 'primary')
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    TriggerServerEvent("qb-banktrucks:server:coolout")
                    NeedAccess1 = true
                    NeedAccess2 = true
                end, function() -- Cancel
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("Cancelled?", 'error')
                end, "fas fa-laptop-code")
            else
                QBCore.Functions.Notify("System seems to be on a cooldown", 'error')
            end
        end)
    else
        QBCore.Functions.Notify("Cannot do this right now..", "error", 3500)
    end
end

RegisterCommand('t', function ()
    Connect()
end)
function Connect()
    TriggerEvent('animations:client:EmoteCommandStart', {"type"})
    Wait(2000)
    QBCore.Functions.TriggerCallback('qb-banktrucks:server:hasItem', function(item)
        if item then
            Wait(500)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Progressbar("search_body", "Connecting", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@heists@ornate_bank@hack",
                anim = "hack_loop",
                flags = 1,
            }, {
                model = "hei_prop_hst_laptop",
                coords = { x = 0.18, y = 0.053, z = 0.02 },
                rotation = { x = 190.0, y = 0.0, z = 80.0 },
            }, {}, function() -- Done
                exports["memorygame"]:thermiteminigame(Config.Blocks, Config.Attempts, Config.Show, Config.Time,
                function() -- Success
                    DeleteObject(hacklaptop)
                    ClearPedTasksImmediately(PlayerPedId())
                    Wait(1000)
                    QBCore.Functions.Notify("Security bypassed, you can now browse the computer", 'success')
                    SystemHacked = true
                    NeedAccess2 = false
                end,
                function() -- Failure
                    ClearPedTasksImmediately(PlayerPedId())
                    QBCore.Functions.Notify("Failed to brute force.. Alarms triggered", 'error')
                end)
            end, function() -- Cancel
                QBCore.Functions.Notify("Cancelled?", 'error')
                ClearPedTasks(ped)
            end, "fas fa-code")
            
        else
            ClearPedTasksImmediately(PlayerPedId())
            QBCore.Functions.Notify("You do not have the equipment to hack this computer", 'error')
        end
    end)
end

function Browse()
    exports['qb-menu']:openMenu({
        {
            header = "Jobs Available",
            txt = "Lester left a tab open with his jobs?",
            icon = "fas fa-money-bill-1",
            isMenuHeader = true
        },
        {
            header = "Bank Truck",
            txt = "Send information to your phone",
            icon = "fas fa-mobile",
            params = {
                event = "qb-banktrucks:client:GotAccess",
            }
        },
    })
end

RegisterNetEvent('qb-banktrucks:client:GotAccess', function ()
    SystemHacked = false
    Wait(1000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Lester's Computer",
        subject = 'Job Info',
        message = 'Anonymous: Hey I got that cooking recipe you wanted, meet me at the location I sent you on the gps. I will be in uniform, see you in 2 minutes',
    })
    Wait(2000)
    QBCore.Functions.Notify("You need to hurry to the location before lester gets there", 'success')
    SetGps()
end)

function SetGps()
    Wait(2000)
    TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', "Meet up at the location with lesters connect", 'fas fa-location-arrow', '#00ffd5', 5500)

    local pedloc = Config.PedLocations[math.random(#Config.PedLocations)]
    if not GuardSpawned then
        QBCore.Functions.LoadModel(Config.SecurityPed)
        local guard = CreatePed(0,Config.SecurityPed, pedloc.x, pedloc.y, pedloc.z, 0.0, true, true)
        SetEntityAsMissionEntity(guard)
        TaskWanderInArea(guard, pedloc.x, pedloc.y, pedloc.z, 1.0, 2, 0.2)

        guardblip = AddBlipForEntity(guard)
        SetBlipSprite(guardblip, 304)
        SetBlipColour(guardblip, 2)
        SetBlipRoute(guardblip, true)
        SetBlipRouteColour(guardblip, 2)
        SetBlipAsShortRange(guardblip, false)
        SetBlipScale(guardblip, 0.75)
        GuardSpawned = true

        local alerted = false
        local GuardZone = BoxZone:Create(vector3(pedloc.x, pedloc.y, pedloc.z), 20.0, 20.0, {
            heading = 0,
            name="guard",
            debugPoly = false,
            -- minZ = 53.64,
            -- maxZ = 56.24
        })
        GuardZone:onPlayerInOut(function(isPointInside)
            if isPointInside and not alerted then
                alerted = true
                TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', "Meet up at the location with Lester's connect", 'fas fa-location-arrow', '#00ffd5', 5500)
                Wait(1500)
                TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', "Kill the guard", 'fas fa-user', '#00ffd5', 5500)
                TaskSmartFleePed(guard, PlayerPedId(), 500.0, -1, true, true)
                QBCore.Functions.Notify("You spooked the guard...Kill him before he alerts the cops", 'primary')
            end
        end)

        local alerted2 = false
        CreateThread( function ()
            while DoesEntityExist(guard) do
                if IsPedDeadOrDying(guard) and not alerted2 then
                    alerted2 = true
                    TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', "Kill the guard", 'fas fa-user', '#00ffd5', 5500)
                    RemoveBlip(guardblip)
                    exports['qb-target']:AddTargetEntity(guard, {
                        options = {
                            {
                                icon = 'fas fa-circle',
                                label = 'Search Body',
                                canInteract = function()
                                    if not BodySearched then return true end
                                    return false
                                end,
                                action = function()
                                    TakePackage()
                                end,
                            }
                        },
                        distance = 2.0
                    })
                end
                Wait(1000)
            end
        end)
    end
end

function TakePackage()
    SearchAnim()
    QBCore.Functions.Progressbar("search_body", "Searching", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
    }, {}, {}, function() -- Done
        BodySearched = true
        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('qb-banktrucks:server:giveitem')
    end, function() -- Cancel
        ClearPedTasksImmediately(PlayerPedId())
        QBCore.Functions.Notify("Cancelled?", 'error')
    end, "fas fa-magnifying-glass")
end

RegisterNetEvent('qb-banktrucks:client:gettruck', function ()
    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    if BodySearched then
        QBCore.Functions.Progressbar("search_body", "Booting Up", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
        }, {}, {}, function() -- Done
            BodySearched = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', "Intercept the truck", 'fas fa-truck-moving', '#00ffd5', 5500)
            SpawnStuff()
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled?", 'error')
        end, "fas fa-location-arrow")
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("No Shortcuts Punk.", 'error')
        TriggerServerEvent("QBCore:Server:RemoveItem", "gps-device", "1")
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["gps-device"], "remove")
    end
end)

function SpawnStuff()
    local Truckloc = Config.Locations[math.random(#Config.Locations)]
    QBCore.Functions.LoadModel("stockade")
    Truck = CreateVehicle("stockade", Truckloc.x, Truckloc.y, Truckloc.z, 52.0, true, true)
    SetEntityAsMissionEntity(Truck)

    TruckBlip = AddBlipForEntity(Truck)
    SetBlipSprite(TruckBlip, 67)
    SetBlipColour(TruckBlip, 2)
    SetBlipFlashes(TruckBlip, true)
    SetBlipRoute(TruckBlip, true)
    SetBlipRouteColour(TruckBlip, 2)

    QBCore.Functions.LoadModel(Config.SecurityPed)
    Driver = CreatePed(26, Config.SecurityPed, Truckloc.x, Truckloc.y, Truckloc.z, 268.9422, true, false)
    CoPilot = CreatePed(26, Config.SecurityPed, Truckloc.x, Truckloc.y, Truckloc.z, 268.9422, true, false)
    SetPedIntoVehicle(Driver, Truck, -1)
    SetPedIntoVehicle(CoPilot, Truck, 0)
    SetPedRelationshipGroupHash(CoPilot, `HATES_PLAYER`)
    GiveWeaponToPed(CoPilot, `WEAPON_SMG`, 250, false, true)
    SetPedSuffersCriticalHits(CoPilot, false)
    TaskVehicleDriveWander(Driver, Truck, 70.0, 262144)
    GotTruck = true
    CreateThread( function ()
        while GotTruck do
            if IsVehicleStopped(Truck) then
                if IsVehicleSeatFree(Truck, -1) and IsVehicleSeatFree(Truck, 0) and IsVehicleSeatFree(Truck, 1) then
                    local PedPos = GetEntityCoords(PlayerPedId())
                    local TruckPos = GetOffsetFromEntityInWorldCoords(Truck, 0.0, -3.5, 0.5)
                    local TruckDist = GetDistanceBetweenCoords(PedPos.x, PedPos.y, PedPos.z, TruckPos.x, TruckPos.y, TruckPos.z, true)
                    if TruckDist <= 2.5 and not NearTruck then
                        if IsPedDeadOrDying(Driver) and IsPedDeadOrDying(CoPilot) then
                            QBCore.Functions.TriggerCallback('qb-banktrucks:server:hasItem', function(item)
                                if item then
                                    exports['qb-ui']:showInteraction("[E] Connect Computer")
                                    PressedKey()
                                else
                                    ClearPedTasksImmediately(PlayerPedId())
                                    QBCore.Functions.Notify("You do not have the equipment to access this door", 'error')
                                end
                            end) 
                        end
                    else
                        exports['qb-ui']:hideInteraction()
                    end
                end
            end
            Wait(1000)
        end
    end)
end

function PressedKey()
    CreateThread(function ()
        while not KeyPressed do
            if IsControlJustReleased(0, 38) then
                GotTruck = false
                NearTruck = true
                KeyPressed = true
                exports['qb-ui']:hideInteraction()
                FreezeEntityPosition(Truck, true)
                AccessDoors()
                TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', "Intercept the truck", 'fas fa-truck-moving', '#00ffd5', 5500)
            end
            Wait(1)
        end
    end)
end

function AccessDoors()
    local ped = PlayerPedId()
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    Wait(1500)
    QBCore.Functions.Progressbar("search_body", "Connecting", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@heists@ornate_bank@hack",
        anim = "hack_loop",
        flags = 1,
    }, {
        model = "hei_prop_hst_laptop",
        coords = { x = 0.18, y = 0.053, z = 0.02 },
        rotation = { x = 190.0, y = 0.0, z = 80.0 },
    }, {}, function() -- Done
        exports['qb-dispatch']:BankTruckRobbery()
        exports["memorygame"]:thermiteminigame(Config.Blocks2, Config.Attempts2, Config.Show2, Config.Time2,
        function() -- Success
            TriggerServerEvent("QBCore:Server:RemoveItem", "hacking-laptop", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hacking-laptop"], "remove")
            SetVehicleUndriveable(Truck, true)
            ClearPedTasks(ped)
            Wait(Config.Timer)
            SpawnGuards()
        end,
        function() -- Failure
            ClearPedTasksImmediately(PlayerPedId())
            QBCore.Functions.Notify("Failed to brute force.. Alarms triggered", 'error')
        end)
    end, function() -- Cancel
        QBCore.Functions.Notify("Cancelled?", 'error')
        ClearPedTasks(ped)
    end, "fas fa-code")
end

function SpawnGuards()
    QBCore.Functions.LoadModel(Config.SecurityPed)
    for k = -1, 4 do
        Wait(1) 
        local Guards = CreatePedInsideVehicle(Truck, 5, Config.SecurityPed, k, 1, 1)
        TaskLeaveVehicle(Guards, Truck, 0)
        SetEntityAsMissionEntity(Guards)
        SetEntityVisible(Guards, true)
        SetPedRelationshipGroupHash(Guards, `HATES_PLAYER`)
        SetPedAccuracy(Guards, 80)
        SetPedArmour(Guards, 200)
        SetPedMaxHealth(Guards, 500)
        SetPedCanSwitchWeapon(Guards, true)
        SetPedDropsWeaponsWhenDead(Guards, false)
        SetPedFleeAttributes(Guards, 0, false)
        GiveWeaponToPed(Guards, `WEAPON_SMG`, 250, false, true)
        SetPedSuffersCriticalHits(Guards, false)
        GuardsSpawned = true
    end
    SetVehicleDoorOpen(Truck, 3, false, true)
    SetVehicleDoorOpen(Truck, 4, false, true)
    CreateThread( function ()
        while GuardsSpawned do
            local PedPos = GetEntityCoords(PlayerPedId())
            local TruckPos = GetOffsetFromEntityInWorldCoords(Truck, 0.0, -3.5, 0.5)
            local TruckDist = GetDistanceBetweenCoords(PedPos.x, PedPos.y, PedPos.z, TruckPos.x, TruckPos.y, TruckPos.z, true)
            if TruckDist <= 2.5 and not CanLoot then
                exports['qb-ui']:showInteraction("[E] Grab Loot")
                PressedKey2()
            else
                exports['qb-ui']:hideInteraction()
            end
            Wait(1000)
        end
    end)
end

function PressedKey2()
    CreateThread(function ()
        while not KeyPressed2 do
            if IsControlJustReleased(0, 38) then
                CanLoot = true
                KeyPressed2 = true
                exports['qb-ui']:hideInteraction()
                Loot()
            end
            Wait(1)
        end
    end)
end

function Loot()
    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    ClearPedTasks(PlayerPedId())
    Wait(1500)
    QBCore.Functions.Progressbar("start_looting", 'Looting', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@heists@ornate_bank@grab_cash_heels",
        anim = "grab",
        flags = 49,
    }, {
        model = "prop_cs_heist_bag_02",
        bone = 57005,
        coords = { x = -0.004, y = 0.00, z = -0.14 },
        rotation = { x = 235.0, y = -25.0, z = 0.0 },
    }, {}, function() -- Done
        TriggerServerEvent('qb-banktrucks:server:Payouts')
    end, function() -- Cancel
        QBCore.Functions.Notify("Cancelled", 'error')
    end,"fas fa-boxes-stacked")
end
function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

RegisterNetEvent('qb-banktrucks:client:Clean', function ()
    NeedAccess1 = false
    NeedAccess2 = false
    SystemHacked = false
    GuardSpawned = false
    BodySearched = false
    GotTruck = false
    NearTruck = false
    KeyPressed = false
    KeyPressed2 = false
    GuardsSpawned = false
    CanLoot = false
end)

function SearchAnim()
    local ped = PlayerPedId()
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    Wait(2500)
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
    TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 49, 0, false, false, false )
end

function OpenAnim()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    local animDict = "anim@heists@ornate_bank@hack"
    RequestAnimDict(animDict)
    QBCore.Functions.LoadModel("hei_prop_hst_laptop")

    hacklaptop = CreateObject(`hei_prop_hst_laptop`, pos.x, pos.y, pos.z + 0.40, 1, 1, 0)
    SetEntityHeading(hacklaptop, GetEntityHeading(ped))
    local LaptopPos = GetEntityCoords(hacklaptop)
    local HackLoop = NetworkCreateSynchronisedScene(LaptopPos, GetEntityRotation(hacklaptop), 0, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, HackLoop, animDict, "hack_loop", 3.0, 3.0, 25, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(hacklaptop, HackLoop, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
    HackFinished = NetworkCreateSynchronisedScene(LaptopPos, GetEntityRotation(hacklaptop), 0, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, HackFinished, animDict, "hack_exit", 3.0, 3.0, 25, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(hacklaptop, HackFinished, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(HackLoop)
end


