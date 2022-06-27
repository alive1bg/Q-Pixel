local streams = {}
local goProActivated = false

local staticCam = nil
local currentCoords = nil

local function prepareCameraSelf(activating, coords)
	local me = PlayerPedId()
	DetachEntity(me, 1, 1)
	SetEntityCollision(me, not activating, not activating)
	SetEntityInvincible(me, activating)
	-- SetEntityAlpha(me, activating and 0 or 255, 0)
	if activating then
	  NetworkFadeOutEntity(me, activating, false)
	else
	  NetworkFadeInEntity(me, 0, false)
	end
	SetEntityCoords(me, coords)
  end

RegisterNetEvent('rp_vehicles:client:GoPro:attach', function(item, dashType)
	local ply = PlayerPedId()
	local veh = GetVehiclePedIsIn(ply, false)

	if veh == 0 then 
		QBCore.Functions.Notify("You must be in a vehicle.", 'error')
		return
	end
	local isDashCammed = Entity(veh).state.dashcam
	if isDashCammed then
		QBCore.Functions.Notify("This vehicle already has dash cam installed.", 'error')
		return
	end

	if dashType == "pd" and GetVehicleClass(veh) ~= 18 then
		QBCore.Functions.Notify("Not an emergency vehicle.", 'error')
		return
	end

	TriggerServerEvent("QBCore:Server:RemoveItem", item.name, 1, item.slot)
	TriggerServerEvent('rp_vehicles:server:GoPro:CreateStream', VehToNet(veh), dashType)
end)

RegisterNetEvent('rp_vehicles:client:GoPro:AttachCam', function(netID, vehCoords)
	local alreadyActive = goProActivated
	goProActivated = true
	local coords = vector3(vehCoords.x, vehCoords.y, vehCoords.z - 10.0)
	if not alreadyActive then
		staticCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		currentCoords = GetEntityCoords(PlayerPedId())
	end
	prepareCameraSelf(true, coords)
	local veh = 0
	local vehLoopCount = 0
	while veh == 0 and vehLoopCount < 10 do
	  veh = NetworkGetEntityFromNetworkId(netID)
	  vehLoopCount = vehLoopCount + 1
	  if veh == 0 then Wait(250) end
	end
	if veh == 0 then
	  prepareCameraSelf(false, currentCoords)
	  QBCore.Functions.Notify("Vehicle not found", 'error')
	  return
	end
	AttachEntityToEntity(PlayerPedId(), veh, 0, 0.0, 0.0, -40.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0)
	local vehModel = GetEntityModel(veh)
	local camX, camY, camZ = 0.35, -0.5, 0.6
	SetCamFov(staticCam, 90.0)
	DetachCam(staticCam)
	AttachCamToVehicleBone(staticCam,veh,GetEntityBoneIndexByName(veh, "seat_dside_f"),1, 0.0, 0.0, 0.0, camX, camY, camZ, 1)
	if not alreadyActive then
		RenderScriptCams(true, false, 0, 1, 0)
	end

	TriggerEvent('rp_vehicles:client:GoPro:ListenKeypress')
end)

local isListeningKeyPress = false
AddEventHandler('rp_vehicles:client:GoPro:ListenKeypress', function()
	if isListeningKeyPress then return end
	exports.rp_ui:ActionBox({action = 'show', title = nil, text = '[E] Exit Dash Cam', style = nil})
	isListeningKeyPress = true
	while isListeningKeyPress do
		if IsControlJustReleased(0, 38) then
			TriggerEvent('rp_vehicles:server:GoPro:DetachCam')
		end
		Wait(3)
	end
end)

AddEventHandler('rp_vehicles:client:GoPro:viewGoPro', function(data)
	TriggerServerEvent('rp_vehicles:server:GoPro:JoinStream', data)
end)

RegisterNetEvent('rp_vehicles:server:GoPro:DetachCam', function()
	prepareCameraSelf(false, currentCoords)
	RenderScriptCams(false, false, 0, 1, 0)

	exports.rp_ui:ActionBox({action = 'hide'})
	isListeningKeyPress = false

	goProActivated = false
	alreadyActive = false
end)

-- RegisterCommand('exitstream', function(source, args)
-- 	prepareCameraSelf(false, currentCoords)
-- 	RenderScriptCams(false, false, 0, 1, 0)
-- end)