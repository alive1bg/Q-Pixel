local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('fp-weedshop:server:GetOGKush', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("weed_og-kush", math.random(Config.MinBudPerPlant, Config.MaxBudPerPlant))
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_og-kush"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GetPurpleHaze', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("weed_purple-haze", math.random(Config.MinBudPerPlant, Config.MaxBudPerPlant))
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_purple-haze"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GetAK47', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("weed_ak47", math.random(Config.MinBudPerPlant, Config.MaxBudPerPlant))
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_ak47"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GetSkunk', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("weed_skunk", math.random(Config.MinBudPerPlant, Config.MaxBudPerPlant))
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_skunk"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GetWhiteWidow', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("weed_white-widow", math.random(Config.MinBudPerPlant, Config.MaxBudPerPlant))
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_white-widow"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GetAmnesia', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("weed_amnesia", math.random(Config.MinBudPerPlant, Config.MaxBudPerPlant))
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_amnesia"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveAndRemoveOGKushh', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.RollingRequiredItem, 1)
    Player.Functions.RemoveItem("weed_og-kush", 1)
    Player.Functions.AddItem("og_kush", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kush"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveAndRemovePurpleHaze', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.RollingRequiredItem, 1)
    Player.Functions.RemoveItem("weed_purple-haze", 1)
    Player.Functions.AddItem("purple_haze", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_haze"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveAndRemoveAK47', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.RollingRequiredItem, 1)
    Player.Functions.RemoveItem("weed_ak47", 1)
    Player.Functions.AddItem("ak47", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveAndRemoveSkunk', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.RollingRequiredItem, 1)
    Player.Functions.RemoveItem("weed_skunk", 1)
    Player.Functions.AddItem("skunk", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunk"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveAndRemoveWhiteWidow', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.RollingRequiredItem, 1)
    Player.Functions.RemoveItem("weed_white-widow", 1)
    Player.Functions.AddItem("white_widow", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widow"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveAndRemoveAmnesia', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.RollingRequiredItem, 1)
    Player.Functions.RemoveItem("weed_amnesia", 1)
    Player.Functions.AddItem("amnesia", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesia"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveGrindedOGKushh', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("weed_og-kush", 1)
    Player.Functions.AddItem("groundog_kush", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["groundog_kush"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveGrindedPurpleHaze', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("weed_purple-haze", 1)
    Player.Functions.AddItem("groundpurple_haze", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["groundpurple_haze"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveGrindedAK47', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("weed_ak47", 1)
    Player.Functions.AddItem("groundak47", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["groundak47"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveGrindedSkunk', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("weed_skunk", 1)
    Player.Functions.AddItem("groundskunk", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["groundskunk"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveGrindedWhiteWidow', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("weed_white-widow", 1)
    Player.Functions.AddItem("groundwhite_widow", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["groundwhite_widow"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveGrindedAmnesia', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("weed_amnesia", 1)
    Player.Functions.AddItem("groundamnesia", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["groundamnesia"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveItemBrownieOGKushh', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.BrownieMixItem, 1)
    Player.Functions.RemoveItem("groundog_kush", 1)
    Player.Functions.AddItem("og_kushbrownie", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kushbrownie"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveItemBrowniePurpleHaze', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.BrownieMixItem, 1)
    Player.Functions.RemoveItem("groundpurple_haze", 1)
    Player.Functions.AddItem("purple_hazebrownie", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_hazebrownie"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveItemBrownieAK47', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.BrownieMixItem, 1)
    Player.Functions.RemoveItem("groundak47", 1)
    Player.Functions.AddItem("ak47brownie", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47brownie"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveItemBrownieSkunk', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.BrownieMixItem, 1)
    Player.Functions.RemoveItem("groundskunk", 1)
    Player.Functions.AddItem("skunkbrownie", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunkbrownie"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveItemBrownieWhiteWidow', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.BrownieMixItem, 1)
    Player.Functions.RemoveItem("groundwhite_widow", 1)
    Player.Functions.AddItem("white_widowbrownie", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widowbrownie"], "add")
end)

RegisterServerEvent('fp-weedshop:server:GiveItemBrownieAmnesia', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.BrownieMixItem, 1)
    Player.Functions.RemoveItem("groundamnesia", 1)
    Player.Functions.AddItem("amnesiabrownie", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesiabrownie"], "add")
end)


QBCore.Functions.CreateCallback('fp-weedshop:server:HasOGKush', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.RollingRequiredItem)
    local weedkush = Player.Functions.GetItemByName("weed_og-kush")
    if rolling ~= nil and weedkush ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasPurpleHaze', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.RollingRequiredItem)
    local weed_purple_haze = Player.Functions.GetItemByName("weed_purple-haze")
    if rolling ~= nil and weed_purple_haze ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasAK47', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.RollingRequiredItem)
    local weed_ak47 = Player.Functions.GetItemByName("weed_ak47")
    if rolling ~= nil and weed_ak47 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasSkunk', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.RollingRequiredItem)
    local weed_skunk = Player.Functions.GetItemByName("weed_skunk")
    if rolling ~= nil and weed_skunk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasWhiteWidow', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.RollingRequiredItem)
    local white_widow = Player.Functions.GetItemByName("weed_white-widow")
    if rolling ~= nil and white_widow ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasAmnesia', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.RollingRequiredItem)
    local amnesia = Player.Functions.GetItemByName("weed_amnesia")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasToGrindOGKush', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.GrinderItem)
    local weed_purple_haze = Player.Functions.GetItemByName("weed_og-kush")
    if rolling ~= nil and weed_purple_haze ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasToGrindPurpleHaze', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.GrinderItem)
    local weed_purple_haze = Player.Functions.GetItemByName("weed_purple-haze")
    if rolling ~= nil and weed_purple_haze ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasToGrindAK47', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.GrinderItem)
    local weed_ak47 = Player.Functions.GetItemByName("weed_ak47")
    if rolling ~= nil and weed_ak47 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasToGrindSkunk', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.GrinderItem)
    local weed_skunk = Player.Functions.GetItemByName("weed_skunk")
    if rolling ~= nil and weed_skunk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasToGrindWhiteWidow', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.GrinderItem)
    local white_widow = Player.Functions.GetItemByName("weed_white-widow")
    if rolling ~= nil and white_widow ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasToGrindAmnesia', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.GrinderItem)
    local amnesia = Player.Functions.GetItemByName("weed_amnesia")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasBrownieMixOGKush', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.BrownieMixItem)
    local amnesia = Player.Functions.GetItemByName("groundog_kush")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasBrownieMixPurpleHaze', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.BrownieMixItem)
    local amnesia = Player.Functions.GetItemByName("groundpurple_haze")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasBrownieMixAK47', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.BrownieMixItem)
    local amnesia = Player.Functions.GetItemByName("groundak47")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasBrownieMixSkunk', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.BrownieMixItem)
    local amnesia = Player.Functions.GetItemByName("groundskunk")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasBrownieMixWhiteWidow', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.BrownieMixItem)
    local amnesia = Player.Functions.GetItemByName("groundwhite_widow")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('fp-weedshop:server:HasBrownieMixAmnesia', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName(Config.BrownieMixItem)
    local amnesia = Player.Functions.GetItemByName("groundamnesia")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)



RegisterServerEvent("fp-weedshop:server:billedcitizen", function(playerId, amount, type)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'weedshop' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if type == "bill" then
                    if amount and amount > 0 then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                elseif type == "cash" then
                    local cash = billed.PlayerData.money['cash']
                    if cash >= amount then
                        billed.Functions.RemoveMoney("cash", amount)
                        TriggerEvent("qb-bossmenu:server:addAccountMoney", "weedshop", amount)
                        TriggerClientEvent("QBCore:Notify", billed.PlayerData.source, "You were charged $"..amount.." for your order", "success")
                    else
                        TriggerClientEvent("QBCore:Notify", source, "Customer doesn't have enough cash...", "error")
                    end
                elseif type == "bank" then
                    local bank = billed.PlayerData.money['bank']
                    if bank >= amount then
                        billed.Functions.RemoveMoney("bank", amount)
                        TriggerEvent("qb-bossmenu:server:addAccountMoney", "weedshop", amount)
                        TriggerClientEvent("QBCore:Notify", billed.PlayerData.source, "Your debit card was charged $"..amount.." for your order", "success")
                    else
                        TriggerClientEvent("QBCore:Notify", source, "Customer doesn't have enough on their debit card...", "error")
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end)

QBCore.Functions.CreateUseableItem("og_kush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("fp-weedshop:client:smokejointogkush", source)
end)
QBCore.Functions.CreateUseableItem("purple_haze", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("fp-weedshop:client:smokejointpurplehaze", source)
end)
QBCore.Functions.CreateUseableItem("ak47", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("fp-weedshop:client:smokejointak47", source)
end)
QBCore.Functions.CreateUseableItem("skunk", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("fp-weedshop:client:smokejointskunk", source)
end)
QBCore.Functions.CreateUseableItem("white_widow", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("fp-weedshop:client:smokejointwhitewidow", source)
end)
QBCore.Functions.CreateUseableItem("amnesia", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("fp-weedshop:client:smokejointamnesia", source)
end)

QBCore.Functions.CreateUseableItem("og_kushbrownie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fp-weedshop:client:eatbrownie", source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kushbrownie"], "remove")
    end
end)
QBCore.Functions.CreateUseableItem("purple_hazebrownie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fp-weedshop:client:eatbrownie", source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_hazebrownie"], "remove")
    end
end)
QBCore.Functions.CreateUseableItem("ak47brownie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fp-weedshop:client:eatbrownie", source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47brownie"], "remove")
    end
end)
QBCore.Functions.CreateUseableItem("skunkbrownie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fp-weedshop:client:eatbrownie", source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunkbrownie"], "remove")
    end
end)
QBCore.Functions.CreateUseableItem("white_widowbrownie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fp-weedshop:client:eatbrownie", source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widowbrownie"], "remove")
    end
end)
QBCore.Functions.CreateUseableItem("amnesiabrownie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fp-weedshop:client:eatbrownie", source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesiabrownie"], "remove")
    end
end)