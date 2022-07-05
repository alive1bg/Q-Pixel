RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenSliderGame(callback, speed, numbers)
  Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({type = "open", speed = speed, numbers = numbers})
end

-- /slider [time] [number count]
RegisterCommand("sliderminigame",function(source, args, raw)
  exports['slider']:OpenSliderGame(function(success)
    if success then
      print("Success")
    else
      print("Failed")
    end
  end, tonumber(args[1]), tonumber(args[2]))
end)