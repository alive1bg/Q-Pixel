local Promise, ActiveMenu = nil, false

RegisterNUICallback("MenuDataPost", function(data, cb)
    if Promise ~= nil then
        if data.returnValue then
            Promise:resolve(data.returnValue)
        else
            Promise:resolve(true)
        end
        Promise = nil
    end
    if data.event and not data.returnValue then
        if not data.server then
            TriggerEvent(data.event, UnpackParams(data.args))
        else
            TriggerServerEvent(data.event, UnpackParams(data.args))
        end
    end
    CloseMenu()
    cb("ok")
end)

RegisterNUICallback("CancelMenu", function(data, cb)
    if Promise ~= nil then
        Promise:resolve(nil)
        Promise = nil
    end
    CloseMenu()
    cb("ok")
end)

CreateMenu = function(data)    
    ActiveMenu = true
    SendNUIMessage({
        action = "menu",
        case = "OPEN_MENU",
        data = ProcessParams(data)
    })
    SetNuiFocus(true, true)
end

CloseMenu = function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "menu",
        case = "CLOSE_MENU",
    })
    ActiveMenu = false
end

CancelMenu = function()
    SendNUIMessage({
        action = "menu",
        case = "CANCEL_MENU",
    })
end

MenuUI = function(data)
    if not data or Promise ~= nil then CancelMenu() return end
    while ActiveMenu do Wait(0) end
    
    Promise = promise.new()
    
    CreateMenu(data)
    
    return Citizen.Await(Promise)
end

ProcessParams = function(data)
    for _, v in pairs(data) do
        if v.args and type(v.args) == "table" and next(v.args) ~= nil then
            v.args = PackParams(v.args)
        end
    end
    return data
end

PackParams = function(arguments)
    local args, pack = arguments, {}
    
    for i = 1, 15, 1 do
        pack[i] = {arg = args[i]}
    end
    return pack
end

UnpackParams = function(arguments, i)
    if not arguments then return end
    local index = i or 1
    
    if index <= #arguments then
        return arguments[index].arg, UnpackParams(arguments, index + 1)
    end
end


-- RegisterCommand("showmenu", function()
--     TriggerEvent("cc-ui:testMenu")
-- end)

-- RegisterNetEvent("cc-ui:testMenu", function()
--     exports["cn-ui"]:MenuUI({
--         {
--             header = "Main Title",
--         },
--         {
--             header = "Sub Menu Title",
--             context = "description",
--             event = "cc-ui:testMenu2",
--             image = "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png",
--             args = {"sub title","description"}
--         }
--     })
-- end)

-- RegisterNetEvent('cc-ui:testMenu2', function(arg1, arg2)
--     exports["cn-ui"]:MenuUI({
--         {
--             header = "< Go Back",
--             event = "cc-ui:testMenu"
--         },
--         {
--             header = arg1,
--             context = arg2
--         },
--     })
-- end)