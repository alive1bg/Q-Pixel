RegisterNetEvent('np-vehicles:server:ejectPassengers', function(pID, pVelocity)
	if pID ~= nil then
        if GetPlayerPed(pID) ~= nil then
            TriggerClientEvent('np-vehicles:client:ejectPassengers', pID, pVelocity)
        end
    end
end)

QBCore.Functions.CreateCallback('np-vehicles:server:fetchClass', function(souce, cb, plate)
	cb(nil)
	--SetEntityDistanceCullingRadius(entity --[[ Entity ]], radius --[[ number ]])
	print("Retured")
end)

local function FetchVehicleByPlate(plate)
	local vehs = GetAllVehicles()
	for i = 1, #vehs do
		local vehPlate = QBCore.Shared.Trim(GetVehicleNumberPlateText(vehs[i]))
		if plate:upper() == vehPlate then
			return vehs[i]
		end
	end

	return false
end

exports('FetchVehicleByPlate', FetchVehicleByPlate)