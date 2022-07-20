local QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["burger-ticket"] = 1,
}

QBCore.Functions.CreateUseableItem("heartstopper-meal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:HeartStopperMeal", source, item.name)
end)

QBCore.Functions.CreateUseableItem("moneyshot-meal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:MoneyShotMeal", source, item.name)
end)

QBCore.Functions.CreateUseableItem("bleeder-meal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:BleederMeal", source, item.name)
end)

QBCore.Functions.CreateUseableItem("torpedo-meal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:TorpedoMeal", source, item.name)
end)

QBCore.Functions.CreateUseableItem("meatfree-meal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:MeatFreeMeal", source, item.name)
end)

QBCore.Functions.CreateUseableItem("heartstopper-meal-shake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:HeartStopperMealShake", source, item.name)
end)

QBCore.Functions.CreateUseableItem("moneyshot-meal-shake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:MoneyShotMealShake", source, item.name)
end)

QBCore.Functions.CreateUseableItem("bleeder-meal-shake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:BleederMealShake", source, item.name)
end)

QBCore.Functions.CreateUseableItem("torpedo-meal-shake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:TorpedoMealShake", source, item.name)
end)

QBCore.Functions.CreateUseableItem("meatfree-meal-shake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:MeatFreeMealShake", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgerbox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershotjob:client:UseBurgerBox", source)
end)

