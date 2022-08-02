local QBCore = exports['qb-core']:GetCoreObject()

local cameraActive = false
local currentCameraIndex = 0
local createdCamera = 0
local opened = false

local CreatedEntities = {}
local isPlacingCam = false

local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("qb-cameras:server:RequestSync")
end)

RegisterNetEvent('qb-cameras:client:SyncData')
AddEventHandler('qb-cameras:client:SyncData', function(data)
    Config.SecurityCameras.cameras = data
end)

-- 
RegisterNetEvent('qb-cameras:client:DisableCam')
AddEventHandler('qb-cameras:client:DisableCam', function(camID, enable)
    for k, v in pairs(Config.SecurityCameras.cameras) do 
        if v.camID == camID then 
            Config.SecurityCameras.cameras[k].isOnline = enable
            break
        end
    end
end)

RegisterNetEvent('qb-cameras:client:RemoveCamera')
AddEventHandler('qb-cameras:client:RemoveCamera', function(camID, isOwner, entity)
    if isOwner then
        for k, v in pairs(Config.SecurityCameras.cameras) do 
            if v.camID == camID then 
                table.remove(Config.SecurityCameras.cameras, k)
                break
            end
        end
    end
    if CreatedEntities[camID] ~= nil then 
        DeleteEntity(CreatedEntities[camID])
    end
    exports['qb-target']:RemoveZone("camera"..camID)
end)

RegisterNetEvent('qb-cameras:client:OpenMenu')
AddEventHandler('qb-cameras:client:OpenMenu', function()
    if not opened then 
        SendNUIMessage({
            type = "ui",
            status = true, 
            cameras = Config.SecurityCameras.cameras,
        })
        SetNuiFocus(true, true)
        opened = true
    else
        SendNUIMessage({
            type = "ui",
            status = false, 
            cameras = Config.SecurityCameras.cameras,
        })
        SetNuiFocus(true, true)
        opened = false
    end
end)

RegisterNUICallback('UIClosed', function(data)
    SetNuiFocus(false, false)
    opened = false
end)

RegisterNUICallback('OpenCamera', function(data)
    TriggerEvent("qb-cameras:client:ActiveCamera", tonumber(data.camid))
end)

