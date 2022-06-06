local Events = {}

function SendUIMessage(data)
  SendNUIMessage(data)
end

exports('SendUIMessage', SendUIMessage)

function RegisterUIEvent(eventName)
    if not Events[eventName] then
        Events[eventName] = true

        RegisterNUICallback(eventName, function (...)
            TriggerEvent(('_npx_uiReq:%s'):format(eventName), ...)
        end)
    end
end

exports('RegisterUIEvent', RegisterUIEvent)

function SetUIFocusCustom(hasKeyboard, hasMouse)
  HasNuiFocus = hasKeyboard or hasMouse

  SetUIFocus(hasKeyboard, hasMouse)
  SetUIFocusKeepInput(HasNuiFocus)
end

exports('SetUIFocusCustom', SetUIFocusCustom)


function GetUIFocus()
  return HasFocus, HasCursor
end

exports('GetUIFocus', GetUIFocus)

CreateThread(function()
    TriggerEvent('_npx_uiReady')
end)

function cashFlash(pCash, pChange)
  SendUIMessage({
      app = "cash",
      data = {
        cash = pCash,
        amountAdjustment = pChange
        -- duration = 5 // optional duration for fade, default 4 seconds
      },
      source = "qb-nui",
  })
end

exports("cashFlash", cashFlash)

function openApplication(app, data, stealFocus)
  stealFocus = stealFocus == nil and true or false
  SendUIMessage({
      source = "qb-nui",
      app = app,
      show = true,
      data = data or {},
  })
  if stealFocus then
    SetUIFocus(true, true)
  end
end

exports("openApplication", openApplication)

RegisterNetEvent("qb-ui:open-application")
AddEventHandler("qb-ui:open-application", openApplication)

function closeApplication(app, data)
  SendUIMessage({
      source = "qb-nui",
      app = app,
      show = false,
      data = data or {},
  })
  SetUIFocus(false, false)
  TriggerEvent("qb-ui:application-closed", app, { fromEscape = false })
end

exports("closeApplication", closeApplication)

function sendAppEvent(app, data, withExtra)
    local sentData = {
        app = app,
        data = data or {},
        source = "qb-nui",
    }
    if withExtra then
      for k, v in pairs(withExtra) do
        sentData[k] = v
      end
    end
    SendUIMessage(sentData)
end

exports("sendAppEvent", sendAppEvent)

local currSoundId = 0
local function getSoundId()
  currSoundId = currSoundId + 1
  return currSoundId
end
function soundPlay(name, volume, loop)
  local id = getSoundId()
  SendUIMessage({
      source = "qb-nui",
      app = "sounds",
      data = {
        action = 'play',
        id = id,
        name = name,
        loop = loop or false,
        volume = volume or 1.0,
      },
  })
  return id
end

RegisterNetEvent("qb-ui:soundPlay")
AddEventHandler("qb-ui:soundPlay", function(name, volume, loop)
  soundPlay(name, volume, loop)
end)

exports("soundPlay", soundPlay)

function soundVolume(id, volume)
  SendUIMessage({
      source = "qb-nui",
      app = "sounds",
      data = {
        action = "volume",
        id = id,
        volume = volume,
      },
  });
end

exports("soundVolume", soundVolume)

function soundStop(id)
  SendUIMessage({
      source = "qb-nui",
      app = "sounds",
      data = {
        action = 'stop',
        id = id,
      },
  })
end

exports("soundStop", soundStop)
