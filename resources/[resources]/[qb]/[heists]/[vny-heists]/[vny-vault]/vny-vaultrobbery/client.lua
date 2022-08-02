local QBCore = exports['qb-core']:GetCoreObject()

if Veny.Framework == "qbold" then
	QBCore = nil
	
	CreateThread(function()
		while QBCore == nil do
			TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
			Wait(0)
		end
		while QBCore.Functions.GetPlayerData().job == nil do
			Wait(10)
		end
		PlayerData = QBCore.Functions.GetPlayerData()
	end)
	
	RegisterNetEvent('QBCore:Client:OnJobUptade')
	AddEventHandler('QBCore:Client:OnJobUptade', function(job)
		PlayerData.job = job
	end)
	
	
	
	local ilkkapi = false
	local ikincikapi = false
	local vaultdoor = false
	local vaultdoor2xd = false
	
	RegisterNetEvent("pacific:ptfxparticle")
	AddEventHandler("pacific:ptfxparticle", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(257.511, 221.387, 106.284)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	
	RegisterNetEvent("pacific:ptfxparticlesec")
	AddEventHandler("pacific:ptfxparticle", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(253.000, 221.653, 101.683)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	
	function animation()
		local ped = PlayerPedId()
		SetEntityHeading(ped, -90.00)
	
		local animDict = "anim@heists@ornate_bank@hack"
		RequestAnimDict(animDict)
		RequestModel("hei_prop_hst_laptop")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestModel("hei_prop_heist_card_hack_02")
		while not HasAnimDictLoaded(animDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(100)
		end
		local ped = PlayerPedId()
		local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
	
		local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
		local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
		local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
	
		--FreezeEntityPosition(ped, true)
		local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
		-- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
		NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
	
		local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
		Wait(200)
		NetworkStartSynchronisedScene(netScene)
		Wait(6300)
		NetworkStartSynchronisedScene(netScene2)
		Wait(2000)
		Wait(1500)
		local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(netScene3)
		Wait(4600)
		NetworkStopSynchronisedScene(netScene3)
		DeleteObject(laptop)
		--FreezeEntityPosition(ped, false)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		if Veny.UseNPDoors == true then
		TriggerServerEvent("shx-doors:alterlockstate", 101)
		elseif Veny.UseNPDoors == false then
		TriggerServerEvent('qb-doorlock:server:updateState', 3, false, false, false, true, false, false)
		end
	end
	
	function animation2()
		local ped = PlayerPedId()
		-- SetEntityCoords(ped, 253.123, 228.336, 101.683, 1, 0, 0, 1)
		-- SetEntityHeading(ped, -90.00)
		
		local animDict = "anim@heists@ornate_bank@hack"
		RequestAnimDict(animDict)
		RequestModel("hei_prop_hst_laptop")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestModel("hei_prop_heist_card_hack_02")
		while not HasAnimDictLoaded(animDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(100)
		end
		local ped = PlayerPedId()
		local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
	
		local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
		local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
		local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
	
		--FreezeEntityPosition(ped, true)
		local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
		-- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
		NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
	
		local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
		Wait(200)
		NetworkStartSynchronisedScene(netScene)
		Wait(6300)
		NetworkStartSynchronisedScene(netScene2)
		Wait(2000)
		Wait(1500)
		local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(netScene3)
		Wait(4600)
		NetworkStopSynchronisedScene(netScene3)
		DeleteObject(laptop)
		--FreezeEntityPosition(ped, false)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		TriggerServerEvent("utk_oh:openvault", 1)
	end
	
	
	
	RegisterNetEvent("utk_oh:vault")
	AddEventHandler("utk_oh:vault", function(method)
		local PlayerPos = GetEntityCoords(PlayerPedId())
		local obj = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 10.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
		local count = 0
	
		if method == 1 then
			repeat
				local rotation = GetEntityHeading(obj) - 0.05
	
				SetEntityHeading(obj, rotation)
				count = count + 1
				Wait(10)
			until count == 1100
		else
			repeat
				local rotation = GetEntityHeading(obj) + 0.05
	
				SetEntityHeading(obj, rotation)
				count = count + 1
				Wait(10)
			until count == 1100
		end
		FreezeEntityPosition(obj, true)
	end)
	
	RegisterNetEvent("utk_oh:vaultsound")
	AddEventHandler("utk_oh:vaultsound", function()
		local plyCoords = GetEntityCoords(PlayerPedId())
		local x,y,z = 253.581, 225.167, 101.876
		local count = 0
		if GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false) <= 10 then
			repeat
				PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
				Wait(900)
				count = count + 1
			until count == 17
		end
	end)
		
	RegisterNetEvent("utk_oh:openvault_c")
	AddEventHandler("utk_oh:openvault_c", function(method)
		TriggerEvent("utk_oh:vault", method)
		TriggerEvent("utk_oh:vaultsound")
	end)
	local disableinput = false
	function DisableControl() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end
	CreateThread(function()
		if disableinput then
			DisableControl()
		else
			Wait(500)
		end
	end)
	
	function SpawnTrolleys(data, name)
		RequestModel("ch_prop_ch_cash_trolly_01c")
		while not HasModelLoaded("ch_prop_ch_cash_trolly_01c") do
			Wait(1)
		end
		RequestModel("ch_prop_gold_trolly_01c")
		while not HasModelLoaded("ch_prop_gold_trolly_01c") do
			Wait(1)
		end
		Trolley1 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 260.331, 214.040, 100.683, 1, 1, 0)
		Trolley2 = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 263.709, 215.525, 100.683, 1, 1, 0)
		Trolley3 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 262.944, 213.291, 100.683, 1, 1, 0)
		local h1 = GetEntityHeading(Trolley1)
		local h2 = GetEntityHeading(Trolley2)
		local h3 = GetEntityHeading(Trolley3)

		SetEntityHeading(Trolley1, 43.26)
		SetEntityHeading(Trolley2, 90.00)
		SetEntityHeading(Trolley3, 43.26)
		done = false

		exports[Veny.TargetScript]:AddBoxZone("pacificfirst", vector3(260.331, 214.040, 100.683), 0.4, 0.6, {
			name="pacificfirst",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:firsttrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
		
		exports[Veny.TargetScript]:AddBoxZone("pacificsecond", vector3(263.709, 215.525, 100.683), 0.4, 0.6, {
			name="pacificsecond",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:secondtrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
		
		exports[Veny.TargetScript]:AddBoxZone("pacificthird", vector3(262.944, 213.291, 100.683), 0.4, 0.6, {
			name="pacificthird",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:thirdtrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
	end
	
	AddEventHandler("onResourceStop", function()
		local xd1 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_ch_cash_trolly_01c"), 0, 0, 0)
		local xd2 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_ch_cash_trolly_01c"), 0, 0, 0)
		local xd3 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_gold_trolly_01c"), 0, 0, 0)
		SetEntityAsMissionEntity(xd1, 1, 1)
		SetEntityAsMissionEntity(xd2, 1, 1)
		SetEntityAsMissionEntity(xd3, 1, 1)
		Wait(0)
		DeleteObject(xd1)
		while DoesEntityExist(xd1) do
			Wait(1)
			DeleteObject(xd1)
		end
	
		DeleteObject(xd2)
		while DoesEntityExist(xd2) do
			Wait(1)
			DeleteObject(xd2)
		end
	
		DeleteObject(xd3)
		while DoesEntityExist(xd3) do
			Wait(1)
			DeleteObject(xd3)
		end
	end)
	
	
	local ilktrolley = false
	local ikincitrolley = false
	local ucuncutrolley = false
	RegisterNetEvent("pacific:firsttrolley")
	AddEventHandler("pacific:firsttrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_cash_pile"
		local playercoords = GetEntityCoords(ped)
		local firsttrolley = vector3(260.331, 214.040, 100.683) 
		if #(playercoords - firsttrolley) < 2.0 and not ilktrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificfirst")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
								TriggerServerEvent("ld-heists:fleeca:rewardCash")
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			DeleteObject(trollyobj)
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ilktrolley = true
			TriggerServerEvent("pacific:addmoney")
			
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	RegisterNetEvent("pacific:secondtrolley")
	AddEventHandler("pacific:secondtrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_gold_bar"
		local playercoords = GetEntityCoords(ped)
		local secondtrolley = vector3(263.709, 215.525, 100.683) 
		if #(playercoords - secondtrolley) < 2.0 and not ikincitrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificsecond")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_gold_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			DeleteObject(trollyobj)
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ikincitrolley = true
			TriggerServerEvent("pacific:addgoldbar")
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	RegisterNetEvent("pacific:thirdtrolley")
	AddEventHandler("pacific:thirdtrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_cash_pile"
		local playercoords = GetEntityCoords(ped)
		local thirdtrolley = vector3(262.944, 213.291, 100.683) 
		if #(playercoords - thirdtrolley) < 2.0 and not ucuncutrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificthird")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
								TriggerServerEvent("ld-heists:fleeca:rewardCash")
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			DeleteObject(trollyobj)
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ucuncutrolley = true
			TriggerServerEvent("pacific:addmoney")
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	
	
	local ilkapi = false
	local ikincikapi = false
	local vaultdoor = false
	local vaultdoor2xd = false
	
	
	RegisterNetEvent('pacific:firstdoor')
	AddEventHandler('pacific:firstdoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local firstdoorlocs = vector3(257.258, 220.184, 106.284)
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		if #(playercoords - firstdoorlocs) < 3.0 and not ilkkapi then
			TaskGoStraightToCoord(PlayerPedId(), 257.156, 219.600, 106.286, 1.0, -1, 337.84, 0.0)
			Wait(4500)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g1")
				-- SetEntityHeading(ped, 180.52)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(257.515, 220.164, 106.284, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 257.515, 220.164, 106.284,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserver", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 257.511, 221.387, 106.284, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
				TriggerServerEvent("shx-doors:alterlockstate", 100)
				elseif Veny.UseNPDoors == false then
				TriggerServerEvent('qb-doorlock:server:updateState', 1, false, false, false, true, false, false)
				end
				
				ilkkapi = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				ilkkapi = false
			end)
		end
		
	end)
	
	
	RegisterNetEvent('pacific:seconddoor')
	AddEventHandler('pacific:seconddoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local seconddoorlocs = vector3(261.943, 223.131, 106.284)
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		if ilkkapi and #(playercoords - seconddoorlocs) < 3.0 and not ikincikapi then
			TaskGoStraightToCoord(PlayerPedId(), 261.609, 223.283, 106.284, 1.0, -1, 248.95, 0.0)
			Wait(2500)
			exports['hacking']:OpenHackingGame(function(Success)
				if Success then
					print("well done g")
					animation()
					
					ikincikapi = true
				else
					ikincikapi = false
				end 
			end)
		end
	end)
	
	RegisterNetEvent('pacific:vaultdoor')
	AddEventHandler('pacific:vaultdoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoorlocs = vector3(253.257, 228.383, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		if not vaultdoor and #(playercoords - vaultdoorlocs) < 3.0 then
			TaskGoStraightToCoord(PlayerPedId(), 253.447, 228.289, 101.683, 1.0, -1, 69.15, 0.0)
			Wait(5000)
			-- SetEntityCoords(PlayerPedId(), 253.257, 228.383, 101.683)
			exports['hacking']:OpenHackingGame(function(Success)
				if Success then
					print("well done g")
					animation2()
					SpawnTrolleys()
					-- refreshVaultDoor()
					vaultdoor = true
				else
					vaultdoor = false
				end
			end)
		end
	end)
	-- vaultdoor and not vaultdoor2xd and 
	RegisterNetEvent('pacific:vaultdoor2')
	AddEventHandler('pacific:vaultdoor2', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoor2 = vector3(252.963, 221.078, 101.683)
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		
		if  not vaultdoor2xd and #(playercoords - vaultdoor2) < 3.0  then
			TaskGoStraightToCoord(PlayerPedId(), 252.963, 221.078, 101.683, 1.0, -1, 161.91, 0.0)
			Wait(4000)
			if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
				local pos = GetEntityCoords(PlayerPedId())
				TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
			end
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				
				-- SetEntityCoords(PlayerPedId(), 253.050, 221.086, 101.683)
				SetEntityHeading(ped, 180.00)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(252.970, 220.700, 101.683, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 252.970, 220.700, 101.683,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserversec", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 253.000, 221.653, 101.683, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
				TriggerServerEvent("shx-doors:alterlockstate", 103)
				elseif Veny.UseNPDoors == false then
				TriggerServerEvent('qb-doorlock:server:updateState', 3, false, false, false, true, false, false)
				end
				
				vaultdoor2xd = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				vaultdoor2xd = false
			end)
		end
	end)
	local vaultdoor3qwe = false
	RegisterNetEvent('pacific:vaultdoor3')
	AddEventHandler('pacific:vaultdoor3', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoor3 = vector3(261.408, 215.673, 101.683)
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		
		if not vaultdoor3qwe and #(playercoords - vaultdoor3) < 3.0  then
			TaskGoStraightToCoord(PlayerPedId(), 261.176, 215.768, 101.683, 1.0, -1, 247.98, 0.0)
			Wait(4000)
			if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
				local pos = GetEntityCoords(PlayerPedId())
				TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
			end
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				
				-- SetEntityCoords(PlayerPedId(), 253.050, 221.086, 101.683)
				-- SetEntityHeading(ped, 180.00)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(261.600, 215.590, 101.683, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 261.600, 215.590, 101.683,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserverthird", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 261.748, 216.586, 101.683, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
				TriggerServerEvent("shx-doors:alterlockstate", 104)
				elseif Veny.UseNPDoors == false then
				TriggerServerEvent('qb-doorlock:server:updateState', 4, false, false, false, true, false, false)
				end
				vaultdoor3qwe = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				vaultdoor3qwe = false
			end)
		end
	end)
	
	RegisterNetEvent("pacific:ptfxparticlethird")
	AddEventHandler("pacific:ptfxparticlethird", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(261.748, 216.586, 101.683)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	RegisterNetEvent("pacific:checkclient")
	AddEventHandler("pacific:checkclient", function()

		local coords = GetEntityCoords(PlayerPedId())
		local dst1 = GetDistanceBetweenCoords(coords, Veny.StartLocs.doors1.startloc.x, Veny.StartLocs.doors1.startloc.y, Veny.StartLocs.doors1.startloc.z, true)
		if dst1 <= 2 then
			TriggerServerEvent("pacific:checker")
		end

	end)

	CreateThread(function()
		while true do
			sleep = 1000
			if ucuncutrolley and ikincitrolley and ilktrolley then
				sleep = 0
				TriggerEvent("pacific:resettimeman")
				break
			end
			Wait(sleep)
		end
	end)
			
	RegisterNetEvent("pacific:resettimeman")
	AddEventHandler("pacific:resettimeman", function()
		TriggerEvent("notification", "Security systems will be back online in 10 minutes!", 2)
		Wait(600000)
		TriggerServerEvent("pacific:ggwps")
	end)
		
	RegisterNetEvent("pacific:resetdoorsmf_cl")
	AddEventHandler("pacific:resetdoorsmf_cl", function()
		----------
		local obj3 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 50.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
		local count3 = 0
		repeat
			local rotation3 = GetEntityHeading(obj3) + 0.05

			SetEntityHeading(obj3, rotation3)
			count3 = count3 + 1
			Wait(10)
		until count3 == 1100
		----------
		TriggerServerEvent("shx-doors:alterlockstate", 104)
		TriggerServerEvent("shx-doors:alterlockstate", 103)
		TriggerServerEvent("shx-doors:alterlockstate", 100)
		TriggerServerEvent("shx-doors:alterlockstate", 101)
	end)
	
end
	
if Veny.Framework == "qbnew" then
	
	local QBCore = exports['qb-core']:GetCoreObject()
	
	
	RegisterNetEvent('QBCore:Client:OnJobUptade')
	AddEventHandler('QBCore:Client:OnJobUptade', function(job)
		PlayerData.job = job
	end)
	
	
	
	local ilkkapi = false
	local ikincikapi = false
	local vaultdoor = false
	local vaultdoor2xd = false
	
	RegisterNetEvent("pacific:ptfxparticle")
	AddEventHandler("pacific:ptfxparticle", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(257.511, 221.387, 106.284)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	
	RegisterNetEvent("pacific:ptfxparticlesec")
	AddEventHandler("pacific:ptfxparticle", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(253.000, 221.653, 101.683)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	
	function animation()
		local ped = PlayerPedId()
		SetEntityHeading(ped, -90.00)
	
		local animDict = "anim@heists@ornate_bank@hack"
		RequestAnimDict(animDict)
		RequestModel("hei_prop_hst_laptop")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestModel("hei_prop_heist_card_hack_02")
		while not HasAnimDictLoaded(animDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(100)
		end
		local ped = PlayerPedId()
		local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
	
		local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
		local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
		local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
	
		--FreezeEntityPosition(ped, true)
		local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
		-- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
		NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
	
		local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
		Wait(200)
		NetworkStartSynchronisedScene(netScene)
		Wait(6300)
		NetworkStartSynchronisedScene(netScene2)
		Wait(2000)
		Wait(1500)
		local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(netScene3)
		Wait(4600)
		NetworkStopSynchronisedScene(netScene3)
		DeleteObject(laptop)
		--FreezeEntityPosition(ped, false)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		if Veny.UseNPDoors == true then
			TriggerServerEvent("shx-doors:alterlockstate", 101)
		elseif Veny.UseNPDoors == false then
			TriggerServerEvent('qb-doorlock:server:updateState', 2, false, false, false, true, false, false)
		end
		
	end
	
	function animation2()
		local ped = PlayerPedId()
		-- SetEntityCoords(ped, 253.123, 228.336, 101.683, 1, 0, 0, 1)
		-- SetEntityHeading(ped, -90.00)
		
		local animDict = "anim@heists@ornate_bank@hack"
		RequestAnimDict(animDict)
		RequestModel("hei_prop_hst_laptop")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestModel("hei_prop_heist_card_hack_02")
		while not HasAnimDictLoaded(animDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(100)
		end
		local ped = PlayerPedId()
		local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
	
		local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
		local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
		local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
	
		--FreezeEntityPosition(ped, true)
		local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
		-- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
		NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
	
		local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
		Wait(200)
		NetworkStartSynchronisedScene(netScene)
		Wait(6300)
		NetworkStartSynchronisedScene(netScene2)
		Wait(2000)
		Wait(1500)
		local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(netScene3)
		Wait(4600)
		NetworkStopSynchronisedScene(netScene3)
		DeleteObject(laptop)
		--FreezeEntityPosition(ped, false)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		TriggerServerEvent("utk_oh:openvault", 1)
	end
	
	
	
	RegisterNetEvent("utk_oh:vault")
	AddEventHandler("utk_oh:vault", function(method)
		local PlayerPos = GetEntityCoords(PlayerPedId())
		local obj = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 10.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
		local count = 0
	
		if method == 1 then
			repeat
				local rotation = GetEntityHeading(obj) - 0.05
	
				SetEntityHeading(obj, rotation)
				count = count + 1
				Wait(10)
			until count == 1100
		else
			repeat
				local rotation = GetEntityHeading(obj) + 0.05
	
				SetEntityHeading(obj, rotation)
				count = count + 1
				Wait(10)
			until count == 1100
		end
		FreezeEntityPosition(obj, true)
	end)
	
	RegisterNetEvent("utk_oh:vaultsound")
	AddEventHandler("utk_oh:vaultsound", function()
		local plyCoords = GetEntityCoords(PlayerPedId())
		local x,y,z = 253.581, 225.167, 101.876
		local count = 0
		if GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false) <= 10 then
			repeat
				PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
				Wait(900)
				count = count + 1
			until count == 17
		end
	end)
		
	RegisterNetEvent("utk_oh:openvault_c")
	AddEventHandler("utk_oh:openvault_c", function(method)
		TriggerEvent("utk_oh:vault", method)
		TriggerEvent("utk_oh:vaultsound")
	end)
	local disableinput = false
	function DisableControl() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end
	CreateThread(function()
		if disableinput then
			DisableControl()
		else
			Wait(500)
		end
	end)
	
	function SpawnTrolleys(data, name)
		RequestModel("ch_prop_ch_cash_trolly_01c")
		while not HasModelLoaded("ch_prop_ch_cash_trolly_01c") do
			Wait(1)
		end
		RequestModel("ch_prop_gold_trolly_01c")
		while not HasModelLoaded("ch_prop_gold_trolly_01c") do
			Wait(1)
		end
		Trolley1 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 260.331, 214.040, 100.683, 1, 1, 0)
		Trolley2 = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 263.709, 215.525, 100.683, 1, 1, 0)
		Trolley3 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 262.944, 213.291, 100.683, 1, 1, 0)
		local h1 = GetEntityHeading(Trolley1)
		local h2 = GetEntityHeading(Trolley2)
		local h3 = GetEntityHeading(Trolley3)

		SetEntityHeading(Trolley1, 43.26)
		SetEntityHeading(Trolley2, 90.00)
		SetEntityHeading(Trolley3, 43.26)
		done = false

		exports[Veny.TargetScript]:AddBoxZone("pacificfirst", vector3(260.331, 214.040, 100.683), 0.4, 0.6, {
			name="pacificfirst",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:firsttrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
		
		exports[Veny.TargetScript]:AddBoxZone("pacificsecond", vector3(263.709, 215.525, 100.683), 0.4, 0.6, {
			name="pacificsecond",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:secondtrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
		
		exports[Veny.TargetScript]:AddBoxZone("pacificthird", vector3(262.944, 213.291, 100.683), 0.4, 0.6, {
			name="pacificthird",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:thirdtrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
	end
	
	AddEventHandler("onResourceStop", function()
		local xd1 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_ch_cash_trolly_01c"), 0, 0, 0)
		local xd2 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_ch_cash_trolly_01c"), 0, 0, 0)
		local xd3 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_gold_trolly_01c"), 0, 0, 0)
		SetEntityAsMissionEntity(xd1, 1, 1)
		SetEntityAsMissionEntity(xd2, 1, 1)
		SetEntityAsMissionEntity(xd3, 1, 1)
		Wait(0)
		DeleteObject(xd1)
		while DoesEntityExist(xd1) do
			Wait(1)
			DeleteObject(xd1)
		end
	
		DeleteObject(xd2)
		while DoesEntityExist(xd2) do
			Wait(1)
			DeleteObject(xd2)
		end
	
		DeleteObject(xd3)
		while DoesEntityExist(xd3) do
			Wait(1)
			DeleteObject(xd3)
		end
	end)
	
	
	local ilktrolley = false
	local ikincitrolley = false
	local ucuncutrolley = false
	RegisterNetEvent("pacific:firsttrolley")
	AddEventHandler("pacific:firsttrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_cash_pile"
		local playercoords = GetEntityCoords(ped)
		local firsttrolley = vector3(260.331, 214.040, 100.683) 
		if #(playercoords - firsttrolley) < 2.0 and not ilktrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificfirst")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
								TriggerServerEvent("ld-heists:fleeca:rewardCash")
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			DeleteObject(trollyobj)
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ilktrolley = true
			TriggerServerEvent("pacific:addmoney")
			
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	RegisterNetEvent("pacific:secondtrolley")
	AddEventHandler("pacific:secondtrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_gold_bar"
		local playercoords = GetEntityCoords(ped)
		local secondtrolley = vector3(263.709, 215.525, 100.683) 
		if #(playercoords - secondtrolley) < 2.0 and not ikincitrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificsecond")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_gold_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			DeleteObject(trollyobj)
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ikincitrolley = true
			TriggerServerEvent("pacific:addgoldbar")
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	RegisterNetEvent("pacific:thirdtrolley")
	AddEventHandler("pacific:thirdtrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_cash_pile"
		local playercoords = GetEntityCoords(ped)
		local thirdtrolley = vector3(262.944, 213.291, 100.683) 
		if #(playercoords - thirdtrolley) < 2.0 and not ucuncutrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificthird")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
								TriggerServerEvent("ld-heists:fleeca:rewardCash")
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			DeleteObject(trollyobj)
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ucuncutrolley = true
			TriggerServerEvent("pacific:addmoney")
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	
	
	local ilkapi = false
	local ikincikapi = false
	local vaultdoor = false
	local vaultdoor2xd = false
	
	
	RegisterNetEvent('pacific:firstdoor')
	AddEventHandler('pacific:firstdoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local firstdoorlocs = vector3(257.258, 220.184, 106.284)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		if #(playercoords - firstdoorlocs) < 3.0 and not ilkkapi then
			TaskGoStraightToCoord(PlayerPedId(), 257.156, 219.600, 106.286, 1.0, -1, 337.84, 0.0)
			Wait(4500)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done chye g")
				-- SetEntityHeading(ped, 180.52)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(257.515, 220.164, 106.284, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 257.515, 220.164, 106.284,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserver", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 257.511, 221.387, 106.284, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
				TriggerServerEvent("shx-doors:alterlockstate", 100)
				elseif Veny.UseNPDoors == false then
				TriggerServerEvent('qb-doorlock:server:updateState', 1, false, false, false, true, false, false)
				end
				
				ilkkapi = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				ilkkapi = false
			end)
		end
		
	end)
	
	
	RegisterNetEvent('pacific:seconddoor')
	AddEventHandler('pacific:seconddoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local seconddoorlocs = vector3(261.943, 223.131, 106.284)
		if ilkkapi and #(playercoords - seconddoorlocs) < 3.0 and not ikincikapi then
			TaskGoStraightToCoord(PlayerPedId(), 261.609, 223.283, 106.284, 1.0, -1, 248.95, 0.0)
			Wait(2500)
			exports['hacking']:OpenHackingGame(function(Success)
				if Success then
					print("well done g")
					animation()
					
					ikincikapi = true
				else
					ikincikapi = false
				end 
			end)
		end
	end)
	
	RegisterNetEvent('pacific:vaultdoor')
	AddEventHandler('pacific:vaultdoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoorlocs = vector3(253.257, 228.383, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		if not vaultdoor and #(playercoords - vaultdoorlocs) < 3.0 then
			TaskGoStraightToCoord(PlayerPedId(), 253.447, 228.289, 101.683, 1.0, -1, 69.15, 0.0)
			Wait(5000)
			-- SetEntityCoords(PlayerPedId(), 253.257, 228.383, 101.683)
			exports['hacking']:OpenHackingGame(function(Success)
				if Success then
					print("well done g")
					animation2()
					SpawnTrolleys()
					-- refreshVaultDoor()
					vaultdoor = true
				else
					vaultdoor = false
				end
			end)
		end
	end)
	-- vaultdoor and not vaultdoor2xd and 
	RegisterNetEvent('pacific:vaultdoor2')
	AddEventHandler('pacific:vaultdoor2', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoor2 = vector3(252.963, 221.078, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		
		if  not vaultdoor2xd and #(playercoords - vaultdoor2) < 3.0  then
			TaskGoStraightToCoord(PlayerPedId(), 252.963, 221.078, 101.683, 1.0, -1, 161.91, 0.0)
			Wait(4000)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				
				-- SetEntityCoords(PlayerPedId(), 253.050, 221.086, 101.683)
				SetEntityHeading(ped, 180.00)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(252.970, 220.700, 101.683, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 252.970, 220.700, 101.683,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserversec", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 253.000, 221.653, 101.683, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
					TriggerServerEvent("shx-doors:alterlockstate", 103)
				elseif Veny.UseNPDoors == false then
					TriggerServerEvent('qb-doorlock:server:updateState', 3, false, false, false, true, false, false)
				end
	
				
				vaultdoor2xd = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				vaultdoor2xd = false
			end)
		end
	end)
	local vaultdoor3qwe = false
	RegisterNetEvent('pacific:vaultdoor3')
	AddEventHandler('pacific:vaultdoor3', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoor3 = vector3(261.408, 215.673, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		
		if not vaultdoor3qwe and #(playercoords - vaultdoor3) < 3.0  then
			TaskGoStraightToCoord(PlayerPedId(), 261.176, 215.768, 101.683, 1.0, -1, 247.98, 0.0)
			Wait(4000)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				
				-- SetEntityCoords(PlayerPedId(), 253.050, 221.086, 101.683)
				-- SetEntityHeading(ped, 180.00)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(261.600, 215.590, 101.683, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 261.600, 215.590, 101.683,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserverthird", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 261.748, 216.586, 101.683, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
					TriggerServerEvent("shx-doors:alterlockstate", 104)
				elseif Veny.UseNPDoors == false then
					TriggerServerEvent('qb-doorlock:server:updateState', 4, false, false, false, true, false, false)
				end
				vaultdoor3qwe = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				vaultdoor3qwe = false
			end)
		end
	end)
	
	RegisterNetEvent("pacific:ptfxparticlethird")
	AddEventHandler("pacific:ptfxparticlethird", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(261.748, 216.586, 101.683)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)

	RegisterNetEvent("pacific:checkclient")
	AddEventHandler("pacific:checkclient", function()

		local coords = GetEntityCoords(PlayerPedId())
		local dst1 = GetDistanceBetweenCoords(coords, Veny.StartLocs.doors1.startloc.x, Veny.StartLocs.doors1.startloc.y, Veny.StartLocs.doors1.startloc.z, true)
		if dst1 <= 2 then
			TriggerServerEvent("pacific:checker")
		end

	end)

	CreateThread(function()
		while true do
			sleep = 1000
			if ucuncutrolley and ikincitrolley and ilktrolley then
				sleep = 0
				TriggerEvent("pacific:resettimeman")
				break
			end
			Wait(sleep)
		end
	end)
			
	RegisterNetEvent("pacific:resettimeman")
	AddEventHandler("pacific:resettimeman", function()
		TriggerEvent("notification", "Security systems will be back online in 10 minutes!", 2)
		Wait(600000)
		TriggerServerEvent("pacific:ggwps")
	end)
		
	RegisterNetEvent("pacific:resetdoorsmf_cl")
	AddEventHandler("pacific:resetdoorsmf_cl", function()
		----------
		local obj3 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 50.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
		local count3 = 0
		repeat
			local rotation3 = GetEntityHeading(obj3) + 0.05

			SetEntityHeading(obj3, rotation3)
			count3 = count3 + 1
			Wait(10)
		until count3 == 1100
		----------
		TriggerServerEvent("shx-doors:alterlockstate", 104)
		TriggerServerEvent("shx-doors:alterlockstate", 103)
		TriggerServerEvent("shx-doors:alterlockstate", 100)
		TriggerServerEvent("shx-doors:alterlockstate", 101)
	end)
		
end
	
if Veny.Framework == "esx" then
	
	ESX = nil
	
	CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Wait(0)
		end
		while ESX.GetPlayerData().job == nil do
			Wait(10)
		end
		PlayerData = ESX.GetPlayerData()
	end)
	
	RegisterNetEvent('esx:setJob')
	AddEventHandler('esx:setJob', function(job)
		PlayerData.job = job
	end)
	
	local ilkkapi = false
	local ikincikapi = false
	local vaultdoor = false
	local vaultdoor2xd = false
	
	
	
	
	
	
	RegisterNetEvent("pacific:ptfxparticle")
	AddEventHandler("pacific:ptfxparticle", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(257.511, 221.387, 106.284)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	
	RegisterNetEvent("pacific:ptfxparticlesec")
	AddEventHandler("pacific:ptfxparticle", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(253.000, 221.653, 101.683)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)
	
	function animation()
		local ped = PlayerPedId()
		SetEntityHeading(ped, -90.00)
	
		local animDict = "anim@heists@ornate_bank@hack"
		RequestAnimDict(animDict)
		RequestModel("hei_prop_hst_laptop")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestModel("hei_prop_heist_card_hack_02")
		while not HasAnimDictLoaded(animDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(100)
		end
		local ped = PlayerPedId()
		local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
	
		local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
		local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
		local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 262.875, 222.976, 105.980, 262.875, 222.976, 105.980, 0, 2)
	
		--FreezeEntityPosition(ped, true)
		local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
		-- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
		NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
	
		local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
		Wait(200)
		NetworkStartSynchronisedScene(netScene)
		Wait(6300)
		NetworkStartSynchronisedScene(netScene2)
		Wait(2000)
		Wait(1500)
		local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(netScene3)
		Wait(4600)
		NetworkStopSynchronisedScene(netScene3)
		DeleteObject(laptop)
		--FreezeEntityPosition(ped, false)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		if Veny.UseNPDoors == true then
		TriggerServerEvent("shx-doors:alterlockstate", 101)
		elseif Veny.UseNPDoors == false then
		TriggerServerEvent('qb-doorlock:server:updateState', 2, false, false, false, true, false, false)
		end
	end
	
	
	
	
	function animation2()
		local ped = PlayerPedId()
		-- SetEntityCoords(ped, 253.123, 228.336, 101.683, 1, 0, 0, 1)
		-- SetEntityHeading(ped, -90.00)
		
		local animDict = "anim@heists@ornate_bank@hack"
		RequestAnimDict(animDict)
		RequestModel("hei_prop_hst_laptop")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestModel("hei_prop_heist_card_hack_02")
		while not HasAnimDictLoaded(animDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(100)
		end
		local ped = PlayerPedId()
		local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
	
		local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
		local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
		local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 253.300, 228.336, 101.450, 253.300, 228.336, 101.450, 0, 2)
	
		--FreezeEntityPosition(ped, true)
		local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
		-- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
		NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
	
		local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
		Wait(200)
		NetworkStartSynchronisedScene(netScene)
		Wait(6300)
		NetworkStartSynchronisedScene(netScene2)
		Wait(2000)
		Wait(1500)
		local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(netScene3)
		Wait(4600)
		NetworkStopSynchronisedScene(netScene3)
		DeleteObject(laptop)
		--FreezeEntityPosition(ped, false)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		TriggerServerEvent("utk_oh:openvault", 1)
	end
	
	
	
	RegisterNetEvent("utk_oh:vault")
	AddEventHandler("utk_oh:vault", function(method)
		local PlayerPos = GetEntityCoords(PlayerPedId())
		--local obj = ESX.Game.GetClosestObject(UTK.vault.type, vector3(UTK.vault.x, UTK.vault.y, UTK.vault.z))
		local obj = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 10.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
		local count = 0
	
		if method == 1 then
			repeat
				local rotation = GetEntityHeading(obj) - 0.05
	
				SetEntityHeading(obj, rotation)
				count = count + 1
				Wait(10)
			until count == 1100
		else
			repeat
				local rotation = GetEntityHeading(obj) + 0.05
	
				SetEntityHeading(obj, rotation)
				count = count + 1
				Wait(10)
			until count == 1100
		end
		FreezeEntityPosition(obj, true)
	end)
	
	RegisterNetEvent("utk_oh:vaultsound")
	AddEventHandler("utk_oh:vaultsound", function()
		local plyCoords = GetEntityCoords(PlayerPedId())
		local x,y,z = 253.581, 225.167, 101.876
		local count = 0
		if GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false) <= 10 then
			repeat
				PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
				Wait(900)
				count = count + 1
			until count == 17
		end
	end)
		
	RegisterNetEvent("utk_oh:openvault_c")
	AddEventHandler("utk_oh:openvault_c", function(method)
		TriggerEvent("utk_oh:vault", method)
		TriggerEvent("utk_oh:vaultsound")
	end)
	local disableinput = false
	function DisableControl() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end
	CreateThread(function()
		if disableinput then
			DisableControl()
		else
			Wait(500)
		end
	end)
	
	function SpawnTrolleys(data, name)
		RequestModel("ch_prop_ch_cash_trolly_01c")
		while not HasModelLoaded("ch_prop_ch_cash_trolly_01c") do
			Wait(1)
		end
		RequestModel("ch_prop_gold_trolly_01c")
		while not HasModelLoaded("ch_prop_gold_trolly_01c") do
			Wait(1)
		end
		Trolley1 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 260.331, 214.040, 100.683, 1, 1, 0)
		Trolley2 = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 263.709, 215.525, 100.683, 1, 1, 0)
		Trolley3 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 262.944, 213.291, 100.683, 1, 1, 0)
		local h1 = GetEntityHeading(Trolley1)
		local h2 = GetEntityHeading(Trolley2)
		local h3 = GetEntityHeading(Trolley3)
		SetEntityHeading(Trolley1, 43.26)
		SetEntityHeading(Trolley2, 90.00)
		SetEntityHeading(Trolley3, 43.26)
		
		done = false
		exports[Veny.TargetScript]:AddBoxZone("pacificfirst", vector3(260.331, 214.040, 100.683), 0.4, 0.6, {
			name="pacificfirst",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:firsttrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
		
		exports[Veny.TargetScript]:AddBoxZone("pacificsecond", vector3(263.709, 215.525, 100.683), 0.4, 0.6, {
			name="pacificsecond",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:secondtrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
		
		exports[Veny.TargetScript]:AddBoxZone("pacificthird", vector3(262.944, 213.291, 100.683), 0.4, 0.6, {
			name="pacificthird",
			debugpoly = false,
			useZ=true
			}, {
				options = {
					{
						event = "pacific:thirdtrolley",
						icon = "fas fa-hand-holding",
						label = "Grab It!",
					},
				},
				job = {"all"},
				distance = 1.5
			}
		)
	
	end
	
	
	AddEventHandler("onResourceStop", function()
		local xd1 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_ch_cash_trolly_01c"), 0, 0, 0)
		local xd2 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_ch_cash_trolly_01c"), 0, 0, 0)
		local xd3 = GetClosestObjectOfType(PlayerPedId(), 20.0, GetHashKey("ch_prop_gold_trolly_01c"), 0, 0, 0)
		SetEntityAsMissionEntity(xd1, 1, 1)
		SetEntityAsMissionEntity(xd2, 1, 1)
		SetEntityAsMissionEntity(xd3, 1, 1)
		Wait(0)
		DeleteObject(xd1)
		while DoesEntityExist(xd1) do
			Wait(1)
			DeleteObject(xd1)
		end
	
		DeleteObject(xd2)
		while DoesEntityExist(xd2) do
			Wait(1)
			DeleteObject(xd2)
		end
	
		DeleteObject(xd3)
		while DoesEntityExist(xd3) do
			Wait(1)
			DeleteObject(xd3)
		end
	end)
	
	
	local ilktrolley = false
	local ikincitrolley = false
	local ucuncutrolley = false
	RegisterNetEvent("pacific:firsttrolley")
	AddEventHandler("pacific:firsttrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_cash_pile"
		local playercoords = GetEntityCoords(ped)
		local firsttrolley = vector3(260.331, 214.040, 100.683) 
		if #(playercoords - firsttrolley) < 2.0 and not ilktrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificfirst")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
								TriggerServerEvent("ld-heists:fleeca:rewardCash")
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			DeleteObject(trollyobj)
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ilktrolley = true
			TriggerServerEvent("pacific:addmoney")
			
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	RegisterNetEvent("pacific:secondtrolley")
	AddEventHandler("pacific:secondtrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_gold_bar"
		local playercoords = GetEntityCoords(ped)
		local secondtrolley = vector3(263.709, 215.525, 100.683) 
		if #(playercoords - secondtrolley) < 2.0 and not ikincitrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificsecond")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_gold_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			DeleteObject(trollyobj)
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ikincitrolley = true
			TriggerServerEvent("pacific:addgoldbar")
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	RegisterNetEvent("pacific:thirdtrolley")
	AddEventHandler("pacific:thirdtrolley", function()
		disableinput = true
		local ped = PlayerPedId()
		local model = "hei_prop_heist_cash_pile"
		local playercoords = GetEntityCoords(ped)
		local thirdtrolley = vector3(262.944, 213.291, 100.683) 
		if #(playercoords - thirdtrolley) < 2.0 and not ucuncutrolley then
			exports[Veny.TargetScript]:RemoveZone("pacificthird")
			Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
			local CashAppear = function()
				local pedCoords = GetEntityCoords(ped)
				local grabmodel = GetHashKey(model)
	
				RequestModel(grabmodel)
				while not HasModelLoaded(grabmodel) do
					Wait(100)
				end
				local grabobj = CreateObject(grabmodel, pedCoords, true)
	
				FreezeEntityPosition(grabobj, true)
				SetEntityInvincible(grabobj, true)
				SetEntityNoCollisionEntity(grabobj, ped)
				SetEntityVisible(grabobj, false, false)
				AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
				local startedGrabbing = GetGameTimer()
	
				CreateThread(function()
					while GetGameTimer() - startedGrabbing < 37000 do
						Wait(1)
						DisableControlAction(0, 73, true)
						if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
							if not IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, true, false)
							end
						end
						if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
							if IsEntityVisible(grabobj) then
								SetEntityVisible(grabobj, false, false)
								TriggerServerEvent("ld-heists:fleeca:rewardCash")
							end
						end
					end
					DeleteObject(grabobj)
				end)
			end
			local trollyobj = Trolley
			local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")
	
			if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
				return
			end
			local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
	
			RequestAnimDict("anim@heists@ornate_bank@grab_cash")
			RequestModel(baghash)
			RequestModel(emptyobj)
			while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
				Wait(100)
			end
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
			local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
			SetPedComponentVariation(ped, 5, 0, 0, 0)
			NetworkStartSynchronisedScene(scene1)
			Wait(1500)
			CashAppear()
			local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene2)
			Wait(37000)
			local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)
	
			NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
			NetworkStartSynchronisedScene(scene3)
			NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
			--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
			SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
			while not NetworkHasControlOfEntity(trollyobj) do
				Wait(1)
				NetworkRequestControlOfEntity(trollyobj)
			end
			while DoesEntityExist(Trolley) do
				Wait(1)
				DeleteObject(Trolley)
			end
			DeleteObject(trollyobj)
			PlaceObjectOnGroundProperly(NewTrolley)
			Wait(1800)
			DeleteObject(bag)
			SetPedComponentVariation(ped, 5, 45, 0, 0)
			RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
			SetModelAsNoLongerNeeded(emptyobj)
			SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
			disableinput = false
			ucuncutrolley = true
			TriggerServerEvent("pacific:addmoney")
		else 
			TriggerEvent("notification", "You can't do this", 2)
		end
	end)
	
	
	
	local ilkapi = false
	local ikincikapi = false
	local vaultdoor = false
	local vaultdoor2xd = false
	
	
	RegisterNetEvent('pacific:firstdoor')
	AddEventHandler('pacific:firstdoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local firstdoorlocs = vector3(257.258, 220.184, 106.284)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		if #(playercoords - firstdoorlocs) < 3.0 and not ilkkapi then
			TaskGoStraightToCoord(PlayerPedId(), 257.156, 219.600, 106.286, 1.0, -1, 337.84, 0.0)
			Wait(4500)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				-- SetEntityHeading(ped, 180.52)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(257.515, 220.164, 106.284, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 257.515, 220.164, 106.284,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserver", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 257.511, 221.387, 106.284, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
					TriggerServerEvent("shx-doors:alterlockstate", 100)
				elseif Veny.UseNPDoors == false then
					TriggerServerEvent('qb-doorlock:server:updateState', 1, false, false, false, true, false, false)
				end
				ilkkapi = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				ilkkapi = false
			end)
		end
		
	end)
	
	
	RegisterNetEvent('pacific:seconddoor')
	AddEventHandler('pacific:seconddoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local seconddoorlocs = vector3(261.943, 223.131, 106.284)
		if ilkkapi and #(playercoords - seconddoorlocs) < 3.0 and not ikincikapi then
			TaskGoStraightToCoord(PlayerPedId(), 261.609, 223.283, 106.284, 1.0, -1, 248.95, 0.0)
			Wait(2500)
			exports['hacking']:OpenHackingGame(function(Success)
				if Success then
					print("well done g")
					animation()
					
					ikincikapi = true
				else
					ikincikapi = false
				end 
			end)
		end
	end)
	
	RegisterNetEvent('pacific:vaultdoor')
	AddEventHandler('pacific:vaultdoor', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoorlocs = vector3(253.257, 228.383, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		if not vaultdoor and #(playercoords - vaultdoorlocs) < 3.0 then
			TaskGoStraightToCoord(PlayerPedId(), 253.447, 228.289, 101.683, 1.0, -1, 69.15, 0.0)
			Wait(5000)
			-- SetEntityCoords(PlayerPedId(), 253.257, 228.383, 101.683)
			exports['hacking']:OpenHackingGame(function(Success)
				if Success then
					print("well done g")
					animation2()
					SpawnTrolleys()
					-- refreshVaultDoor()
					vaultdoor = true
				else
					vaultdoor = false
				end
			end)
		end
	end)
	
	RegisterNetEvent('pacific:vaultdoor2')
	AddEventHandler('pacific:vaultdoor2', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoor2 = vector3(252.963, 221.078, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		
		if  not vaultdoor2xd and #(playercoords - vaultdoor2) < 3.0  then
			TaskGoStraightToCoord(PlayerPedId(), 252.963, 221.078, 101.683, 1.0, -1, 161.91, 0.0)
			Wait(4000)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				
				-- SetEntityCoords(PlayerPedId(), 253.050, 221.086, 101.683)
				SetEntityHeading(ped, 180.00)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(252.970, 220.700, 101.683, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 252.970, 220.700, 101.683,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserversec", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 253.000, 221.653, 101.683, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
					TriggerServerEvent("shx-doors:alterlockstate", 103)
				elseif Veny.UseNPDoors == false then
					TriggerServerEvent('qb-doorlock:server:updateState', 3, false, false, false, true, false, false)
				end
				vaultdoor2xd = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				vaultdoor2xd = false
			end)
		end
	end)
	local vaultdoor3qwe = false
	RegisterNetEvent('pacific:vaultdoor3')
	AddEventHandler('pacific:vaultdoor3', function()
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vaultdoor3 = vector3(261.408, 215.673, 101.683)
		RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
		RequestModel("hei_p_m_bag_var22_arm_s")
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(50)
		end
		if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
			RequestNamedPtfxAsset("scr_ornate_heist")
			while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
				Wait(1)
			end
		end
		
		if not vaultdoor3qwe and #(playercoords - vaultdoor3) < 3.0  then
			TaskGoStraightToCoord(PlayerPedId(), 261.176, 215.768, 101.683, 1.0, -1, 247.98, 0.0)
			Wait(4000)
			exports["memorygame"]:thermiteminigame(8, 3, 3, 10,
			function() -- success
				print("well done g")
				
				-- SetEntityCoords(PlayerPedId(), 253.050, 221.086, 101.683)
				-- SetEntityHeading(ped, 180.00)
				local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
				local bagscene = NetworkCreateSynchronisedScene(261.600, 215.590, 101.683, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
				local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 261.600, 215.590, 101.683,  true,  true, false)
		
				SetEntityCollision(bag, false, true)
				NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
				NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				NetworkStartSynchronisedScene(bagscene)
				Wait(1500)
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
		
				SetEntityCollision(bomba, false, true)
				AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
				Wait(2000)
				DeleteObject(bag)
				SetPedComponentVariation(ped, 5, 45, 0, 0)
				DetachEntity(bomba, 1, 1)
				FreezeEntityPosition(bomba, true)
				TriggerServerEvent("pacific:particleserverthird", method)
				SetPtfxAssetNextCall("scr_ornate_heist")
				local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 261.748, 216.586, 101.683, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				
				NetworkStopSynchronisedScene(bagscene)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
				TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
				Wait(10000)
				ClearPedTasks(ped)
				DeleteObject(bomba)
				StopParticleFxLooped(effect, 0)
				Wait(7000)
				if Veny.UseNPDoors == true then
					TriggerServerEvent("shx-doors:alterlockstate", 104)
				elseif Veny.UseNPDoors == false then
					TriggerServerEvent('qb-doorlock:server:updateState', 4, false, false, false, true, false, false)
				end
				vaultdoor3qwe = true
				TriggerServerEvent("pacific:itemdelete")
			end,
			function() -- failure
				print("failure")
				vaultdoor3qwe = false
			end)
		end
	end)
	
	RegisterNetEvent("pacific:ptfxparticlethird")
	AddEventHandler("pacific:ptfxparticlethird", function(method)
		local ptfx
	
		RequestNamedPtfxAsset("scr_ornate_heist")
		while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
			Wait(1)
		end
			ptfx = vector3(261.748, 216.586, 101.683)
		SetPtfxAssetNextCall("scr_ornate_heist")
		local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		Wait(4000)
		
		StopParticleFxLooped(effect, 0)
	end)

	RegisterNetEvent("pacific:checkclient")
	AddEventHandler("pacific:checkclient", function()

		local coords = GetEntityCoords(PlayerPedId())
		local dst1 = GetDistanceBetweenCoords(coords, Veny.StartLocs.doors1.startloc.x, Veny.StartLocs.doors1.startloc.y, Veny.StartLocs.doors1.startloc.z, true)
		if dst1 <= 2 then
			TriggerServerEvent("pacific:checker")
		end

	end)

	CreateThread(function()
		while true do
			sleep = 1000
			if ucuncutrolley and ikincitrolley and ilktrolley then
				sleep = 0
				TriggerEvent("pacific:resettimeman")
				break
			end
			Wait(sleep)
		end
	end)
			
	RegisterNetEvent("pacific:resettimeman")
	AddEventHandler("pacific:resettimeman", function()
		TriggerEvent("notification", "Security systems will be back online in 10 minutes!", 2)
		Wait(600000)
		TriggerServerEvent("pacific:ggwps")
	end)
		
	RegisterNetEvent("pacific:resetdoorsmf_cl")
	AddEventHandler("pacific:resetdoorsmf_cl", function()
		----------
		local obj3 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 50.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
		local count3 = 0
		repeat
			local rotation3 = GetEntityHeading(obj3) + 0.05

			SetEntityHeading(obj3, rotation3)
			count3 = count3 + 1
			Wait(10)
		until count3 == 1100
		----------
		TriggerServerEvent("shx-doors:alterlockstate", 104)
		TriggerServerEvent("shx-doors:alterlockstate", 103)
		TriggerServerEvent("shx-doors:alterlockstate", 100)
		TriggerServerEvent("shx-doors:alterlockstate", 101)
	end)
		
end
	
	




--- ADDED FROM QB-BANK ROBBERY
function DrawText3Ds(x, y, z, text) -- Globally used
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function IsWearingHandshoes() -- Globally Used
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == `mp_m_freemode_01` then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    QBCore.Functions.TriggerCallback('qb-bankrobbery:server:GetConfig', function(config)
        Config = config
    end)
    onDuty = true
    --ResetBankDoors()
end)

RegisterNetEvent('robbery:usesafe', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
                QBCore.Functions.Progressbar("hospital_revive", "Opening Safe", 10000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = healAnimDict,
                    anim = healAnim,
                    flags = 16,
                }, {}, {}, function() -- Done
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    local pos = GetEntityCoords(PlayerPedId())
                    local Player = QBCore.Functions.GetPlayerData()
                    local src = source
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["safe"], "remove")
                    TriggerServerEvent("QBCore:Server:RemoveItem", "safe", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["gatecrack"], "remove")
                    TriggerServerEvent("QBCore:Server:RemoveItem", "gatecrack", 1)
                    TriggerServerEvent("qb-useablesafe:server:getItem")
                end, function() -- Cancel
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify('Cancelled...', 'error', 2500)
                end)
        else
            QBCore.Functions.Notify('You are missing something...', 'error', 2500)
        end
    end, 'gatecrack')
end)
