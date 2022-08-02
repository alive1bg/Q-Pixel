--[[
---------------------------------------------------
LUXART VEHICLE CONTROL (FOR FIVEM)
---------------------------------------------------
Last revision: MAY 01 2017 (VERS. 1.01)
Coded by Lt.Caine
---------------------------------------------------
NOTES
	LVC will automatically apply to all emergency vehicles (vehicle class 18)
---------------------------------------------------
CONTROLS	
	Right indicator:	=	(Next Custom Radio Track)
	Left indicator:		-	(Previous Custom Radio Track)
	Hazard lights:	Backspace	(Phone Cancel)
	Toggle emergency lights:	Y	(Text Chat Team)
	Airhorn:	E	(Horn)
	Toggle siren:	,	(Previous Radio Station)
	Manual siren / Change siren tone:	N	(Next Radio Station)
	Auxiliary siren:	Down Arrow	(Phone Up)
---------------------------------------------------
]]
local QBCore = exports['qb-core']:GetCoreObject()

local count_bcast_timer = 0
local delay_bcast_timer = 200

local count_sndclean_timer = 0
local delay_sndclean_timer = 400

local actv_ind_timer = false
local count_ind_timer = 0
local delay_ind_timer = 180

local actv_lxsrnmute_temp = false
local srntone_temp = 0
local dsrn_mute = true

local state_indic = {}
local state_lxsiren = {}
local state_pwrcall = {}
local state_airmanu = {}

local ind_state_o = 0
local ind_state_l = 1
local ind_state_r = 2
local ind_state_h = 3

local snd_lxsiren = {}
local snd_pwrcall = {}
local snd_airmanu = {}

-- these models will use their real wail siren, as determined by their assigned audio hash in vehicles.meta
local eModelsWithFireSrn =
{
	"FIRETRUK",
}

-- models listed below will use AMBULANCE_WARNING as auxiliary siren
-- unlisted models will instead use the default wail as the auxiliary siren
local eModelsWithPcall =
{	
	"AMBULANCE",
	"FIRETRUK",
	"LGUARD",
}


