local QBCore = exports['qb-core']:GetCoreObject()
local listening, currentPrompt = false, nil
local defaultDuiUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
local currentBoardUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
local currentMeetingRoomBoardUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
local inClassRoom, inMeetingRoom = false, false
local dui = nil

CreateThread(function()
  exports["qb-polyzone"]:AddPolyZone("mrpd_classroom", {
    vector2(448.41372680664, -990.47613525391),
    vector2(439.50704956055, -990.55731201172),
    vector2(439.43478393555, -981.08758544922),
    vector2(448.419921875, -981.26306152344),
    vector2(450.23190307617, -983.00885009766),
    vector2(450.25042724609, -988.77667236328)
  }, {
    gridDivisions = 25,
    minZ = 34.04,
    maxZ = 37.69
  })


  --[[ exports["qb-polyzone"]:AddBoxZone("mrdp_change_picture", vector3(439.44, -985.89, 34.97), 1.0, 0.4, {
    heading=0,
    minZ=35.37,
    maxZ=36.17
  })

  exports["qb-polyzone"]:AddBoxZone("mrpd_meetingroom_screen", vector3(474.02, -1001.79, 30.69), 3.6, 2.8, {
    heading=1,
    minZ=30.54,
    maxZ=32.54
  }) ]]
end)

local zoneData = {}

AddEventHandler("qb-polyzone:enter", function(zone)
  local currentZone = zoneData[zone]
  if zone == "mrpd_classroom" then
    if not dui then
      dui = exports["np-lib"]:getDui(currentBoardUrl)
      AddReplaceTexture('prop_planning_b1', 'prop_base_white_01b', dui.dictionary, dui.texture)
    else
      exports["np-lib"]:changeDuiUrl(dui.id, currentBoardUrl)
    end
    inClassRoom = true
  elseif zone == "mrpd_meetingroom" then
    if not dui then
      dui = exports["np-lib"]:getDui(currentMeetingRoomBoardUrl)
      AddReplaceTexture('prop_planning_b1', 'prop_base_white_01b', dui.dictionary, dui.texture)
    else
      exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
    end
    inMeetingRoom = true
  elseif currentZone then --and isCop
    currentPrompt = zone
    local prompt = type(currentPrompt.promptText) == 'function' and currentPrompt.promptText() or currentPrompt.promptText
    exports["qb-ui"]:showInteraction(prompt)
    listenForKeypress(zone)
  end
end)

AddEventHandler("qb-polyzone:exit", function(zone)
  local currentZone = zoneData[zone]
  if zone == "mrpd_classroom" then
    RemoveReplaceTexture('prop_planning_b1', 'prop_base_white_01b')
    if dui ~= nil then
      exports["np-lib"]:releaseDui(dui.id)
      dui = nil
    end
    inClassRoom = false
  elseif zone == "mrpd_meetingroom" then
    RemoveReplaceTexture('prop_planning_b1', 'prop_base_white_01b')
    if dui ~= nil then
      exports["np-lib"]:releaseDui(dui.id)
      dui = nil
    end
    inMeetingRoom = false
  elseif currentZone then
    exports["qb-ui"]:hideInteraction()
    listening = false
    currentPrompt = nil
  end
end)

--[[ RegisterNetEvent("police:changewhiteboardcli")
AddEventHandler("police:changewhiteboardcli", function(pUrl, pRoom)
  if pRoom == "mrpd_classroom" and inClassRoom and dui then
    currentBoardUrl = pUrl
    exports["np-lib"]:changeDuiUrl(dui.id, currentBoardUrl)
  elseif pRoom == "mrpd_meetingroom" and inMeetingRoom and dui then
    currentMeetingRoomBoardUrl = pUrl
    exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
  end
end) ]]

CreateThread(function()
  local duiObj = CreateDui(defaultDuiUrl, 1064, 661)
  _G.duiObj = duiObj
  local dui = GetDuiHandle(duiObj)
  local txd = CreateRuntimeTxd('duiTxd')
  local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
end)

RegisterNetEvent("police:client:SetBoardPhoto")
AddEventHandler("police:client:SetBoardPhoto", function(pUrl)
  currentBoardUrl = pUrl
  if inClassRoom then
    SetDuiUrl(_G.duiObj, currentBoardUrl)
    TriggerEvent("police:changewhiteboardclipp", currentBoardUrl)
  end
end)

RegisterNetEvent("police:changewhiteboardclipp")
AddEventHandler("police:changewhiteboardclipp", function(pUrl)
    currentMeetingRoomBoardUrl = pUrl
    exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
    --TriggerServerEvent("police:server:SetBoardPhoto", currentMeetingRoomBoardUrl)
end)

RegisterNetEvent("police:changewhiteboardcli")
AddEventHandler("police:changewhiteboardcli", function(pUrl)
    currentMeetingRoomBoardUrl = pUrl
    exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
    TriggerServerEvent("police:server:SetBoardPhoto", currentMeetingRoomBoardUrl)
end)

QBCore.Functions.TriggerCallback("qb-ui:policechangeurl", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['qb-ui']:closeApplication('textbox')
  TriggerServerEvent("police:changewhiteboard", data.values.url, data.hiddenItems.room)
end)