--meals with no shake 

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientHeartStopperMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local heartstopper = Ply.Functions.GetItemByName("burger-heartstopper")
    local softdrink = Ply.Functions.GetItemByName("burger-softdrink")
    if fries and heartstopper and softdrink then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-heartstopper", 1)
        Ply.Functions.RemoveItem("burger-softdrink", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMoneyShotMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local moneyshot = Ply.Functions.GetItemByName("burger-moneyshot")
    local softdrink = Ply.Functions.GetItemByName("burger-softdrink")
    if fries and moneyshot and softdrink then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-moneyshot", 1)
        Ply.Functions.RemoveItem("burger-softdrink", 1)        
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBleederMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local bleeder = Ply.Functions.GetItemByName("burger-bleeder")
    local softdrink = Ply.Functions.GetItemByName("burger-softdrink")
    if fries and bleeder and softdrink then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-bleeder", 1)
        Ply.Functions.RemoveItem("burger-softdrink", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientTorpedoMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local torpedo = Ply.Functions.GetItemByName("burger-torpedo")
    local softdrink = Ply.Functions.GetItemByName("burger-softdrink")
    if fries and torpedo and softdrink then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-torpedo", 1)
        Ply.Functions.RemoveItem("burger-softdrink", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMeatFreeMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local meatfree = Ply.Functions.GetItemByName("burger-meatfree")
    local softdrink = Ply.Functions.GetItemByName("burger-softdrink")
    if fries and meatfree and softdrink then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-meatfree", 1)
        Ply.Functions.RemoveItem("burger-softdrink", 1)
    else
        cb(false)
    end
end)

--meals with shake 

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientHeartStopperMealshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local heartstopper = Ply.Functions.GetItemByName("burger-heartstopper")
    local softdrink = Ply.Functions.GetItemByName("burger-milkshake")
    if fries and heartstopper and milkshake then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-heartstopper", 1)
        Ply.Functions.RemoveItem("burger-milkshake", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMoneyShotMealshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local moneyshot = Ply.Functions.GetItemByName("burger-moneyshot")
    local softdrink = Ply.Functions.GetItemByName("burger-milkshake")
    if fries and moneyshot and milkshake then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-moneyshot", 1)
        Ply.Functions.RemoveItem("burger-milkshake", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBleederMealshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local bleeder = Ply.Functions.GetItemByName("burger-bleeder")
    local softdrink = Ply.Functions.GetItemByName("burger-milkshake")
    if fries and bleeder and milkshake then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-bleeder", 1)
        Ply.Functions.RemoveItem("burger-milkshake", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientTorpedoMealshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local torpedo = Ply.Functions.GetItemByName("burger-torpedo")
    local milshake = Ply.Functions.GetItemByName("burger-milkshake")
    if fries and torpedo and milkshake then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-torpedo", 1)
        Ply.Functions.RemoveItem("burger-milkshake", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMeatFreeMealshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local meatfree = Ply.Functions.GetItemByName("burger-meatfree")
    local milshake = Ply.Functions.GetItemByName("burger-milkshake")
    if fries and meatfree and milkshake then
        cb(true)
        Ply.Functions.RemoveItem("burger-fries", 1)
        Ply.Functions.RemoveItem("burger-meatfree", 1)
        Ply.Functions.RemoveItem("burger-milkshake", 1)
    else
        cb(false)
    end
end)

-- ingredients

QBCore.Functions.CreateCallback('qb-burgershotjob:get:ingredient:syrup', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local syrup = Ply.Functions.GetItemByName("burger-syrup")
    if syrup then
        cb(true)
        Ply.Functions.RemoveItem("burger-syrup", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershotjob:get:ingredient:cream', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cream = Ply.Functions.GetItemByName("burger-cream")
    local milk = Ply.Functions.GetItemByName("burger-milk")
    if cream and milk then
        cb(true)
        Ply.Functions.RemoveItem("burger-cream", 1)
        Ply.Functions.RemoveItem("milk", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershotjob:get:bleederingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local buns = Ply.Functions.GetItemByName("burger-bun")
    local cheese = Ply.Functions.GetItemByName("burger-cheese")
    if lettuce and meat and buns and cheese then
        cb(true)
        Ply.Functions.RemoveItem("burger-bun", 2)
        Ply.Functions.RemoveItem("burger-meat", 1)
        Ply.Functions.RemoveItem("burger-lettuce", 1)
        Ply.Functions.RemoveItem("burger-cheese", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershotjob:get:moneyshotingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local buns = Ply.Functions.GetItemByName("burger-bun")
    local cheese = Ply.Functions.GetItemByName("burger-cheese")
    local tomatoslice = Ply.Functions.GetItemByName("tomatoslice")
    if lettuce and meat and buns and cheese and tomatoslice then
        cb(true)
        Ply.Functions.RemoveItem("burger-bun", 2)
        Ply.Functions.RemoveItem("burger-cheese", 1)
        Ply.Functions.RemoveItem("tomatoslice", 2)
        Ply.Functions.RemoveItem("burger-meat", 1)
        Ply.Functions.RemoveItem("burger-lettuce", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershotjob:get:hearstopperingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local buns = Ply.Functions.GetItemByName("burger-bun")
    local cheese = Ply.Functions.GetItemByName("burger-cheese")
    local tomatoslice = Ply.Functions.GetItemByName("tomatoslice")
    if lettuce and meat and buns and cheese and tomatoslice then
        cb(true)
        Ply.Functions.RemoveItem("burger-bun", 2)
        Ply.Functions.RemoveItem("burger-cheese", 2)
        Ply.Functions.RemoveItem("tomatoslice", 2)
        Ply.Functions.RemoveItem("burger-meat", 2)
        Ply.Functions.RemoveItem("burger-lettuce", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershotjob:get:torpedoingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local buns = Ply.Functions.GetItemByName("burger-bun")
    if lettuce and meat and buns then
        cb(true)
        Ply.Functions.RemoveItem("burger-bun", 2)
        Ply.Functions.RemoveItem("burger-meat", 1)
        Ply.Functions.RemoveItem("burger-lettuce", 1)
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershotjob:get:meatfreeingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local buns = Ply.Functions.GetItemByName("burger-bun")
    local cheese = Ply.Functions.GetItemByName("burger-cheese")
    local tomatoslice = Ply.Functions.GetItemByName("tomatoslice")
    if lettuce and buns and cheese and tomatoslice then
        cb(true)
        Ply.Functions.RemoveItem("burger-bun", 2)
        Ply.Functions.RemoveItem("burger-lettuce", 1)
        Ply.Functions.RemoveItem("burger-cheese", 1)
        Ply.Functions.RemoveItem("tomatoslice", 1)
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:Rawmeat', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local rawmeat = Ply.Functions.GetItemByName("burger-raw")
    if rawmeat  then
        cb(true)
        Ply.Functions.RemoveItem("burger-raw", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:potato', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local potato = Ply.Functions.GetItemByName("burger-potato")
    if potato  then
        cb(true)
        Ply.Functions.RemoveItem("burger-potato", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:OnionRings', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local slicedonion = Ply.Functions.GetItemByName("slicedonion")
    if slicedonion  then
        cb(true)
        Ply.Functions.RemoveItem("slicedonion", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:ChickenNuggets', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local frozennuggets = Ply.Functions.GetItemByName("frozennuggets")
    if frozennuggets  then
        cb(true)
        Ply.Functions.RemoveItem("frozennuggets", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:Icecreamcone', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local icecreamcone = Ply.Functions.GetItemByName("burger-icecreamcone")
    if icecreamcone  then
        cb(true)
        Ply.Functions.RemoveItem("burger-icecreamcone", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:Tomato', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local tomato = Ply.Functions.GetItemByName("tomato")
    if tomato then
        cb(true)
        Ply.Functions.RemoveItem("tomato", 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:getingredient:Onion', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local onions = Ply.Functions.GetItemByName("onions")
    if onions then
        cb(true)
        Ply.Functions.RemoveItem("onions", 1)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-burgershotjob:start:deliveryjob', function()
    local src = source
    TriggerClientEvent('qb-burgershotjob:deliveryjob', src)
end)

RegisterNetEvent('qb-burgershotjob:reward:ticket', function()
    local src = source
    TriggerClientEvent('QBCore:Notify', src, 'Burger Bag Has been delivered! Go back for more deliveries', 'success')
end)

RegisterNetEvent('qb-burgershot:payment:money', function()
    local src = source
    local price = 0
    local payment = 0
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("burger-ticket")
    local bossamount = 0
    if xItem then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] then 
                if ItemList[Player.PlayerData.items[k].name] then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    payment = price * Config.PaymentDelivery
                    bossprice = bossamount + (ItemList[Player.PlayerData.items[k].name] * Config.BossPaymentDelivery)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    exports['qb-management']:AddMoney(Player.PlayerData.job.name , bossprice)
                    Player.Functions.AddMoney("cash", payment, "Burgershot delivery payment")
                    TriggerClientEvent('QBCore:Notify', src, 'You turned in $'..payment..' worth of delivery tickets', 'primary')
                    TriggerEvent("qb-log:server:CreateLog", "burgershot", "tickets", "white", "**"..GetPlayerName(src) .. "** made $"..payment.." for turning in burgershot tickets")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have no burgershot tickets..', 'error')
    end
end)

RegisterNetEvent('qb-burgershot:bill:player', function(info)
    local Player = QBCore.Functions.GetPlayer(source)
    local Player2 = QBCore.Functions.GetPlayer(tonumber(info.citizenid))
    local type = info.billtype
    local pos = GetEntityCoords(GetPlayerPed(source))
    local pos2 = GetEntityCoords(GetPlayerPed(tonumber(info.citizenid)))
    local dist = #(pos - pos2)
    if Player.PlayerData.job.name == 'burgershot' then
        if Player.PlayerData.job.onduty then
            if type == 'bank' then
                if dist < 5 then
                    local Amount = tonumber(info.billprice)
                    local playeramount = Amount * 0.2
                    local bossamount = Amount - playeramount
                    Player2.Functions.RemoveMoney('bank', Amount, 'Burgershot debit card charged')
                    -- Send money to sender job--
                    Player.Functions.AddMoney('bank', playeramount, 'Burgershot debit card charged')
                    exports['qb-management']:AddMoney(Player.PlayerData.job.name, bossamount)
                    -----
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You have been charged $ ' ..Amount..' From your debit card', 'error')
                    TriggerClientEvent('QBCore:Notify', source, 'You charged the person $ ' ..Amount..' From their debit card', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are too far away! ', 'error')
                end
            else
                if dist < 5 then
                    local Amount = tonumber(info.billprice)
                    local playeramount = Amount * 0.4
                    local bossamount = Amount - playeramount
                    Player2.Functions.RemoveMoney('cash', Amount, 'Burgershot receipt')
                    -- Send money to sender job--
                    Player.Functions.AddMoney('cash', playeramount, 'Burgershot receipt')
                    exports['qb-management']:AddMoney(Player.PlayerData.job.name, bossamount)
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
