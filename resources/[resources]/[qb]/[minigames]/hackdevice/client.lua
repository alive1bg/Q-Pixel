RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenDevice(callback, target, time)
  Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({type = "open", target = target, time = time})
end

-- /hack [target count] [seconds]
RegisterCommand("hackdevice",function(source, args, raw)
  exports['hackdevice']:OpenDevice(function(success)
    if success then
      print("Success")
    else
      print("Failed")
    end
  end, tonumber(args[1]), tonumber(args[2]))
end)