---------------------------------------------------------------------
function ShowDebug(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

---------------------------------------------------------------------
function useFiretruckSiren(veh)
	local model = GetEntityModel(veh)
	for i = 1, #eModelsWithFireSrn, 1 do
		if model == GetHashKey(eModelsWithFireSrn[i]) then
			return true
		end
	end
	return false
end

---------------------------------------------------------------------
function usePowercallAuxSrn(veh)
	local model = GetEntityModel(veh)
	for i = 1, #eModelsWithPcall, 1 do
		if model == GetHashKey(eModelsWithPcall[i]) then
			return true
		end
	end
	return false
end

---------------------------------------------------------------------
function CleanupSounds()
	if count_sndclean_timer > delay_sndclean_timer then
		count_sndclean_timer = 0
		for k, v in pairs(state_lxsiren) do
			if v > 0 then
				if not DoesEntityExist(k) or IsEntityDead(k) then
					if snd_lxsiren[k] ~= nil then
						StopSound(snd_lxsiren[k])
						ReleaseSoundId(snd_lxsiren[k])
						snd_lxsiren[k] = nil
						state_lxsiren[k] = nil
					end
				end
			end
		end
		for k, v in pairs(state_pwrcall) do
			if v == true then
				if not DoesEntityExist(k) or IsEntityDead(k) then
					if snd_pwrcall[k] ~= nil then
						StopSound(snd_pwrcall[k])
						ReleaseSoundId(snd_pwrcall[k])
						snd_pwrcall[k] = nil
						state_pwrcall[k] = nil
					end
				end
			end
		end
		for k, v in pairs(state_airmanu) do
			if v == true then
				if not DoesEntityExist(k) or IsEntityDead(k) or IsVehicleSeatFree(k, -1) then
					if snd_airmanu[k] ~= nil then
						StopSound(snd_airmanu[k])
						ReleaseSoundId(snd_airmanu[k])
						snd_airmanu[k] = nil
						state_airmanu[k] = nil
					end
				end
			end
		end
	else
		count_sndclean_timer = count_sndclean_timer + 1
	end
end

---------------------------------------------------------------------
function TogIndicStateForVeh(veh, newstate)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if newstate == ind_state_o then
			SetVehicleIndicatorLights(veh, 0, false) -- R
			SetVehicleIndicatorLights(veh, 1, false) -- L
		elseif newstate == ind_state_l then
			SetVehicleIndicatorLights(veh, 0, false) -- R
			SetVehicleIndicatorLights(veh, 1, true) -- L
		elseif newstate == ind_state_r then
			SetVehicleIndicatorLights(veh, 0, true) -- R
			SetVehicleIndicatorLights(veh, 1, false) -- L
		elseif newstate == ind_state_h then
			SetVehicleIndicatorLights(veh, 0, true) -- R
			SetVehicleIndicatorLights(veh, 1, true) -- L
		end
		state_indic[veh] = newstate
	end
end

---------------------------------------------------------------------
function TogMuteDfltSrnForVeh(veh, toggle)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		DisableVehicleImpactExplosionActivation(veh, toggle)
	end
end

---------------------------------------------------------------------
function SetLxSirenStateForVeh(veh, newstate)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if newstate ~= state_lxsiren[veh] then
				
			if snd_lxsiren[veh] ~= nil then
				StopSound(snd_lxsiren[veh])
				ReleaseSoundId(snd_lxsiren[veh])
				snd_lxsiren[veh] = nil
			end
						
			if newstate == 1 then
				if useFiretruckSiren(veh) then
					TogMuteDfltSrnForVeh(veh, false)
				else
					snd_lxsiren[veh] = GetSoundId()	
					PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_SIREN_1", veh, 0, 0, 0)
					TogMuteDfltSrnForVeh(veh, true)
				end
				
			elseif newstate == 2 then
				snd_lxsiren[veh] = GetSoundId()
				PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_SIREN_2", veh, 0, 0, 0)
				TogMuteDfltSrnForVeh(veh, true)
			
			elseif newstate == 3 then
				snd_lxsiren[veh] = GetSoundId()
				if useFiretruckSiren(veh) then
					PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_AMBULANCE_WARNING", veh, 0, 0, 0)
				else
					PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_POLICE_WARNING", veh, 0, 0, 0)
				end
				TogMuteDfltSrnForVeh(veh, true)
				
			else
				TogMuteDfltSrnForVeh(veh, true)
				
			end				
				
			state_lxsiren[veh] = newstate
		end
	end
end

---------------------------------------------------------------------
function TogPowercallStateForVeh(veh, toggle)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if toggle == true then
			if snd_pwrcall[veh] == nil then
				snd_pwrcall[veh] = GetSoundId()
				if usePowercallAuxSrn(veh) then
					PlaySoundFromEntity(snd_pwrcall[veh], "VEHICLES_HORNS_AMBULANCE_WARNING", veh, 0, 0, 0)
				else
					PlaySoundFromEntity(snd_pwrcall[veh], "VEHICLES_HORNS_SIREN_1", veh, 0, 0, 0)
				end
			end
		else
			if snd_pwrcall[veh] ~= nil then
				StopSound(snd_pwrcall[veh])
				ReleaseSoundId(snd_pwrcall[veh])
				snd_pwrcall[veh] = nil
			end
		end
		state_pwrcall[veh] = toggle
	end
end

---------------------------------------------------------------------
function SetAirManuStateForVeh(veh, newstate)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if newstate ~= state_airmanu[veh] then
				
			if snd_airmanu[veh] ~= nil then
				StopSound(snd_airmanu[veh])
				ReleaseSoundId(snd_airmanu[veh])
				snd_airmanu[veh] = nil
			end
						
			if newstate == 1 then
				snd_airmanu[veh] = GetSoundId()
				if useFiretruckSiren(veh) then
					PlaySoundFromEntity(snd_airmanu[veh], "VEHICLES_HORNS_FIRETRUCK_WARNING", veh, 0, 0, 0)
				else
					PlaySoundFromEntity(snd_airmanu[veh], "SIRENS_AIRHORN", veh, 0, 0, 0)
				end
				
			elseif newstate == 2 then
				snd_airmanu[veh] = GetSoundId()
				PlaySoundFromEntity(snd_airmanu[veh], "VEHICLES_HORNS_SIREN_1", veh, 0, 0, 0)
			
			elseif newstate == 3 then
				snd_airmanu[veh] = GetSoundId()
				PlaySoundFromEntity(snd_airmanu[veh], "VEHICLES_HORNS_SIREN_2", veh, 0, 0, 0)
				
			end				
				
			state_airmanu[veh] = newstate
		end
	end
end


---------------------------------------------------------------------
RegisterNetEvent("lvc_TogIndicState_c")
AddEventHandler("lvc_TogIndicState_c", function(sender, newstate)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				TogIndicStateForVeh(veh, newstate)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_TogDfltSrnMuted_c")
AddEventHandler("lvc_TogDfltSrnMuted_c", function(sender, toggle)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				TogMuteDfltSrnForVeh(veh, toggle)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_SetLxSirenState_c")
AddEventHandler("lvc_SetLxSirenState_c", function(sender, newstate)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				SetLxSirenStateForVeh(veh, newstate)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_TogPwrcallState_c")
AddEventHandler("lvc_TogPwrcallState_c", function(sender, toggle)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				TogPowercallStateForVeh(veh, toggle)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_SetAirManuState_c")
AddEventHandler("lvc_SetAirManuState_c", function(sender, newstate)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				SetAirManuStateForVeh(veh, newstate)
			end
		end
	end
end)



---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
			
			CleanupSounds()
			
			----- IS IN VEHICLE -----
			local playerped = GetPlayerPed(-1)		
			if IsPedInAnyVehicle(playerped, false) then	
			
				----- IS DRIVER -----
				local veh = GetVehiclePedIsUsing(playerped)	
				if GetPedInVehicleSeat(veh, -1) == playerped then
				
					DisableControlAction(0, 84, true) -- INPUT_VEH_PREV_RADIO_TRACK  
					DisableControlAction(0, 83, true) -- INPUT_VEH_NEXT_RADIO_TRACK 
					
					if state_indic[veh] ~= ind_state_o and state_indic[veh] ~= ind_state_l and state_indic[veh] ~= ind_state_r and state_indic[veh] ~= ind_state_h then
						state_indic[veh] = ind_state_o
					end
					
					-- INDIC AUTO CONTROL
					if actv_ind_timer == true then	
						if state_indic[veh] == ind_state_l or state_indic[veh] == ind_state_r then
							if GetEntitySpeed(veh) < 6 then
								count_ind_timer = 0
							else
								if count_ind_timer > delay_ind_timer then
									count_ind_timer = 0
									actv_ind_timer = false
									state_indic[veh] = ind_state_o
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									TogIndicStateForVeh(veh, state_indic[veh])
									count_bcast_timer = delay_bcast_timer
								else
									count_ind_timer = count_ind_timer + 1
								end
							end
						end
					end
					
					
					--- IS EMERG VEHICLE ---
					if GetVehicleClass(veh) == 18 then
						
						local actv_manu = false
						local actv_horn = false
						
						DisableControlAction(0, 86, true) -- INPUT_VEH_HORN	
						DisableControlAction(0, 172, true) -- INPUT_CELLPHONE_UP 
						--DisableControlAction(0, 173, true) -- INPUT_CELLPHONE_DOWN
						--DisableControlAction(0, 174, true) -- INPUT_CELLPHONE_LEFT 
						--DisableControlAction(0, 175, true) -- INPUT_CELLPHONE_RIGHT 
						DisableControlAction(0, 81, true) -- INPUT_VEH_NEXT_RADIO
						DisableControlAction(0, 82, true) -- INPUT_VEH_PREV_RADIO
						DisableControlAction(0, 19, true) -- INPUT_CHARACTER_WHEEL 
						DisableControlAction(0, 85, true) -- INPUT_VEH_RADIO_WHEEL 
						DisableControlAction(0, 80, true) -- INPUT_VEH_CIN_CAM 
					
						SetVehRadioStation(veh, "OFF")
						SetVehicleRadioEnabled(veh, false)
						
						if state_lxsiren[veh] ~= 1 and state_lxsiren[veh] ~= 2 and state_lxsiren[veh] ~= 3 then
							state_lxsiren[veh] = 0
						end
						if state_pwrcall[veh] ~= true then
							state_pwrcall[veh] = false
						end
						if state_airmanu[veh] ~= 1 and state_airmanu[veh] ~= 2 and state_airmanu[veh] ~= 3 then
							state_airmanu[veh] = 0
						end
						
						if useFiretruckSiren(veh) and state_lxsiren[veh] == 1 then
							TogMuteDfltSrnForVeh(veh, false)
							dsrn_mute = false
						else
							TogMuteDfltSrnForVeh(veh, true)
							dsrn_mute = true
						end
						
						if not IsVehicleSirenOn(veh) and state_lxsiren[veh] > 0 then
							PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
							SetLxSirenStateForVeh(veh, 0)
							count_bcast_timer = delay_bcast_timer
						end
						if not IsVehicleSirenOn(veh) and state_pwrcall[veh] == true then
							PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
							TogPowercallStateForVeh(veh, false)
							count_bcast_timer = delay_bcast_timer
						end
					
						----- CONTROLS -----
						if not IsPauseMenuActive() then
						
							-- TOG DFLT SRN LIGHTS
							if IsDisabledControlJustReleased(0, 85) or IsDisabledControlJustReleased(0, 246) then
								if IsVehicleSirenOn(veh) then
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									SetVehicleSiren(veh, false)
								else
									PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									SetVehicleSiren(veh, true)
									count_bcast_timer = delay_bcast_timer
								end		
							
							-- TOG LX SIREN
							elseif IsDisabledControlJustReleased(0, 19) or IsDisabledControlJustReleased(0, 82) then
								local cstate = state_lxsiren[veh]
								if cstate == 0 then
									if IsVehicleSirenOn(veh) then
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- on
										SetLxSirenStateForVeh(veh, 1)
										count_bcast_timer = delay_bcast_timer
									end
								else
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- off
									SetLxSirenStateForVeh(veh, 0)
									count_bcast_timer = delay_bcast_timer
								end
								
							-- POWERCALL
							elseif IsDisabledControlJustReleased(0, 172) then
								if state_pwrcall[veh] == true then
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									TogPowercallStateForVeh(veh, false)
									count_bcast_timer = delay_bcast_timer
								else
									if IsVehicleSirenOn(veh) then
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
										TogPowercallStateForVeh(veh, true)
										count_bcast_timer = delay_bcast_timer
									end
								end
								
							end
							
							-- BROWSE LX SRN TONES
							if state_lxsiren[veh] > 0 then
								if IsDisabledControlJustReleased(0, 80) or IsDisabledControlJustReleased(0, 81) then
									if IsVehicleSirenOn(veh) then
										local cstate = state_lxsiren[veh]
										local nstate = 1
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- on
										if cstate == 1 then
											nstate = 2
										elseif cstate == 2 then
											nstate = 3
										else	
											nstate = 1
										end
										SetLxSirenStateForVeh(veh, nstate)
										count_bcast_timer = delay_bcast_timer
									end
								end
							end
										
							-- MANU
							if state_lxsiren[veh] < 1 then
								if IsDisabledControlPressed(0, 80) or IsDisabledControlPressed(0, 81) then
									actv_manu = true
								else
									actv_manu = false
								end
							else
								actv_manu = false
							end
							
							-- HORN
							if IsDisabledControlPressed(0, 86) then
								actv_horn = true
							else
								actv_horn = false
							end
						
						end
						
						---- ADJUST HORN / MANU STATE ----
						local hmanu_state_new = 0
						if actv_horn == true and actv_manu == false then
							hmanu_state_new = 1
						elseif actv_horn == false and actv_manu == true then
							hmanu_state_new = 2
						elseif actv_horn == true and actv_manu == true then
							hmanu_state_new = 3
						end
						if hmanu_state_new == 1 then
							if not useFiretruckSiren(veh) then
								if state_lxsiren[veh] > 0 and actv_lxsrnmute_temp == false then
									srntone_temp = state_lxsiren[veh]
									SetLxSirenStateForVeh(veh, 0)
									actv_lxsrnmute_temp = true
								end
							end
						else
							if not useFiretruckSiren(veh) then
								if actv_lxsrnmute_temp == true then
									SetLxSirenStateForVeh(veh, srntone_temp)
									actv_lxsrnmute_temp = false
								end
							end
						end
						if state_airmanu[veh] ~= hmanu_state_new then
							SetAirManuStateForVeh(veh, hmanu_state_new)
							count_bcast_timer = delay_bcast_timer
						end	
					end
					
						
					--- IS ANY LAND VEHICLE ---	
					if GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 and GetVehicleClass(veh) ~= 21 then
					
						----- CONTROLS -----
						if not IsPauseMenuActive() then
						
							-- IND L
							if IsDisabledControlJustReleased(0, 84) then -- INPUT_VEH_PREV_RADIO_TRACK
								local cstate = state_indic[veh]
								if cstate == ind_state_l then
									state_indic[veh] = ind_state_o
									actv_ind_timer = false
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								else
									state_indic[veh] = ind_state_l
									actv_ind_timer = true
									PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								end
								TogIndicStateForVeh(veh, state_indic[veh])
								count_ind_timer = 0
								count_bcast_timer = delay_bcast_timer			
							-- IND R
							elseif IsDisabledControlJustReleased(0, 83) then -- INPUT_VEH_NEXT_RADIO_TRACK
								local cstate = state_indic[veh]
								if cstate == ind_state_r then
									state_indic[veh] = ind_state_o
									actv_ind_timer = false
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								else
									state_indic[veh] = ind_state_r
									actv_ind_timer = true
									PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								end
								TogIndicStateForVeh(veh, state_indic[veh])
								count_ind_timer = 0
								count_bcast_timer = delay_bcast_timer
							-- IND H
							elseif IsControlJustReleased(0, 202) then -- INPUT_FRONTEND_CANCEL / Backspace
								if GetLastInputMethod(0) then -- last input was with kb
									local cstate = state_indic[veh]
									if cstate == ind_state_h then
										state_indic[veh] = ind_state_o
										PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									else
										state_indic[veh] = ind_state_h
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									end
									TogIndicStateForVeh(veh, state_indic[veh])
									actv_ind_timer = false
									count_ind_timer = 0
									count_bcast_timer = delay_bcast_timer
								end
							end
						
						end
						
						
						----- AUTO BROADCAST VEH STATES -----
						if count_bcast_timer > delay_bcast_timer then
							count_bcast_timer = 0
							--- IS EMERG VEHICLE ---
							if GetVehicleClass(veh) == 18 then
								TriggerServerEvent("lvc_TogDfltSrnMuted_s", dsrn_mute)
								TriggerServerEvent("lvc_SetLxSirenState_s", state_lxsiren[veh])
								TriggerServerEvent("lvc_TogPwrcallState_s", state_pwrcall[veh])
								TriggerServerEvent("lvc_SetAirManuState_s", state_airmanu[veh])
							end
							--- IS ANY OTHER VEHICLE ---
							TriggerServerEvent("lvc_TogIndicState_s", state_indic[veh])
						else
							count_bcast_timer = count_bcast_timer + 1
						end
					
					end
					
				end
			end
			
		Citizen.Wait(0)
	end
end)

------------- VEHICLE EXTRAS
------ Vehicle Extras ------

function createExtrasMenu()
    extrasMenu = {
        {
            isHeader = true,
            header = 'Veh Extras Controls',
			icon = 'fas fa-car-on'
        },
        {
            header = "Activate Extras",
			txt = "Turn Extra's On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:client:extrasActMenu",
            }
        },
        {
            header = "Deactivate Extras",
			txt = "Turn Extra's Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:client:extrasDeactMenu",
            }
        },
		{
            header = 'Close Menu',
            txt = 'Close whole menu',
			icon = 'fas fa-x',
            params = {
                isServer = false,
                event = exports['qb-menu']:closeMenu(),
            }
        },
    }
    exports['qb-menu']:openMenu(extrasMenu)
end

function createExtrasDeactMenu()
    extrasDeactMenu = {
        {
            isHeader = true,
            header = 'Veh Extras Controls',
			icon = 'fas fa-car-on'
        },
        {
            header = "Extra 1",
			txt = "Turn Extra 1 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 1
            }
        },
        {
            header = "Extra 2",
			txt = "Turn Extra 2 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 3
            }
        },
        {
            header = "Extra 3",
			txt = "Turn Extra 3 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 5
            }
        },
        {
            header = "Extra 4",
			txt = "Turn Extra 4 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 7
            }
        },
        {
            header = "Extra 5",
			txt = "Turn Extra 5 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 9
            }
        },
        {
            header = "Extra 6",
			txt = "Turn Extra 6 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 11
            }
        },
        {
            header = "Extra 7",
			txt = "Turn Extra 7 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 13
            }
        },
        {
            header = "Extra 8",
			txt = "Turn Extra 8 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 15
            }
        },
        {
            header = "Extra 9",
			txt = "Turn Extra 9 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 17
            }
        },
        {
            header = "Extra 10",
			txt = "Turn Extra 10 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 19
            }
        },
        {
            header = "Extra 11",
			txt = "Turn Extra 11 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 21
            }
        },
        {
            header = "Extra 12",
			txt = "Turn Extra 12 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 23
            }
        },
		{
            header = "Extra 13",
			txt = "Turn Extra 13 Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 25
            }
        },
		{
            header = "All Extras",
			txt = "Turn All Extras Off",
			icon = 'fas fa-power-off',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 27
            }
        },
        {
            header = 'Back',
            txt = 'Go Back to Car Control Menu',
			icon = 'fas fa-arrow-rotate-left',
            params = {
                isServer = false,
                event = 'qb-vehiclemenu:client:extrasMenu',
            }
        },
		{
            header = 'Close Menu',
            txt = '',
			icon = 'fas fa-x',
            params = {
                isServer = false,
                event = exports['qb-menu']:closeMenu(),
            }
        },
    }
    exports['qb-menu']:openMenu(extrasDeactMenu)
