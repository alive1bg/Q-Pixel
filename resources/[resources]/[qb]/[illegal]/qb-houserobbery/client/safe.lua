local playAnim = function(ped,ad,anim,pos,rot,wait_for_finish,b_in,b_out,s_time)
	TaskPlayAnimAdvanced(ped, ad, anim, pos.x,pos.y,pos.z, 0.0,0.0,rot, (b_in or 1.0),(b_out or 1.0), -1, (wait_for_finish and 2 or 1), (s_time or 0.0))
	if wait_for_finish then
		while not IsEntityPlayingAnim(ped,ad,anim,3) do Wait(0); end
		while GetEntityAnimCurrentTime(ped,ad,anim) < 1.0 do Wait(0); end
	end
end

local loadResources = function()
	RequestAnimDict("mini@safe_cracking")
	while not HasAnimDictLoaded("mini@safe_cracking") do Wait(0); end

	RequestStreamedTextureDict("mpsafecracking")
	while not HasStreamedTextureDictLoaded("mpsafecracking") do Wait(0); end
end

local unloadResources = function()
	RemoveAnimDict("mini@safe_cracking")
	SetStreamedTextureDictAsNoLongerNeeded("mpsafecracking")
end

local closestSafe = function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local hash = GetHashKey('prop_ld_int_safe_01')
	local closest = GetClosestObjectOfType(pos.x,pos.y,pos.z, 10.0, hash)
	local closestDist
	if closest and closest > 0 then
		closestDist = #(GetEntityCoords(closest) - pos)
	end

	return closest,closestDist
end

local closeDoor = function(obj,start_rot)
	Citizen.CreateThread(function()
		Wait(5000)
		while GetEntityHeading(obj) > start_rot do
			SetEntityHeading(obj,GetEntityHeading(obj) - 1.0)
			Wait(10)
		end
		FreezeEntityPosition(obj,true)
	end)
end

safeCracker = {}

