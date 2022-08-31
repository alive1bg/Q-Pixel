local boostVehicle = 0

local dropblip = nil
local areablip = nil
local blipOffset = 200.0

local currentHacks = 0
local canHack = true

local connectNetwork = false
local wipedPaperwork = false
local hasScratched = false

local DropOffZone
local currentTier = nil
local currentContract = nil

local neons = {
    {r = 222,   g = 222,    b = 255},
    {r = 2,     g = 21,     b = 255},
    {r = 3,     g = 83,     b = 255},
    {r = 0,     g = 255,    b = 140},
    {r = 94,    g = 255,    b = 1},
    {r = 255,   g = 255,    b = 0},
    {r = 255,   g = 150,    b = 0}, 
    {r = 255,   g = 62,     b = 0},
    {r = 255,   g = 1,      b = 1},
    {r = 255,   g = 50,     b = 100},
    {r = 255,   g = 5,      b = 190},
    {r = 35,    g = 1,      b = 255},
    {r = 15,    g = 3,      b = 255}
}

local vehMods = { -- You can add more here
    0, -- Spoiler
    1, -- Front Bumper
    2, -- Rear Bumper
    3, -- Skirt
    4, -- Exhaust
    5, -- Chassis
    6, -- Grill
    7, -- Bonnet
    8, -- Wing L
    9, -- Wing R
    10, -- Roof
    22, -- Xenon Lights
}

local upgrades = {
    ['S+'] = {
        turbo = true,
        engine = 4,
        brakes = 2,
        transmission = 3
    },
    ['S'] = {
        turbo = false,
        engine = 4,
        brakes = 2,
        transmission = 3
    },
    ['A'] = {
        turbo = false,
        engine = 3,
        brakes = 1,
        transmission = 2
    },
    ['B'] = {
        turbo = false,
        engine = 2,
        brakes = 1,
        transmission = 2
    }
}

--- Creates a randomly off-set blip radius for given coordinates
--- @param coords vec3 - Coordinates of a location
--- @return blip object - Off-set blip radius
local CreateAreaBlip = function(coords)
    local offsetSign = math.random(-100, 100)/100
    local blip = AddBlipForRadius(coords.x + (offsetSign*blipOffset), coords.y + (offsetSign*blipOffset), coords.z + (offsetSign*blipOffset), 300.00)
    SetBlipHighDetail(blip, true)
    SetBlipAlpha(blip, 100)
    SetBlipColour(blip, 2)
    return blip
end

--- Creates a drop-off zone blip for given coordinates
--- @param coords vec3 - Coordinates of a location
--- @return blip object - blip
local CreateDropOffBlip = function(coords)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 227)
    SetBlipColour(blip, 2)
    SetBlipScale(blip, 0.80)
    AddTextEntry('MYBLIP', "Dropoff Location")
    BeginTextCommandSetBlipName('MYBLIP')
    AddTextComponentSubstringPlayerName('Vehicle Drop off')
    EndTextCommandSetBlipName(blip)
    return blip
end

--- Gives a vehicle random cosmetic upgrades
--- @param vehicle object - Vehicle object
local SetRandomCosmetics = function(vehicle)
    -- Colours
    local c1, c2 = math.random(160), math.random(160)
    SetVehicleColours(vehicle, c1, c2)

    -- Cosmetics
    SetVehicleModKit(vehicle, 0)
    for i=1, #vehMods, 1 do
        local modAmount = GetNumVehicleMods(vehicle, vehMods[i])
        local rndm = math.random(modAmount)
        SetVehicleMod(vehicle, vehMods[i], rndm, false)
    end
end

--- Enables upgrades for a specific vehicle based on the tier of the contract
--- @param vehicle object - Vehicle object
--- @param tier string - Tier of the boosting contract
local EnableUpgrades = function(vehicle, tier)
    SetVehicleModKit(vehicle, 0)
    ToggleVehicleMod(vehicle, 18, upgrades[tier].turbo) 
    SetVehicleMod(vehicle, 11, upgrades[tier].engine, false)
    SetVehicleMod(vehicle, 12, upgrades[tier].brakes, false)
    SetVehicleMod(vehicle, 13, upgrades[tier].transmission, false)   
end

