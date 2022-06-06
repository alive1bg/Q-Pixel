local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
      while true do
        local sleep = 1000
        for k, v in pairs(Config.VoteLocations) do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if GetDistanceBetweenCoords(v.x, v.y, v.z, coords.x, coords.y, coords.z, true) < 1 then
            sleep = 5
            exports[Config.UI]:DrawNotify("vote","[E] Vote", "rgba(25, 130, 250, 0.938)")
            if IsControlJustPressed(1, 38)  then 
                QBCore.Functions.TriggerCallback('ld-vote:server:isVoted', function(isVoted)
                    if isVoted == false then
                        openVoteScreen()
                    else
                        exports['mythic_notify']:SendAlert('error', 'You have already voted!')
                    end
                end)
            end
        else 
            exports[Config.UI]:Clear("vote")
        end
        Wait(1)
      end
      Wait(sleep)

   end
end)

RegisterNUICallback("postVote", function(data)
    print(data.vote)
    TriggerServerEvent("ld-vote:server:postedVote", data.vote)
end)

RegisterNUICallback("closeVoteScreen", function()
    SetNuiFocus(false, false)
end)

function openVoteScreen()
    SetNuiFocus(true, true)
    SendNUIMessage({
        open = true,
        candidates = Config.Candidates
    })
end

function DrawText3D(x,y,z,text,size)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end