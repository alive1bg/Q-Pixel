-- Variables

local alcoholCount = 0
local onWeed = false
local ParachuteEquiped = false
local currentVest = nil
local currentVestTexture = nil

-- Functions

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function EquipParachuteAnim()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function HealOxy()
    if not healing then
        healing = true
    else
        return
    end

    local count = 9
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 6)
    end
    healing = false
end

function MethBagEffect()
    local startStamina = 8
    TrevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            TrevorEffect()
        end
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function TrevorEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Wait(3000)
	StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
	StopScreenEffect("DrugsTrevorClownsFight")
	StopScreenEffect("DrugsTrevorClownsFightIn")
	StopScreenEffect("DrugsTrevorClownsFightOut")
end

function EcstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
end

function JointEffect() -- uncommented joint effect for new useJoint
    if not onWeed then
        local RelieveOdd = math.random(35, 45)
        onWeed = true
        local weedTime = Config.JointEffectTime
        CreateThread(function()
            while onWeed do
                SetPlayerHealthRechargeMultiplier(PlayerId(), 1.8)
                Wait(1000)
                weedTime = weedTime - 1
                if weedTime == RelieveOdd then
                    TriggerServerEvent('hud:Server:RelieveStress', math.random(14, 18))
                end
                if weedTime <= 0 then
                    onWeed = false
                end
            end
        end)
    end
end

function CrackBaggyEffect()
    local startStamina = 8
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 60 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function CokeBaggyEffect()
    local startStamina = 20
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 10 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

function AddArmor()
    local a = 15
    while a > 0 do
        Wait(math.random(750, 1150))
        a = a - 1
        AddArmourToPed(PlayerPedId(), 1)
    end
end

function AddHealth()
    if not healing then
        healing = true
    else
        return
    end

    local count = 30
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1)
    end
    healing = false
end

function AdrenEffect()
    local startStamina = 8
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.29)
    while startStamina > 0 do 
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            RestorePlayerStamina(PlayerId(), 0.9)
        end
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function Armour(EffectTime, Multiplier) -- added with useJoint
    while EffectTime > 0 do
      Wait(1000)
      EffectTime = EffectTime - 1
        local armor = GetPedArmour(PlayerPedId())
        SetPedArmour(PlayerPedId(), math.ceil(armor + Multiplier))
    end
    EffectTime = 0
end


-- Events
RegisterNetEvent('consumables:client:Eat', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkAlcohol', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("snort_coke", "Drinking liquor..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            TriggerEvent('consumables:client:setPedDrunk', 1.0)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
            TriggerEvent('consumables:client:setPedDrunk', 3.0)
        end

    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:smokeCigarette", function(ItemData)
    local taskdep = nil
    local smokeanim = "smoke2"
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        taskdep = "WORLD_HUMAN_SMOKING"
    end
    LocalPlayer.state:set("inv_busy", true, true)
    QBCore.Functions.Progressbar("smoke_cigarette", "Lighting Cigarette..", 13000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    },  
    {
        task = taskdep,      
    }, {}, {}, function() -- Done 
        LocalPlayer.state:set("inv_busy", false, true)
        if math.random(1, 3) == 1 then
            smokeanim = "smoke3"
        elseif math.random(1, 3) == 2 then
            smokeanim = "smoke4"
        end
        ClearPedTasksImmediately(PlayerPedId())
        TriggerEvent('animations:client:EmoteCommandStart', {smokeanim})
        TriggerServerEvent('smoke:cigarette', ItemData)
    end)
    end, function() -- Cancel
        ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('consumables:client:Cokebaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("snort_coke", "Quick sniff..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "cokebaggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cokebaggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:Crackbaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("snort_coke", "Smoking crack..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "crack_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crack_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy', function()
    QBCore.Functions.Progressbar("use_ecstasy", "Pops Pills", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "xtcbaggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["xtcbaggy"], "remove")
        EcstasyEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Failed", "error")
    end)
end)

RegisterNetEvent('consumables:client:oxy', function()
    QBCore.Functions.Progressbar("use_oxy", "Healing", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "oxy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oxy"], "remove")
        ClearPedBloodDamage(PlayerPedId())
		HealOxy()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:meth', function()
    QBCore.Functions.Progressbar("snort_meth", "Smoking Ass Meth", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "meth", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meth"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
		TriggerEvent("evidence:client:SetStatus", "agitated", 300)
        MethBagEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
	end)
