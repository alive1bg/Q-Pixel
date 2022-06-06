QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["uwu-ticket"] = 1,
}

QBCore.Functions.CreateUseableItem("uwubentobox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:uwubentoboxMeal", source)
end)

-- plushs
QBCore.Functions.CreateUseableItem("uwupurpleplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwupurpleplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwugreenplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwugreenplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwublueplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwublueplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwubrownplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwubrownplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwuyellowplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwuyellowplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwuredplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwuredplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwugreenrareplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwugreenrareplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwupinkrareplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwujob:client:uwupinkrareplush", source, item.name)
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwubudhabowl', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local broccoil = Player.Functions.GetItemByName("broccoil")
    local cauliflower = Player.Functions.GetItemByName("cauliflower")
    local chickpeas = Player.Functions.GetItemByName("chickpeas")
    local cashews = Player.Functions.GetItemByName("cashews")
    local lemonjuice = Player.Functions.GetItemByName("lemonjuice")
    local garlic = Player.Functions.GetItemByName("garlic")
    if broccoil and cauliflower and chickpeas and cashews and lemonjuice and garlic then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwusushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local whiterice = Player.Functions.GetItemByName("whiterice")
    local vinegar = Player.Functions.GetItemByName("vinegar")
    local sugar = Player.Functions.GetItemByName("sugar")
    local salt = Player.Functions.GetItemByName("salt")
    local seaweed = Player.Functions.GetItemByName("seaweed")
    local crabmeat = Player.Functions.GetItemByName("crabmeat")
    if whiterice and vinegar and sugar and salt and seaweed and crabmeat then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwumisosoup', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local dashigranules = Player.Functions.GetItemByName("dashigranules")
    local waterbottle = Player.Functions.GetItemByName("water_bottle")
    local misopaste = Player.Functions.GetItemByName("misopaste")
    local dicedsilkentofu = Player.Functions.GetItemByName("dicedsilkentofu")
    local onions = Player.Functions.GetItemByName("onions")
    if dashigranules and waterbottle and misopaste and dicedsilkentofu and onions then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwuchocsandy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cocoapowder = Player.Functions.GetItemByName("cocoapowder")
    local butter = Player.Functions.GetItemByName("butter")
    local sugar = Player.Functions.GetItemByName("sugar")
    local egg = Player.Functions.GetItemByName("egg")
    local milk = Player.Functions.GetItemByName("milk")
    local flour = Player.Functions.GetItemByName("flour")
    local kittymarshmallows = Player.Functions.GetItemByName("kittymarshmallows")
    if cocoapowder and butter and sugar and egg and milk and flour and kittymarshmallows then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwuvanillasandy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local vanillaextract = Player.Functions.GetItemByName("vanillaextract")
    local butter = Player.Functions.GetItemByName("butter")
    local sugar = Player.Functions.GetItemByName("sugar")
    local egg = Player.Functions.GetItemByName("egg")
    local milk = Player.Functions.GetItemByName("milk")
    local flour = Player.Functions.GetItemByName("flour")
    local kittymarshmallows = Player.Functions.GetItemByName("kittymarshmallows")
    if vanillaextract and butter and sugar and egg and milk and flour and kittymarshmallows then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwucupcake', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local flour = Player.Functions.GetItemByName("flour")
    local cocoapowder = Player.Functions.GetItemByName("cocoapowder")
    local butter = Player.Functions.GetItemByName("butter")
    local sugar = Player.Functions.GetItemByName("sugar")
    local milk = Player.Functions.GetItemByName("milk")
    local egg = Player.Functions.GetItemByName("egg")
    local vanillaextract = Player.Functions.GetItemByName("vanillaextract")
    local bakingpowder = Player.Functions.GetItemByName("bakingpowder")
    if flour and cocoapowder and butter and sugar and milk and egg and vanillaextract and bakingpowder then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwupancake', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local egg = Player.Functions.GetItemByName("egg")
    local scallions = Player.Functions.GetItemByName("scallions")
    local salt = Player.Functions.GetItemByName("salt")
    local soysauce = Player.Functions.GetItemByName("soysauce")
    local flour = Player.Functions.GetItemByName("flour")
    if egg and scallions and salt and soysauce and flour then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwububbleteamint', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local matchapowder = Player.Functions.GetItemByName("matchapowder")
    local waterbottle = Player.Functions.GetItemByName("water_bottle")
    local heavycream = Player.Functions.GetItemByName("heavycream")
    local tapiocapearls = Player.Functions.GetItemByName("tapiocapearls")
    if matchapowder and waterbottle and heavycream and tapiocapearls then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwububbleteablueberry', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local blueberrylavendertea = Player.Functions.GetItemByName("blueberrylavendertea")
    local waterbottle = Player.Functions.GetItemByName("water_bottle")
    local heavycream = Player.Functions.GetItemByName("heavycream")
    local tapiocapearls = Player.Functions.GetItemByName("tapiocapearls")
    if blueberrylavendertea and waterbottle and heavycream and tapiocapearls then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-uwujob:ingredients:uwububbletearose', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local sakurarosetea = Player.Functions.GetItemByName("sakurarosetea")
    local waterbottle = Player.Functions.GetItemByName("water_bottle")
    local heavycream = Player.Functions.GetItemByName("heavycream")
    local tapiocapearls = Player.Functions.GetItemByName("tapiocapearls")
    if sakurarosetea and waterbottle and heavycream and tapiocapearls then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-uwujob:start:deliveryjob', function()
    local src = source
    TriggerClientEvent('qb-uwujob:deliveryjob', src)