--- Enables neon and xenon for a specific vehicle
--- @param vehicle object - Vehicle object
local EnableNeon = function(vehicle)
    -- Neon
    local colour = math.random(#neons)
    SetVehicleNeonLightsColour(vehicle, neons[colour].r, neons[colour].g, neons[colour].b)
    SetVehicleNeonLightEnabled(vehicle, 0, true)
    SetVehicleNeonLightEnabled(vehicle, 1, true)
    SetVehicleNeonLightEnabled(vehicle, 2, true)
    SetVehicleNeonLightEnabled(vehicle, 3, true)

    -- Xenon
    ToggleVehicleMod(vehicle, 22, true)
    SetVehicleXenonLightsColor(vehicle, math.random(0, 12))
end

--- Alerts the police
--- @param plate string - license plate text of a vehicle
--- @param veh object - Vehicle object
local AlertPolice = function(plate, veh)
    -- Standard QBCore police alert
    --TriggerServerEvent('police:server:policeAlert', 'Vehicle Theft: '..plate)
    
    -- Project-Sloth Dispatch
    exports['qb-dispatch']:CarBoosting(veh) 
end

--- Checks if a specific vehicle is VIN scratched
--- @param vehicle object - Vehicle object
local CheckVIN = function(vehicle)
    if vehicle and vehicle ~= 0 then
        SetVehicleDoorOpen(vehicle, 4, false, false)
        Framework.Functions.Progressbar("vinscratch_checkVin", Translations.info['checking_vin'], 8000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini@repair",
            anim = "fixing_a_player",
            flags = 16,
        }, {}, {}, function() -- Done
            local vehCo = GetEntityCoords(vehicle)
            local ped = PlayerPedId()
            local pedCo = GetEntityCoords(ped)
            StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
            SetVehicleDoorShut(vehicle, 4, false)
            if #(vehCo - pedCo) < 5.0 then
                local plate = GetVehicleNumberPlateText(vehicle)
                TriggerServerEvent('qb-carboosting:server:CheckVin', plate)
            else
                Framework.Functions.Notify(Translations.error['vehicle_far'], 'error', 2500)
            end
        end)
    end
end

--- Performans a VIN scratch animation and adds the vehicle to the players garage as a VIN scratched vehicle
--- @param vehicle object - Vehicle object
local ScratchVin = function(vehicle)
    Framework.Functions.Progressbar("vinscratch_scratchcar", Translations.info['scratching_vin'], 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_car_bomb",
        anim = "car_bomb_mechanic",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
        -- Add to garage
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        local plate = GetVehicleNumberPlateText(vehicle)
        local props = Framework.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('qb-carboosting:server:AddToGarage', string.lower(model), plate, props)
        -- Reset stuff
        DropOffZone:destroy()
        RemoveBlip(dropblip)
        TriggerServerEvent('qb-carboosting:server:VinScratch', currentTier)
        DeleteContract(currentContract)
        currentTier = nil
        currentContract = nil
        boostVehicle = 0
        started = false
        currentHacks = 0
        connectNetwork = false
        wipedPaperwork = false
        hasScratched = false
        TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.success['scratched_vin'], 'fas fa-car', '#ff002f', 10000)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
        Framework.Functions.Notify(Translations.error['canceled'], "error", 3500)
    end)
end

--- This functions handles the second part of VIN scratching a vehicle by making an animation and setting the wipedPaperwork variable to true as well as removing qb-target options
local VinLaptopTwo = function()
    local animDict = 'anim@heists@prison_heiststation@cop_reactions'
    local anim = 'cop_b_idle'
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, animDict, anim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    Framework.Functions.Progressbar("vinscratch_laptop2", Translations.info['wiping_paperwork'], 8000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        -- Delete Target
        exports['qb-target']:RemoveZone("vinscratch_laptop")
        wipedPaperwork = true
        TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['can_scratch_vin'], 'fas fa-car', '#ff002f', 10000)
        StopAnimTask(ped, animDict, anim, 1.0)
        -- Create Target to scratch vin of vehicle
        exports['qb-target']:AddGlobalVehicle({
            options = {
                {
                    icon = 'fas fa-eye-slash',
                    label = 'Scratch VIN',
                    action = function(entity)
                        ScratchVin(entity)
                    end,
                    canInteract = function(entity, distance, data)
                        if entity == boostVehicle and connectNetwork and wipedPaperwork and not hasScratched then return true end
                        return false
                    end,
                }
            },
            distance = 1.5,
        })
        end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
        Framework.Functions.Notify(Translations.error['canceled'], "error", 3500)
        StopAnimTask(ped, animDict, anim, 1.0)
    end)
