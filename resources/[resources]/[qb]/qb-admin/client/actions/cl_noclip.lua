local floor = math.floor
local vector3 = vector3
local SetCamRot = SetCamRot
local IsCamActive = IsCamActive
local SetCamCoord = SetCamCoord
local LoadInterior = LoadInterior
local SetFocusArea = SetFocusArea
local LockMinimapAngle = LockMinimapAngle
local GetInteriorAtCoords = GetInteriorAtCoords
local LockMinimapPosition = LockMinimapPosition

local _internal_camera = nil
local _internal_isFrozen = false

local _internal_pos = nil
local _internal_rot = nil
local _internal_fov = nil
local _internal_vecX = nil
local _internal_vecY = nil
local _internal_vecZ = nil

local rad = math.rad
local sin = math.sin
local cos = math.cos
local min = math.min
local max = math.max
local type = type

noClipEnabled = false
local freecamVeh = 0

local Wait = Citizen.Wait
local vector3 = vector3
local IsPauseMenuActive = IsPauseMenuActive
local GetSmartControlNormal = GetSmartControlNormal

local CAMERA_SETTINGS = {
    --Camera
  FOV = 50.0,

  -- On enable/disable
  ENABLE_EASING = true,
  EASING_DURATION = 250,

  -- Keep position/rotation
  KEEP_POSITION = false,
  KEEP_ROTATION = false
}

local CONTROL_SETTINGS = {
    -- Rotation
    LOOK_SENSITIVITY_X = 5,
    LOOK_SENSITIVITY_Y = 5,
  
    -- Position
    BASE_MOVE_MULTIPLIER = 0.85,
    FAST_MOVE_MULTIPLIER = 6,
    SLOW_MOVE_MULTIPLIER = 6,
}

-- [ Code ] --

-- [ Functions ] --

function toggleFreecam(enabled)
    noClipEnabled = enabled
    local ped = PlayerPedId()
    SetEntityVisible(ped, not enabled)
    SetEntityInvincible(ped, enabled)
    FreezeEntityPosition(ped, enabled)

    if enabled then
        freecamVeh = GetVehiclePedIsIn(ped, false)
        if freecamVeh > 0 then
            NetworkSetEntityInvisibleToNetwork(freecamVeh, true)
            SetEntityCollision(freecamVeh, false, false)
        end
    end

    function enableNoClip()
        lastTpCoords = GetEntityCoords(ped)

        SetFreecamActive(true)
        StartFreecamThread()

        Citizen.CreateThread(function()
            while IsFreecamActive() do
                SetEntityLocallyInvisible(ped)
                if freecamVeh > 0 then
                    if DoesEntityExist(freecamVeh) then
                        SetEntityLocallyInvisible(freecamVeh)
                    else
                        freecamVeh = 0
                    end
                end
                Wait(0)
            end

            if not DoesEntityExist(freecamVeh) then
                freecamVeh = 0
            end
            if freecamVeh > 0 then
                local coords = GetEntityCoords(ped)
                NetworkSetEntityInvisibleToNetwork(freecamVeh, false)
                SetEntityCollision(freecamVeh, true, true)
                SetEntityCoords(freecamVeh, coords[1], coords[2], coords[3])
                SetPedIntoVehicle(ped, freecamVeh, -1)
                freecamVeh = 0
            end
        end)
    end

    function disableNoClip()
        SetFreecamActive(false)
        SetGameplayCamRelativeHeading(0)
    end

    if not IsFreecamActive() and enabled then
        QBCore.Functions.Notify('Noclip '..Lang:t("actions.enabled"), 'success')
        enableNoClip()
    end

    if IsFreecamActive() and not enabled then
        QBCore.Functions.Notify('Noclip '..Lang:t("actions.disabled"), 'error')
        disableNoClip()
    end
end

-- [ Freecam ] --

-------------------------------------------------------------------------------
local function GetSpeedMultiplier()
  local fastNormal = GetSmartControlNormal(21)
  local slowNormal = GetSmartControlNormal(19)

  local baseSpeed = CONTROL_SETTINGS.BASE_MOVE_MULTIPLIER
  local fastSpeed = 1 + ((CONTROL_SETTINGS.FAST_MOVE_MULTIPLIER - 1) * fastNormal)
  local slowSpeed = 1 + ((CONTROL_SETTINGS.SLOW_MOVE_MULTIPLIER - 1) * slowNormal)

  local frameMultiplier = GetFrameTime() * 60
  local speedMultiplier = baseSpeed * fastSpeed / slowSpeed

  return speedMultiplier * frameMultiplier
end

