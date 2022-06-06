local checkState = false

RegisterNetEvent("playerSpawned")
AddEventHandler("playerSpawned", function()
	if not checkState then
		ShutdownLoadingScreenNui()
		checkState = true
		TriggerEvent("base:disableLoading")
	end
end)

CreateThread(function()
	SetNuiFocus(true, false)
end)