end

--- This functions handles the first part of VIN scratching a vehicle by making an animation and setting the connectNetwork variable to true as well as executing the second part of VIN scratching
local VinLaptopOne = function()
    local animDict = 'anim@heists@prison_heiststation@cop_reactions'
    local anim = 'cop_b_idle'
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, animDict, anim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    Framework.Functions.Progressbar("vinscratch_laptop1", Translations.info['connect_network'], 8000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        connectNetwork = true
        TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['can_wipe'], 'fas fa-car', '#ff002f', 10000)
        VinLaptopTwo()
        StopAnimTask(ped, animDict, anim, 1.0)
        end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
        Framework.Functions.Notify(Translations.error['canceled'], "error", 3500)
        StopAnimTask(ped, animDict, anim, 1.0)
    end)
end

--- This function holds all the logics for the drop-off of a contract
--- @param id number - The id of the boosting contract
--- @param tier string - Tier of the boosting contract
--- @param vehicle string - The model of the vehicle of the contract
--- @param plate string - The license plate from the contract
StartDropOff = function(id, tier, vehicle, plate)
    TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['go_vehicle'], 'fas fa-car', '#ff002f', 600000)
    
    -- Grab random location
    local randLoc = math.random(#Shared.Contracts[tier].locations)
    local vehLoc = Shared.Contracts[tier].locations[randLoc].vehicle
    local dropOffLoc = Shared.DropOffLocations[math.random(#Shared.DropOffLocations)]
    areablip = CreateAreaBlip(vehLoc)
    
    -- Area Zone
    local VehArea = CircleZone:Create(vehLoc, 200.0, {name="boosting_vehiclearea", debugPoly=false})
    VehArea:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            -- Spawn Car
            Framework.Functions.TriggerCallback('qb-carboosting:server:SpawnCar', function(netId)
                while not NetworkDoesEntityExistWithNetworkId(netId) do Wait(10) end
                boostVehicle = NetworkGetEntityFromNetworkId(netId)
                SetRandomCosmetics(boostVehicle)
                if tier ~= 'D' and tier ~= 'C' then
                    EnableNeon(boostVehicle)
                    EnableUpgrades(boostVehicle, tier)
                end
            end, vehicle, vehLoc, plate)
            VehArea:destroy()
            TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['find_steal'], 'fas fa-car', '#ff002f', 600000)
        end
    end)
    
    -- Veh Zone
    local VehZone = CircleZone:Create(vehLoc, 2.5, {name="boosting_vehiclearea", debugPoly=false})
    VehZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            VehZone:destroy()
            Framework.Functions.TriggerCallback('qb-carboosting:server:SpawnNPC', function(netIds)
                Wait(1000)
                local ped = PlayerPedId()
                for i=1, #netIds, 1 do
                    local npc = NetworkGetEntityFromNetworkId(netIds[i])
                    SetPedDropsWeaponsWhenDead(npc, false)
                    GiveWeaponToPed(npc, `WEAPON_PISTOL`, 250, false, true)
                    SetPedMaxHealth(npc, 500)
                    SetPedArmour(npc, 200)
                    SetCanAttackFriendly(npc, false, true)
                    TaskCombatPed(npc, ped, 0, 16)
                    SetPedCombatAttributes(npc, 46, true)
                    SetPedCombatAttributes(npc, 0, false)
                    SetPedCombatAbility(npc, 100)
                    SetPedAsCop(npc, true)
                    SetPedRelationshipGroupHash(npc, `HATES_PLAYER`)
                    SetPedAccuracy(npc, 60)
                    SetPedFleeAttributes(npc, 0, 0)
                    SetPedKeepTask(npc, true)
                    --TaskGoStraightToCoord(npc, vehLoc.x, vehLoc.y, vehLoc.z, 1, -1, 0.0, 0.0)
                    SetBlockingOfNonTemporaryEvents(npc, true)
                end
            end, tier, randLoc)
        end
    end)
   
    -- Drop Off Zone
    local madeDropOffZone = false
    DropOffZone = CircleZone:Create(dropOffLoc, 7.0, {name="boosting_dropoff", debugPoly=false})
    
    -- Wait Until Inside Car
    while not madeDropOffZone do
        Wait(1000)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if GetVehicleNumberPlateText(veh) == plate then
            boostVehicle = veh
            exports[Shared.FuelScript]:SetFuel(boostVehicle, 23.00)
            -- Alert Cops
            AlertPolice(plate, boostVehicle)
            TriggerServerEvent('qb-carboosting:server:ActivateVehicle', plate, tier)
            TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['look_tracking'], 'fas fa-car', '#ff002f', 60000)
            Wait(6000)
            RemoveBlip(areablip)
            madeDropOffZone = true
        elseif not started then
            TriggerServerEvent('qb-carboosting:server:DeactivateVehicle', plate)
            VehZone:destroy()
            RemoveBlip(areablip)
            TriggerEvent('qb-phone:client:CustomNotification', 'BOOSTING', Translations.info['canceled_contract'], 'fas fa-car', '#ff002f', 10000)
            return
        end
    end

    -- Wait Until all hacks done
    while currentHacks < Shared.Contracts[tier].hacks do
        Wait(1000) 
        if not started then
            TriggerServerEvent('qb-carboosting:server:DeactivateVehicle', plate)
            DropOffZone:destroy()
            TriggerEvent('qb-phone:client:CustomNotification', 'BOOSTING', Translations.info['canceled_contract'], 'fas fa-car', '#ff002f', 10000)
            return 
        end
    end
    
    -- Create Drop off blip and logic
    dropblip = CreateDropOffBlip(dropOffLoc)
    TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['go_dropoff'], 'fas fa-car', '#ff002f', 60000)
    DropOffZone:onPlayerInOut(function(isPointInside, point)
        if currentHacks == Shared.Contracts[tier].hacks then
            if isPointInside then
                if GetVehiclePedIsIn(PlayerPedId(), false) == boostVehicle then
                    TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['park_vehicle'], 'fas fa-car', '#ff002f', 600000)
                end
            else
                if GetVehiclePedIsIn(PlayerPedId(), false) ~= boostVehicle and DropOffZone:isPointInside(GetEntityCoords(boostVehicle)) then
                    -- Complete
                    DropOffZone:destroy()
                    Wait(10000)
                    Framework.Functions.DeleteVehicle(boostVehicle)
                    RemoveBlip(dropblip)
                    TriggerServerEvent('qb-carboosting:server:DropOff', tier)
                    DeleteContract(id)
                    boostVehicle = 0
                    started = false
                    currentHacks = 0
                    TriggerEvent('qb-phone:client:CustomNotification', 'Boosting', Translations.info['completed_contract'], 'fas fa-car', '#ff002f', 10000)
                end
            end
        end
    end)
