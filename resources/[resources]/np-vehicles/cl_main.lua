isLoggedIn = false

CreateThread(function()
    if LocalPlayer.state['isLoggedIn'] then
        isLoggedIn = true
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
end)

--Handling all the vehicle data for seatbelt, harness, that good fun shit
VehicleData = {
	seatbelt = false,
	harness = false,
	cruise = false,
	engine = false,
	stalledVehicle = 0,
	damagedEngine = false
}