local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-pawnshop:sellGoods", function()
    local src = source;
    local Player = QBCore.Functions.GetPlayer(src);
    local price = 0;

    for k, v in next, Player.PlayerData.items do
        for i=1, #Config.Sells do
            local data = Config.Sells[i];
            if data.item == v.name then
                price = price + (data.price * v.amount);
                Player.Functions.RemoveItem(v.name, v.amount, k);
                break
            end
        end
    end

    Player.Functions.AddMoney("cash", price);
    TriggerClientEvent("QBCore:Notify", src, "You are sold your goods and received $" .. price .. ".")
end)

RegisterCommand('fg', function()
    local x = 1;
    print(x += 8);
    x += 8;
    print(x)

    local y = { a = 'a', b = 'b' };
    local a, b in y;
    print(a, b)
end);