SetDiscordAppId()
SetDiscordRichPresenceAsset('logo_name')

local WaitTime = 5000 -- How often do  you want to update the status (In MS)

local onlinePlayers = 0


Citizen.CreateThread(function()
	while true do
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)

		onlinePlayers = #GetActivePlayers()

		Citizen.Wait(WaitTime)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				  if not IsEntityInArea(PlayerPedId(),2631.851,2572.982,45.096,-2449.445,711.613,264.987,false,false,0) then
           if IsPedSprinting(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/120 | Sprinting down "..StreetName)
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/120 | Running down "..StreetName)
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/120 | Going down "..StreetName)
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/120 | Standing on "..StreetName)
				end
				else
				if IsPedRunning(PlayerPedId()) or GetEntitySpeed(PlayerPedId()) > 2.0 then
					SetRichPresence(onlinePlayers.."/120 | Running scared around "..StreetName)
				elseif not IsPedRunning(PlayerPedId()) and GetEntitySpeed(PlayerPedId()) > 1.0 and GetEntitySpeed(PlayerPedId()) < 2.0 then
					SetRichPresence(onlinePlayers.."/120 | Searching around on your own "..StreetName)
				else
					SetRichPresence(onlinePlayers.."/120 | Relaxing on "..StreetName)
				end
				end
			elseif IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.23693629205)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				if MPH > 50 and not IsPedOnAnyBike(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/120 | Blowing down "..StreetName)
				elseif MPH <= 50 and MPH > 0  then
					SetRichPresence(onlinePlayers.."/120 | Cruising down "..StreetName)
				elseif MPH == 0 then
					SetRichPresence(onlinePlayers.."/120 | Parked on "..StreetName)
				elseif MPH > 50 and IsPedOnAnyBike(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/120 | Driving around near "..StreetName)
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				local KT = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 1.9438444924406046)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) and GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 25.0 and KT>90 then
					SetRichPresence(onlinePlayers.."/120 | Flying over "..StreetName.." in "..VehName)
				elseif IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) and GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) <= 25.0 and KT < 90 and KT>40 and GetLandingGearState(GetVehiclePedIsIn(PlayerPedId(), false)) == 0 then
					SetRichPresence(onlinePlayers.."/120 | Landing at "..StreetName.." in "..VehName)
				elseif GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) <= 25.0 and KT >= 90 and KT < 120 and GetLandingGearState(GetVehiclePedIsIn(PlayerPedId())) == 0 then
					SetRichPresence(onlinePlayers.."/120 | Started taking off at "..StreetName.." in "..VehName)
				else
					SetRichPresence(onlinePlayers.."/120 | Landed at "..StreetName.." in "..VehName)
				end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence(onlinePlayers.."/120 | Swimming around")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				SetRichPresence(onlinePlayers.."/120 | Sailing around with one "..VehName)
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence(onlinePlayers.."/120 | OCEAN MAN 🌊 😍 Take me by the hand ✋ lead me to the land that you understand 🙌 🌊")
			end
		end
	end
end)





-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

--CreateThread(function()
    --while true do
        -- This is the Application ID (Replace this with you own)
	---SetDiscordAppId()

        -- Here you will have to put the image name for the "large" icon.
	--SetDiscordRichPresenceAsset('logo_name')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        --SetDiscordRichPresenceAssetText('This is a lage icon with text')
       
        -- Here you will have to put the image name for the "small" icon.
        --SetDiscordRichPresenceAssetSmall('logo_name')

        -- Here you can add hover text for the "small" icon.
        --SetDiscordRichPresenceAssetSmallText('This is a lsmall icon with text')

        --QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
        --    SetRichPresence('Players: '..result..'/64')
        --end)

        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        --[[ SetDiscordRichPresenceAction(0, "First Button!", "fivem://connect/localhost:30120")
        SetDiscordRichPresenceAction(1, "Second Button!", "fivem://connect/localhost:30120") ]]

        -- It updates every minute just in case.
	--Wait(60000)
    --end
--end)
