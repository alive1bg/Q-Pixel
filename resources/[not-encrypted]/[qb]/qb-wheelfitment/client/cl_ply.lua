QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}
DecorRegister("qb-wheelfitment_applied", 2)
DecorRegister("qb-wheelfitment_w_width", 1)
DecorRegister("qb-wheelfitment_w_size", 1)
DecorRegister("qb-wheelfitment_w_fl", 1)
DecorRegister("qb-wheelfitment_w_fr", 1)
DecorRegister("qb-wheelfitment_w_rl", 1)
DecorRegister("qb-wheelfitment_w_rr", 1)
DecorRegister("qb-wheelfitment_w_flro", 1)
DecorRegister("qb-wheelfitment_w_frro", 1)
DecorRegister("qb-wheelfitment_w_rlro", 1)
DecorRegister("qb-wheelfitment_w_rrro", 1)

local plyVehFitments = {}
local vehiclesToCheckFitment = {}
local didPlyAdjustFitments = false
local performVehicleCheck = true
local currentFitmentsToSet = {width = 0, size = 0, fl = 0, fr = 0, rl = 0, rr = 0, flro = 0, frro = 0, rlro = 0, rrro = 0}
local inZone = false
local suanki_zone = nil

local validZones = {
    ["qb-wheelfitment:zone1"] = true,
    ["qb-wheelfitment:zone2"] = true
}