end

function createExtrasActMenu()
    extrasActMenu = {
        {
            isHeader = true,
            header = 'Veh Extras Controls',
			icon = 'fas fa-car-on'
        },
        {
            header = "Extra 1",
			txt = "Turn Extra 1 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 2
            }
        },
        {
            header = "Extra 2",
			txt = "Turn Extra 2 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 4
            }
        },
        {
            header = "Extra 3",
			txt = "Turn Extra 3 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 6
            }
        },
        {
            header = "Extra 4",
			txt = "Turn Extra 4 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 8
            }
        },
        {
            header = "Extra 5",
			txt = "Turn Extra 6 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 10
            }
        },
        {
            header = "Extra 6",
			txt = "Turn Extra 6 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 12
            }
        },
        {
            header = "Extra 7",
			txt = "Turn Extra 7 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 14
            }
        },
        {
            header = "Extra 8",
			txt = "Turn Extra 8 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 16
            }
        },
        {
            header = "Extra 9",
			txt = "Turn Extra 9 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 18
            }
        },
        {
            header = "Extra 10",
			txt = "Turn Extra 10 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 20
            }
        },
        {
            header = "Extra 11",
			txt = "Turn Extra 11 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 22
            }
        },
        {
            header = "Extra 12",
			txt = "Turn Extra 12 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 24
            }
        },
		{
            header = "Extra 13",
			txt = "Turn Extra 13 On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 26
            }
        },
		{
            header = "All Extras",
			txt = "Turn All Extras On",
			icon = 'fas fa-plug',
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 28
            }
        },
        {
            header = 'Back',
            txt = 'Go Back to Car Control Menu',
			icon = 'fas fa-arrow-rotate-left',
            params = {
                isServer = false,
                event = 'qb-vehiclemenu:client:extrasMenu',
            }
        },
		{
            header = 'Close Menu',
            txt = '',
			icon = 'fas fa-x',
            params = {
                isServer = false,
                event = exports['qb-menu']:closeMenu(),
            }
        },
    }
    exports['qb-menu']:openMenu(extrasActMenu)
