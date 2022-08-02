local wingsuiting = false
local usedSuperBoost = false
local superBoostActive = false


local attachedProps = {}
local attachPropsByName = {}


function removeAttachedProp()
  for _, v in pairs(attachedProps) do
    DeleteEntity(v)
  end
  attachedProps = {}
end
function removeAttachedPropByName(pName)
  local v = attachPropsByName[pName]
  DeleteEntity(v)
end
function attachProp(attachModelSent, boneNumberSent, x, y, z, xR, yR, zR, keepOtherProps, altVertex, name)
  if not keepOtherProps then
    removeAttachedProp()
  end
  attachModel = GetHashKey(attachModelSent)
  boneNumber = boneNumberSent
  local bone = GetPedBoneIndex(PlayerPedId(), boneNumberSent)
  RequestModel(attachModel)
  while not HasModelLoaded(attachModel) do
    Wait(0)
  end
  local attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
  if name then
    attachPropsByName[name] = attachedProp
  else
    attachedProps[#attachedProps + 1] = attachedProp
  end
  AttachEntityToEntity(attachedProp, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 1, not altVertex and 2 or 0, 1)
  SetModelAsNoLongerNeeded(attachModel)
end

AddEventHandler("qb-props:attachProp", function(attachModelSent, boneNumberSent, x, y, z, xR, yR, zR, keepOtherProps, altVertex, name)
  attachProp(attachModelSent, boneNumberSent, x, y, z, xR, yR, zR, keepOtherProps, altVertex, name)
end)
AddEventHandler("qb-props:removeProp", function()
  removeAttachedProp()
end)
AddEventHandler("qb-props:removePropByName", function(pName)
  removeAttachedPropByName(pName)
end)



RegisterNetEvent('qb-wingsuit-use', function()
  if wingsuiting then return end
  local playerPed = PlayerPedId()
  local veh = GetVehiclePedIsIn(playerPed, false)
  if veh ~= 0 then return end
  if GetEntityHeightAboveGround(playerPed) < 2 then return end
  wingsuiting = true
  usedSuperBoost = false
  CreateThread(function()
    TriggerServerEvent("QBCore:Server:RemoveItem", "qb-wingsuit", 1)
    Wait(200)
    TriggerEvent("qb-props:attachProp", "qb-wingsuit_open", 24817, 0.1, -0.15, 0.0, 0.0, 90.0, 0.0, true, true, "qb-wingsuit_open")
  end)
  CreateThread(function()
    SetPlayerParachuteModelOverride(PlayerId(), `p_parachute1_mp_s`)
    SetPedParachuteTintIndex(playerPed, 6)
    GiveWeaponToPed(playerPed, -72657034, 1, 0, 1)
  end)
  CreateThread(function()
    while not IsPedInParachuteFreeFall(playerPed) do
      Wait(0)
    end
    while (GetEntityHeightAboveGround(playerPed) > 1) and (GetPedParachuteState(PlayerPedId()) < 1) do
      Wait(500)
    end
    TriggerEvent("qb-props:removePropByName", "qb-wingsuit_open")
    Wait(20000)
    ExecuteCommand('propstuck')
    wingsuiting = false
  end)
  CreateThread(function()
    while not IsPedInParachuteFreeFall(playerPed) do
      Wait(0)
    end
    while (GetEntityHeightAboveGround(playerPed) > 1) and (GetPedParachuteState(PlayerPedId()) < 1) do
      if IsControlPressed(0, 8) and (not superBoostActive) then
        ApplyForceToEntity(playerPed, 1, 0.0, 30.0, 2.5, 0.0, 0.0, 0.0, 0, true, false, false, false, true)
      elseif IsControlPressed(0, 32) and (not superBoostActive) then
        ApplyForceToEntity(playerPed, 1, 0.0, 80.0, 75.0, 0.0, 0.0, -75.0, 0, true, false, false, false, true)
      end
      if IsControlPressed(0, 22) and (not usedSuperBoost) then
        usedSuperBoost = true
        CreateThread(function()
          superBoostActive = true
          while superBoostActive do
            ApplyForceToEntity(playerPed, 1, 0.0, 200.0, 400.0, 0.0, 0.0, -300.0, 0, true, false, false, false, true)
            Wait(0)
          end
        end)
        CreateThread(function()
          Wait(1500)
          superBoostActive = false
        end)
      end
      Wait(0)
    end
  end)
end)





-- pail and shovel

RegisterNetEvent('qb-sandcastles', function()
  local validSand = {
    [-1595148316] = true,
    [1288448767] = true,
}
local sandcastles = {
    `prop_beach_sandcas_01`,
    `prop_beach_sandcas_03`,
    `prop_beach_sandcas_04`,
    `prop_beach_sandcas_05`,
}

local ped = PlayerPedId()

if IsPedInAnyVehicle(ped, true) then
    return false
end

local offsetCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 1.5, 0)
local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(offsetCoords.x, offsetCoords.y, offsetCoords.z, offsetCoords.x, offsetCoords.y, offsetCoords.z - 2, 1, 0, 4)
local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
if not hit then return end
if not validSand[materialHash] then return end

TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
  local success = exports['qb-lock']:StartLockPickCircle(3,20)
  ClearPedTasks(ped)
    if success then
      local sandcastle = sandcastles[math.random(1, #sandcastles)]
      RequestModel(sandcastle)
      while not HasModelLoaded(sandcastle) do
          Wait(0)
      end
      local obj = CreateObject(sandcastle, endCoords, true, false, false)
      SetTimeout(120000, function()
          SetEntityAsMissionEntity(obj, true, true)
          --Sync.DeleteObject(obj)
      end)
    else
      QBCore.Functions.Notify("You can't even build a sand castle lmao..", 'error')
  end
    return false
end)