local function roundNum(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function isNear(pos1, pos2, distMustBe)
    local diff = #(pos2 - pos1)
    return (diff < (distMustBe))
end

function SyncWheelFitment()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if didPlyAdjustFitments then
        if not DecorExistOn(plyVeh, "qb-wheelfitment_applied") then
            DecorSetBool(plyVeh, "qb-wheelfitment_applied", true)
        end

        DecorSetFloat(plyVeh, "qb-wheelfitment_w_width", roundNum(GetVehicleWheelWidth(plyVeh), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_size", roundNum(GetVehicleWheelSize(plyVeh), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_fl", roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_fr", roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rl", roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rr", roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_flro", roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_frro", roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rlro", roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rrro", roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2))

        local plate = GetVehicleNumberPlateText(plyVeh)
        TriggerServerEvent("qb-wheelfitment_sv:saveWheelfitment", plate, currentFitmentsToSet, plyVeh)
        
        didPlyAdjustFitments = false
    end

    currentFitmentsToSet = {width = 0, size = 0, fl = 0, fr = 0, rl = 0, rr = 0, flro = 0, frro = 0, rlro = 0, rrro = 0}

    performVehicleCheck = true

    checkVehicleFitment()

    FreezeEntityPosition(plyVeh, false)
    SetEntityCollision(plyVeh, true, true)

    TriggerServerEvent("bu-orospu-zonelari-kaydet", suanki_zone, false)
end

function SyncWheelFitment1()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if didPlyAdjustFitments then
        if not DecorExistOn(plyVeh, "qb-wheelfitment_applied") then
            DecorSetBool(plyVeh, "qb-wheelfitment_applied", true)
        end

        DecorSetFloat(plyVeh, "qb-wheelfitment_w_width", roundNum(GetVehicleWheelWidth(plyVeh), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_size", roundNum(GetVehicleWheelSize(plyVeh), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_fl", roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_fr", roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rl", roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rr", roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_flro", roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_frro", roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rlro", roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2))
        DecorSetFloat(plyVeh, "qb-wheelfitment_w_rrro", roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2))

        local plate = GetVehicleNumberPlateText(plyVeh)
        TriggerServerEvent("qb-wheelfitment_sv:saveWheelfitment", plate, currentFitmentsToSet, plyVeh)
        
        didPlyAdjustFitments = false
    end

    currentFitmentsToSet = {width = 0, size = 0, fl = 0, fr = 0, rl = 0, rr = 0, flro = 0, frro = 0, rlro = 0, rrro = 0}

    performVehicleCheck = true

    checkVehicleFitment()
end

function AdjustWheelFitment(state, wheel, amount)
    if amount == -1 then
        amount = -1.00
    elseif amount == 1 then
        amount = 1.00
    elseif amount == 0 then
        amount = 0.00
    end

    if state then
        if wheel == "w_fl" then
            wheel = 0

            currentFitmentsToSet.fl = amount
        elseif wheel == "w_fr" then
            wheel = 1

            currentFitmentsToSet.fr = amount
        elseif wheel == "w_rl" then
            wheel = 2

            currentFitmentsToSet.rl = amount
        elseif wheel == "w_rr" then
            wheel = 3

            currentFitmentsToSet.rr = amount
        end

        if wheel == "w_flro" then
            wheel = 0

            currentFitmentsToSet.flro = amount
        elseif wheel == "w_frro" then
            wheel = 1

            currentFitmentsToSet.frro = amount
        elseif wheel == "w_rlro" then
            wheel = 2

            currentFitmentsToSet.rlro = amount
        elseif wheel == "w_rrro" then
            wheel = 3

            currentFitmentsToSet.rrro = amount
        elseif wheel == "w_size" then
            wheel = 0, 1, 2, 3

            currentFitmentsToSet.size = amount
        end

        if not didPlyAdjustFitments then
            didPlyAdjustFitments = true
        end

    else
        if not didPlyAdjustFitments then
            didPlyAdjustFitments = true
        end

        currentFitmentsToSet.width = amount
    end
end

function checkVehicleFitment()
    vehiclesToCheckFitment = {}

    local vehicles = GetGamePool("CVehicle")
    for _, veh in ipairs(vehicles) do
        local plyPed = PlayerPedId()
        local plyPos = GetEntityCoords(plyPed)

        if isNear(plyPos, GetEntityCoords(veh), 150) then
            if DecorExistOn(veh, "qb-wheelfitment_applied") then
                vehiclesToCheckFitment[#vehiclesToCheckFitment + 1] = {
                    vehicle = veh,
                    w_width = DecorGetFloat(veh, "qb-wheelfitment_w_width"),
                    w_size = DecorGetFloat(veh, "qb-wheelfitment_w_size"),
                    w_fl = DecorGetFloat(veh, "qb-wheelfitment_w_fl"),
                    w_fr = DecorGetFloat(veh, "qb-wheelfitment_w_fr"),
                    w_rl = DecorGetFloat(veh, "qb-wheelfitment_w_rl"),
                    w_rr = DecorGetFloat(veh, "qb-wheelfitment_w_rr"),
                    w_flro = DecorGetFloat(veh, "qb-wheelfitment_w_flro"),
                    w_frro = DecorGetFloat(veh, "qb-wheelfitment_w_frro"),
                    w_rlro = DecorGetFloat(veh, "qb-wheelfitment_w_rlro"),
                    w_rrro = DecorGetFloat(veh, "qb-wheelfitment_w_rrro"),
                }
            end
        end
    end
end

CreateThread(function()
    exports["qb-polyzone"]:AddBoxZone("qb-wheelfitment:zone1", vector3(135.88, -3030.43, 7.04), 6.4, 4.0, {
        heading = 0,
        minZ = 3.64,
        maxZ = 7.64,
        data = {id = "wheel_fitment_zone"}
    })
    
    -- PD Zone bruh
    exports["qb-polyzone"]:AddBoxZone("qb-wheelfitment:zone2", vector3(435.41, -975.99, 25.7), 4.0, 8.6, {
        name="2",
        heading = 0,
        minZ = 24.5,
        maxZ = 27.1,
        data = { id = "wheel_fitment_zone2" }
    })
end)

CreateThread(function()
    while true do
        if performVehicleCheck then
            for _, vehData in ipairs(vehiclesToCheckFitment) do
                if vehData.vehicle ~= nil and DoesEntityExist(vehData.vehicle) then
                    if GetVehicleWheelWidth(vehData.vehicle) ~= vehData.w_width then
                        SetVehicleWheelWidth(vehData.vehicle, vehData.w_width)
                    end
                    if GetVehicleWheelSize(vehData.vehicle) ~= vehData.w_size then
                        SetVehicleWheelSize(vehData.vehicle, vehData.w_size)
                    end
                    if GetVehicleWheelXOffset(vehData.vehicle, 0) ~= vehData.w_fl then
                        SetVehicleWheelXOffset(vehData.vehicle, 0, vehData.w_fl)
                        SetVehicleWheelXOffset(vehData.vehicle, 1, vehData.w_fr)
                        SetVehicleWheelXOffset(vehData.vehicle, 2, vehData.w_rl)
                        SetVehicleWheelXOffset(vehData.vehicle, 3, vehData.w_rr)
                    end
                    if GetVehicleWheelYRotation(vehData.vehicle, 0) ~= vehData.w_flro then
                        SetVehicleWheelYRotation(vehData.vehicle, 0, vehData.w_flro)
                        SetVehicleWheelYRotation(vehData.vehicle, 1, vehData.w_frro)
                        SetVehicleWheelYRotation(vehData.vehicle, 2, vehData.w_rlro)
                        SetVehicleWheelYRotation(vehData.vehicle, 3, vehData.w_rrro)
                    end
                end
            end
        else
            if isMenuShowing then
                local plyPed = PlayerPedId()
                local plyVeh = GetVehiclePedIsIn(plyPed, false)

                SetVehicleWheelWidth(plyVeh, currentFitmentsToSet.width)
                SetVehicleWheelSize(plyVeh, currentFitmentsToSet.size)
                SetVehicleWheelXOffset(plyVeh, 0, currentFitmentsToSet.fl)
                SetVehicleWheelXOffset(plyVeh, 1, currentFitmentsToSet.fr)
                SetVehicleWheelXOffset(plyVeh, 2, currentFitmentsToSet.rl)
                SetVehicleWheelXOffset(plyVeh, 3, currentFitmentsToSet.rr)
                SetVehicleWheelYRotation(plyVeh, 0, currentFitmentsToSet.flro)
                SetVehicleWheelYRotation(plyVeh, 1, currentFitmentsToSet.frro)
                SetVehicleWheelYRotation(plyVeh, 2, currentFitmentsToSet.rlro)
                SetVehicleWheelYRotation(plyVeh, 3, currentFitmentsToSet.rrro)
            end
        end
        Wait(0)
    end
end)

CreateThread(function()
    while true do
        if performVehicleCheck then
            checkVehicleFitment()
        end

        Wait(cfg_scanVehicleTimer)
    end
end)

AddEventHandler("qb-polyzone:enter", function(zone, data)
    if not validZones[zone] then return end
    suanki_zone = zone

    CreateThread(function()
        local plyPed = PlayerPedId()
        local Player = QBCore.Functions.GetPlayerData()
        local PlayerJob = Player.job
        local onDuty = Player.job.onduty
        inZone = true
        local isWheelFitmentInUse = false
        QBCore.Functions.TriggerCallback('qb-wheelfitment_sv:getIsWheelFitmentInUse', function(data)
            isWheelFitmentInUse = data
            while inZone do
                if IsPedInAnyVehicle(plyPed, false) and not isWheelFitmentInUse then
                    if not isMenuShowing then
                        if PlayerJob.name == 'tuner' and PlayerJob.grade.level == 4 and onDuty then
                            local plyPos = GetEntityCoords(plyPed, false)
                            local coords = cfg_wheelFitmentPos[zone].coords
                            local heading = cfg_wheelFitmentPos[zone].heading
                            if isNear(plyPos, coords, 2.0) then
                                if IsControlJustReleased(1, 38) then -- Key: E
                                    local slider_wWidth = {}
                                    local slider_wSize = {}
                                    local slider_wfFL = {}
                                    local slider_wfFR = {}
                                    local slider_wfRL = {}
                                    local slider_wfRR = {}
                                    local slider_wfFLRO = {}
                                    local slider_wfFRRO = {}
                                    local slider_wfRLRO = {}
                                    local slider_wfRRRO = {}
                                    local sliderStartPos = {}
                                    local plyVeh = GetVehiclePedIsIn(plyPed, false)

                                    performVehicleCheck = false

                                    SetEntityCoords(plyVeh, coords)
                                    SetEntityHeading(plyVeh, heading)
                                    FreezeEntityPosition(plyVeh, true)
                                    SetEntityCollision(plyVeh, false, true)

                                    TriggerServerEvent("bu-orospu-zonelari-kaydet", zone, true)

                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wWidth[#slider_wWidth + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelWidth(plyVeh), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wWidth
                                        end
                                    end

                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wSize[#slider_wSize + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelSize(plyVeh), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wSize
                                        end
                                    end

                                    for i = 0.0, -1.56, -0.01 do
                                        slider_wfFL[#slider_wfFL + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfFL
                                        end
                                    end

                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wfFR[#slider_wfFR + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfFR
                                        end
                                    end

                                    for i = 0.0, -1.56, -0.01 do
                                        slider_wfRL[#slider_wfRL + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfRL
                                        end
                                    end

                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wfRR[#slider_wfRR + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfRR
                                        end
                                    end

                                    for i = 0.0, -1.56, -0.01 do
                                        slider_wfFLRO[#slider_wfFLRO + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelYRotation(plyVeh, 0), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfFLRO
                                        end
                                    end

                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wfFRRO[#slider_wfFRRO + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelYRotation(plyVeh, 1), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfFRRO
                                        end
                                    end

                                    for i = 0.0, -1.56, -0.01 do
                                        slider_wfRLRO[#slider_wfRLRO + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelYRotation(plyVeh, 2), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfRLRO
                                        end
                                    end

                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wfRRRO[#slider_wfRRRO + 1] = roundNum(i, 2)

                                        if math.abs(i - roundNum(GetVehicleWheelYRotation(plyVeh, 3), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfRRRO
                                        end
                                    end

                                    currentFitmentsToSet.width = GetVehicleWheelWidth(plyVeh)
                                    currentFitmentsToSet.size = GetVehicleWheelSize(plyVeh)
                                    currentFitmentsToSet.fl = GetVehicleWheelXOffset(plyVeh, 0)
                                    currentFitmentsToSet.fr = GetVehicleWheelXOffset(plyVeh, 1)
                                    currentFitmentsToSet.rl = GetVehicleWheelXOffset(plyVeh, 2)
                                    currentFitmentsToSet.rr = GetVehicleWheelXOffset(plyVeh, 3)
                                    currentFitmentsToSet.flro = GetVehicleWheelYRotation(plyVeh, 0)
                                    currentFitmentsToSet.frro = GetVehicleWheelYRotation(plyVeh, 1)
                                    currentFitmentsToSet.rlro = GetVehicleWheelYRotation(plyVeh, 2)
                                    currentFitmentsToSet.rrro = GetVehicleWheelYRotation(plyVeh, 3)
                                    checkVehicleFitment()

                                    DisplayMenu(true, slider_wWidth, slider_wSize, slider_wfFL, slider_wfFR, slider_wfRL, slider_wfRR, slider_wfFLRO, slider_wfFRRO, slider_wfRLRO, slider_wfRRRO, sliderStartPos)
                                end
                            end
                        end
                    end
                end
                Wait(0)
            end
        end, zone)
    end)
end)

AddEventHandler("qb-polyzone:exit", function(zone)
    suanki_zone = nil
    if not validZones[zone] then return end
    inZone = false
end)
-- #[Event Handlers]#--
RegisterNetEvent("qb-wheelfitment_cl:applySavedWheelFitment", function(wheelFitments, plyVeh)
    performVehicleCheck = false

    SetVehicleWheelWidth(plyVeh, wheelFitments.width)
    SetVehicleWheelSize(plyVeh, wheelFitments.size)
    SetVehicleWheelXOffset(plyVeh, 0, wheelFitments.fl)
    SetVehicleWheelXOffset(plyVeh, 1, wheelFitments.fr)
    SetVehicleWheelXOffset(plyVeh, 2, wheelFitments.rl)
    SetVehicleWheelXOffset(plyVeh, 3, wheelFitments.rr)
    SetVehicleWheelYRotation(plyVeh, 0, wheelFitments.flro)
    SetVehicleWheelYRotation(plyVeh, 1, wheelFitments.frro)
    SetVehicleWheelYRotation(plyVeh, 2, wheelFitments.rlro)
    SetVehicleWheelYRotation(plyVeh, 3, wheelFitments.rrro)

    if not DecorExistOn(plyVeh, "qb-wheelfitment_applied") then
        DecorSetBool(plyVeh, "qb-wheelfitment_applied", true)
    end

    DecorSetFloat(plyVeh, "qb-wheelfitment_w_width", wheelFitments.width)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_size", wheelFitments.size)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_fl", wheelFitments.fl)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_fr", wheelFitments.fr)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_rl", wheelFitments.rl)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_rr", wheelFitments.rr)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_flro", wheelFitments.flro)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_frro", wheelFitments.frro)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_rlro", wheelFitments.rlro)
    DecorSetFloat(plyVeh, "qb-wheelfitment_w_rrro", wheelFitments.rrro)

    performVehicleCheck = true
    checkVehicleFitment()
end)

RegisterNetEvent("qb-wheelfitment_cl:forceMenuClose", function()
    if isMenuShowing then
        local plyPed = PlayerPedId()
        local plyVeh = GetVehiclePedIsIn(plyPed, false)

        if plyVeh ~= 0 or plyVeh ~= nil then
            -- SetEntityCoords(plyVeh, cfg_wheelFitmentPos)
            -- SetEntityHeading(plyVeh, cfg_wheelFitmentHeading)
            FreezeEntityPosition(plyVeh, false)
            SetEntityCollision(plyVeh, true, true)
        end
    end

    TriggerServerEvent("bu-orospu-zonelari-kaydet", suanki_zone, false)
    SyncWheelFitment()
    DisplayMenu(false)
end)

RegisterNetEvent("qb-wheelfitment_cl:SaveClose", function()
    SyncWheelFitment1()
end)

RegisterCommand("leavefitment", function()
    TriggerEvent("qb-wheelfitment_cl:forceMenuClose")
end)