end)

RegisterNetEvent('consumables:client:UseJoint', function() -- new useJoint effect
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(item)
        if item then
            QBCore.Functions.Progressbar("smoke_joint", "Lighting a blunt..", 9500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "remove")
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    TriggerEvent('animations:client:EmoteCommandStart', {"weed"})
                else
                    TriggerEvent('animations:client:EmoteCommandStart', {"weed"})
                end
                JointEffect()
                Armour(10,2.5)
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 3000)
            end, function() -- Cancel
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You don't have a lighter", "error")
        end
    end, "lighter")
end)

-- RegisterNetEvent('consumables:client:UseJoint', function() -- old use joint event
--     QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
-- 		disableMouse = false,
-- 		disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "remove")
--         if IsPedInAnyVehicle(PlayerPedId(), false) then
--             TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
--         else
--             TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
--         end
--         TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
--         TriggerEvent('animations:client:SmokeWeed')
--     end)
-- end)

RegisterNetEvent("consumables:client:stopsign")
AddEventHandler("consumables:client:stopsign", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"stopsign"})
end)

RegisterNetEvent('consumables:client:UseParachute', function()
    EquipParachuteAnim()
    QBCore.Functions.Progressbar("use_parachute", "parachute using..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = PlayerPedId()
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "remove")
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false)
        local ParachuteData = {
            outfitData = {
                ["bag"]   = { item = 7, texture = 0},  -- Adding Parachute Clothing
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', ParachuteData)
        ParachuteEquiped = true
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end)
end)

RegisterNetEvent('consumables:client:ResetParachute', function()
    if ParachuteEquiped then
        EquipParachuteAnim()
        QBCore.Functions.Progressbar("reset_parachute", "Packing parachute..", 40000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = PlayerPedId()
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "add")
            local ParachuteRemoveData = {
                outfitData = {
                    ["bag"] = { item = 0, texture = 0} -- Removing Parachute Clothing
                }
            }
            TriggerEvent('qb-clothing:client:loadOutfit', ParachuteRemoveData)
            TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            TriggerServerEvent("qb-smallpenis:server:AddParachute")
            ParachuteEquiped = false
        end)
    else
        QBCore.Functions.Notify("You dont have a parachute!", "error")
    end
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    if GetPedArmour(PlayerPedId()) >= 100 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    QBCore.Functions.Progressbar("use_armor", "Putting on the body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["armor"], "remove")
        --TriggerServerEvent('hospital:server:SetArmor', 75)
        SetPedArmour(PlayerPedId(), GetPedArmour(PlayerPedId()) + 50)
        TriggerServerEvent("QBCore:Server:RemoveItem", "armor", 1)
        --SetPedArmour(PlayerPedId(), 75)
    end)
end)

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Progressbar("use_heavyarmor", "Putting on body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        -- if PlayerData.charinfo.gender == 0 then
        --     currentVest = GetPedDrawableVariation(ped, 9)
        --     currentVestTexture = GetPedTextureVariation(ped, 9)
        --     if GetPedDrawableVariation(ped, 9) == 7 then
        --         SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
        --     else
        --         SetPedComponentVariation(ped, 9, 5, 2, 2) -- Blue
        --     end
        -- else
        --     currentVest = GetPedDrawableVariation(ped, 30)
        --     currentVestTexture = GetPedTextureVariation(ped, 30)
        --     SetPedComponentVariation(ped, 9, 30, 0, 2)
        -- end
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "remove")
        TriggerServerEvent("QBCore:Server:RemoveItem", "heavyarmor", 1)
        --SetPedArmour(ped, 100)
        SetPedArmour(PlayerPedId(), GetPedArmour(PlayerPedId()) + 100)
    end)
end)

RegisterNetEvent('consumables:client:ResetArmor', function()
    local ped = PlayerPedId()
    if currentVest ~= nil and currentVestTexture ~= nil then
        QBCore.Functions.Progressbar("remove_armor", "Removing the body armour..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 9, currentVest, currentVestTexture, 2)
            SetPedArmour(ped, 0)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "add")
            TriggerServerEvent("QBCore:Server:AddItem", "heavyarmor", 1)
        end)
    else
        QBCore.Functions.Notify("You\'re not wearing a vest..", "error")
    end
end)