end

--- This function holds all the logics for the VIN scratch of a contract
--- @param id number - The id of the boosting contract
--- @param tier string - Tier of the boosting contract
--- @param vehicle string - The model of the vehicle of the contract
--- @param plate string - The license plate from the contract
StartVinScratch = function(id, tier, vehicle, plate)
    currentTier = tier
    currentContract = id
    TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['go_vehicle'], 'fas fa-car', '#ff002f', 600000)
    
    -- Grab random location
    local randLoc = math.random(#Shared.Contracts[tier].locations)
    local vehLoc = Shared.Contracts[tier].locations[randLoc].vehicle
    local dropOffLoc = Shared.ScratchLocations[math.random(#Shared.ScratchLocations)]
    areablip = CreateAreaBlip(vehLoc)
    
    -- Area Zone
    local VehArea = CircleZone:Create(vehLoc, 200.0, {name="boosting_vehiclearea", debugPoly=false})
    VehArea:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            -- Spawn Car
            Framework.Functions.TriggerCallback('qb-carboosting:server:SpawnCar', function(netId)
                while not NetworkDoesEntityExistWithNetworkId(netId) do Wait(10) end
                boostVehicle = NetworkGetEntityFromNetworkId(netId)
                SetRandomCosmetics(boostVehicle)
                if tier ~= 'D' and tier ~= 'C' then
                    EnableNeon(boostVehicle)
                    EnableUpgrades(boostVehicle, tier)
                end
            end, vehicle, vehLoc, plate)
            VehArea:destroy()
            TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['find_steal'], 'fas fa-car', '#ff002f', 600000)
        end
    end)
    
    -- Veh Zone
    local VehZone = CircleZone:Create(vehLoc, 2.5, {name="boosting_vehiclearea", debugPoly=false})
    VehZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            VehZone:destroy()
            Framework.Functions.TriggerCallback('qb-carboosting:server:SpawnNPC', function(netIds)
                Wait(1000)
                local ped = PlayerPedId()
                for i=1, #netIds, 1 do
                    local npc = NetworkGetEntityFromNetworkId(netIds[i])
                    SetPedDropsWeaponsWhenDead(npc, false)
                    GiveWeaponToPed(npc, `WEAPON_PISTOL`, 250, false, true)
                    SetPedMaxHealth(npc, 500)
                    SetPedArmour(npc, 200)
                    SetCanAttackFriendly(npc, false, true)
                    TaskCombatPed(npc, ped, 0, 16)
                    SetPedCombatAttributes(npc, 46, true)
                    SetPedCombatAttributes(npc, 0, false)
                    SetPedCombatAbility(npc, 100)
                    SetPedAsCop(npc, true)
                    SetPedRelationshipGroupHash(npc, `HATES_PLAYER`)
                    SetPedAccuracy(npc, 60)
                    SetPedFleeAttributes(npc, 0, 0)
                    SetPedKeepTask(npc, true)
                    --TaskGoStraightToCoord(npc, vehLoc.x, vehLoc.y, vehLoc.z, 1, -1, 0.0, 0.0)
                    SetBlockingOfNonTemporaryEvents(npc, true)
                end
            end, tier, randLoc)
        end
    end)
    
    -- Drop Off Zone
    local madeDropOffZone = false
    DropOffZone = CircleZone:Create(dropOffLoc.coords, 7.0, {name="boosting_dropoff", debugPoly=false})
    
    -- Wait Until Inside Car
    while not madeDropOffZone do
        Wait(1000)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if GetVehicleNumberPlateText(veh) == plate then
            boostVehicle = veh
            exports[Shared.FuelScript]:SetFuel(boostVehicle, 23.00)
            -- Alert Cops
            AlertPolice(plate, boostVehicle)
            TriggerServerEvent('qb-carboosting:server:ActivateVehicle', plate, tier)
            TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['look_tracking'], 'fas fa-car', '#ff002f', 60000)
            Wait(6000)
            RemoveBlip(areablip)
            madeDropOffZone = true
        elseif not started then
            TriggerServerEvent('qb-carboosting:server:DeactivateVehicle', plate)
            VehZone:destroy()
            RemoveBlip(areablip)
            TriggerEvent('qb-phone:client:CustomNotification', 'BOOSTING', Translations.info['canceled_contract'], 'fas fa-car', '#ff002f', 10000)
            return
        end
    end
    
    -- Wait Until all hacks done
    while currentHacks < Shared.Contracts[tier].hacks do
        Wait(1000) 
        if not started then
            TriggerServerEvent('qb-carboosting:server:DeactivateVehicle', plate)
            DropOffZone:destroy()
            TriggerEvent('qb-phone:client:CustomNotification', 'BOOSTING', Translations.info['canceled_contract'], 'fas fa-car', '#ff002f', 10000)
            return 
        end
    end
    
    -- Create Drop off blip and logic
    dropblip = CreateDropOffBlip(dropOffLoc.coords)
    TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['go_dropoff'], 'fas fa-car', '#ff002f', 60000)
    DropOffZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            if GetVehiclePedIsIn(PlayerPedId(), false) == boostVehicle then
                TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['park_vehicle'], 'fas fa-car', '#ff002f', 10000)
            end
        else
            if GetVehiclePedIsIn(PlayerPedId(), true) == boostVehicle and DropOffZone:isPointInside(GetEntityCoords(boostVehicle)) then
                -- Create Target for the Laptop
                exports['qb-target']:AddBoxZone("vinscratch_laptop", dropOffLoc.laptop.xyz, 0.3, 0.4, {
                    name = "vinscratch_laptop",
                    heading = dropOffLoc.laptop.w,
                    debugPoly = false,
                    minZ = dropOffLoc.laptop.z-0.3,
                    maxZ = dropOffLoc.laptop.z+0.3
                    }, {
                    options = { 
                        {
                            action = function()
                                VinLaptopOne()
                            end,
                            icon = 'fas fa-network-wired',
                            label = 'Connect to network',
                            canInteract = function()
                                if connectNetwork then return false end
                                return true
                            end
                        },
                        {
                            action = function()
                                VinLaptopTwo()
                            end,
                            icon = 'fas fa-globe',
                            label = 'Wipe paperwork',
                            canInteract = function()
                                if wipedPaperwork or not connectNetwork then return false end
                                return true
                            end
                        }
                    },
                    distance = 1.5,
                })
            end
        end
    end)
