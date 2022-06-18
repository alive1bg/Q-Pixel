local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

--// Blips \\--
Citizen.CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlips then
			info.blip = AddBlipForCoord(info.x, info.y, info.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.6)	
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		end
	end	
end)

--// PickUp Weed \\--
RegisterNetEvent('qb-whitewidow:PickUpWeed', function()         
	loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
	TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
	QBCore.Functions.Progressbar("search_register", "Picking Up Weed...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
		ClearPedTasks(GetPlayerPed(-1))		
		TriggerServerEvent('qb-whitewidow:pickUpWeed')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end)

--// PickUp Weed Skunk \\--
RegisterNetEvent('qb-whitewidow:PickUpWeedSkunk', function()         
	loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
	TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
	QBCore.Functions.Progressbar("search_register", "Picking Up Skunk...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
		ClearPedTasks(GetPlayerPed(-1))		
		TriggerServerEvent('qb-whitewidow:pickUpSkunk')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end)

--// PickUp Weed Ak47 \\--
RegisterNetEvent('qb-whitewidow:PickUpWeedAk47', function()         
	loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
	TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
	QBCore.Functions.Progressbar("search_register", "Picking Up AK-47...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
		ClearPedTasks(GetPlayerPed(-1))		
		TriggerServerEvent('qb-whitewidow:pickUpAk47')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end)

--// PickUp Weed Og-Kush \\--
RegisterNetEvent('qb-whitewidow:PickUpWeedOgKush', function()         
	loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
	TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
	QBCore.Functions.Progressbar("search_register", "Picking Up Og-Kush...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
		ClearPedTasks(GetPlayerPed(-1))		
		TriggerServerEvent('qb-whitewidow:pickUpOgKush')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end)

--// Trey \\--
RegisterNetEvent("qb-whitewidow:OpenPlate", function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "WhiteWidow Tray", {maxweight = 30000, slots = 10})
	TriggerEvent("inventory:client:SetCurrentStash", "WhiteWidow Tray") 
end)

--// Grab Cola \\--
RegisterNetEvent('qb-whitewidow:Client:GrabCola', function()
	TriggerServerEvent("qb-whitewidow:GrabCola")
end)

--// Grab Snack \\--
RegisterNetEvent('qb-whitewidow:Client:GrabSnack', function()
	TriggerServerEvent("qb-whitewidow:GrabSnack")
end)

--// Grab Water \\--
RegisterNetEvent('qb-whitewidow:Client:GrabWater', function()
	TriggerServerEvent("qb-whitewidow:GrabWater")
end)

--// Process Cannabis \\--
RegisterNetEvent('qb-whitewidow:Client:ProcessCannabis', function()
	QBCore.Functions.TriggerCallback('qb-whitewidow:HasItemProcessCannabis', function(HasItems)
		if HasItems then
			ProcessWeedCannabis()
		else
			QBCore.Functions.Notify('You Dont Have Enough Cannabis / Weed Scissors', 'error')
		end
	end)
end)

--// Process Weed Skunk \\--
RegisterNetEvent('qb-whitewidow:Client:ProcessSkunk', function()
	QBCore.Functions.TriggerCallback('qb-whitewidow:HasItemProcessSkunk', function(HasItems)
		if HasItems then
			ProcessWeedSkunk()
		else
			QBCore.Functions.Notify('You Dont Have Enough Skunk / Weed Scissors', 'error')
		end
	end)
end)

--// Process Weed Ak47 \\--
RegisterNetEvent('qb-whitewidow:Client:ProcessAk47', function()
	QBCore.Functions.TriggerCallback('qb-whitewidow:HasItemProcessAk47', function(HasItems)
		if HasItems then
			ProcessWeedAk47()
		else
			QBCore.Functions.Notify('You Dont Have Enough AK-47 / Weed Scissors', 'error')
		end
	end)
end)

--// Process Weed Og-Kush \\--
RegisterNetEvent('qb-whitewidow:Client:ProcessOgKush', function()
	QBCore.Functions.TriggerCallback('qb-whitewidow:HasItemProcessOgKush', function(HasItems)
		if HasItems then
			ProcessWeedOgKush()
		else
			QBCore.Functions.Notify('You Dont Have Enough Og-Kush / Weed Scissors', 'error')
		end
	end)
end)

--// Process Joints \\--
RegisterNetEvent('qb-whitewidow:Client:Joints', function()
	QBCore.Functions.TriggerCallback('qb-whitewidow:CheckForItemsJoint', function(HasItems)
		if HasItems then
			ProcessJoints()
		else
			QBCore.Functions.Notify('You Dont Have Any Drugs For Making Joints / Rolling Paper', 'error')
		end
	end)
end)

--// Shop \\--
RegisterNetEvent('qb-whitewidowShop:Open', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "WhiteWidow Shop", Config.Items)
end)

--// Stash \\--
RegisterNetEvent('qb-whitewidowShop:Stash', function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "WhiteWidow Storage") 
	TriggerEvent("inventory:client:SetCurrentStash", "WhiteWidow Storage")
end)

--// Duty \\--
RegisterNetEvent('qb-whitewidowDuty:On', function()
	onDuty = not onDuty
	TriggerServerEvent("QBCore:ToggleDuty")
end)

--// Bong \\--
RegisterNetEvent("qb-whitewidow:Client:Bong")
AddEventHandler("qb-whitewidow:Client:Bong", function()
	QBCore.Functions.TriggerCallback('qb-whitewidow:HasItemSmokeBong', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("snort_coke", "Smoking Bong", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "anim@safehouse@bong",
				anim = "bong_stage1",
				flags = 49,
				TriggerEvent("qb-whitewidow:SpawnBong")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "anim@safehouse@bong", "bong_stage1", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.BongItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.BongItem], "remove")
				BongEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "anim@safehouse@bong", "bong_stage1", 1.0)
				QBCore.Functions.Notify("Canceled..", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Bong !', 'error')
		end
	end)
end)

function LoadModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Wait(10)
	end
end

RegisterNetEvent("qb-whitewidow:SpawnBong")
AddEventHandler("qb-whitewidow:SpawnBong", function()
	LoadModel('prop_bong_01')
	LoadModel("p_cs_lighter_01")
	local bong = CreateObject(GetHashKey('prop_bong_01'), GetEntityCoords(PlayerPedId()), true)
	local lighter = CreateObject(GetHashKey('p_cs_lighter_01'), GetEntityCoords(PlayerPedId()), true)
	local pedCoords = GetEntityCoords(PlayerPedId())
	local objectBong = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("prop_bong_01"), false)
	local objectLighter = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("p_cs_lighter_01"), false)
	local itemid = objectBong
	RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded('core') do
        Citizen.Wait(0)
    end
    UseParticleFxAsset("core")
    StartNetworkedParticleFxLoopedOnEntity("ent_anim_cig_smoke",objectBong,0,0,0.1, 0,0,0, 3.0, 0,0,0)
	AttachEntityToEntity(objectBong,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.10,-0.25,0.0,95.0,190.0,180.0,1,1,0,1,0,1)
	AttachEntityToEntity(objectLighter, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),28422),  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	Wait(5500)
	QBCore.Functions.Notify("You Feel A Bit High !")
	DetachEntity(objectBong, true, true)
	DeleteObject(objectBong)
	DeleteObject(objectLighter)
end)

function BongEffect()
    local startStamina = 8
    SmokingBongEffect()
	TriggerClientEvent("qb-hud:Server:RelieveStress")
    while startStamina > 0 do 
        Citizen.Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 51 then
            SmokingBongEffect()
        end
    end
    startStamina = 0
end

function SmokingBongEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Citizen.Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Citizen.Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
    StopScreenEffect("DrugsTrevorClownsFight")
    StopScreenEffect("DrugsTrevorClownsFightIn")
    StopScreenEffect("DrugsTrevorClownsFightOut")
end

--// WhiteWidows Garage \\--
function SpawnBaller(vehicle)
    local coords = { ['x'] = 199.30825, ['y'] = -269.8516, ['z'] = 49.924686, ['h'] = 246.63543 }
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "WHITE	"..tostring(math.random(1000, 9999)))
        exports['qb-fuel']:SetFuel(veh, 100.0)
        SetVehicleCustomPrimaryColour(veh, 255,255,255)
        SetEntityHeading(veh, coords.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)     
end

--// WhiteWidows Garage Store Vehicle \\--
RegisterNetEvent('WhiteWidow:storecar')
AddEventHandler('WhiteWidow:storecar', function()
    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    DeleteVehicle(car)
    DeleteEntity(car)
end)

--// WhiteWidows Garage Menu \\--
RegisterNetEvent('WhiteWidow:Garage:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "White Widow Garage",
			isMenuHeader = true,
        },
        {
            header = "Baller",
            txt = "White Widows Vehicle",
			params = {
				event = "WhiteWidow:garage",
			}
        },
        {
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
			params = {
				event = "WhiteWidow:storecar",
			}
        },
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },     
    })
