local QBCore = exports['qb-core']:GetCoreObject()

globalOptionsCache = {}
isPlayerCloseToMusic = false
disableMusic = false

function getDefaultInfo()
    return {
        volume = 1.0,
        url = "",
        id = "",
        position = nil,
        distance = 0,
        playing = false,
        paused = false,
        loop = false, 
        isDynamic = false,
        timeStamp = 0,
        maxDuration = 0,
        destroyOnFinish = true,
    }
end

-- updating position on html side so we can count how much volume the sound needs.
CreateThread(function()
    local refresh = config.RefreshTime
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    while true do
        Wait(refresh)
        if not disableMusic and isPlayerCloseToMusic then
            ped = PlayerPedId()
            pos = GetEntityCoords(ped)
            SendNUIMessage({
                status = "position",
                x = pos.x,
                y = pos.y,
                z = pos.z
            })
        else
            SendNUIMessage({ status = "position", x = -900000, y = -900000, z = -900000 })
            Wait(1000)
        end
    end
end)

-- checking if player is close to sound so we can switch bool value to true.
CreateThread(function()
    local ped = PlayerPedId()
    local playerPos = GetEntityCoords(ped)
    while true do
        Wait(500)
        ped = PlayerPedId()
        playerPos = GetEntityCoords(ped)
        isPlayerCloseToMusic = false
        for k, v in pairs(soundInfo) do
            if v.position ~= nil and v.isDynamic then
                if #(v.position - playerPos) < v.distance + config.distanceBeforeUpdatingPos then
                    isPlayerCloseToMusic = true
                    break
                end
            end
        end
    end
end)

-- updating timeStamp
CreateThread(function()
    Wait(1100)
    while true do
        Wait(1000)
        for k, v in pairs(soundInfo) do
            if v.playing then
                if getInfo(v.id).timeStamp ~= nil and getInfo(v.id).maxDuration ~= nil then
                    if getInfo(v.id).timeStamp < getInfo(v.id).maxDuration then
                        getInfo(v.id).timeStamp = getInfo(v.id).timeStamp + 1
                    end
                end
            end
        end
    end
end)

 
RegisterNetEvent("play:song", function(SongURL, coords, place)
    PlayUrlPos(place, SongURL, 0.2, coords, false, false)
end)

RegisterNetEvent("vanilla:request:song", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Song URL",
        info = "Place the song URL below.", 
        submitText = "Confirm",
        inputs = {
            {
                text = "Song URL", -- text you want to be displayed as a place holder
                name = "songurl", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })

    if dialog ~= nil then
        if dialog then
            QBCore.Functions.Notify("Song is begining to play!", "success")
            TriggerServerEvent("vanilla:request:song:sv", dialog.songurl)
        else
            QBCore.Functions.Notify("You need a song URL", "error")
        end
    end
end)

RegisterNetEvent("vanilla:change:volume", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Music Volume",
        info = "Volume Between 0/100", 
        submitText = "Confirm",
        inputs = {
            {
                text = "Change Volume", -- text you want to be displayed as a place holder
                name = "musicvolume", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })
    if dialog ~= nil then

        if dialog then
            TriggerServerEvent("vanilla:change:volume", dialog.musicvolume)
        else
            QBCore.Functions.Notify("You need to specify a volume", "error")
        end 
    end
end)

RegisterNetEvent("bahamas:request:song", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Song URL",
        info = "Place the song URL below.", 
        submitText = "Confirm",
        inputs = {
            {
                text = "Song URL", -- text you want to be displayed as a place holder
                name = "songurl", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })

    if dialog ~= nil then
        if dialog then
            QBCore.Functions.Notify("Song is begining to play!", "success")
            TriggerServerEvent("bahamas:request:song:sv", dialog.songurl)
        else
            QBCore.Functions.Notify("You need a song URL", "error")
        end
    end
end)

RegisterNetEvent("bahamas:change:volume", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Music Volume",
        info = "Volume Between 0/100", 
        submitText = "Confirm",
        inputs = {
            {
                text = "Change Volume", -- text you want to be displayed as a place holder
                name = "musicvolume", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })
    if dialog ~= nil then

        if dialog then
            TriggerServerEvent("bahamas:change:volume", dialog.musicvolume)
        else
            QBCore.Functions.Notify("You need to specify a volume", "error")
        end
    end
end)

RegisterNetEvent("tequilala:request:song", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Song URL",
        info = "Place the song URL below.",  
        submitText = "Confirm",
        inputs = {
            {
                text = "Song URL", -- text you want to be displayed as a place holder
                name = "songurl", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        }, 
    })

    if dialog ~= nil then
        if dialog then
            QBCore.Functions.Notify("Song is begining to play!", "success")
            TriggerServerEvent("tequilala:request:song:sv", dialog.songurl)
        else
            QBCore.Functions.Notify("You need a song URL", "error")
        end
    end
end)

RegisterNetEvent("tequilala:change:volume", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Music Volume",
        info = "Volume Between 0/100", 
        submitText = "Confirm",
        inputs = {
            {
                text = "Change Volume", -- text you want to be displayed as a place holder
                name = "musicvolume", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })
    if dialog ~= nil then

        if dialog then
            TriggerServerEvent("tequilala:change:volume", dialog.musicvolume)
        else
            QBCore.Functions.Notify("You need to specify a volume", "error")
        end
    end
end)

RegisterNetEvent("arcade:request:song", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Song URL",
        info = "Place the song URL below.", 
        submitText = "Confirm",
        inputs = { 
            {
                text = "Song URL", -- text you want to be displayed as a place holder
                name = "songurl", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })

    if dialog ~= nil then
        if dialog then
            QBCore.Functions.Notify("Song is begining to play!", "success")
            TriggerServerEvent("arcade:request:song:sv", dialog.songurl)
        else
            QBCore.Functions.Notify("You need a song URL", "error")
        end
    end
end)

RegisterNetEvent("arcade:change:volume", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Music Volume",
        info = "Volume Between 0/100", 
        submitText = "Confirm",
        inputs = {
            {
                text = "Change Volume", -- text you want to be displayed as a place holder
                name = "musicvolume", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })
    if dialog ~= nil then

        if dialog then
            TriggerServerEvent("arcade:change:volume", dialog.musicvolume)
        else
            QBCore.Functions.Notify("You need to specify a volume", "error")
        end
    end
end)




