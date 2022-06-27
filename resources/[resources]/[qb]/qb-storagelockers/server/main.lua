local QBCore = exports['qb-core']:GetCoreObject()

Config = {}

QBCore.Functions.CreateCallback("qb-storagelockers:server:FetchConfig", function(source, cb)
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    cb(Config.Lockers)
end)

QBCore.Functions.CreateCallback("qb-storagelockers:server:purchaselocker", function(source, cb, v, k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenID = Player.PlayerData.citizenid
    local price = v.price
    local bankMoney = Player.PlayerData.money["bank"]
    if bankMoney >= price then
        Player.Functions.RemoveMoney('bank', price, "Locker Purchased")
        Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        Config.Lockers[k]['isOwned'] = true
        Config.Lockers[k]['owner'] = CitizenID 
        SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
        TriggerClientEvent('qb-storagelockers:client:FetchConfig', -1)
        TriggerClientEvent('qb-storagelockers:client:setupBlips', src)
        cb(bankMoney)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money..', 'error')
        cb(bankMoney)
    end
end)

QBCore.Functions.CreateCallback("qb-storagelockers:server:getData", function(source, cb, locker, data)  --make this a fetch event for everything and then pass through what you wanna fetch
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    cb(Config.Lockers[locker][data])
end)

QBCore.Functions.CreateCallback('qb-storagelockers:server:getOwnedLockers', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ownedLockers = {}
    if Player then
        Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        for k, v in pairs(Config.Lockers) do 
            if Player.PlayerData.citizenid == v["owner"] then
                table.insert(ownedLockers, k)
            end
        end
        if ownedLockers then
            cb(ownedLockers)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent('qb-storagelockers:server:changePasscode')
AddEventHandler('qb-storagelockers:server:changePasscode', function(newPasscode, lockername, lockertable)
    local src = source
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    Config.Lockers[lockername]['password'] = newPasscode
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('qb-storagelockers:client:FetchConfig', -1)
    TriggerClientEvent('QBCore:Notify', src, 'Passcode Changed', 'success')
end)

RegisterNetEvent('qb-storagelockers:server:sellLocker')
AddEventHandler('qb-storagelockers:server:sellLocker', function(lockername, lockertable)
    --add extra checks to make sure they own the locker
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = lockertable.price
    local saleprice = price - ((tonumber(price)/100) * 10)
    Config.Lockers[lockername]['isOwned'] = false
    Config.Lockers[lockername]['owner'] = '' --will this work?
    Player.Functions.AddMoney('bank', saleprice, "Locker Sold")
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('QBCore:Notify', src, 'Locker sold for ' .. saleprice, 'success')
    TriggerClientEvent('qb-storagelockers:client:setupBlips', src)
    TriggerClientEvent('qb-storagelockers:client:FetchConfig', -1)
end)

RegisterNetEvent('qb-storagelockers:server:createPassword')
AddEventHandler('qb-storagelockers:server:createPassword', function(password, locker)
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    Config.Lockers[locker]['password'] = password
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('qb-storagelockers:client:FetchConfig', -1)
end)

QBCore.Commands.Add("locker", "Create a locker at your current location", {{name = "name", help = "Locker name"}, {name = "price", help = "Locker Price"}, {name = "slots", help = "Slots - suggested 30"}, {name = "capactiy", help = "Capacity - suggested 5,000,000"} }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coords = GetEntityCoords(GetPlayerPed(source))
    if Player.PlayerData.job.name == 'realestate' then
        name = args[1]
        price = args[2]
        slots = args[3]
        capacity = args[4]
        newlocker = {
            ["capacity"] = {},
            ["price"] = {},
            ["slots"] = {},
            ["coords"] = {}
        }
        newlocker["price"] = tonumber(price)
        newlocker["capacity"] = tonumber(capacity)
        newlocker["slots"] = tonumber(slots)
        newlocker["coords"] = {x = coords.x, y = coords.y, z = coords.z}
        local currentConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        currentConfig[name] = newlocker
        SaveResourceFile(GetCurrentResourceName(), "lockers.json", json.encode(currentConfig), -1)
        TriggerClientEvent('qb-storagelockers:client:FetchConfig', -1)
    else
        TriggerClientEvent("QBCore:Notify", 'You are not Real Estate Agent!', "error", 5500)
    end
end)