end)

RegisterNetEvent("WhiteWidow:garage")
AddEventHandler("WhiteWidow:garage", function()
	SpawnBaller(Config.Vehicle)
end)

CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        local letSleep = true        

        if PlayerJob ~= nil and PlayerJob.name == Config.Job then
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 196.96069, -268.2592, 50.046707, true) < 10) then
                letSleep = false
                DrawMarker(2, 196.96069, -268.2592, 50.046707, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 0, 0, 0, 222, false, false, false, true, false, false, false)
				if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 196.96069, -268.2592, 50.046707, true) < 1.5) then
                    DrawText3D(196.96069, -268.2592, 50.046707, "~g~E~w~ - White Widow Garage") 
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("WhiteWidow:Garage:Menu")
                    end
                end  
            end
        end

        if letSleep then
            Wait(2000)
        end

        Wait(1)
    end
end)

function DrawText3D(x, y, z, text)
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

--// WhiteWidows Process Menu \\--
RegisterNetEvent('qb-whitewidow:Process:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "White Widow Process",
			isMenuHeader = true,
        },
        {
            header = "Process Cannabis",
            txt = "1X Cannabis 1X Weed Scissors",
			params = {
				event = "qb-whitewidow:Client:ProcessCannabis",
			}
        },       
		{
            header = "Process Skunk",
            txt = "1X Skunk 1X Weed Scissors",
			params = {
				event = "qb-whitewidow:Client:ProcessSkunk",
			}
        },    
		{
            header = "Process AK-47",
            txt = "1X AK-47 1X Weed Scissors",
			params = {
				event = "qb-whitewidow:Client:ProcessAk47",
			}
        },   
		{
            header = "Process Og-Kush",
            txt = "1X Og-Kush 1X Weed Scissors",
			params = {
				event = "qb-whitewidow:Client:ProcessOgKush",
			}
        },   
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        }, 
    })
end)

--// WhiteWidows Bong Menu \\--
RegisterNetEvent('qb-whitewidow:OpenBong:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "Smoke Bong",
            txt = "Smoke Bong But Dont Smoke To Much Otherwise You Will Feel High !",
			params = {
				event = "qb-whitewidow:Client:Bong",
			}
        },        
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        }, 
    })
end)

--// WhiteWidows Vanding Machine Menu \\--
RegisterNetEvent('qb-whitewidowShop:Menu:Open', function()
	local colaprice = Config.ColaContextPrice
	local snackprice = Config.SnackContextPrice
	local waterprice = Config.WaterContextPrice
    TriggerEvent('qb-menu:client:openMenu', {
		{
			header = "White Widow Vanding Machine",
			isMenuHeader = true,
		},
		{
			header = "Grab Cola",
			txt = 'Buy Cola For ' .. colaprice,
			params = {
				event = "qb-whitewidow:Client:GrabCola",
			}
		},       
		{
			header = "Grab Snack",
			txt = 'Buy Snack For ' .. snackprice,
			params = {
				event = "qb-whitewidow:Client:GrabSnack",
			}
		},    
		{
			header = "Grab Water",
			txt = 'Buy Water For ' .. waterprice,
			params = {
				event = "qb-whitewidow:Client:GrabWater",
			}
		},   
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        }, 
    })
end)

--// Joints Process Menu \\--
RegisterNetEvent('qb-whitewidow:ProcessJoints:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "White Widow Process Joints",
			isMenuHeader = true,
        },
        {
            header = "Roll Joints",
            txt = "Required: 1X Proccesed Cannabis / Proccesed Ak-47 / Proccesed Og-Kush / Proccesed Skunk",
			params = {
				event = "qb-whitewidow:Client:Joints",
            }
        },       
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        }, 
    })
end)

