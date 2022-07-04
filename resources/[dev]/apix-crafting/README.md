
**APIX DEVELOPMENT<3**




**Need Scrpits**
    qb-target

=================================================================================

**Example**

local ExampleItem = {
    {
        itemName = "lockpick",
        isGun = false,
        level = 0, need xp
        levelUp = 2, -- add xp
        Timer = 1000,
        NeedItems = {
            ['steel'] = 10,
            ['plastic'] = 10,
        },
    },
}

CreateThread(function()
    local Entity = {
        -573669520 -- crafting object
    }
    exports["qb-target"]:AddTargetModel(Entity, {
        options = {
            {
                type = "client",
                event = "apix-crafting:client:OpenMainCraft",
                data = ExampleItem,
                icon = "fa fa-circle",
                label = "Test",
                job = false,
            },
        },
    distance = 2.0
    })
end)

=================================================================================