end

RegisterNetEvent('qb-carboosting:client:ActivateVehicle', function(licenseplate, tier)
    activeVehicles[licenseplate] = {
        curHack = 0,
        maxHack = Shared.Contracts[tier].hacks
    }
end)

RegisterNetEvent('qb-carboosting:client:DeactivateVehicle', function(licenseplate)
    activeVehicles[licenseplate] = nil
end)

RegisterNetEvent('qb-carboosting:client:UpdateTracker', function(licenseplate, amount)
    activeVehicles[licenseplate].curHack = amount
    local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
    if plate == licenseplate then
        TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['update_tracker'].."("..activeVehicles[plate].curHack.."/"..activeVehicles[plate].maxHack..")", 'fas fa-car', '#ff002f', 60000)
    end
end)

RegisterNetEvent('qb-carboosting:client:UseDisabler', function()
    if canHack then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        local plate = GetVehicleNumberPlateText(veh)
        if activeVehicles[plate] then
            if GetPedInVehicleSeat(veh, 0) == ped and GetPedInVehicleSeat(veh, -1) ~= 0 then
                if activeVehicles[plate].curHack < activeVehicles[plate].maxHack then
                    if math.ceil(GetEntitySpeed(veh) * 2.23694) >= Shared.MinSpeed then
                        canHack = false

                        local result = exports['boostinghack']:StartHack()
                        if result then
                            TriggerServerEvent('qb-carboosting:server:UpdateTracker', plate, true)
                        else
                            TriggerServerEvent('qb-carboosting:server:UpdateTracker', plate, false)
                            Framework.Functions.Notify(Translations.error['failed'], "error", 2500)
                        end

                        -- Cooldown
                        CreateThread(function()
                            Wait(60*1000) -- 60 seconds timer until you can hack again
                            canHack = true
                        end)
                    else
                        Framework.Functions.Notify(Translations.error['too_slow'], 'error', 2500)
                    end
                else
                    TriggerEvent('qb-phone:client:CustomNotification', Translations.info['current'], Translations.info['go_dropoff'], 'fas fa-car', '#ff002f', 60000)
                end
            else
                Framework.Functions.Notify(Translations.error['only_passenger'], 'error', 2500)
            end
        else
            Framework.Functions.Notify(Translations.error['wrong_vehicle'], 'error', 2500)
        end
    end
end)

