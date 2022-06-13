# CN-UI

This is a combined resource of TEXTUI / MENU / INPUT for fivem

# TEXT UI

```
  SHOW TEXT - exports["cn-ui"]:TextUI(text, color)
  HIDE TEXT - exports["cn-ui"]:TextUI()
```

# MENU

```
exports["cn-ui"]:MenuUI({
        {
            header = "MAIN TITLE",
        },
        {
            header = "SUB MENU TITLE",
            context = "DESCRIPTION",
            server = false, -- is Event server side
            event = "EVENT",
            image = "IMAGE URL",            
            args = {"TITLE","DESCRIPTION"}
        }
    })
```

# INPUT

```
local inputvalue = exports["cn-ui"]:InputUI({
    header = "Vehicle Menu",
    rows = {
        {
            id = 0,
            txt = "Spawn Name 1"
        },
        {
            id = 1,
            txt = "Spawn Name 2"
        },
    }
})
if inputvalue[1].input == nil then return end    
local vehname1 = inputvalue[2].input
local vehname2 = inputvalue[2].input
TriggerServerEvent("VehicleSpawnEvent", {vehname1}) -- EXAMPLE
```