local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-vote:client:vote', function()
    for k, v in pairs(Config.VoteLocations) do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if GetDistanceBetweenCoords(v.x, v.y, v.z, coords.x, coords.y, coords.z, true) < 1.5 then
            QBCore.Functions.TriggerCallback('qb-vote:server:isVoted', function(isVoted)
                if isVoted == false then
                    openVoteScreen()
                else
                    QBCore.Functions.Notify("Already Voted!", "error")
                end
            end)
        end
    end
    Wait(500)
end)

exports['qb-target']:AddBoxZone("vote1", vector3(-541.88, -182.51, 38.23), 0.55, 0.5, {
    name = "vote1",
    heading=0,
    debugPoly = false,
    minZ=38.23,
    maxZ=38.63
    }, {
    options = {
        {
            type = "client",
            event = "qb-vote:client:vote",
            icon = "fas fa-person-booth",
            label = "Vote",
        },
    },
    distance = 1.5
})

exports['qb-target']:AddBoxZone("vote2", vector3(-542.66, -181.22, 38.23), 0.55, 0.5, {
    name = "vote2",
    heading = 0,
    debugPoly = false,
    minZ=38.23,
    maxZ=38.63
    }, {
    options = {
        {
            type = "client",
            event = "qb-vote:client:vote",
            icon = "fas fa-person-booth",
            label = "Vote",
        },
    },
    distance = 1.5
})

exports['qb-target']:AddBoxZone("vote3", vector3(-543.38, -179.87, 38.23), 0.55, 0.5, {
    name = "vote3",
    heading = 0,
    debugPoly = false,
    minZ=38.23,
    maxZ=38.63
    }, {
    options = {
        {
            type = "client",
            event = "qb-vote:client:vote",
            icon = "fas fa-person-booth",
            label = "Vote",
        },
    },
    distance = 1.5
})

RegisterNUICallback("postVote", function(data)
    print(data.vote)
    TriggerServerEvent("qb-vote:server:postedVote", data.vote)
    QBCore.Functions.Notify('Your vote has been accepted', 'success', 7500)
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