RegisterNetEvent('qb-carboosting:client:ReceiveLocation', function(coords, model, plate)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 161)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 1.00)
    AddTextEntry('MYBLIP', "Vehicle Theft "..model.." - "..plate)
    BeginTextCommandSetBlipName('MYBLIP')
    AddTextComponentSubstringPlayerName("Vehicle Theft "..model.." - "..plate)
    EndTextCommandSetBlipName(blip)
    Wait(10*1000) -- How long the blip should remain active, here 10 seconds
    RemoveBlip(blip)
end)

CreateThread(function()
    exports['qb-target']:AddGlobalVehicle({
        options = {
            {
                icon = 'fas fa-check-circle',
                label = 'Check VIN',
                action = function(entity)
                    CheckVIN(entity)
                end,
                job = 'police'
            }
        },
        distance = 1.5,
    })
end)

CreateThread(function() -- Main thread to check amount of hacks on current vehicle
    while true do
        Wait(1000)
        if isLoggedIn then
            local ped = PlayerPedId()
            local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false))
            if activeVehicles[plate] then
                currentHacks = activeVehicles[plate].curHack
            end
        end
    end
end)

CreateThread(function() -- Main thread for police alerts
    while true do
        Wait(20*1000) -- This here controls how often to alert the cops 20*1000 being 20 seconds
        if isLoggedIn then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local plate = GetVehicleNumberPlateText(veh)
            if activeVehicles[plate] and GetPedInVehicleSeat(veh, -1) == ped then
                if activeVehicles[plate].curHack < activeVehicles[plate].maxHack then
                    -- Alert Cops
                    TriggerServerEvent('qb-carboosting:server:SendLocation', GetEntityCoords(veh), GetDisplayNameFromVehicleModel(GetEntityModel(veh)), GetVehicleNumberPlateText(veh))
                    -- PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1) -- You can uncomment this but i found it annoying
                end
            end
        end
    end
end)