local function UpdateCamera()
  if not IsFreecamActive() or IsPauseMenuActive() then
    return
  end

  if not IsFreecamFrozen() then
    local vecX, vecY = GetFreecamMatrix()
    local vecZ = vector3(0, 0, 1)

    local pos = GetFreecamPosition()
    local rot = GetFreecamRotation()

    -- Get speed multiplier for movement
    local speedMultiplier = GetSpeedMultiplier()

    -- Get rotation input
    local lookX = GetSmartControlNormal(1) -- Mouse right
    local lookY = GetSmartControlNormal(2) -- Mouse down

    -- Get position input
    local moveX = GetSmartControlNormal(30) -- D
    local moveY = GetSmartControlNormal(31) -- S
    local moveZ = GetSmartControlNormal({152, 153})

    -- Calculate new rotation.
    local rotX = rot.x + (-lookY * CONTROL_SETTINGS.LOOK_SENSITIVITY_X)
    local rotZ = rot.z + (-lookX * CONTROL_SETTINGS.LOOK_SENSITIVITY_Y)
    local rotY = rot.y

    -- Adjust position relative to camera rotation.
    pos = pos + (vecX *  moveX * speedMultiplier)
    pos = pos + (vecY * -moveY * speedMultiplier)
    pos = pos + (vecZ *  moveZ * speedMultiplier)

    -- Adjust new rotation
    rot = vector3(rotX, rotY, rotZ)

    -- Update camera
    SetFreecamPosition(pos.x, pos.y, pos.z)
    SetFreecamRotation(rot.x, rot.y, rot.z)
  
    return pos, rotZ
  end

  -- Trigger a tick event. Resources depending on the freecam position can
  -- make use of this event.
  -- TriggerEvent('freecam:onTick')
end

-------------------------------------------------------------------------------
function StartFreecamThread()
  -- Camera/Pos updating thread
  Citizen.CreateThread(function ()
    local ped = PlayerPedId()
    local initialPos = GetEntityCoords(ped)
    SetFreecamPosition(initialPos[1], initialPos[2], initialPos[3])

    local function updatePos(pos, rotZ)
      if pos ~= nil and rotZ ~= nil then
        -- Update ped
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        SetEntityHeading(ped, rotZ)
        -- Update veh
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh > 0 then 
          SetEntityCoords(veh, pos.x, pos.y, pos.z)
        end
      end
    end

    local frameCounter = 0
    local loopPos, loopRotZ
    while IsFreecamActive() do
      loopPos, loopRotZ = UpdateCamera()
      frameCounter = frameCounter + 1
      if frameCounter > 100 then
        frameCounter = 0
        updatePos(loopPos, loopRotZ)
      end
      Wait(0)
    end

    -- One last time due to the optimization
    updatePos(loopPos, loopRotZ)
  end)
  
  local function InstructionalButton(controlButton, text)
    ScaleformMovieMethodAddParamPlayerNameString(controlButton)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
  end
  
  --Scaleform drawing thread
  Citizen.CreateThread(function()
    local scaleform = RequestScaleformMovie("instructional_buttons")
    while not HasScaleformMovieLoaded(scaleform) do
      Wait(1)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()
  
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    InstructionalButton(GetControlInstructionalButton(0, 21, 1), Lang:t('actions.faster')) -- Left Shift
    PopScaleformMovieFunctionVoid()
      
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionalButton(GetControlInstructionalButton(0, 19, 1), Lang:t('actions.slower')) -- left Alt
    PopScaleformMovieFunctionVoid()
      
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    InstructionalButton(GetControlInstructionalButton(0, 31, 1), Lang:t('actions.fwdback')) -- S
    PopScaleformMovieFunctionVoid()
      
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    InstructionalButton(GetControlInstructionalButton(0, 30, 1), Lang:t('actions.leftright')) -- D
    PopScaleformMovieFunctionVoid()
  
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    InstructionalButton(GetControlInstructionalButton(0, 153, 1), Lang:t('actions.down')) -- E
    PopScaleformMovieFunctionVoid()
  
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    InstructionalButton(GetControlInstructionalButton(0, 152, 1), Lang:t('actions.up')) -- Q
    PopScaleformMovieFunctionVoid()
  
    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()
  
    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
  
    while IsFreecamActive() do
      DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
      Wait(0)
    end
    SetScaleformMovieAsNoLongerNeeded()
  end)
end

--------------------------------------------------------------------------------

-- When the resource is stopped, make sure to return the camera to the player.
AddEventHandler('onResourceStop', function (resourceName)
  if resourceName == GetCurrentResourceName() then
    SetFreecamActive(false)
  end
end)


-- [ NEEDS ] --

--------------------------------------------------------------------------------

function GetInitialCameraPosition()
  if CAMERA_SETTINGS.KEEP_POSITION and _internal_pos then
    return _internal_pos
  end

  return GetGameplayCamCoord()
end