RegisterNetEvent('qb-cameras:client:UseCCTVCamera')
AddEventHandler('qb-cameras:client:UseCCTVCamera', function(is360, GcamID)
    QBCore.Functions.Progressbar("camerkit", "Opening Camera Kit", 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 50,
    }, {}, {}, function() 
        --[[ DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
        local dialog.cameraid = nil
        input = true
        while true do 
            Wait(0)
            if input == true then
                HideHudAndRadarThisFrame()
                if UpdateOnscreenKeyboard() == 1 then
                    dialog.cameraid = GetOnscreenKeyboardResult() 
                    if string.len(dialog.cameraid) > 0 then
                        break
                    else
                        DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 10)
                    end
                end
            end
        end ]]

        local dialog = exports['qb-input']:ShowInput({
            header = "CAMERA SETUP",
            info = "Name Your Camera",
            submitText = "Confirm",
            inputs = {
                {
                    text = "Camera ID (#)", -- text you want to be displayed as a place holder
                    name = "cameraid", -- name of the input should be unique otherwise it might override
                    type = "text", -- type of the input
                    isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                }
            },
        })

    
        if dialog ~= nil then
            print(json.encode(dialog.cameraid))
            local prop, hash, cam, dropCoords, itemname = nil, nil, nil, nil, nil

            if is360 == 1 then 
                --prop = 'prop_cctv_pole_02'
                prop = 'prop_cctv_cam_07a'
                itemname = '360cctv'
            else
                --prop = 'prop_cctv_pole_04'
                prop = 'prop_cctv_cam_01b'      
                itemname = 'cctv'
            end

            hash = GetHashKey(prop)
            RequestModel(hash)
            while not HasModelLoaded(prop) do 
                Wait(500)
            end

            isPlacingCam = true
            local color = {r = 255, g = 255, b = 255, a = 255}

            SetCurrentPedWeapon(PlayerPedId(), 0xA2719263) 
            cam = CreateObject(prop, 1.0, 1.0, 1.0, false, true, false)
            CreatedEntities[GcamID] = cam
            SetEntityHeading(cam, GetEntityHeading(PlayerPedId()))
            SetEntityAlpha(cam, 200)
            SetEntityCollision(cam, false, false)
            SetEntityInvincible(cam, true)
            FreezeEntityPosition(cam, true)

            -- CreateThread(function()	-- While loop needed for delete lazer
                while true do
                    sleep = 1000
                    if isPlacingCam then
                        sleep = 7
                        local hit, coords, entity = RayCastGamePlayCamera(1000.0)
                        if hit and #(GetEntityCoords(PlayerPedId()) - coords) < 8.0 then
                            DrawLine(GetEntityCoords(PlayerPedId()), coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                            SetEntityCoords(cam, coords.x, coords.y, coords.z)
                            if IsControlJustReleased(0, 38) then
                                isPlacingCam = false
                                break
                            end
                        end
                    end
                    Wait(sleep)
                end
            -- end)
            
            --if dialog.cameraid ~= nil then 
                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                    if hasItem then 
                        QBCore.Functions.Progressbar("fixing camera", "Placing CCTV Camera", 2000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_movie_bulb@base",
                            anim = "base",
                            flags = 50,
                        }, {}, {}, function() 

                            SetEntityHeading(cam, GetEntityHeading(PlayerPedId()))
                            SetEntityAlpha(cam, 255)
                            FreezeEntityPosition(cam, true)
                            SetEntityInvincible(cam, true)
                            SetEntityAsMissionEntity(cam, true, true)

                            local camCoords = GetEntityCoords(cam)
                            if is360 == 1 then 
                                local id = #Config.SecurityCameras.cameras + 1
                                Config.SecurityCameras.cameras[id] = {
                                    label = dialog.cameraid, 
                                    type = "360-Vision CCTV Camera",
                                    coords = vector4(camCoords.x, camCoords.y, camCoords.z - 0.2, GetEntityHeading(cam)),
                                    r = {x = -25.0, y = 0.0, z = GetEntityHeading(cam)}, 
                                    canRotate = true, 
                                    isOnline = true,
                                    camID = GcamID,
                                }

                                TriggerServerEvent("qb-cameras:server:AddCamera", Config.SecurityCameras.cameras[id], true, cam)

                            else
                                local id = #Config.SecurityCameras.cameras + 1
                                Config.SecurityCameras.cameras[id] = {
                                    label = dialog.cameraid, 
                                    type = "Single Vision CCTV Camera",
                                    coords = vector4(camCoords.x, camCoords.y, camCoords.z - 0.2, GetEntityHeading(cam)),
                                    r = {x = 200.0, y = 180.0, z = GetEntityHeading(cam)}, 
                                    canRotate = false, 
                                    isOnline = true,
                                    camID = GcamID,
                                }

                                TriggerServerEvent("qb-cameras:server:AddCamera", Config.SecurityCameras.cameras[id], false, cam)
                            end
                            exports['qb-target']:AddEntityZone("camera-"..GcamID, cam, {
                                name = "camera-"..GcamID,
                                heading = GetEntityHeading(cam),
                                debugPoly = false,
                            }, {
                                options = {
                                    {
                                        type = "server",
                                        event = "qb-cameras:server:DisableCam",
                                        icon = "fa fa-camera",
                                        label = "Enable the Camera",
                                        camera = GcamID,
                                        enable = true,
                                    },
                                    {
                                        type = "server",
                                        event = "qb-cameras:server:DisableCam",
                                        icon = "fa fa-camera",
                                        label = "Disable the Camera",
                                        camera = GcamID,
                                        enable = false,
                                    },
                                    {
                                        type = "server",
                                        event = "qb-cameras:server:RemoveCamera",
                                        icon = "fa fa-camera",
                                        label = "Disconnect and Remove the Camera",
                                        camera = GcamID,
                                        ent = cam,
                                    },
                                },
                                distance = 3.0
                            })
                        end, function()

                            StopAnimTask(PlayerPedId(), "amb@prop_human_movie_bulb@base", "base", 1.0)
                            QBCore.Functions.Notify("Canceled", "error")
                            
                        end)
                    else
                        QBCore.Functions.Notify("You do not have the Required Item. Stop Exploiting Bugs!", "error", 5000)
                    end
                end, itemname)
            --end
        end

        
    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

