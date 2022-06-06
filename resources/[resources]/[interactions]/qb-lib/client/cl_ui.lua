local registered = {}

function RegisterUICallback(name, cb)
  local function interceptCb(data, innerCb)
    cb(data, function(result)
      if result.meta.ok then
        result.meta.message = "done"
      end
      innerCb(result)
    end)
  end
  AddEventHandler(('_npx_uiReq:%s'):format(name), interceptCb)

  if (GetResourceState("qb-ui") == "started") then exports["qb-ui"]:RegisterUIEvent(name) end

  registered[#registered + 1] = name
end

function SendUIMessage(data)
  exports["qb-ui"]:SendUIMessage(data)
end

function SetUIFocus(hasFocus, hasCursor)
  exports["qb-ui"]:SetUIFocus(hasFocus, hasCursor)
end
exports('SetUIFocus', SetUIFocus)

function GetUIFocus()
  return exports["qb-ui"]:GetUIFocus()
end

AddEventHandler("_npx_uiReady", function()
  for _, eventName in ipairs(registered) do
    exports["qb-ui"]:RegisterUIEvent(eventName)
  end
end)