safeCracker.start = function(safe_object,pins,callback,rotate_door)
	safe_object = closestSafe()
	pins = (pins or 4)

	local start_rot = GetEntityHeading(safe_object)

	SetActivateObjectPhysicsAsSoonAsItIsUnfrozen(safe_object,true)

	local ped = GetPlayerPed(-1)
	local fwd,right,up,t_pos = GetEntityMatrix(safe_object)
	local pos = t_pos - (fwd * 0.95) - (right * 0.05)
	local f,z = GetGroundZFor_3dCoord(pos.x,pos.y,pos.z)
	local rot = GetEntityHeading(safe_object)
	pos = vector3(pos.x,pos.y,z+1.0)

	loadResources()

	local ad = "mini@safe_cracking"
	local anim = 'step_into'
	playAnim(ped, ad, anim, pos + (right * 0.13), rot, true)

	anim = 'idle_base'
	playAnim(ped, ad, anim, pos, rot, false)

	local dialrot = 0.0
	local mod = 25.0

	local locks,nums = {},{}
	for i=1,pins,1 do
		math.randomseed(GetGameTimer() * math.random(999,999999) * math.pi)
		locks[i] = true

		if 			i%2 == 0 then
			nums[i] = math.random(nums[i-1] + 45.0, nums[i-1] + 359.0)
		elseif  i%3 == 0 then
			nums[i] = math.random(nums[i-1] - 719.0, nums[i-1] - 405.0)
		else
			nums[i] = math.random(45.0, 359.0)
		end
		print(i,nums[i])
	end
	print("---")

	-----------------------
	-- REDO LOCK NUMBERS --
	-----------------------
	-- Make numbers persist if chosen.
	-- Add number count for difficulty.
	-- Multiples of 2 are positive, 45 - 359;
	-- Multiples of 3 are negative, 719 - 405;
	-- Everything else is negative, 45 - 359;

	local target = 1

	while true do
		N_0xf4f2c0d4ee209e20()

		DisableControlAction(0,322,true)
		DisableControlAction(0,200,true)

		if not success_anim and not fail_anim then
			if IsControlPressed(0,209) and (IsControlJustPressed(0,175) or IsControlPressed(0,175)) then
				anim = 'dial_turn_clock_fast'
				dialrot = dialrot + (2.0 * mod * GetFrameTime())
			elseif IsControlPressed(0,209) and (IsControlJustPressed(0,174) or IsControlPressed(0,174)) then
				anim = 'dial_turn_anti_fast'
				dialrot = dialrot - (2.0 * mod * GetFrameTime())
			elseif IsControlPressed(0,210) and (IsControlJustPressed(0,175) or IsControlPressed(0,175)) then
				anim = 'dial_turn_clock_slow'
				dialrot = dialrot + (0.5 * mod * GetFrameTime())
			elseif IsControlPressed(0,210) and (IsControlJustPressed(0,174) or IsControlPressed(0,174)) then
				anim = 'dial_turn_anti_slow'
				dialrot = dialrot - (0.5 * mod * GetFrameTime())
			elseif (IsControlJustPressed(0,175) or IsControlPressed(0,175)) then
				anim = 'dial_turn_clock_normal'
				dialrot = dialrot + (1.0 * mod * GetFrameTime())
			elseif (IsControlJustPressed(0,174) or IsControlPressed(0,174)) then
				anim = 'dial_turn_anti_normal'
				dialrot = dialrot - (1.0 * mod * GetFrameTime())
			elseif IsDisabledControlJustReleased(0,322) then
				if callback then
					callback(false)
				end
				ClearPedTasks(ped)
				return
			else
				anim = 'idle_base'
			end

			if not last_anim then
				last_anim = anim
				playAnim(ped, ad, anim, pos, rot, false, 1.0, 1.0, 0.1)
			elseif last_anim ~= anim or GetEntityAnimCurrentTime(ped,ad,anim) > 0.6 then
				playAnim(ped, ad, anim, pos, rot, false, 1.0, 1.0, 0.1)
				last_anim = anim
			end

			if math.floor(dialrot) == math.floor(nums[target]) then
				locks[target] = false
				target = target + 1

				if target > pins then 
					playAnim(ped, ad, 'door_open_succeed_stand', pos+(fwd*0.1), rot, false)
					Wait(2050)

					if safe_object and rotate_door then
						FreezeEntityPosition(safe_object,false)
						Wait(0)

						local start_head = GetEntityHeading(safe_object)
						for i=1,90,1 do
							SetEntityHeading(safe_object, start_head + i)
							Wait(10)
						end
					end

					ClearPedTasks(ped)
					if callback then callback(true); end

					if safe_object and rotate_door then
						closeDoor(safe_object,start_rot)
					end
					return
				else
					playAnim(ped, ad, 'dial_turn_succeed_1', pos, rot, false, 1.0, 1.0, 0.1)
					success_anim = GetGameTimer()
					last_anim = false
				end
			end
		else
			if success_anim and GetEntityAnimCurrentTime(ped,ad,'dial_turn_succeed_1') > 0.9 then
				success_anim = false
			elseif fail_anim and GetGameTimer() - fail_anim > 1000 then
				fail_anim = false
			end
		end

		local ratio = GetAspectRatio(true)
		local start = (0.5 - ( (pins+1) / 2 / 10))
		for i=1,pins,1 do
			local sprite = (locks[i] == true and 'lock_closed' or 'lock_open')
			DrawSprite("mpsafecracking",sprite, start + (i / 10),0.2, 0.04,ratio * 0.04, 0,	255,255,255,255)
		end

		DrawSprite("mpsafecracking","Dial_BG", 0.5,0.8, 0.3,				ratio * 0.3, 							0,	255,255,255,255)
		DrawSprite("mpsafecracking","Dial",    0.5,0.8, 0.3 * 0.5,	ratio * 0.3 * 0.5, -dialrot,	255,255,255,255)

		Wait(0)
	end
end

AddEventHandler("safecracker:start",safeCracker.start)
exports('start',safeCracker.start)