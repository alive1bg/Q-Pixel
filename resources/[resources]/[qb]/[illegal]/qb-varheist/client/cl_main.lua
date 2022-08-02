QBCore = exports['qb-core']:GetCoreObject()

local helmet = false
local isReviving = false
connected = false
local varGuardModels = {
    's_m_y_blackops_01',
    's_m_y_marine_03',
    's_m_y_blackops_03',
    's_m_m_marine_01'
}

VarPoly = PolyZone:Create({
    vector2(2358.8073730469, 2951.3486328125),
    vector2(2359.1591796875, 2890.0095214844),
    vector2(2238.3586425781, 2887.0358886719),
    vector2(2168.5622558594, 2901.3996582031),
    vector2(2095.4116210938, 2888.84765625),
    vector2(1977.7425537109, 2889.7995605469),
    vector2(1977.3488769531, 2953.0361328125),
    vector2(2099.07421875, 2954.0571289062),
    vector2(2168.8854980469, 2939.3120117188),
    vector2(2237.1203613281, 2951.5830078125),
    vector2(2358.5131835938, 2953.880859375)
    }, {
    name='varenvironment',
    minZ = -85.80,
    maxZ = -78.42
})

ToggleVarConnect = function(index)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
            if helmet then
                connected = not connected
                if connected then
                    FreezeEntityPosition(PlayerPedId(), true)
                else
                    FreezeEntityPosition(PlayerPedId(), false)
                end
                TriggerServerEvent('qb-varheist:server:ConnectDock', index, connected)
            else
                QBCore.Functions.Notify("First equip your VAR Helmet!", "error", 2500)
            end
        else
            QBCore.Functions.Notify("You don't have a VAR Helmet..", "error", 2500)
        end
    end, 'var_helmet')
end

LowerHack = function(index)
    if not Config.LowerHacks[index].busy then
        -- Set Busy
        TriggerServerEvent('qb-varheist:server:SetLowerBusy', index, true)
        local animDict = 'anim@heists@prison_heiststation@cop_reactions'
        local anim = 'cop_b_idle'
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, animDict, anim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
        exports['varhack']:OpenHackingGame(function(success)
            if success then
                PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
                TriggerServerEvent('qb-varheist:server:LowerHackResult', index)
            end
            StopAnimTask(ped, animDict, anim, 1.0)
            -- Unset Busy
            TriggerServerEvent('qb-varheist:server:SetLowerBusy', index, false)
        end, Config.LowerHacks[index].difficulty, 7)
    end
end

RegisterNetEvent('qb-varheist:client:VarEnter', function()
    local ped = PlayerPedId()
    Wait(500)
    DoScreenFadeOut(250)
    Wait(250)
    SetEntityCoords(ped, 2154.9, 2921.1, -82.00)
    SetEntityHeading(ped, 268.47)
    FreezeEntityPosition(ped, false)
    Wait(250)
    DoScreenFadeIn(250)
    TriggerServerEvent('qb-varheist:server:EnterVar')
    TriggerEvent('qb-varheist:enter') -- use this event in other scripts
    -- Qb-Target for Guards
    exports['qb-target']:AddTargetModel(varGuardModels, {
        options = {
            {
                action = function(entity)
                    RobGuard(entity)
                end,
                icon = 'fas fa-hand-holding',
                label = 'Grab Gear',
                canInteract = function(entity)
                    if not IsPedAPlayer(entity) then 
                        return IsEntityDead(entity)
                    end
                end, 
            },
        },
        distance = 1.5,
    })
end)

RegisterNetEvent('qb-varheist:client:VarExit', function()
    Wait(500)
    DoScreenFadeOut(500)
    Wait(250)
    SetArtificialLightsState(false)
    TriggerEvent('qb-weathersync:client:EnableSync')
    SetEntityCoords(PlayerPedId(), -1054.19, -232.91, 43.12)
    SetEntityHeading(PlayerPedId(), 116.46)
    Wait(250)
    DoScreenFadeIn(1000)
    TriggerEvent('qb-varheist:leave') -- use this event in other scripts
end)