-- SendNUIMessage({
--     type = "ui",
--     status = true, 
--     cameras = Config.SecurityCameras.cameras,
-- })
-- SetNuiFocus(true, true)

CreateThread(function()
    -- print(Config.SecurityCameras.cameras[1])

    while true do
        local ped = PlayerPedId()
        local pedPos = GetEntityCoords(ped, false)
        local pedHead = GetEntityRotation(ped, 2)
        -- if IsControlJustReleased(0, 74) then
        --     -- ??
        -- end
        if createdCamera ~= 0 then
            local instructions = CreateInstuctionScaleform("instructional_buttons")
            DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
            SetTimecycleModifier("scanline_cam_cheap")
            SetTimecycleModifierStrength(1.0)

            if Config.SecurityCameras.hideradar then
                DisplayRadar(false)
            end

            -- CLOSE CAMERAS
            if IsControlJustPressed(1, 177) then
                DoScreenFadeOut(250)
                while not IsScreenFadedOut() do
                    Wait(0)
                end
                CloseSecurityCamera()
                SendNUIMessage({
                    type = "disablecam",
                })
                DoScreenFadeIn(250)
            end

            ---------------------------------------------------------------------------
            -- CAMERA ROTATION CONTROLS
            ---------------------------------------------------------------------------

            if Config.SecurityCameras.cameras[currentCameraIndex].canRotate then
                local getCameraRot = GetCamRot(createdCamera, 2)
                -- print(createdCamera, GetGameplayCamRot(0).x + 0.7, 0.0, GetGameplayCamRot(0).z, GetEntityHeading(PlayerPedId()))
                SetCamRot(createdCamera, GetGameplayCamRot(0).x + 0.7, 0.0, GetGameplayCamRot(0).z, 2)
            end
        else
            --Wait(2000)
        end
        Wait(0)
    end
end)

RegisterNetEvent('qb-cameras:client:ActiveCamera')
AddEventHandler('qb-cameras:client:ActiveCamera', function(cameraId)
    -- print(cameraId, Config.SecurityCameras.cameras[cameraId])
    if Config.SecurityCameras.cameras[cameraId] ~= nil then
        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Wait(0)
        end
        SendNUIMessage({
            type = "enablecam",
            label = Config.SecurityCameras.cameras[cameraId].label,
            id = cameraId,
            connected = Config.SecurityCameras.cameras[cameraId].isOnline,
            time = GetCurrentTime(),
        })
        local firstCamx = Config.SecurityCameras.cameras[cameraId].coords.x
        local firstCamy = Config.SecurityCameras.cameras[cameraId].coords.y
        local firstCamz = Config.SecurityCameras.cameras[cameraId].coords.z - 0.5
        local firstCamr = Config.SecurityCameras.cameras[cameraId].r
        SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
        ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
        currentCameraIndex = cameraId
        DoScreenFadeIn(250)
    elseif cameraId == 0 then
        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Wait(0)
        end
        CloseSecurityCamera()
        SendNUIMessage({
            type = "disablecam",
        })
        DoScreenFadeIn(250)
    else
        QBCore.Functions.Notify("Camera doesn\'t exist..", "error")
    end
end)

-- RegisterNetEvent('police:client:DisableAllCameras')
-- AddEventHandler('police:client:DisableAllCameras', function()
--     for k, v in pairs(Config.SecurityCameras.cameras) do 
--         Config.SecurityCameras.cameras[k].isOnline = false
--     end
-- end)

