local QBCore = exports['qb-core']:GetCoreObject()

local CoolDown = false

RegisterServerEvent('kevin-deliveries:coolout', function()
    CoolDown = true
    local timer = Config.CoolDown
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            CoolDown = false
        end
    end
end)

QBCore.Functions.CreateCallback("kevin-deliveries:coolc",function(source, cb)
    if CoolDown then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('kevin-deliveries:TakeJob', function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('delivery',0)
    TriggerClientEvent('QBCore:Notify', src, "You got a new job..try checking in again", "success", 3000)
end)

QBCore.Functions.CreateCallback('kevin-deliveries:hasPackage', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local hasPackage = Player.Functions.GetItemByName("delivery-box")
    if hasPackage then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('kevin-deliveries:RemovePackage', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem("delivery-box", 1, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["delivery-box"], "remove")
	Wait(2500)
end)

RegisterServerEvent('kevin-deliveries:Payouts', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local pay = data.Payment
    Player.Functions.AddMoney(Config.PaymentMethod, pay, 'Finished Delivery')
	Wait(2500)
end)