RegisterNetEvent('qb-varheist:client:UseHelmet', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    if not VarPoly:isPointInside(GetEntityCoords(ped)) then
        helmet = not helmet
        if model == `mp_m_freemode_01` then -- male
            if helmet then
                while not HasAnimDictLoaded("mp_masks@standard_car@ds@") do RequestAnimDict("mp_masks@standard_car@ds@") Wait(10) end
                TaskPlayAnim(ped, "mp_masks@standard_car@ds@", "put_on_mask", 3.0, 3.0, 600, 51, 0, false, false, false)
                Wait(500)
                SetPedPropIndex(ped, 0, 70, 0, true)
            else
                while not HasAnimDictLoaded("missheist_agency2ahelmet") do RequestAnimDict("missheist_agency2ahelmet") Wait(10) end
                TaskPlayAnim(ped, "missheist_agency2ahelmet", "take_off_helmet_stand", 3.0, 3.0, 1200, 51, 0, false, false, false)
                Wait(700)
                ClearPedProp(ped, 0)
            end
        else -- female
            if helmet then
                while not HasAnimDictLoaded("mp_masks@standard_car@ds@") do RequestAnimDict("mp_masks@standard_car@ds@") Wait(10) end
                TaskPlayAnim(ped, "mp_masks@standard_car@ds@", "put_on_mask", 3.0, 3.0, 600, 51, 0, false, false, false)
                Wait(500)
                SetPedPropIndex(ped, 0, 70, 0, true)
            else
                while not HasAnimDictLoaded("missheist_agency2ahelmet") do RequestAnimDict("missheist_agency2ahelmet") Wait(10) end
                TaskPlayAnim(ped, "missheist_agency2ahelmet", "take_off_helmet_stand", 3.0, 3.0, 1200, 51, 0, false, false, false)
                Wait(700)
                ClearPedProp(ped, 0)
            end
        end
    else
        QBCore.Functions.Notify("You cannot remove your helmet inside the VAR Environment..", 'error', 2500)
    end
end)

RegisterNetEvent('qb-varheist:client:ConnectDock', function(dock, bool)
    Config.Docks[dock] = bool
end)

RegisterNetEvent('qb-varheist:client:InstructionMail', function()
    Wait(3000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Lionh34rt",
        subject = "VAR Environment",
        message = "You have entered a VAR environment. You may exit at any time by typing 'var_exit' in your F8 console. Only one terminal can be used at the same time. Contraband will be confiscated upon leaving. You have three hours to complete the VAR Heist.",
        button = {}
    })
end)

RegisterNetEvent('qb-varheist:client:UseMedKit', function()
    if not isReviving and VarPoly:isPointInside(GetEntityCoords(PlayerPedId())) then
        local player, distance = QBCore.Functions.GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            isReviving = true
            QBCore.Functions.Progressbar('var_revive', 'Reviving person..', 1000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = healAnimDict,
                anim = healAnim,
                flags = 16,
            }, {}, {}, function() -- Done
                -- REMOVE
                TriggerServerEvent('QBCore:Server:RemoveItem', 'var_medkit', 1)
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['var_medkit'], 'remove')
                -- REVIVE
                TriggerServerEvent('hospital:server:RevivePlayer', playerId)
                StopAnimTask(PlayerPedId(), healAnimDict, 'exit', 1.0)
                isReviving = false
            end, function() -- Cancel
                isReviving = false
                StopAnimTask(PlayerPedId(), healAnimDict, 'exit', 1.0)
            end)
        else
            QBCore.Functions.Notify('No one nearby!', 'error')
        end
    end
end)

RegisterNetEvent('qb-varheist:client:StartHack', function()
    if not Config.CurrentHack.busy then
        -- Set Busy
        TriggerServerEvent('qb-varheist:server:SetBusy', true)
        local animDict = 'anim@heists@prison_heiststation@cop_reactions'
        local anim = 'cop_b_idle'
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, animDict, anim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
        exports['varhack']:OpenHackingGame(function(success)
            if success then PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1) end
            TriggerServerEvent('qb-varheist:server:HackResult', success)
            StopAnimTask(ped, animDict, anim, 1.0)
            -- Set Not Busy
            TriggerServerEvent('qb-varheist:server:SetBusy', false)
        end, Config.Hacks[Config.CurrentHack.id], 9)
    else
        QBCore.Functions.Notify('Only one person can use a terminal at the same time..', 'error', 2500)
    end
end)

RegisterNetEvent('qb-varheist:client:SetBusy', function(bool)
    Config.CurrentHack.busy = bool
end)

RegisterNetEvent('qb-varheist:client:SetLowerBusy', function(index, bool)
    Config.LowerHacks[index].busy = bool
end)