function GetInitialCameraRotation()
  if CAMERA_SETTINGS.KEEP_ROTATION and _internal_rot then
    return _internal_rot
  end

  local rot = GetGameplayCamRot()
  return vector3(rot.x, 0.0, rot.z)
end

--------------------------------------------------------------------------------

function IsFreecamFrozen()
  return _internal_isFrozen
end

function SetFreecamFrozen(frozen)
  local frozen = frozen == true
  _internal_isFrozen = frozen
end

--------------------------------------------------------------------------------

function GetFreecamPosition()
  return _internal_pos
end

function SetFreecamPosition(x, y, z)
  local pos = vector3(x, y, z)
  local int = GetInteriorAtCoords(pos)

  LoadInterior(int)
  SetFocusArea(pos)
  LockMinimapPosition(x, y)
  SetCamCoord(_internal_camera, pos)

  _internal_pos = pos
end

--------------------------------------------------------------------------------

function GetFreecamRotation()
  return _internal_rot
end


function SetFreecamRotation(x, y, z)
  local rotX, rotY, rotZ = ClampCameraRotation(x, y, z)
  local vecX, vecY, vecZ = EulerToMatrix(rotX, rotY, rotZ)
  local rot = vector3(rotX, rotY, rotZ)

  LockMinimapAngle(floor(rotZ))
  SetCamRot(_internal_camera, rot)

  _internal_rot  = rot
  _internal_vecX = vecX
  _internal_vecY = vecY
  _internal_vecZ = vecZ
end

--------------------------------------------------------------------------------

function GetFreecamFov()
  return _internal_fov
end

function SetFreecamFov(fov)
  local fov = Clamp(fov, 0.0, 90.0)
  SetCamFov(_internal_camera, fov)
  _internal_fov = fov
end

--------------------------------------------------------------------------------

function GetFreecamMatrix()
  return _internal_vecX,
         _internal_vecY,
         _internal_vecZ,
         _internal_pos
end

function GetFreecamTarget(distance)
  local target = _internal_pos + (_internal_vecY * distance)
  return target
end

--------------------------------------------------------------------------------

function IsFreecamActive()
  return IsCamActive(_internal_camera) == 1
end

function SetFreecamActive(active)
  if active == IsFreecamActive() then
    return
  end

  local enableEasing = CAMERA_SETTINGS.ENABLE_EASING
  local easingDuration = CAMERA_SETTINGS.EASING_DURATION

  if active then
    local pos = GetInitialCameraPosition()
    local rot = GetInitialCameraRotation()

    _internal_camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

    SetFreecamFov(CAMERA_SETTINGS.FOV)
    SetFreecamPosition(pos.x, pos.y, pos.z)
    SetFreecamRotation(rot.x, rot.y, rot.z)
    -- TriggerEvent('freecam:onEnter')
  else
    DestroyCam(_internal_camera)
    ClearFocus()
    UnlockMinimapPosition()
    UnlockMinimapAngle()
    -- TriggerEvent('freecam:onExit')
  end

  RenderScriptCams(active, enableEasing, easingDuration, true, true)
end

function Clamp(x, _min, _max)
  return min(max(x, _min), _max)
end

function ClampCameraRotation(rotX, rotY, rotZ)
  local x = Clamp(rotX, -90.0, 90.0)
  local y = rotY % 360
  local z = rotZ % 360
  return x, y, z
end

function IsGamepadControl()
  return not IsInputDisabled(2)
end

function GetSmartControlNormal(control)
  if type(control) == 'table' then
    local normal1 = GetDisabledControlNormal(0, control[1])
    local normal2 = GetDisabledControlNormal(0, control[2])
    return normal1 - normal2
  end

  return GetDisabledControlNormal(0, control)
end

function EulerToMatrix(rotX, rotY, rotZ)
  local radX = rad(rotX)
  local radY = rad(rotY)
  local radZ = rad(rotZ)

  local sinX = sin(radX)
  local sinY = sin(radY)
  local sinZ = sin(radZ)
  local cosX = cos(radX)
  local cosY = cos(radY)
  local cosZ = cos(radZ)

  local vecX = {}
  local vecY = {}
  local vecZ = {}

  vecX.x = cosY * cosZ
  vecX.y = cosY * sinZ
  vecX.z = -sinY

  vecY.x = cosZ * sinX * sinY - cosX * sinZ
  vecY.y = cosX * cosZ - sinX * sinY * sinZ
  vecY.z = cosY * sinX

  vecZ.x = -cosX * cosZ * sinY + sinX * sinZ
  vecZ.y = -cosZ * sinX + cosX * sinY * sinZ
  vecZ.z = cosX * cosY

  vecX = vector3(vecX.x, vecX.y, vecX.z)
  vecY = vector3(vecY.x, vecY.y, vecY.z)
  vecZ = vector3(vecZ.x, vecZ.y, vecZ.z)

  return vecX, vecY, vecZ
end