CreateThread(function()
	local Player = QBCore.Functions.GetPlayerData()
		--// Shop Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowShopMenu", vector3(185.30625, -242.0963, 54.16048), 1.0, 2.2, {
			name = "WhiteWidowShopMenu",
			heading = 65.22052,
			debugPoly = Config.PolyZone,
			minZ = 53.16048,
			maxZ = 55.16048,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidowShop:Open",
					icon = "fa fa-shop",
					label = "Open Shop",
					job = Config.Job,
					canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.0
		})
		
		--// Drinks Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowDrinksMenu", vector3(187.12597, -245.377, 53.808071), 0.8, 0.8, {
			name = "WhiteWidowDrinksMenu",
			heading = 251.49156,
			debugPoly = Config.PolyZone,
			minZ = 52.808071,
			maxZ = 54.808071,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidowShop:Menu:Open",
					icon = "fa fa-shop",
					label = "Open Vanding Machine",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.0
		})
		
		--// Pick 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick1", vector3(170.10705, -244.7768, 50.367435), 1.0, 3, {
			name = "WhiteWidowPick1",
			heading = 257.0451,
			debugPoly = Config.PolyZone,
			minZ = 49.367435,
			maxZ = 51.367435,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick2", vector3(169.60479, -246.0026, 50.36737), 1.0, 3, {
			name = "WhiteWidowPick2",
			heading = 232.04508,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.336737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick3", vector3(169.28524, -247.451, 50.36737), 1.0, 3, {
			name = "WhiteWidowPick3",
			heading = 154.54508,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick4", vector3(168.66157, -248.5414, 50.36737), 1.0, 3, {
			name = "WhiteWidowPick4",
			heading = 174.54508,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick5", vector3(168.39279, -249.3025, 50.135208), 1.0, 3, {
			name = "WhiteWidowPick5",
			heading = 192.04489,
			debugPoly = Config.PolyZone,
			minZ = 49.135208,
			maxZ = 51.135208,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick1", vector3(167.59107, -244.1141, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick1",
			heading = 225.96217,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick2", vector3(167.08296, -245.2875, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick2",
			heading = 138.46217,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick3", vector3(166.32737, -246.294, 50.055263), 1.0, 3, {
			name = "WhiteWidowSkunkPick3",
			heading = 193.45697,
			debugPoly = Config.PolyZone,
			minZ = 49.055263,
			maxZ = 51.055263,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick4", vector3(166.34451, -247.64, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick4",
			heading = 193.45697,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.3
		})
		
		--// Pick Skunk 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick5", vector3(165.78178, -248.8942, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick5",
			heading = 148.46218,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.3
		})
		
		--// Pick Ak47 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick1", vector3(165.09664, -243.0975, 50.36737), 1.0, 3, {
			name = "WhiteWidowAk47Pick1",
			heading = 196.58908,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick2", vector3(164.59544, -244.2542, 50.36737), 1.0, 3, {
			name = "WhiteWidowAk47Pick2",
			heading = 144.08908,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick3", vector3(164.09489, -245.5303, 50.36737), 1.0, 3, {
			name = "WhiteWidoAk47Pick3",
			heading = 151.58908,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick4", vector3(163.52682, -246.6997, 50.36737), 1.0, 3, {
			name = "WhiteWidowAk47Pick4",
			heading = 151.58908,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick5", vector3(163.30659, -247.5116, 50.364101), 1.0, 3, {
			name = "WhiteWidowAk47Pick5",
			heading = 161.46582,
			debugPoly = Config.PolyZone,
			minZ = 49.364101,
			maxZ = 51.364101,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick1", vector3(162.51042, -242.0645, 50.055507), 1.0, 3, {
			name = "WhiteWidowOgKushPick1",
			heading = 161.58906,
			debugPoly = Config.PolyZone,
			minZ = 49.055507,
			maxZ = 51.055507,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick2", vector3(162.11291, -243.459, 50.36737), 1.0, 3, {
			name = "WhiteWidowOgKushPick2",
			heading = 161.58906,
			debugPoly = Config.PolyZone,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick3", vector3(162.03102, -244.4711, 50.054496), 1.0, 3, {
			name = "WhiteWidowOgKushPick3",
			heading = 161.58258,
			debugPoly = Config.PolyZone,
			minZ = 49.054496,
			maxZ = 51.054496,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick4", vector3(161.56398, -245.8443, 50.055507), 1.0, 3, {
			name = "WhiteWidowOgKushPick4",
			heading = 161.59028,
			debugPoly = Config.PolyZone,
			minZ = 49.055507,
			maxZ = 51.055507,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick5", vector3(161.15199, -246.9786, 50.055507), 1.0, 3, {
			name = "WhiteWidowOgKushPick5",
			heading = 161.58903,
			debugPoly = Config.PolyZone,
			minZ = 49.055507,
			maxZ = 51.055507,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Duty Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowDuty", vector3(184.8912, -241.8809, 54.069698), 0.6, 2.4, {
			name = "WhiteWidowDuty",
			heading = 251.634,
			debugPoly = Config.PolyZone,
			minZ = 53.069698,
			maxZ = 55.069698,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidowDuty:On",
					icon = "fa fa-clock",
					label = "On/Off Duty",
                    job = Config.Job,
				},
			},
			distance = 1.0
		})
		
		--// Stash Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowStash", vector3(184.17364, -244.2578, 53.918201), 1.1, 1.2, {
			name = "WhiteWidowStash",
			heading = 335.49276,
			debugPoly = Config.PolyZone,
			minZ = 52.918201,
			maxZ = 54.918201,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidowShop:Stash",
					icon = "fa fa-box",
					label = "Storage",
                    job = Config.Job,
				},
			},
			distance = 1.2
		})
		
		--// Processing Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowProcess", vector3(165.55667, -235.6183, 50.681068), 1.0, 2.7, {
			name = "WhiteWidowProcess",
			heading = 166.99382,
			debugPoly = Config.PolyZone,
			minZ = 49.681068,
			maxZ = 51.681068,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:Process:Menu",
					icon = "fa fa-smoking",
					label = "To Process Cannabis",
					job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})
		
		--// Processing Joint Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowProcessJoints", vector3(164.46914, -233.2938, 50.274959), 1.0, 2.7, {
			name = "WhiteWidowProcessJoints",
			heading = 68.521919,
			debugPoly = Config.PolyZone,
			minZ = 49.274959,
			maxZ = 51.274959,
		}, {
			options = {
				{
					type = "client",
					event = "qb-whitewidow:ProcessJoints:Menu",
					icon = "fa fa-smoking",
					label = "To Roll Joints",
                    job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
				},
			},
			distance = 1.2
		})

		for k, v in pairs(Config.BongLocations) do
			exports['qb-target']:AddBoxZone("BongLocation"..k, vector3(v.coords.x, v.coords.y, v.coords.z), v.poly1, v.poly2, {
				name = "BongLocation"..k,
				heading = v.heading,
				debugPoly = Config.PolyZone,
				minZ = v.minZ,
				maxZ = v.maxZ,
				}, {
					options = { 
					{
						type = "client",
						event = "qb-whitewidow:OpenBong:Menu",
						icon = "fa fa-bong",
						label = "Smoke Bong",
					}
				},
				distance = 1.3,
			})
		end
