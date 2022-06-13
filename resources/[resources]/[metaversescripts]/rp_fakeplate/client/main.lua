local NumberCharset = {}
local Charset = {}
owned = false
hasfake = false

local isInstalling = false

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

local changingplate = false
RegisterNetEvent("qb-fakeplate:client:ChangePlate")
AddEventHandler("qb-fakeplate:client:ChangePlate", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehicleplate =  GetVehicleNumberPlateText(vehicle)
    local nearbyv = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(PlayerPedId())
    local putDist = GetDistanceBetweenCoords(pos, nearbyv)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then
        if putDist <= 3 then
            QBCore.Functions.TriggerCallback("fakeplate:server:GetOwnedVehicles", function(result)
                owned = false
                hasfake = false

                if result == nil then QBCore.Functions.Notify("You do not own this vehicle!", "error", 2500) return end
                
                for k, v in pairs(result) do
                    if result[k].fakeplate == vehicleplate then
                        QBCore.Functions.Notify("Vehicle already has a fake plate!", "error", 2500)
                        hasfake = true
                    end
                    if result[k].plate == vehicleplate then
                        owned = true
                    end
                end
                if owned and not hasfake then
                    if not isInstalling then
                        QBCore.Functions.TriggerCallback('fakeplate:server:GeneratePlate', function(fakeplate)
                        if fakeplate ~= nil then    
                            local installtime = math.random(5000, 10000)
                            ChangePlateAnim(installtime)
                            isInstalling = true
                            QBCore.Functions.Progressbar("install_fakeplate", "Installing Fake Plate", installtime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                changingplate = false
                                StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                                SetVehicleNumberPlateText(vehicle, fakeplate)
                                TriggerServerEvent('QBCore:Server:RemoveItem', "license_plate", 1)
                                TriggerEvent("vehiclekeys:client:SetOwner", fakeplate)
                                TriggerServerEvent('qb-fakeplate:server:updatePlate', vehicleplate, fakeplate)
                                local itemInfo = QBCore.Shared.Items["license_plate"]
                                TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
                                QBCore.Functions.Notify("Fake Plate Installed", "success", 3500)
                                isInstalling = false
                            end, function() -- Cancel
                                changingplate = false
                                StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                                QBCore.Functions.Notify("Failed!", "error")
                                isInstalling = false
                            end)
                        else
                            fakeplate = ""
                        end
                        end, vehicleplate)
                    end
                elseif not owned and not hasfake then
                    QBCore.Functions.Notify("You don't own this vehicle", "error", 2500)
                end
            end)
        else
            QBCore.Functions.Notify("No Vehicle Nearby" , "error", 2500)
        end
    else
        QBCore.Functions.Notify("Must be outside vehicle", "error", 2500)
    end
end)

RegisterNetEvent("qb-fakeplate:client:RemovePlate")
AddEventHandler("qb-fakeplate:client:RemovePlate", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehicleplate =  GetVehicleNumberPlateText(vehicle)
    local nearbyv = GetEntityCoords(vehicle)
    local position = GetEntityCoords(PlayerPedId())
    local putDist = GetDistanceBetweenCoords(position, nearbyv)
    local owned = false
    local hasfake = false
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then
        if putDist <= 3 then
            QBCore.Functions.TriggerCallback("fakeplate:server:GetOwnedVehicles", function(result)
                if result == nil then QBCore.Functions.Notify("You do not own this vehicle!", "error", 2500) return end
                for k, v in pairs(result) do
                    if result[k].fakeplate == vehicleplate then
                        hasfake = true
                        owned = true
                    end
                    if result[k].plate == vehicleplate then
                        QBCore.Functions.Notify("Nothing happened.", "error", 2500)
                        hasfake = false
                        owned = true
                    end
                end
                if owned and hasfake then
                    QBCore.Functions.TriggerCallback('qb-fakeplate:server:getRealPlate', function(realplate)
                    if realplate ~= nil then  
                        TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 8.0, -1, 16, -1, false, false, false)
                        local breakchance = math.random(1,100)
                        local finished = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                        if finished ~= 100 then ---failed
                             QBCore.Functions.Notify("Failed to remove fake plate", "error", 2500)
                             StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                             ClearPedTasksImmediately(PlayerPedId())
                             if breakchance <= 10 then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "screwdriverset", 1)
                                local itemInfo = QBCore.Shared.Items["screwdriverset"]
                                TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
                                QBCore.Functions.Notify("You broke your toolset!", "error", 5000)
                             end
                             return
                        end
                        
                        SetVehicleNumberPlateText(vehicle, realplate)
                        TriggerServerEvent('qb-fakeplate:server:updatePlate', realplate)
                        TriggerEvent("vehiclekeys:client:SetOwner", realplate)----might not need this
                        StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                        QBCore.Functions.Notify("Fake plate removed", "success", 2500)
                    end
                    end, vehicleplate)
                elseif not owned then
                    QBCore.Functions.Notify("You don't own this vehicle", "error", 2500)
                elseif owned and not fakeplate then
                    QBCore.Functions.Notify("This vehicle doesn't have a fake plate", "error", 2500)
                end
            end)
        else
            QBCore.Functions.Notify("No Vehicle Nearby" , "error", 2500)
        end
    else
        QBCore.Functions.Notify("Must be outside vehicle", "error", 2500)
    end
end)

function ChangePlateAnim(time)
    time = time / 1000
    loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
    TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,3.0, 3.0, -1, 16, 0, false, false, false)
    changingplate = true
    Citizen.CreateThread(function()
        while changingplate do
            TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000)
            time = time - 1
            if time <= 0 then
                changingplate = false
                StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            end
        end
    end)
end







