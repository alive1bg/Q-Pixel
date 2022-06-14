exports['qb-target']:AddBoxZone("mrpd_classroom", vector3(439.24, -985.8, 34.97), 2.6, 0.7, {
    name = "mrpd_classroom",
    heading = 0,
    debugPoly = false,
    minZ=34.97,
    maxZ=36.77,
}, {
    options = { 
        {
            type = "client",
            event = "qb-whiteboard:changewhiteboardcli",
            icon = "fas fa-images",
            label = "Change Dui",
            job = 'police',
        },
    },
    distance = 1.5
})

exports['qb-target']:AddBoxZone("mrpd_meetingroom_screen", vector3(439.24, -985.8, 34.97), 2.6, 0.7, {
    name = "mrpd_meetingroom_screen",
    heading = 0,
    debugPoly = false,
    minZ=34.97,
    maxZ=36.77,
}, {
    options = { 
        {
            type = "client",
            event = "qb-whiteboard:changewhiteboardcli",
            icon = "fas fa-images",
            label = "Change Dui",
            job = 'police',
        },
    },
    distance = 1.5
})

RegisterNetEvent("qb-whiteboard:changewhiteboardcli")
AddEventHandler("qb-whiteboard:changewhiteboardcli", function()
    local dialog = exports['qb-ui']:OpenInputMenu({
        {
            label = "Whiteboard URL",
            name = 'URL',
            icon = 'pencil-alt',
        }
    })
    --[[local dialog = exports['qb-input']:ShowInput({
        header = "Whiteboard URL",
        submitText = "Confirm",
        inputs = {
            {
                text = "URL", -- text you want to be displayed as a place holder
                name = "mrpdurl", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })]]

    if dialog ~= nil then
        for k,v in pairs(dialog) do
            print(v)
            TriggerEvent("police:changewhiteboardcli", v)
        end
    end
end)