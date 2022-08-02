local ananinamcu = false

local successCb
local failCb





exports("password", function(number, time1, time2, success, fail)
  successCb = success
  failCb = fail

  SetNuiFocus(true, true)
  SendNUIMessage({
    type = "open",
    number = number,
    time1 = time1,
    time2 = time2,
  })
end)

RegisterNUICallback("successful" , function(cb)
  SetNuiFocus(false, false)
  successCb()
end)

RegisterNUICallback("failed" , function(cb)
  SetNuiFocus(false, false)

  failCb()
  



end)