local QBCore = exports['qb-core']:GetCoreObject()
local closestScrapyard = 0
local emailSend = false
local isBusy = false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    TriggerServerEvent("qb-scrapyard:server:LoadVehicleList")
end)

CreateThread(function()
	for id, scrapyard in pairs(Config.Locations) do
		local blip = AddBlipForCoord(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z)
        SetBlipSprite(blip, 380)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Scrap Yard")
        EndTextCommandSetBlipName(blip)
	end
    Wait(1000)
    while true do
        SetClosestScrapyard()
        Wait(10000)
    end
end)
			


CreateThread(function()
	while true do
		Wait(1)
		if closestScrapyard ~= 0 then
			local pos = GetEntityCoords(PlayerPedId())
			if #(pos - vector3(Config.Locations[closestScrapyard]["deliver"].x, Config.Locations[closestScrapyard]["deliver"].y, Config.Locations[closestScrapyard]["deliver"].z)) < 10.0 then
				if IsPedInAnyVehicle(PlayerPedId()) then
					local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
					if vehicle ~= 0 and vehicle ~= nil then
						local vehpos = GetEntityCoords(vehicle)
						if #(pos - vector3(vehpos.x, vehpos.y, vehpos.z)) < 2.5 and not isBusy then
							DrawText3Ds(vehpos.x, vehpos.y, vehpos.z, "~g~E~w~ - Disassemble Vehicle")
							if IsControlJustReleased(0, 38) then
								if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
									if IsVehicleValid(GetEntityModel(vehicle)) then
										local vehiclePlate = QBCore.Functions.GetPlate(vehicle)
										QBCore.Functions.TriggerCallback('qb-scrapyard:checkOwnerVehicle',function(retval)
											if retval then
												ScrapVehicle(vehicle)
											else
												QBCore.Functions.Notify("You can't smash a vehicle that owns it.", "error")
											end
										end,vehiclePlate)
									else
										QBCore.Functions.Notify("This Vehicle Cannot Be Scrapped.", "error")
									end
								else
									QBCore.Functions.Notify("You Are Not The Driver", "error")
								end
							end
						end
					end
				end
			end
			if #(pos - vector3(Config.Locations[closestScrapyard]["list"].x, Config.Locations[closestScrapyard]["list"].y, Config.Locations[closestScrapyard]["list"].z)) < 1.5 then
				if not IsPedInAnyVehicle(PlayerPedId()) and not emailSend then
					DrawText3Ds(Config.Locations[closestScrapyard]["list"].x, Config.Locations[closestScrapyard]["list"].y, Config.Locations[closestScrapyard]["list"].z, "~g~E~w~ - E-mail Vehicle List")
					if IsControlJustReleased(0, 38) then
						CreateListEmail()
					end
				end
			end
			if #(pos - vector3(Config.Locations[closestScrapyard]["exchange"].x, Config.Locations[closestScrapyard]["exchange"].y, Config.Locations[closestScrapyard]["exchange"].z)) < 1.5 then
				if not IsPedInAnyVehicle(PlayerPedId()) then
					DrawText3Ds(Config.Locations[closestScrapyard]["exchange"].x, Config.Locations[closestScrapyard]["exchange"].y, Config.Locations[closestScrapyard]["exchange"].z, "~g~E~w~ - Break Parts Down")
					if IsControlJustReleased(0, 38) then
						TriggerEvent("qb-scrapyard:client:exchangeItemsMenu")
					end
				end
			end
		end
	end
end)

RegisterNetEvent('qb-scapyard:client:setNewVehicles', function(vehicleList)
	Config.CurrentVehicles = vehicleList
end)

function CreateListEmail()
	if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then
		emailSend = true
		local vehicleList = ""
		for k, v in pairs(Config.CurrentVehicles) do
			if Config.CurrentVehicles[k] ~= nil then
				local vehicleInfo = QBCore.Shared.Vehicles[v]
				if vehicleInfo ~= nil then
					vehicleList = vehicleList  .. vehicleInfo["brand"] .. " " .. vehicleInfo["name"] .. "<br />"
				end
			end
		end
		SetTimeout(math.random(15000, 20000), function()
			emailSend = false
			TriggerServerEvent('qb-phone:server:sendNewMail', {
				sender = "Madryx Auto Yard",
				subject = "Vehicle List",
				message = "You Can Only Demolish A Number Of Vehicles.<br />You Can Keep Everything You Demolish For Yourself or Trade It In Over At the Warehouse Desk As Long As You Dont Bother Me.<br /><br /><strong>Vehicle List:</strong><br />".. vehicleList,
				button = {}
			})
		end)
	else
		QBCore.Functions.Notify("You Are Not Allowed To Strip Vehicles Now", "error")
	end
