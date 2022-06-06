local v = nil

RegisterNUICallback("ResultGames", function(data, cb)
    SetNuiFocus(false, false)
    v:resolve(data.result)
    v = nil
    cb("ok")
end)

function HackingFleeca(duration,round) 
    if not duration then return end
    if not round then return end
    if v then return end
    
    v = promise.new()

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "OPEN_FLEECA",
        duration = duration,
        rounds = round
    })

    return Citizen.Await(v)
end

exports("HackingFleeca", HackingFleeca)

-- local minigame = exports["minigame-fleeca"]:HackingFleeca(10000,3) --ms timer
-- if minigame then
--     -- Win Games
-- else
--     -- Lose Games
-- end