-- RegisterNetEvent('police:client:EnableAllCameras')
-- AddEventHandler('police:client:EnableAllCameras', function()
--     for k, v in pairs(Config.SecurityCameras.cameras) do 
--         Config.SecurityCameras.cameras[k].isOnline = true
--     end
-- end)

-- RegisterNetEvent('police:client:SetCamera')
-- AddEventHandler('police:client:SetCamera', function(key, isOnline)
--     Config.SecurityCameras.cameras[key].isOnline = isOnline
-- end)

---------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------
function GetCurrentTime()
    local hours = GetClockHours()
    local minutes = GetClockMinutes()
    if hours < 10 then
        hours = tostring(0 .. GetClockHours())
    end
    if minutes < 10 then
        minutes = tostring(0 .. GetClockMinutes())
    end
    return tostring(hours .. ":" .. minutes)
end

function ChangeSecurityCamera(x, y, z, r)
    if createdCamera ~= 0 then
        DestroyCam(createdCamera, 0)
        createdCamera = 0
    end

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, x, y, z)
    SetCamRot(cam, r.x, r.y, r.z, 2)
    -- print(r.x, r.y, r.z, GetEntityHeading(PlayerPedId()))
    RenderScriptCams(1, 0, 0, 1, 1)
    Wait(250)
    createdCamera = cam
end

function CloseSecurityCamera()
    DestroyCam(createdCamera, 0)
    RenderScriptCams(0, 0, 1, 1, 1)
    createdCamera = 0
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    if Config.SecurityCameras.hideradar then
        DisplayRadar(true)
    end
    FreezeEntityPosition(GetPlayerPed(PlayerId()), false)
end

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = #(p - vector3(x, y, z))
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0*scale, 0.35*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function CreateInstuctionScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, 194, true))
    InstructionButtonMessage("Close Camera")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

RegisterNetEvent("qb-cameras:client:CreateCamerasAndTarget")
AddEventHandler("qb-cameras:client:CreateCamerasAndTarget", function(data, player)

    if player ~= GetPlayerServerId(PlayerId()) then
        for k, v in pairs(data) do 
            local dt = v
            if type(v) ~= "table" then
                dt = json.decode(v)
            else
                dt = v
            end

            local prop, hash, cam = nil, nil, nil

            if dt.canRotate then 
                prop = 'prop_cctv_cam_07a'
            else
                prop = 'prop_cctv_cam_01b'      
            end
        
            hash = GetHashKey(prop)
            RequestModel(hash)
            while not HasModelLoaded(prop) do 
                Wait(500)
            end
            
            cam = CreateObject(prop, dt.coords.x, dt.coords.y, dt.coords.z, false, true, false)

            CreatedEntities[dt.camID] = cam

            SetEntityHeading(cam, dt.coords.w)
            FreezeEntityPosition(cam, true)
            SetEntityAlpha(cam, 255)
            SetEntityInvincible(cam, true)
            SetEntityAsMissionEntity(cam, true, true)
            SetEntityInvincible(cam, true)

            exports['qb-target']:AddEntityZone("camera-"..dt.camID, cam, {
                name = "camera-"..dt.camID,
                heading = GetEntityHeading(cam),
                debugPoly = false,
            }, {
                options = {
                    {
                        type = "server",
                        event = "qb-cameras:server:DisableCam",
                        icon = "fa fa-camera",
                        label = "Enable Camera",
                        camera = dt.camID,
                        enable = true,
                    },
                    {
                        type = "server",
                        event = "qb-cameras:server:DisableCam",
                        icon = "fa fa-camera",
                        label = "Disable Camera",
                        camera = dt.camID,
                        enable = false,
                    },
                    {
                        type = "server",
                        event = "qb-cameras:server:RemoveCamera",
                        icon = "fa fa-camera",
                        label = "Disconnect and Remove the Camera",
                        camera = dt.camID,
                        ent = cam,
                    },
                },
                distance = 3.0
            })
        end
    end

end)