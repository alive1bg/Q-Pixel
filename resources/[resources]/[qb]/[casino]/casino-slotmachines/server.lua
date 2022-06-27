

local QBCore = exports['qb-core']:GetCoreObject()
math.randomseed(os.clock()*100000000000)
math.randomseed(os.clock()*math.random())
math.randomseed(os.clock()*math.random())

local activeSlot = {}

QBCore.Functions.CreateCallback('casino:slots:isSeatUsed',function(source, cb, index)
	if activeSlot[index] ~= nil then
		if activeSlot[index].used then
			cb(true)
		else
			activeSlot[index].used = true
			cb(false)
		end
	else
		activeSlot[index] = {}
		activeSlot[index].used = true
		cb(false)
	end
end) 

RegisterNetEvent('casino:slots:notUsing')
AddEventHandler('casino:slots:notUsing',function(index)
	if activeSlot[index] ~= nil then
		activeSlot[index].used = false
	end
end)


local ItemList = {
    ["casino_whitechip"] = 1
}
QBCore.Functions.CreateCallback('doj:server:whiteChipsAmount', function(source, cb)
    local retval = 0
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    retval = retval + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                end
            end
        end
    end
    cb(retval)
end)

RegisterNetEvent('casino:taskStartSlots')
AddEventHandler('casino:taskStartSlots',function(index, data)
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	local Chips = Player.Functions.GetItemByName("casino_whitechip")
	local minAmount = data.bet
	if Chips ~= nil then 
		if Chips.amount >= minAmount then
			if activeSlot[index] then
				Player.Functions.RemoveItem("casino_whitechip", minAmount)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['casino_whitechip'], "remove", minAmount)
				local w = {a = math.random(1,16),b = math.random(1,16),c = math.random(1,16)}
				local rnd1 = math.random(1,100)
				local rnd2 = math.random(1,100)
				local rnd3 = math.random(1,100)
				if Config.Offset then 
					if rnd1 > 70 then w.a = w.a + 0.5 end
					if rnd2 > 70 then w.b = w.b + 0.5 end
					if rnd3 > 70 then w.c = w.c + 0.5 end
				end
				TriggerClientEvent('casino:slots:startSpin', src, index, w)
				activeSlot[index].win = w
			end 
		else
			return TriggerClientEvent('QBCore:Notify', src, 'You dont have enough white chips', 'error')
		end
	else
		return TriggerClientEvent('QBCore:Notify', src, 'You dont have any white chips', 'error')
	end
end) 


RegisterNetEvent('casino:slotsCheckWin')
AddEventHandler('casino:slotsCheckWin',function(index, data, dt)
	if activeSlot[index] then
		if activeSlot[index].win then
			if activeSlot[index].win.a == data.a
			and activeSlot[index].win.b == data.b
			and activeSlot[index].win.c == data.c then
				CheckForWin(activeSlot[index].win, dt)
			end 
		end
	end
end)

function CheckForWin(w, data)
	local src = source 
	local Player = QBCore.Functions.GetPlayer(source)
	local a = Config.Wins[w.a]
	local b = Config.Wins[w.b]
	local c = Config.Wins[w.c]
	local total = 0
	if a == b and b == c and a == c then
		if Config.Mult[a] then
			total = data.bet*Config.Mult[a]
		end		
	elseif a == '6' and b == '6' then
		total = data.bet*5
	elseif a == '6' and c == '6' then
		total = data.bet*5
	elseif b == '6' and c == '6' then
		total = data.bet*5
		
	elseif a == '6' then
		total = data.bet*2
	elseif b == '6' then
		total = data.bet*2
	elseif c == '6' then
		total = data.bet*2
	end
	if total > 0 then
		
		if Player.Functions.AddItem('casino_whitechip', total, nil, {["quality"] = 100}) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["casino_whitechip"], "add", total)
			TriggerClientEvent('QBCore:Notify', src, "You Won "..total.." whitechip casino chips!")
		else
			TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
		end

	else
		TriggerClientEvent('QBCore:Notify', src, "You Lost, Better luck next time!", 'error')
	end
end

