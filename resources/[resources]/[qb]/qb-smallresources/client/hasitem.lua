QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("robbery:client:hasTV")
AddEventHandler("robbery:client:hasTV", function()
	local ped = PlayerPedId()

	QBCore.Functions.TriggerCallback('robbery:server:hasTV', function(hasItems)
		if hasItems then
			TriggerEvent('animations:client:EmoteCommandStart', {"tv"})
			holdingBox = true
		elseif holdingBox and not hasItems then
			TriggerEvent('animations:client:EmoteCommandStart', {"tv"})
			Wait(250)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			holdingBox = false
		end
	end)
	QBCore.Functions.TriggerCallback('robbery:server:hasSafe', function(hasItems)
		if hasItems then
			TriggerEvent('animations:client:EmoteCommandStart', {"stolensafe"})
			holdingSafe = true
		elseif holdingSafe and not hasItems then
			TriggerEvent('animations:client:EmoteCommandStart', {"stolensafe"})
			Wait(250)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			holdingSafe = false
		end
	end)
end)