end

RegisterNetEvent('qb-vehiclemenu:vehicleExtras', function(args)
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(veh)
    if veh ~= nil then
        if veh == true then
            QBCore.Functions.Notify('Not In A Vehicle..')
        else
            SetVehicleAutoRepairDisabled(veh, true)
            if DoesExtraExist(veh, 1) then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleExtra(veh, 1, 1)
                    QBCore.Functions.Notify('Extra ' .. 1 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 2 then 
                    SetVehicleExtra(veh, 1, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 1 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 2) then
                local args = tonumber(args)
                if args == 3 then 
                    SetVehicleExtra(veh, 2, 1)
                    QBCore.Functions.Notify('Extra ' .. 2 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 4 then 
                    SetVehicleExtra(veh, 2, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 2 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 3) then
                local args = tonumber(args)
                if args == 5 then 
                    SetVehicleExtra(veh, 3, 1)
                    QBCore.Functions.Notify('Extra ' .. 3 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 6 then 
                    SetVehicleExtra(veh, 3, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 3 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 4) then
                local args = tonumber(args)
                if args == 7 then 
                    SetVehicleExtra(veh, 4, 1)
                    QBCore.Functions.Notify('Extra ' .. 4 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 8 then 
                    SetVehicleExtra(veh, 4, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 4 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 5) then
                local args = tonumber(args)
                if args == 9 then 
                    SetVehicleExtra(veh, 5, 1)
                    QBCore.Functions.Notify('Extra ' .. 5 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 10 then 
                    SetVehicleExtra(veh, 5, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 5 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 6) then
                local args = tonumber(args)
                if args == 11 then 
                    SetVehicleExtra(veh, 6, 1)
                    QBCore.Functions.Notify('Extra ' .. 6 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 12 then 
                    SetVehicleExtra(veh, 6, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 6 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 7) then
                local args = tonumber(args)
                if args == 13 then 
                    SetVehicleExtra(veh, 7, 1)
                    QBCore.Functions.Notify('Extra ' .. 7 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 14 then 
                    SetVehicleExtra(veh, 7, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 7 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 8) then
                local args = tonumber(args)
                if args == 15 then 
                    SetVehicleExtra(veh, 8, 1)
                    QBCore.Functions.Notify('Extra ' .. 8 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 16 then 
                    SetVehicleExtra(veh, 8, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 8 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 9) then
                local args = tonumber(args)
                if args == 17 then 
                    SetVehicleExtra(veh, 9, 1)
                    QBCore.Functions.Notify('Extra ' .. 9 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 18 then 
                    SetVehicleExtra(veh, 9, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 9 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 10) then
                local args = tonumber(args)
                if args == 19 then 
                    SetVehicleExtra(veh, 10, 1)
                    QBCore.Functions.Notify('Extra ' .. 10 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 20 then 
                    SetVehicleExtra(veh, 10, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 10 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 11) then
                local args = tonumber(args)
                if args == 21 then 
                    SetVehicleExtra(veh, 11, 1)
                    QBCore.Functions.Notify('Extra ' .. 11 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 22 then 
                    SetVehicleExtra(veh, 11, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 11 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 12) then
                local args = tonumber(args)
                if args == 23 then 
                    SetVehicleExtra(veh, 12, 1)
                    QBCore.Functions.Notify('Extra ' .. 12 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 24 then 
                    SetVehicleExtra(veh, 12, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 12 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
            if DoesExtraExist(veh, 13) then
                local args = tonumber(args)
                if args == 25 then 
                    SetVehicleExtra(veh, 13, 1)
                    QBCore.Functions.Notify('Extra ' .. 13 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasDeactMenu')
                elseif args == 26 then 
                    SetVehicleExtra(veh, 13, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 13 .. ' Activated', 'success', 2500)
                    TriggerEvent('qb-vehiclemenu:client:extrasActMenu')
                end
            end
			if DoesExtraExist(veh) then
				local args = tonumber(args)
				if args == 27 then
					SetVehicleAutoRepairDisabled(true)
					QBCore.Functions.Notify('All extras are Deactivated', 'error', 2500)
					TriggerEvent('qb-vehiclemenu:alldisable')
				elseif args == 28 then 
					SetVehicleAutoRepairDisabled(true)
					QBCore.Functions.Notify('All extras are Activated', 'success', 2500)
					TriggerEvent('qb-vehiclemenu:allenable')
				end
			end
			if not DoesExtraExist(veh) then
				QBCore.Functions.Notify('This extra is not present on this vehicle ', 'error', 2500)
			end
        end
    end
end)

RegisterNetEvent('qb-vehiclemenu:alleExtras', function(args)
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(veh)
	if veh ~= nil then
        if veh == true then
            QBCore.Functions.Notify('Not In A Vehicle..')
        else
			local args = tonumber(args)
			if args == 27 then
				SetVehicleAutoRepairDisabled(true)
				QBCore.Functions.Notify('All extras are Deactivated', 'error', 2500)
				TriggerEvent('qb-vehiclemenu:alldisable')
			elseif args == 28 then 
				SetVehicleAutoRepairDisabled(true)
				QBCore.Functions.Notify('All extras are Activated', 'success', 2500)
				TriggerEvent('qb-vehiclemenu:allenable')
			end
		end
	end
end)

RegisterNetEvent('qb-vehiclemenu:allenable', function()
	local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed)
	SetVehicleAutoRepairDisabled(true)
	if DoesExtraExist(veh, 1) then
    	SetVehicleExtra(veh, 1, 0)
	end
	if DoesExtraExist(veh, 2) then
		SetVehicleExtra(veh, 2, 0)
	end
	if DoesExtraExist(veh, 3) then
		SetVehicleExtra(veh, 3, 0)
	end
	if DoesExtraExist(veh, 4) then
		SetVehicleExtra(veh, 4, 0)
	end
	if DoesExtraExist(veh, 5) then
		SetVehicleExtra(veh, 5, 0)
	end
	if DoesExtraExist(veh, 6) then
		SetVehicleExtra(veh, 6, 0)
	end
	if DoesExtraExist(veh, 7) then
		SetVehicleExtra(veh, 7, 0)
	end
	if DoesExtraExist(veh, 8) then
		SetVehicleExtra(veh, 8, 0)
	end
	if DoesExtraExist(veh, 9) then
		SetVehicleExtra(veh, 9, 0)
	end
	if DoesExtraExist(veh, 10) then
		SetVehicleExtra(veh, 10, 0)
	end
	if DoesExtraExist(veh, 11) then
		SetVehicleExtra(veh, 11, 0)
	end
	if DoesExtraExist(veh, 12) then
		SetVehicleExtra(veh, 12, 0)
	end
	if DoesExtraExist(veh, 13) then
		SetVehicleExtra(veh, 13, 0)
	end
	if DoesExtraExist(veh) then
		QBCore.Functions.Notify('This extra is not present on this vehicle ', 'error', 2500)
	end
end)

RegisterNetEvent('qb-vehiclemenu:alldisable', function()
	local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed)
	SetVehicleAutoRepairDisabled(true)
    SetVehicleExtra(veh, 1, 1)
	SetVehicleExtra(veh, 2, 1)
	SetVehicleExtra(veh, 3, 1)
	SetVehicleExtra(veh, 4, 1)
	SetVehicleExtra(veh, 5, 1)
	SetVehicleExtra(veh, 6, 1)
	SetVehicleExtra(veh, 7, 1)
	SetVehicleExtra(veh, 8, 1)
	SetVehicleExtra(veh, 9, 1)
	SetVehicleExtra(veh, 10, 1)
	SetVehicleExtra(veh, 11, 1)
	SetVehicleExtra(veh, 12, 1)
	SetVehicleExtra(veh, 13, 1)
end)


-- events
RegisterNetEvent('qb-vehiclemenu:client:extrasMenu', function()
	local PlayerPed = PlayerPedId()		
	if IsPedInAnyVehicle(PlayerPed, false) then
		local veh = GetVehiclePedIsUsing(PlayerPed)
		if GetPedInVehicleSeat(veh, -1) == PlayerPed then
			if GetVehicleClass(veh) == 18 then
				createExtrasMenu()
				exports['qb-menu']:openMenu(extrasMenu)
			else
				QBCore.Functions.Notify('Thats not emergency vehicle', 'error', 2500)
			end
		else
			QBCore.Functions.Notify('You have to be on driver seat', 'error', 2500)
		end
	end
end)

RegisterNetEvent('qb-vehiclemenu:client:extrasActMenu', function()
    createExtrasActMenu()
    exports['qb-menu']:openMenu(extrasActMenu)
end)

RegisterNetEvent('qb-vehiclemenu:client:extrasDeactMenu', function()
    createExtrasDeactMenu()
    exports['qb-menu']:openMenu(extrasDeactMenu)
end)