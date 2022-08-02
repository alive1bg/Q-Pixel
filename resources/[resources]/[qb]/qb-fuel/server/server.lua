-- Variables

local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function GlobalTax(value)
	local tax = (value / 100 * Config.GlobalTax)
	return tax
end

-- Server Events

RegisterNetEvent("qb-fuel:server:OpenMenu", function (amount, inGasStation, hasWeapon)
	local src = source
	if not src then return end
	local player = QBCore.Functions.GetPlayer(src)
	if not player then return end
	local tax = GlobalTax(amount)
	local total = math.ceil(amount + tax)
	if inGasStation == true and not hasWeapon then
		TriggerClientEvent('qb-menu:client:openMenu', src, {
			{
				header = 'Gas Station',
				txt = 'The total cost is going to be: $'..total..' including taxes.' ,
				params = {
					event = "qb-fuel:client:RefuelVehicle",
					args = total,
				}
			},
		})
	else
		TriggerClientEvent('qb-menu:client:openMenu', src, {
			{
				header = 'Jerry Can Fuel',
				txt = 'Refuel from jerry can' ,
				params = {
					event = "qb-fuel:client:RefuelVehicle",
					args = total,
				}
			},
		})
	end
end)

QBCore.Functions.CreateCallback('qb-fuel:server:fuelCan', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local itemData = Player.Functions.GetItemByName("weapon_petrolcan")
    cb(itemData)
end)

RegisterNetEvent("qb-fuel:server:PayForFuel", function (amount)
	local src = source
	if not src then return end
	local player = QBCore.Functions.GetPlayer(src)
	if not player then return end
	player.Functions.RemoveMoney('cash', amount)
end)