RegisterNetEvent('qb-varheist:client:EnableServer', function(server)
    exports["qb-target"]:AddCircleZone("VARServer", Config.Servers[server].coords, 0.5, {
        name = "VARServer",
        useZ = false,
        debugPoly = false
        }, {
            options = {
            {
                type = "client",
                event = "qb-varheist:client:InsertServer",
                icon = "fas fa-user-secret",
                label = "Insert USB Panel Reader"
            }
        },
        distance = 1.5
    })
end)

RegisterNetEvent('qb-varheist:client:InsertServer', function()
    RequestAnimDict('amb@prop_human_atm@male@enter')
    while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do Wait(10) end
    if HasAnimDictLoaded('amb@prop_human_atm@male@enter') then
        TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end
    QBCore.Functions.Progressbar('var_server', 'Configuring Server Panel', 20000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-varheist:server:GetPassword')
        RequestAnimDict('amb@prop_human_atm@male@exit')
        while not HasAnimDictLoaded('amb@prop_human_atm@male@exit') do Wait(10) end
        if HasAnimDictLoaded('amb@prop_human_atm@male@exit') then
            TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@exit', "exit", 1.0,-1.0, 3000, 1, 1, true, true, true)
        end
    end, function() -- Cancel
        QBCore.Functions.Notify('Canceled', 'error', 2500)
        RequestAnimDict('amb@prop_human_atm@male@exit')
        while not HasAnimDictLoaded('amb@prop_human_atm@male@exit') do Wait(10) end
        if HasAnimDictLoaded('amb@prop_human_atm@male@exit') then
            TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@exit', "exit", 1.0,-1.0, 3000, 1, 1, true, true, true)
        end
    end)
end)

RegisterNetEvent('qb-varheist:client:RemoveServerTarget', function()
    exports['qb-target']:RemoveZone("VARServer")
end)

RegisterNetEvent('qb-varheist:client:SetHacked', function()
    Config.CurrentHack.hacked = true
end)

RegisterNetEvent('qb-varheist:client:EnterPassword', function()
    if not Config.CurrentHack.busy then
        -- Set Busy
        TriggerServerEvent('qb-varheist:server:SetBusy', true)
        local animDict = 'anim@heists@prison_heiststation@cop_reactions'
        local anim = 'cop_b_idle'
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, animDict, anim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
        local keyboard, input = exports["var-password"]:Keyboard({
            header = "Password", 
            rows = {""}
        })
        if keyboard then
            QBCore.Functions.TriggerCallback('qb-varheist:server:EnterPassword',function(correct)
                if correct then
                    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
                end
            end, input)
        end
        StopAnimTask(ped, animDict, anim, 1.0)
        -- Unset Busy
        TriggerServerEvent('qb-varheist:server:SetBusy', false)
    else
        QBCore.Functions.Notify('Only one person can use a terminal at the same time..', 'error', 2500)
    end
end)

RegisterNetEvent('qb-varheist:client:SetPassword', function(bool)
    Config.CurrentHack.pasword = bool
    if bool then
        Config.CurrentHack.id = Config.CurrentHack.id + 1
        Config.CurrentHack.hacked = false
        Config.CurrentHack.password = false
        if Config.CurrentHack.id == 11 then
            Config.CurrentHack.password = true
        end
    end
end)

RegisterNetEvent('qb-varheist:client:LowerHackResult', function(index)
    Config.LowerHacks[index].hacked = true
end)

RegisterNetEvent('qb-varheist:client:Shutdown', function()
    QBCore.Functions.Notify('Shutting Down VAR Environment', 'error', 5000)
    exports['qb-target']:RemoveTargetModel(varGuardModels, 'Test')
    exports['qb-target']:RemoveZone("VARServer")
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Lionh34rt",
        subject = "VAR Emergency Procedure",
        message = "Due to unforseen circumstances, the VAR environment is shutting down. Please vacate the system. In 3 minutes, you will automatically be vacated.",
        button = {}
    })
    TriggerEvent('qb-weathersync:client:DisableSync')
    Wait(5000) -- Time until blackout after warning
    SetArtificialLightsState(true)
end)

RegisterNetEvent('qb-varheist:client:ResetVarHeist', function()
    Config.CurrentHack.id = 1
    Config.CurrentHack.busy = false
    Config.CurrentHack.hacked = false
    Config.CurrentHack.password = false
    for i=1, #Config.Docks, 1 do
        Config.Docks[i] = false
    end
    for j=1, #Config.LowerHacks, 1 do
        Config.LowerHacks[j].hacked = false
    end
    connected = false
    isReviving = false
end)