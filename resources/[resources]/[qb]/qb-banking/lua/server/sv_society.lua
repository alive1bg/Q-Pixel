function Getmanagement_funds(name)
    local result = MySQL.Sync.fetchAll('SELECT * FROM management_funds WHERE name= ?', {name}) --exports['ghmattimysql']:execute("SELECT * FROM `management_funds` WHERE `name` ='"..name.."' ")
    local data = result[1]

    return data
end


RegisterNetEvent('qb-banking:management_funds:server:WithdrawMoney')
AddEventHandler('qb-banking:management_funds:server:WithdrawMoney', function(pSource, a, n)
    local src = pSource
    if not src then return end

    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end

    if not a then return end
    if not n then return end

    local s = Getmanagement_funds(n)
    local sMoney = tonumber(s.money)
    local amount = tonumber(a)
    local withdraw = sMoney - amount

    local setter = MySQL.Sync.fetchAll("UPDATE management_funds SET money =  ? WHERE name = ?", {withdraw, n})
end)

RegisterServerEvent('qb-banking:management_funds:server:DepositMoney')
AddEventHandler('qb-banking:management_funds:server:DepositMoney', function(pSource, a, n)
    local src = pSource
    if not src then return end

    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end

    if not a then return end
    if not n then return end

    local s = Getmanagement_funds(n)
    local sMoney = tonumber(s.money)
    local amount = tonumber(a)
    local deposit = sMoney + amount

    
    local setter = MySQL.Sync.fetchAll("UPDATE management_funds SET money =  ? WHERE name = ?", {deposit, n})
end)