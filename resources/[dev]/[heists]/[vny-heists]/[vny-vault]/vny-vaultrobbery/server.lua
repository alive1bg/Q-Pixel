local QBCore = exports['qb-core']:GetCoreObject()

if Veny.Framework == "qbold" then
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

    RegisterServerEvent("pacific:checker")
    AddEventHandler("pacific:checker", function(bank)
        local _source = source
        local copcount = 0
        local Players = QBCore.Functions.GetPlayers()

        for i = 1, #Players, 1 do
            local xPlayer = QBCore.Functions.GetPlayer(Players[i])

            if xPlayer.PlayerData.job.name == "police" then
                copcount = copcount + 1
            end
        end
        local xPlayer = QBCore.Functions.GetPlayer(_source)

        if copcount >= Veny.mincops then
            if not Veny.onaction == true then
                if (os.time() - Veny.cooldown) > Veny.lastrobbed then
                    Veny.onaction = true
                    xPlayer.Functions.RemoveItem("thermitecharge", 1)
                    TriggerClientEvent("pacific:firstdoor", source)
                    
                else
                    TriggerClientEvent("notification", source, "You should wait to rob this bank "..math.floor((Veny.cooldown - (os.time() - Veny.lastrobbed)) / 60)..":"..math.fmod((Veny.cooldown - (os.time() - Veny.lastrobbed)), 2))
                    
                end
            else
                TriggerClientEvent("notification", source, "This bank is currently being robbed", 2)
            end
        else
            TriggerClientEvent("notification", source, "There are not enough police in city", 2)
        end
    end)

    RegisterServerEvent("pacific:particleserver")
    AddEventHandler("pacific:particleserver", function(method)
        TriggerClientEvent("pacific:ptfxparticle", -1, method)
    end)

    RegisterServerEvent("pacific:particleserversec")
    AddEventHandler("pacific:particleserversec", function(method)
        TriggerClientEvent("pacific:ptfxparticlesec", -1, method)
    end)
    RegisterServerEvent("pacific:particleserverthird")
    AddEventHandler("pacific:particleserverthird", function(method)
        TriggerClientEvent("pacific:ptfxparticlethird", -1, method)
    end)

    RegisterServerEvent("utk_oh:openvault")
    AddEventHandler("utk_oh:openvault", function(method)
        TriggerClientEvent("utk_oh:openvault_c", -1, method)
    end)

    QBCore.Functions.CreateUseableItem("redlaptop", function(source)
        TriggerClientEvent("pacific:seconddoor", source)
        TriggerClientEvent("pacific:vaultdoor", source)
    end)

    QBCore.Functions.CreateUseableItem("thermitecharge", function(source)
        TriggerClientEvent("pacific:firstdoor", source)
        TriggerClientEvent("pacific:vaultdoor2", source)
        TriggerClientEvent("pacific:vaultdoor3", source)
    end)

    RegisterNetEvent("pacific:itemdelete")
    AddEventHandler("pacific:itemdelete", function()
        xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveItem("thermitecharge", 1)
    end)

    RegisterNetEvent("pacific:addmoney")
    AddEventHandler("pacific:addmoney", function()
        xPlayer = QBCore.Functions.GetPlayer(source)
        local quaxcankardes = math.random(1,4) -- this is a better way of adding chance to get random item
        if quaxcankardes == 1 then  -- this is a better way of adding chance to get random item
            xPlayer.Functions.AddItem("inkedmoney", math.random(1,3))-- this is a better way of adding chance to get random item
        end                     -- this is a better way of adding chance to get random item
        xPlayer.Functions.AddItem("markedbills", math.random(100,150))

        local random = math.random(1, 2) -- this way includes a config with item table
        local Rareitem = Config.RareItems[math.random(1, #Config.RareItems)]
        Player.Functions.AddItem(Rareitem, random)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Rareitem], 'add')
    end)


    RegisterNetEvent("pacific:addgoldbar")
    AddEventHandler("pacific:addgoldbar", function()
        xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem("goldbar", math.random(10,30))
    end)

end

