-- TriggerEvent("qb-props:attachProp", flagProp, 24818, -0.25, -0.25, 0.0, 180.0, 90.0, 0.0)
local QBCore = exports['qb-core']:GetCoreObject()

local attachedProps = {}

function removeAttachedProp()
  for _, v in pairs(attachedProps) do
    DeleteEntity(v)
  end
  attachedProps = {}
end

function attachProp(attachModelSent, boneNumberSent, x, y, z, xR, yR, zR, keepOtherProps, altVertex)
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
  attachedProps[#attachedProps + 1] = attachedProp
  AttachEntityToEntity(attachedProp, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 1, not altVertex and 2 or 0, 1)
  SetModelAsNoLongerNeeded(attachModel)
end

AddEventHandler("qb-props:attachProp", function(attachModelSent, boneNumberSent, x, y, z, xR, yR, zR, keepOtherProps, altVertex)
  attachProp(attachModelSent, boneNumberSent, x, y, z, xR, yR, zR, keepOtherProps, altVertex)
end)

AddEventHandler("qb-props:removeProp", function()
  removeAttachedProp()
end)