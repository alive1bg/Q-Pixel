RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenThermiteGame(callback, size, starttime, endtime)
  Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({type = "open", size = size, starttime = starttime, endtime = endtime})
end

-- /thermite [size] [start time] [full time]
RegisterCommand("thermiteminigame",function(source, args, raw)
  exports['thermite']:OpenThermiteGame(function(success)
    if success then
      print("Success")
    else
      print("Failed")
    end
  end, tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
end)