if Veny.Framework == "qbnew" then
    local QBCore = exports['qb-core']:GetCoreObject()
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

    RegisterServerEvent("pacific:checker")
    AddEventHandler("pacific:checker", function(bank)
        local _source = source
        local copcount = 0
        local Players = QBCore.Functions.GetPlayers()

        for i = 1, #Players, 1 do
            local xPlayer = QBCore.Functions.GetPlayer(Players[i])

            if xPlayer.PlayerData.job.name == "police" then
                copcount = copcount + 1
            end
        end
        local xPlayer = QBCore.Functions.GetPlayer(_source)

        if copcount >= Veny.mincops then
            if not Veny.onaction == true then
                if (os.time() - Veny.cooldown) > Veny.lastrobbed then
                    Veny.onaction = true
                    xPlayer.Functions.RemoveItem("thermitecharge", 1)
                    TriggerClientEvent("pacific:firstdoor", source)
                    
                else
                    TriggerClientEvent("notification", source, "You should wait to rob this bank "..math.floor((Veny.cooldown - (os.time() - Veny.lastrobbed)) / 60)..":"..math.fmod((Veny.cooldown - (os.time() - Veny.lastrobbed)), 2))
                    
                end
            else
                TriggerClientEvent("notification", source, "This bank is currently being robbed", 2)
            end
        else
            TriggerClientEvent("notification", source, "There are not enough police in city", 2)
        end
    end)


    RegisterServerEvent("pacific:particleserver")
    AddEventHandler("pacific:particleserver", function(method)
        TriggerClientEvent("pacific:ptfxparticle", -1, method)
    end)

    RegisterServerEvent("pacific:particleserversec")
    AddEventHandler("pacific:particleserversec", function(method)
        TriggerClientEvent("pacific:ptfxparticlesec", -1, method)
    end)
    RegisterServerEvent("pacific:particleserverthird")
    AddEventHandler("pacific:particleserverthird", function(method)
        TriggerClientEvent("pacific:ptfxparticlethird", -1, method)
    end)

    RegisterServerEvent("utk_oh:openvault")
    AddEventHandler("utk_oh:openvault", function(method)
        TriggerClientEvent("utk_oh:openvault_c", -1, method)
    end)

    QBCore.Functions.CreateUseableItem("redlaptop", function(source)
        TriggerClientEvent("pacific:seconddoor", source)
        TriggerClientEvent("pacific:vaultdoor", source)
    end)

    QBCore.Functions.CreateUseableItem("thermitecharge", function(source)
        TriggerClientEvent("pacific:firstdoor", source)
        TriggerClientEvent("pacific:vaultdoor2", source)
        TriggerClientEvent("pacific:vaultdoor3", source)
    end)

    RegisterNetEvent("pacific:itemdelete")
    AddEventHandler("pacific:itemdelete", function()
        xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveItem("thermitecharge", 1)
    end)

    RegisterNetEvent("pacific:addmoney")
    AddEventHandler("pacific:addmoney", function()
        xPlayer = QBCore.Functions.GetPlayer(source)
        local quaxcankardes = math.random(1,4) -- this is a better way of adding chance to get random item
        if quaxcankardes == 1 then  -- this is a better way of adding chance to get random item
            xPlayer.Functions.AddItem("inkedmoney", math.random(1,3))-- this is a better way of adding chance to get random item
        end                     -- this is a better way of adding chance to get random item
        xPlayer.Functions.AddItem("markedbills", math.random(100,150))

        local random = math.random(1, 2) -- this way includes a config with item table
        local Rareitem = Config.RareItems[math.random(1, #Config.RareItems)]
        Player.Functions.AddItem(Rareitem, random)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Rareitem], 'add')
    end)


    RegisterNetEvent("pacific:addgoldbar")
    AddEventHandler("pacific:addgoldbar", function()
        xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem("goldbar", math.random(10,30))
    end)
    
end

