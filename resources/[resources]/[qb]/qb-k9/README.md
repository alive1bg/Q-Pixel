# Police K9 Scripts originally forked from hashisx https://github.com/hashisx/hashx_k9

# Use
Purchase a dog from the location specified in the Config, use Z to follow or attack (Must be pointing a weapon to attack).

Press K to show K9 Commands (Both of these are now keymaps so its a on user basis)

# Searching

 You must be facing your target (vehicle or player) when selecting the Search Action, except for Search Area.
 Sometimes the Search Person will pick up the dog. Best to have the dog behind you.

# K9 Ped
The k9 ped I use personally from this script is from here https://forum.cfx.re/t/how-to-german-shepherd-malinois-k9-dog-1-0-1/1065040

# You must add this to QB Inventory Server main.lua.
```
    local function HasItem(list, item)

        for i = 1, #list do

            if item == list[i] then
                return true
            end
        end

        return false
    end

    AddEventHandler("inventory:server:SearchLocalVehicleInventory", function(plate, list, cb)
    local trunk = Trunks[plate]
    local glovebox = Gloveboxes[plate]
    local result = false

    if trunk ~= nil then
        for k, v in pairs(trunk.items) do
            local ITEM = trunk.items[k].name
            if HasItem(list, ITEM) then
                RESULT = true
            end
        end
    else
        trunk = GetOwnedVehicleItems(plate)

        for k, v in pairs(TRUNK) do

            local ITEM = TRUNK[k].name
            if HasItem(list, ITEM) then
                RESULT = true
            end
        end

    end

    if glovebox ~= nil then
        for k, v in pairs(glovebox.items) do

            local ITEM = glovebox.items[k].name
            if HasItem(list, ITEM) then
                RESULT = true
            end
        end
    else
        glovebox = GetOwnedVehicleGloveboxItems(plate)

        for k, v in pairs(glovebox) do
            local ITEM = glovebox[k].name
            if HasItem(list, ITEM) then
                RESULT = true
            end
        end
    end
    cb(RESULT)
end)
```