end

function ScrapVehicle(vehicle)
	isBusy = true
	local scrapTime = math.random(28000, 37000)
	ScrapVehicleAnim(scrapTime)
	QBCore.Functions.Progressbar("scrap_vehicle", "Stripping Vehicle", scrapTime, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
		TriggerServerEvent("qb-scrapyard:server:ScrapVehicle", GetVehicleKey(GetEntityModel(vehicle)))
		SetEntityAsMissionEntity(vehicle, true, true)
		DeleteVehicle(vehicle)
		isBusy = false
	end, function() -- Cancel
		StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
		isBusy = false
		QBCore.Functions.Notify("Canceled", "error")
	end)
end

function IsVehicleValid(vehicleModel)
	local retval = false
	if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then
		for k, v in pairs(Config.CurrentVehicles) do
			if Config.CurrentVehicles[k] ~= nil and GetHashKey(Config.CurrentVehicles[k]) == vehicleModel then
				retval = true
			end
		end
	end
	return retval
end

function GetVehicleKey(vehicleModel)
	local retval = 0
	if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then
		for k, v in pairs(Config.CurrentVehicles) do
			if GetHashKey(Config.CurrentVehicles[k]) == vehicleModel then
				retval = k
			end
		end
	end
	return retval
end

function SetClosestScrapyard()
	local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
	for id, scrapyard in pairs(Config.Locations) do
		if current ~= nil then
			if #(pos - vector3(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z)) < dist then
				current = id
				dist = #(pos - vector3(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z))
			end
		else
			dist = #(pos - vector3(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z))
			current = id
		end
	end
	closestScrapyard = current
end

RegisterNetEvent("qb-scrapyard:client:exchangeItemsMenu", function()
    local menu = {
        {
            header = "Madryx Auto Yard",
            txt = "Exchange parts down to make materials",
			isMenuHeader = true
        },
        {
            header = "Exchange Door",
            txt = "Exchange a door for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-door",
                    item = "metalscrap",
                    amountremove = 1,
                    amount = math.random(5,10)   --change the values in here to fit your server economy
                },
                isServer = false
            }
        },
        {
            header = "Exchange Trunk",
            txt = "Exchange a trunk for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-trunk",
                    item = "aluminum",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
        {
            header = "Exchange Hood",
            txt = "Exchange a hood for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-hood",
                    item = "metalscrap",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
        {
            header = "Exchange tyre",
            txt = "Exchange a Tyre for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-tyre",
                    item = "rubber",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Brakes",
            txt = "Exchange Brakes for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-brakes",
                    item = "metalscrap",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Bumper",
            txt = "Exchange a Bumper for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-bumper",
                    item = "plastic",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Engine",
            txt = "Exchange an Engine for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-engine",
                    item = "steel",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Exhaust",
            txt = "Exchange a Exhaust for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-exhaust",
                    item = "copper",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Headlight",
            txt = "Exchange a Headlight for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-headlight",
                    item = "plastic",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Mirror",
            txt = "Exchange Mirror for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-mirror",
                    item = "glass",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Rim",
            txt = "Exchange a Rim for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-rim",
                    item = "steel",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Seat",
            txt = "Exchange a Seat for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-seat",
                    item = "plastic",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Suspension",
            txt = "Exchange a Suspension for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-suspension",
                    item = "iron",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Transmission",
            txt = "Exchange a Transmission for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-transmission",
                    item = "iron",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Turbo",
            txt = "Exchange a Turbo for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-turbo",
                    item = "steel",
                    amountremove = 1,
                    amount = math.random(5,10)
                },
                isServer = false
            }
        },
		{
            header = "Exchange Internals",
            txt = "Exchange Internals for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-internals",
                    item = "copper",
                    amountremove = 1,
                    amount = math.random(10,20)
                },
                isServer = false
            }
        },
		{
            header = "Exchange NOS",
            txt = "Exchange a NOS for materials",
            params = {
                event = "qb-scrapyard:client:exchangeItems",
                args = {
                    itemremove = "chop-nos",
                    item = "iron",
                    amountremove = 1,
                    amount = math.random(10,20)
                },
                isServer = false
            }
        },
    }

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("qb-scrapyard:client:exchangeItems", function(data)
    TriggerServerEvent("qb-scrapyard:server:ExchangeItems", data.itemremove, data.item, data.amountremove, data.amount)
end)

function ScrapVehicleAnim(time)
    time = (time / 1000)
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(2000)
			time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function DrawText3Ds(x, y, z, text)
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