if Veny.Framework == "esx" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    
    RegisterServerEvent("pacific:checker")
    AddEventHandler("pacific:checker", function(bank)
        local _source = source
        local copcount = 0
        local Players = ESX.GetPlayers()

        for i = 1, #Players, 1 do
            local xPlayer = ESX.GetPlayerFromId(Players[i])

            if xPlayer.job.name == "police" then
                copcount = copcount + 1
            end
        end
        local xPlayer = ESX.GetPlayerFromId(_source)

        if copcount >= Veny.mincops then
            if not Veny.onaction == true then
                if (os.time() - Veny.cooldown) > Veny.lastrobbed then
                    Veny.onaction = true
                    xPlayer.removeInventoryItem("thermitecharge", 1)
                    TriggerClientEvent("pacific:firstdoor", source)
                    
                else
                    TriggerClientEvent("notification", source, "You should wait to rob this bank "..math.floor((Veny.cooldown - (os.time() - Veny.lastrobbed)) / 60)..":"..math.fmod((Veny.cooldown - (os.time() - Veny.lastrobbed)), 2))
                    
                end
            else
                TriggerClientEvent("notification", source, "This bank is currently being robbed", 2)
            end
        else
            TriggerClientEvent("notification", source, "There are not enough police in city", 2)
        end
    end)
    
    RegisterServerEvent("pacific:particleserver")
    AddEventHandler("pacific:particleserver", function(method)
        TriggerClientEvent("pacific:ptfxparticle", -1, method)
    end)
    
    RegisterServerEvent("pacific:particleserversec")
    AddEventHandler("pacific:particleserversec", function(method)
        TriggerClientEvent("pacific:ptfxparticlesec", -1, method)
    end)
    RegisterServerEvent("pacific:particleserverthird")
    AddEventHandler("pacific:particleserverthird", function(method)
        TriggerClientEvent("pacific:ptfxparticlethird", -1, method)
    end)
    
    RegisterServerEvent("utk_oh:openvault")
    AddEventHandler("utk_oh:openvault", function(method)
        TriggerClientEvent("utk_oh:openvault_c", -1, method)
    end)
    
    ESX.RegisterUsableItem("redlaptop", function(source)
        TriggerClientEvent("pacific:seconddoor", source)
        TriggerClientEvent("pacific:vaultdoor", source)
    end)
    
    ESX.RegisterUsableItem("thermitecharge", function(source)
        TriggerClientEvent("pacific:firstdoor", source)
        TriggerClientEvent("pacific:vaultdoor2", source)
        TriggerClientEvent("pacific:vaultdoor3", source)
    end)
    
    RegisterNetEvent("pacific:itemdelete")
    AddEventHandler("pacific:itemdelete", function()
        xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem("thermitecharge", 1)
    end)
    
    RegisterNetEvent("pacific:addmoney")
    AddEventHandler("pacific:addmoney", function()
        xPlayer = ESX.GetPlayerFromId(source)
        local quaxcankardes = math.random(1,4)
        if quaxcankardes == 1 then 
            xPlayer.addInventoryItem("inkedmoney", math.random(1,3))
        end
        xPlayer.addInventoryItem("markedbills", math.random(100,150))
    end)
    
    RegisterNetEvent("pacific:addgoldbar")
    AddEventHandler("pacific:addgoldbar", function()
        xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem("goldbar", math.random(1,25))
    end)


end



RegisterServerEvent("pacific:ggwps")
AddEventHandler("pacific:ggwps", function()
    Veny.lastrobbed = os.time()
    Veny.onaction = false
    TriggerClientEvent("pacific:resetdoorsmf_cl", -1)
end)

RegisterServerEvent("pacific:failurereset")
AddEventHandler("pacific:failurereset", function()
    Veny.onaction = false
end)

-- AddEventHandler('onResourceStart', function(resource)
--     if resource == GetCurrentResourceName() then
--        Wait(300000)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--        Wait(100)
--        print("Veny Development | https://discord.gg/TGjGUchWsk | Thanks for your purchase!")
--     end
-- end)





---- ADDED FROM QB BANK ROBBERY
QBCore.Functions.CreateCallback('qb-bankrobbery:server:GetConfig', function(source, cb)
    cb(Config)
end)

