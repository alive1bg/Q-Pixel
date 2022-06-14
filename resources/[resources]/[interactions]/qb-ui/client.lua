local lasttext = {}

exports("showInteraction", function(text, type)
    if not type then type = "info" end
    lasttext = text
    SendNUIMessage({
        type = "open",
        text = text,
        color = type,
    })
end)

exports("hideInteraction", function(type)
    type = type and type or "info"
    SendNUIMessage({
        type = "close",
        text = lasttext,
        color = type,
    })
end)