-- RegisterNetEvent('consumables:client:UseRedSmoke', function()
--     if ParachuteEquiped then
--         local ped = PlayerPedId()
--         SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
--         SetPlayerCanLeaveParachuteSmokeTrail(ped, true)
--         TriggerEvent("inventory:client:Itembox", QBCore.Shared.Items["smoketrailred"], "remove")
--     else
--         QBCore.Functions.Notify("You need to have a paracute to activate smoke!", "error")
--     end
-- end)

--Threads

RegisterNetEvent("consumables:client:UseiFak", function() -- IFAK EVENT
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("use_bandage", "Applying iFak", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_clipboard@male@idle_a",
        anim = "idle_c",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "ifak", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ifak"], "remove")
        TriggerServerEvent('hud:server:RelieveStress', 20)
        TriggerEvent("hospital:client:HealInjuries", "full")
        ResetPedMovementClipset(playerPed, 0.0)
        local health = GetEntityHealth(playerPed)
        local maxHealth = GetEntityMaxHealth(playerPed)
        local newHealth = health + 25
        if newHealth > maxHealth then
            SetEntityHealth(playerPed, maxHealth)
        else
            SetEntityHealth(playerPed, newHealth)
        end
    end, function() -- Cancel
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent('consumables:client:adrenshot', function() -- adrenaline shot
    QBCore.Functions.Progressbar("use_adrenshot", "Taking Adrenaline", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "adrenshot", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["adrenshot"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        AdrenEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

CreateThread(function()
    while true do
        Wait(10)
        if alcoholCount > 0 then
            Wait(1000 * 60 * 15)
            alcoholCount = alcoholCount - 1
        else
            Wait(2000)
        end
    end
end)


-- uwu items start
RegisterNetEvent("consumables:client:uwububbleteablueberry", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"bubbletea"})
    action = true
    QBCore.Functions.Progressbar("drink_something", "Popping some Bubble Tea..", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(40, 85))
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwumisosoup", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"misosoup"})
    action = true
    QBCore.Functions.Progressbar("drink_something", "Supping some Soup..", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(40, 85))
        HealOxy()
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwubudhabowl", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"budhabowl"})
    action = true
    QBCore.Functions.Progressbar("eat_something", "Banging a bowl of goodness..", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(40, 85))
        HealOxy()
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwuvanillasandy", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    action = true
    QBCore.Functions.Progressbar("eat_something", "uWu Icecream Mmm..", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(40, 65))
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwuchocsandy", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    action = true
    QBCore.Functions.Progressbar("eat_something", "uWu Icecream Mmm..", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(40, 65))
        action = false
    end)
end)
-- uwu items end


-- slushy
RegisterNetEvent('consumables:client:slushy', function()
    Wait(1500)
    local playerPed = PlayerPedId()
    local prop_name = 'prop_cs_bs_cup'
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(playerPed, 28422)

    if not action then
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    else
        DeleteObject(prop)
    end

    action = true
    QBCore.Functions.Progressbar("drink_something", "Drinking slushy...", 3500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_drinking@coffee@male@idle_a",
        anim = "idle_c",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["slushy"], "remove", 1)   
        action = false
        TriggerServerEvent('hud:server:RelieveStress', math.random(10, 15))
        AddArmor(1, 5)
        local health = GetEntityHealth(playerPed)
        local maxHealth = GetEntityMaxHealth(playerPed)
        local newHealth = health + 25
        if newHealth > maxHealth then
            SetEntityHealth(playerPed, maxHealth)
        else
            SetEntityHealth(playerPed, newHealth)
        end
        DeleteObject(prop)
    end, function() -- Cancel
        StopAnimTask(ped, "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
        DeleteObject(prop)
    end)
end)


RegisterNetEvent('consumables:client:setPedDrunk', function(shake) -- get drunk/tipsy from drinking alcohol
    local playerPed = PlayerPedId()
        Wait(650)
        SetPedMotionBlur(playerPed, true)
        SetTimecycleModifier("spectator3")
        SetPedMovementClipset(playerPed, "move_m@hobo@a", true)
        SetPedIsDrunk(playerPed, true)
        ShakeGameplayCam("DRUNK_SHAKE", shake)
        Wait(60000)
        SetPedMoveRateOverride(playerPed, 1.0)
        SetRunSprintMultiplierForPlayer(playerPed, 1.0)
        SetPedIsDrunk(playerPed, false)        
        SetPedMotionBlur(playerPed, false)
        ResetPedMovementClipset(playerPed)
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
    end)
