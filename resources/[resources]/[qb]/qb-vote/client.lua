local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        local sleep = 500
        for k, v in pairs(Config.VoteLocations) do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            if GetDistanceBetweenCoords(v.x, v.y, v.z, coords.x, coords.y, coords.z, true) < 2 then
                sleep = 100
                exports["qb-ui"]:showInteraction("Vote Cabin")
            else 
                exports["qb-ui"]:hideInteraction()
            end
        end
        Wait(sleep)
   end
end)

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

exports['qb-target']:AddBoxZone("vote1", vector3(-557.98, -205.72, 38.22), 0.5, 0.75, {
    name = "vote1",
    heading = 30,
    debugPoly = false,
    minZ=38.12,
    maxZ=38.57
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

exports['qb-target']:AddBoxZone("vote2", vector3(-559.0, -206.31, 38.22), 0.5, 0.75, {
    name = "vote2",
    heading = 30,
    debugPoly = false,
    minZ=38.12,
    maxZ=38.57
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

exports['qb-target']:AddBoxZone("vote3", vector3(-560.06, -206.92, 38.22), 0.5, 0.75, {
    name = "vote3",
    heading = 30,
    debugPoly = false,
    minZ=38.12,
    maxZ=38.57
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

exports['qb-target']:AddBoxZone("vote4", vector3(-561.1, -207.5, 38.22), 0.5, 0.75, {
    name = "vote4",
    heading = 30,
    debugPoly = false,
    minZ=38.12,
    maxZ=38.57
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

exports['qb-target']:AddBoxZone("vote5", vector3(-562.12, -208.12, 38.22), 0.5, 0.75, {
    name = "vote5",
    heading = 30,
    debugPoly = false,
    minZ=38.12,
    maxZ=38.57
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