end)
				
local trayprops = {
	'bkr_prop_meth_tray_01b',
}
		
--// Trey Target \\--
exports['qb-target']:AddTargetModel(trayprops, {
	name = "WhiteWidowTray",
	options = {
		{
			type = "client",
			event = "qb-whitewidow:OpenPlate",
			icon = "fas fa-random",
			label = "Open Tray",
		},
	},
	distance = 1.3
})

--// Function For Processing Cannabis \\--
function ProcessWeedCannabis()
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	TriggerServerEvent('qb-whitewidow:ProcessCannabis')
	QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('qb-whitewidow:ProcessCannabisAdd')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

--// Function For Processing Skunk \\--
function ProcessWeedSkunk()
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	TriggerServerEvent('qb-whitewidow:ProcessSkunk')
	QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('qb-whitewidow:ProcessSkunkAdd')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

--// Function For Processing Ak47 \\--
function ProcessWeedAk47()
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	TriggerServerEvent('qb-whitewidow:ProcessAk47')
	QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('qb-whitewidow:ProcessAddAk47')
		ClearPedTasks(GetPlayerPed(-1))
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

--// Function For Processing Og-Kush \\--
function ProcessWeedOgKush()
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	TriggerServerEvent('qb-whitewidow:ProcessOgKush')
	QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('qb-whitewidow:ProcessOgKushAdd')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

--// Function For Processing Joints \\--
function ProcessJoints()
	TriggerServerEvent('qb-whitewidow:ProcessJoints')                                                       				
	QBCore.Functions.Progressbar("search_register", "Rolling Joints...", 7000, false, true, {
	  	disableMovement = true,
	  	disableCarMovement = true,
	  	disableMouse = false,
		disableCombat = true,
  	}, {
	  	animDict = 'anim@amb@business@coc@coc_unpack_cut@',
	  	anim = 'fullcut_cycle_v6_cokecutter',
	  	flags = 16,
   	}, {}, {}, function()
	  	ClearPedTasks(GetPlayerPed(-1))
	  	TriggerServerEvent('qb-whitewidow:ProcessJointsAdd')
   	end, function()
	  	ClearPedTasks(GetPlayerPed(-1))
   	end)  
end

--// Function For Animations \\--
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

print("This Resources Created By Nevo#0652 For CloudDevelopment Please Aware Thats Leaking / Resselling This Resource May Get You Banned !")