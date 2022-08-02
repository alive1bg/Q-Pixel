local IntID = GetInteriorAtCoords(-1285.47, -302.03, 36.05)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local player = PlayerPedId()
    if GetInteriorFromEntity(player) == IntID then
      DisableControlAction(0,22,true)
    end
  end
end)