end)

RegisterNetEvent('qb-uwujob:reward:ticket', function()
    local src = source
    TriggerClientEvent('QBCore:Notify', src, 'Burger Bag Has been delivered! Go back for more deliveries', 'success')
end)

RegisterNetEvent('qb-uwujob:payment:money', function()
    local src = source
    local price = 0
    local payment = 0
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("uwu-ticket")
    local bossamount = 0
    if xItem then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] then 
                if ItemList[Player.PlayerData.items[k].name] then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    payment = price * Config.PaymentDelivery
                    bossprice = bossamount + (ItemList[Player.PlayerData.items[k].name] * Config.BossPaymentDelivery)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    --TriggerEvent('qb-management:server:addAccountMoney', Player.PlayerData.job.name , bossprice)
                    exports['qb-management']:AddMoney(Player.PlayerData.job.name , bossprice)
                    Player.Functions.AddMoney("cash", payment, "sold-uwu-ticket")
                    TriggerClientEvent('QBCore:Notify', src, 'You turned in $'..payment..' worth of delivery tickets', 'primary')
                    TriggerEvent("qb-log:server:CreateLog", "uwucafejob", "tickets", "white", "**"..GetPlayerName(src) .. "** made $"..payment.." for turning in uwucafejob tickets")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have no uwucafejob tickets..', 'error')
    end
end)

RegisterNetEvent('qb-uwujob:bill:player', function(info)
    local Player = QBCore.Functions.GetPlayer(source)
    local Player2 = QBCore.Functions.GetPlayer(tonumber(info.citizenid))
    local type = info.billtype
    local pos = GetEntityCoords(GetPlayerPed(source))
    local pos2 = GetEntityCoords(GetPlayerPed(tonumber(info.citizenid)))
    local dist = #(pos - pos2)
    if Player.PlayerData.job.name == 'uwu' then
        if Player.PlayerData.job.onduty then
            if type == 'bank' then
                if dist < 5 then
                    local Amount = tonumber(info.billprice)
                    local playeramount = Amount * 0.07
                    local bossamount = Amount - playeramount
                    Player2.Functions.RemoveMoney('bank', Amount, 'Charged')
                    -- Send money to sender job--
                    Player.Functions.AddMoney('bank', playeramount, 'Charged')
                    --TriggerEvent('qb-management:server:addAccountMoney', Player.PlayerData.job.name, bossamount)
                    exports['qb-management']:AddMoney(Player.PlayerData.job.name , bossamount)
                    -----
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You have been charged $ ' ..Amount..' From your debit card', 'error')
                    TriggerClientEvent('QBCore:Notify', source, 'You charged the person $ ' ..Amount..' From their debit card', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are too far away! ', 'error')
                end
            else
                if dist < 5 then
                    local Amount = tonumber(info.billprice)
                    local playeramount = Amount * 0.07
                    local bossamount = Amount - playeramount
                    Player2.Functions.RemoveMoney('cash', Amount, 'Charged')
                    -- Send money to sender job--
                    Player.Functions.AddMoney('cash', playeramount, 'Charged')
                    --TriggerEvent('qb-management:server:addAccountMoney', Player.PlayerData.job.name, bossamount)
                    exports['qb-management']:AddMoney(Player.PlayerData.job.name , bossamount)
                    -----
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You have been charged $ ' ..Amount, 'error')
                    TriggerClientEvent('QBCore:Notify', source, 'You charged the person $ ' ..Amount, 'success')
                else
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are too far away! ', 'error')
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are not on Duty! ', 'error')
        end
    end
end)

QBCore.Commands.Add('uwucats', 'Calling all uWu cats', {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'uwu' and Player.PlayerData.job.grade.level >= 4 then
        TriggerClientEvent('qb-uwujob:spawnUwuKittys', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You must be a uwu boss to call the cats!', 'error')
    end
end)