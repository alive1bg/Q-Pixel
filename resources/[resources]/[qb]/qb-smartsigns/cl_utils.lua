Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for k, v in pairs(config.signs) do
            local distance = #(v.sign[1] - pedCoords)
            if distance < config.main.accessPointDistance then
                nearAccessPoint(k, v, ped, pedCoords)
            end
            if distance <= config.main.loadInDistance and not v.loaded then
                if config.main.developerMode then
                    print("[Smart Signs] - Loaded Sign ID: "..k)
                end
                TriggerEvent('loadSign', k)
            elseif distance > config.main.loadInDistance and v.loaded then
                if config.main.developerMode then
                    print("[Smart Signs] - Unloaded Sign ID: "..k)
                end
                TriggerEvent('unloadSign', k)
            end
        end
    end
end)

RegisterNetEvent('signs:client:hello')
AddEventHandler('signs:client:hello' , function(k, v, ped, pedCoords)
    if config.main.developerMode then
        print("[Smart Signs] - Access point control pressed")
    end
    if config.main.animation.enabled then
        if config.main.developerMode then
            print("[Smart Signs] - Animation Enabled - Starting")
        end
        local boxPosition = GetOffsetFromEntityInWorldCoords(v.signProp, -1.55, 0.0, 0.0)
        SetEntityCoords(ped, boxPosition.x, boxPosition.y, boxPosition.z, true, true, true, false)
        SetEntityHeading(ped, GetEntityHeading(v.signProp) - 90.0)
        if config.main.developerMode then
            print("[Smart Signs] - Ped Coords Set")
        end
        RequestAnimDict(config.main.animation.dict)
        if config.main.developerMode then
            print("[Smart Signs] - Requesting Animation Dictionary: "..config.main.animation.dict)
        end
        while not HasAnimDictLoaded(config.main.animation.dict) do 
            if config.main.developerMode then
                print("[Smart Signs] - Loading Animation Dictionary: "..config.main.animation.dict)
            end
            Wait(0) 
        end
        if config.main.developerMode then
            print("[Smart Signs] - Loaded Animation Dictionary: "..config.main.animation.dict)
        end
        if config.main.developerMode then
            print("[Smart Signs] - Playing Animation Name: "..config.main.animation.name)
        end
        TaskPlayAnim(ped, config.main.animation.dict, config.main.animation.name, 8.0, -8.0, -1, 0, 0.0, 0, 0, 0)
    end
    local inputs = {}
    for i = 1, 3 do 
        if config.main.developerMode then
            print("[Smart Signs] - Starting user input for line: "..i)
        end
        inputs[i] = getInput(i)
        if config.main.developerMode then
            print("[Smart Signs] - User input returned: "..tostring(inputs[i]))
        end
    end
    local streetHash = GetStreetNameAtCoord(pedCoords.x, pedCoords.y, pedCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    if config.main.developerMode then
        print("[Smart Signs] - Street Hash: "..tostring(streetHash))
        print("[Smart Signs] - Street Name: "..tostring(streetName))
    end
    if config.main.developerMode then
        print("[Smart Signs] - Data for Sign ID: "..k.." sent to server")
    end
    TriggerServerEvent("SmartSigns:updateSign", k, inputs, tostring(streetName))
    ClearPedTasks(ped)
    if config.main.soundEffect.enabled then
        PlaySoundFrontend(-1, config.main.soundEffect.name, config.main.soundEffect.dict)
        if config.main.developerMode then
            print("[Smart Signs] - Playing sound: Name: "..config.main.soundEffect.name.." - Dict: "..config.main.soundEffect.dict)
        end
    end
end)



function getInput(i)
    AddTextEntry('FMMC_MPM_NA', "Enter text for line " .. i)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Enter text for line" .. i, "", "", "", "", 14)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local input = GetOnscreenKeyboardResult()
        return string.lower(input)
    end
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local coords = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, x,y,z, 1)    
    local scale = (1 / distance ) * 20
    local fov = ( 1 / GetGameplayCamFov() ) * 100
    local scale = scale * fov
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function showNotification(message)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

if config.main.developerMode then
    RegisterCommand("newsign", function()
        RequestModel(config.main.signModelName)
        while not HasModelLoaded(config.main.signModelName) do Wait(0) end
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local signProp = CreateObject(config.main.signModelName, coords, true, false, false)
        while not DoesEntityExist(signProp) do Wait(0) end
        FreezeEntityPosition(signProp, true)
        SetEntityCoords(signProp, coords.x + config.main.signOffset[1], coords.y + config.main.signOffset[2], coords.z + config.main.signOffset[3], true, true, true, false)
        local heading = GetEntityHeading(ped)
        SetEntityHeading(signProp, ped)
        SetModelAsNoLongerNeeded(config.main.signModelName)

        local complete = false
        while not complete do
            local coords = GetEntityCoords(signProp)
            local heading = GetEntityHeading(signProp)
            if IsControlJustPressed(0, 207) then --page down
                SetEntityCoords(signProp, coords.x, coords.y, coords.z - 0.2)
            end
                
            if IsControlJustPressed(0, 208) then --page up
                SetEntityCoords(signProp, coords.x, coords.y, coords.z + 0.2)
            end


            if IsControlJustPressed(0, 173) then --arrow down
                SetEntityCoords(signProp, coords.x, coords.y - 0.2, coords.z)
            end

            if IsControlJustPressed(0, 172) then --arrow up
                SetEntityCoords(signProp, coords.x, coords.y + 0.2, coords.z)
            end

            if IsControlJustPressed(0, 174) then --arrow left
                SetEntityCoords(signProp, coords.x - 0.2, coords.y, coords.z)
            end

            if IsControlJustPressed(0, 175) then --arrow right
                SetEntityCoords(signProp, coords.x + 0.2, coords.y, coords.z)
            end

            if IsControlJustPressed(0, 29) then --b rotate left
                SetEntityHeading(signProp, heading - 2.0)
            end

            if IsControlJustPressed(0, 306) then --n rotate right
                SetEntityHeading(signProp, heading + 2.0)
            end

            if IsControlJustPressed(0, 191) then -- enter - finish
                complete = true
            end

            Wait(0)
        end

        local coords = GetEntityCoords(signProp)
        local heading = GetEntityHeading(signProp)
        local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        showNotification("~b~Coords~w~: {"..coords.x..", "..coords.y..", "..coords.z.."}")
        showNotification("~b~Heading~w~: "..heading)
    end, false)
end