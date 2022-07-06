Veny = {}


Veny.Framework = "qbnew" -- This can either be qbold | esx | qbnew

Veny.UseNPDoors = false -- Set to true if using npdoors (if you are on QB we recommend you keep this false as it'll use NUI Doorlock which we provide.)
Veny.TargetScript = "qb-target" -- I don't know if it's gonna work directly with other target scripts too. And don't forget we ain't giving any support for another target scripts. It is on you :)

Veny.cooldown = 9000 -- amount of time to do the heist again in seconds (2.5 hours)
Veny.mincops = 5 -- minimum required cops to start mission


----- -- DON'T TOUCH -- -----
Veny.lastrobbed = 0 
Veny.onaction = false 

Veny.StartLocs = {
    doors1 = {
        startloc = {x = 256.775, y = 219.844, z = 106.286}, 
    },
}