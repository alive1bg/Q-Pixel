QBCore = exports['qb-core']:GetCoreObject()
debug = true

varActive = false
varPlayers = {}

local fails = 0
local password = nil
local upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local num = "0123456789"
local characterSet = upper..num
local passLength = 6

local contraband = { -- Add more items to be removed upon exiting the VAR Environment
    weapon_assaultrifle = true,
    weapon_appistol = true,
    weapon_microsmg = true,
    weapon_molotov = true,
    weapon_grenade = true,
    var_medkit = true,
    pistol_ammo = true,
    rifle_ammo = true,
    smg_ammo = true,
    armor = true,
    heavyarmor = true,
    bandage = true
}

getRandomVarPlayer = function()
    local temp = {}
    for playerId, state in pairs(varPlayers) do
        if state then -- true
            temp[#temp+1] = playerId
        end
    end
    return temp[math.random(#temp)]
end

local isVarEmpty = function()
    for k, v in pairs(varPlayers) do
        if v then
            return false
        end
    end
    return true
end

local confiscateContraband = function(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        local items = Player.PlayerData.items
        for k, v in pairs(items) do
            if contraband[v.name] then
                Player.Functions.RemoveItem(v.name, v.amount, k)
            end
        end
        if debug then
            print('^3[qb-varheist] ^5Confiscated Items from: '..GetPlayerName(Player.PlayerData.source)..'^7')
        end
        TriggerClientEvent('QBCore:Notify', playerId, 'Your contraband has been taken', 'error', 2500)
    end
end

local GeneratePassword = function()
    local string = ""
    for i = 1, passLength do
        local rand = math.random(#characterSet)
        string = string .. string.sub(characterSet, rand, rand)
    end
    if debug then
        print('^3[qb-varheist] ^5New Password: '..string..'^7')
    end
    return string
end

local ResetVar = function()
    if debug then
        print('^3[qb-varheist] ^5Resetting VAR Heist^7')
    end
    -- REMOVE ALL GUARDS
    RemoveGuards()
    -- RESET SERVER
    varActive = false
    varPlayers = {}
    fails = 0
    password = nil
    Config.CurrentHack.id = 1
    Config.CurrentHack.busy = false
    Config.CurrentHack.hacked = false
    Config.CurrentHack.password = false
    for i=1, #Config.Docks, 1 do
        Config.Docks[i] = false
    end
    for k=1, #Config.LowerHacks, 1 do
        Config.LowerHacks[k].hacked = false
    end
    -- RESET CLIENT
    TriggerClientEvent('qb-varheist:client:ResetVarHeist', -1)
end

local EndHeist = function()
    if debug then
        print('^3[qb-varheist] ^5Ending VAR Heist: Shutdown Warning^7')
    end
    for playerId, state in pairs(varPlayers) do
        if state then -- true
            TriggerClientEvent('qb-varheist:client:Shutdown', playerId)
        end
    end
    Wait(3*60*1000) -- Three minutes to complete all lower hacks
    if debug then
        print('^3[qb-varheist] ^5Ending VAR Heist: Remove all Players^7')
    end
    for playerId, state in pairs(varPlayers) do
        if state then -- true
            TriggerEvent('qb-varheist:server:VarExit', playerId)
            TriggerClientEvent('hospital:client:Revive', playerId)
        end
    end
    ResetVar()
end

local lowerHackCheck = function()
    if Config.LowerHacks[1].hacked and Config.LowerHacks[2].hacked and Config.LowerHacks[3].hacked and Config.LowerHacks[4].hacked then
        if debug then
            print('^3[qb-varheist] ^5All Lower Hacks are done^7')
        end
    end
end

AddEventHandler('playerDropped', function()
    local src = source
    if varPlayers[src] then
        varPlayers[src] = false
        if debug then
            print('^3[qb-varheist] ^5Removed '..src..' from VAR Players^7')
        end
        -- Create Log to alert admins for players carrying items from VAR
        local name = GetPlayerName(src)
        TriggerEvent('qb-log:server:CreateLog', 'varheist', 'Player Dropped', 'red', '**'..name..'** has left the server while inside the VAR Environment.')
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource ~= GetCurrentResourceName() then return end
    RemoveGuards()
end)

RegisterNetEvent('qb-varheist:server:ConnectDock', function(dock, bool)
    local src = source
    Config.Docks[dock] = bool
    TriggerClientEvent('qb-varheist:client:ConnectDock', -1, dock, bool)
    if bool then
        -- ADD TO VAR PLAYERS
        varPlayers[src] = true
        if debug then
            print('^3[qb-varheist] ^5Added '..src..' to VAR Players^7')
        end
    else
        -- REMOVE FROM VAR PLAYERS
        varPlayers[src] = false
        if debug then
            print('^3[qb-varheist] ^5Removed '..src..' from VAR Players^7')
        end
    end
end)

RegisterNetEvent('qb-varheist:server:VarExit', function(playerId)
    local src = playerId or source
    -- REMOVE FROM VAR PLAYERS
    varPlayers[src] = false
    if debug then
        print('^3[qb-varheist] ^5Removed '..src..' from VAR Players^7')
    end
    -- TELEPORT OUT
    TriggerClientEvent('qb-varheist:client:VarExit', src)
    if isVarEmpty() then
        if debug then
            print('^3[qb-varheist] ^5VAR Environment Empty^7')
        end
        -- RESET VAR
        ResetVar()
    end
    -- REMOVE ITEMS
    confiscateContraband(src)
end)

RegisterNetEvent('qb-varheist:server:StartVar', function()
    for playerId, state in pairs(varPlayers) do
        if state then -- true
            -- Enter Event
            TriggerClientEvent('qb-varheist:client:VarEnter', playerId)
            -- Instructions Email
            TriggerClientEvent('qb-varheist:client:InstructionMail', playerId)
        end
    end
    varActive = true
    if debug then
        print('^3[qb-varheist] ^5Starting VAR Heist^7')
    end
    Wait(10000) -- 10 seconds before all guards spawn
    SpawnGuards()
    CreateThread(function()
        Wait(3*60*60*1000) -- 3 hours time limit on heist
        if varActive then
            EndHeist()
        end
    end)
end)

RegisterNetEvent('qb-varheist:server:SetBusy', function(bool)
    Config.CurrentHack.busy = bool
    TriggerClientEvent('qb-varheist:client:SetBusy', -1, bool)
end)

RegisterNetEvent('qb-varheist:server:SetLowerBusy', function(index, bool)
    Config.LowerHacks[index].busy = bool
    TriggerClientEvent('qb-varheist:client:SetLowerBusy', -1, index, bool)
end)

RegisterNetEvent('qb-varheist:server:HackResult', function(success)
    local src = source
    if success then
        -- RESET FAILS
        fails = 0
        -- SET SERVER
        local server = math.random(#Config.Servers)
        if debug then
            print('^3[qb-varheist] ^5New Server: '..Config.Servers[server].label..'^7')
        end
        -- SHOW SERVER LOCATION
        TriggerClientEvent('var-ui:on', src, Config.Servers[server].label)
        -- ENABLE TARGET FOR SERVER
        for playerId, state in pairs(varPlayers) do
            if state then -- true
                TriggerClientEvent('qb-varheist:client:EnableServer', playerId, server)
            end
        end
        -- SET HACKED
        Config.CurrentHack.hacked = true
        TriggerClientEvent('qb-varheist:client:SetHacked', -1)
    else
        fails = fails + 1
        if fails == Config.MaxFails then
            EndHeist()
        end
    end
end)

RegisterNetEvent('qb-varheist:server:GetPassword', function()
    local src = source
    -- Remove Zone
    for playerId, state in pairs(varPlayers) do
        if state then -- true
            TriggerClientEvent('qb-varheist:client:RemoveServerTarget', playerId)
        end
    end
    -- Show Password
    password = GeneratePassword()
    TriggerClientEvent('var-ui:on', src, password)
end)

QBCore.Functions.CreateCallback('qb-varheist:server:EnterPassword', function(source, cb, answer)
    local src = source
    if answer == password then
        password = nil
        Config.CurrentHack.id = Config.CurrentHack.id + 1
        Config.CurrentHack.hacked = false
        Config.CurrentHack.password = false
        TriggerClientEvent('qb-varheist:client:SetPassword', -1, true)
        if Config.CurrentHack.id == 11 then
            Config.CurrentHack.password = true
            -- Turn lights off and three minutes for lower hacks until shut down
            EndHeist()
        end
        cb(true)
    else
        fails = fails + 1
        TriggerClientEvent('QBCore:Notify', src, 'Incorrect password! ('..fails..'/'..Config.MaxFails..')', 'error', 2500)
        if fails == Config.MaxFails then
            cb(false)
            EndHeist()
        else
            cb(false)
        end
    end
end)

RegisterNetEvent('qb-varheist:server:LowerHackResult', function(index)
    -- Set Hacked
    Config.LowerHacks[index].hacked = true
    TriggerClientEvent('qb-varheist:client:LowerHackResult', -1, index)
    -- Give 25% Key
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem('var_usb'..index, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['var_usb'..index], 'add')
        TriggerEvent("qb-log:server:CreateLog", "varheist", "Master Key 25%", "default", "**"..GetPlayerName(src).."** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) Received: var_usb"..index)
        if debug then
            print('^3[qb-varheist] ^5'..Player.PlayerData.name..' received 25% USB'..index..'^7')
        end
    end
    -- Check if finished
    lowerHackCheck()
end)

QBCore.Functions.CreateUseableItem("var_helmet", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-varheist:client:UseHelmet', src)
end)

QBCore.Functions.CreateUseableItem("var_medkit", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-varheist:client:UseMedKit', src)
end)

-- Create Master Key
QBCore.Functions.CreateUseableItem("var_usb1", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.Functions.GetItemByName('var_usb1') and Player.Functions.GetItemByName('var_usb2') and Player.Functions.GetItemByName('var_usb3') and Player.Functions.GetItemByName('var_usb4') then
            -- Remove 25%
            Player.Functions.RemoveItem('var_usb1', 1, false)
            Player.Functions.RemoveItem('var_usb2', 1, false)
            Player.Functions.RemoveItem('var_usb3', 1, false)
            Player.Functions.RemoveItem('var_usb4', 1, false)
            -- Add 100%
            Player.Functions.AddItem('var_usb5', 1, false)
            TriggerEvent("qb-log:server:CreateLog", "varheist", "Master Key 100%", "default", "**"..GetPlayerName(src).."** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) Received: var_usb5")
            if debug then
                print('^3[qb-varheist] ^5'..Player.PlayerData.name..' received 100% USB^7')
            end
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['var_usb5'], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You combined the USBs into a Master Key', 'success', 2500)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You need all 4 Master Keys', 'error', 2500)
        end
    end
end)

QBCore.Functions.CreateUseableItem("var_usb2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.Functions.GetItemByName('var_usb1') and Player.Functions.GetItemByName('var_usb2') and Player.Functions.GetItemByName('var_usb3') and Player.Functions.GetItemByName('var_usb4') then
            -- Remove 25%
            Player.Functions.RemoveItem('var_usb1', 1, false)
            Player.Functions.RemoveItem('var_usb2', 1, false)
            Player.Functions.RemoveItem('var_usb3', 1, false)
            Player.Functions.RemoveItem('var_usb4', 1, false)
            -- Add 100%
            Player.Functions.AddItem('var_usb5', 1, false)
            TriggerEvent("qb-log:server:CreateLog", "varheist", "Master Key 100%", "default", "**"..GetPlayerName(src).."** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) Received: var_usb5")
            if debug then
                print('^3[qb-varheist] ^5'..Player.PlayerData.name..' received 100% USB^7')
            end
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['var_usb5'], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You combined the USBs into a Master Key', 'success', 2500)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You need all 4 Master Keys', 'error', 2500)
        end
    end
end)

QBCore.Functions.CreateUseableItem("var_usb3", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.Functions.GetItemByName('var_usb1') and Player.Functions.GetItemByName('var_usb2') and Player.Functions.GetItemByName('var_usb3') and Player.Functions.GetItemByName('var_usb4') then
            -- Remove 25%
            Player.Functions.RemoveItem('var_usb1', 1, false)
            Player.Functions.RemoveItem('var_usb2', 1, false)
            Player.Functions.RemoveItem('var_usb3', 1, false)
            Player.Functions.RemoveItem('var_usb4', 1, false)
            -- Add 100%
            TriggerEvent("qb-log:server:CreateLog", "varheist", "Master Key 100%", "default", "**"..GetPlayerName(src).."** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) Received: var_usb5")
            Player.Functions.AddItem('var_usb5', 1, false)
            if debug then
                print('^3[qb-varheist] ^5'..Player.PlayerData.name..' received 100% USB^7')
            end
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['var_usb5'], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You combined the USBs into a Master Key', 'success', 2500)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You need all 4 Master Keys', 'error', 2500)
        end
    end
end)

QBCore.Functions.CreateUseableItem("var_usb4", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.Functions.GetItemByName('var_usb1') and Player.Functions.GetItemByName('var_usb2') and Player.Functions.GetItemByName('var_usb3') and Player.Functions.GetItemByName('var_usb4') then
            -- Remove 25%
            Player.Functions.RemoveItem('var_usb1', 1, false)
            Player.Functions.RemoveItem('var_usb2', 1, false)
            Player.Functions.RemoveItem('var_usb3', 1, false)
            Player.Functions.RemoveItem('var_usb4', 1, false)
            -- Add 100%
            TriggerEvent("qb-log:server:CreateLog", "varheist", "Master Key 100%", "default", "**"..GetPlayerName(src).."** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*) Received: var_usb5")
            Player.Functions.AddItem('var_usb5', 1, false)
            if debug then
                print('^3[qb-varheist] ^5'..Player.PlayerData.name..' received 100% USB^7')
            end
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['var_usb5'], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You combined the USBs into a Master Key', 'success', 2500)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You need all 4 Master Keys', 'error', 2500)
        end
    end
end)

QBCore.Commands.Add("var_exit", "Exit the VAR Environment", {}, false, function(source, args)
	local src = source
    if varPlayers[src] then
	    TriggerEvent('qb-varheist:server:VarExit', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not in the VAR Environment', 'error', 2500)
    end
end)