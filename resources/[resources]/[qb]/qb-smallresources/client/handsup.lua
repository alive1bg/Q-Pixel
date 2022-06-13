--[[ local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false

RegisterKeyMapping('hu', 'Put your hands up', 'KEYBOARD', '=')

RegisterCommand('hu', function()
    local ped = PlayerPedId()
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
    handsup = not handsup
    if exports['qb-policejob']:IsHandcuffed() then return end
    if handsup then
        TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                CreateThread(function()
                    while handsup do
                        Wait(1)
                        DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0,21,true) -- disable sprint
                        DisableControlAction(0,24,true) -- disable attack
                        DisableControlAction(0,25,true) -- disable aim
                        DisableControlAction(0,47,true) -- disable weapon
                        DisableControlAction(0,58,true) -- disable weapon
                        DisableControlAction(0,71,true) -- veh forward
                        DisableControlAction(0,72,true) -- veh backwards
                        DisableControlAction(0,63,true) -- veh turn left
                        DisableControlAction(0,64,true) -- veh turn right
                        DisableControlAction(0,263,true) -- disable melee
                        DisableControlAction(0,264,true) -- disable melee
                        DisableControlAction(0,257,true) -- disable melee
                        DisableControlAction(0,140,true) -- disable melee
                        DisableControlAction(0,141,true) -- disable melee
                        DisableControlAction(0,142,true) -- disable melee
                        DisableControlAction(0,143,true) -- disable melee
                        DisableControlAction(0,75,true) -- disable exit vehicle
                        DisableControlAction(27,75,true) -- disable exit vehicle
                    end
                end)
            end
        end
    else
        ClearPedTasks(ped)
    end
end, false) ]]

local handsup = false
local surrender = false

CreateThread(function()
	while true do
		Wait(5)
		local playerPed = PlayerPedId()
		if IsControlJustPressed(0, 38) and IsInputDisabled(2) then
			Citizen.Wait(100)
			if not IsPedInAnyVehicle(playerPed) then 
				RequestAnimDict("random@arrests@busted")
				while not HasAnimDictLoaded("random@arrests@busted") do 
					Wait(100)
				end
				if surrender then
					handsup = false
					surrender = false
					ClearPedTasks(playerPed)
				elseif handsup then
					surrender = true
					TaskPlayAnim(playerPed, "random@arrests@busted", "idle_a", 2.0, 2.5, -1, 3, 0, 0, 0, 0)
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(5)
		local playerPed = PlayerPedId()
		if IsControlJustPressed(0, 73) and IsInputDisabled(2) then
			Citizen.Wait(100)
			if not IsPedInAnyVehicle(playerPed) then 
				RequestAnimDict('missminuteman_1ig_2')
				while not HasAnimDictLoaded('missminuteman_1ig_2') do
					Wait(100)
				end
				if handsup then
					handsup = false
					ClearPedSecondaryTask(playerPed)
				else
					handsup = true
					TaskPlayAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
				end
			end

			TriggerEvent("debug", 'Handsup: ' .. (handsup and 'Enabled' or 'Disabled'), (handsup and 'success' or 'error'))
		end
	end
end)
