local QBCore = exports['qb-core']:GetCoreObject()
local isJudge = false
local isPolice = false
local isTow = false
local isTaxi = false
local isMedic = false
local isRealestate = false
local isDead = false
local myJob = "Unemployed"
local onDuty = false
local inGarage = false
local inDepots = false
local inBennys = false
local inBennys2 = false
local inTuner = false
local inTunerShop = false
local inSandyRepair = false
local inPaletoRepair = false
local inPdMech = false
local PlayerJob = {}
Config = {}

AddEventHandler('onResourceStart', function(resource)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    onDuty = PlayerJob.onduty
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

rootMenuConfig =  {
    {
        id = "expressions",
        displayName = "Expressions",
        icon = "#expressions",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return not pData.metadata["isdead"] and not pData.metadata["inlaststand"]
            --return not isDead
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
        id = "blips",
        displayName = "GPS",
        icon = "#blips",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return not pData.metadata["isdead"] and not pData.metadata["inlaststand"]
        end,
        subMenus = { "blips:togglehair", "blips:toggletattoo", "blips:toggleclothing", "fk:galeri"}
    },
    {
        id = "animations",
        displayName = "Walk style",
        icon = "#walking",
        enableMenu = function() 
            local pData = QBCore.Functions.GetPlayerData()
            return not pData.metadata["isdead"] and not pData.metadata["inlaststand"]
        end,
        subMenus = { "animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien" }
    },
    {
        id = "Interaction",
        displayName = "Interaction",
        icon = "#general-contact",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return not pData.metadata["isdead"] and not pData.metadata["inlaststand"]
        end,
        
        subMenus = {"general:givenum", "general:cuff", "police:escort"}
    },
    {
        id = "civDead",
         displayName = "Signal",
         icon = "#police-dead",
         functionName = "dispatch:client:InjuriedPerson",
         enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (pData.metadata["isdead"] and pData.metadata["inlaststand"] and not isPolice and not isMedic)
        end,
    },
    {
        id = "clothingNear",
        displayName = "Outfits",
        icon = "#house-setoutift",
        functionName = "raid_clothes:outfits",
        enableMenu = function()
            local Data = QBCore.Functions.GetPlayerData()
            local clothing = exports["raid_clothes"]:IsNearShopMenu() 
            return (not Data.metadata["isdead"] and not Data.metadata["inlaststand"] and clothing <= 5.0)
        end
    },
    {
        id = "copDead",
         displayName = "11-A",
         icon = "#police-dead",
         functionName = "qb-dispatch:client:officerdown",
         enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (pData.metadata["isdead"] and pData.metadata["inlaststand"] and isPolice)
        end,
    },
    {
        id = "reinforcement",
         displayName = "10-1",
         icon = "#bell-exclamation-secondary",
         functionName = "qb-dispatch:client:reinforcement",
         enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty)
        end,
    },
    {
        id = "emsDead",
         displayName = "11-A",
         icon = "#police-dead",
         functionName = "qb-dispatch:client:emsdown",
         enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (pData.metadata["isdead"] and pData.metadata["inlaststand"] and isMedic)
        end,
    },
    {
        id = "Police",
        displayName = "Police",
        icon = "#badge-sheriff",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty)
        end,
        subMenus = {"police:mdt", "police:escort", "police:checkvin", "general:cuff", "police:seizecash", "police:checkvehicle", "police:takedriverlicense", "police:statuscheck", "police:searchplayer", "police:jail", "police:takeoffmask"}
    },
    {
        id = "Vehicle",
        displayName = "Vehicle",
        icon = "#general-car",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty and IsPedInAnyVehicle(PlayerPedId(), true))
        end,
        subMenus = {"vehicle:menu", "vehicle:radar", "vehicle:extras"}
    },
    {
        id = "PoliceObjects",
        displayName = "Police Objects",
        icon = "#police-objects",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty)
        end,
        subMenus = {"police:spawnpion", "police:spawnhek", "police:spawnschotten", "police:spawntent", "police:spawnverlichting", "police:del" }
    },
    {
        id = "Radio",
        displayName = "Police Radio",
        icon = "#headset",
        item = "radio",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty)
        end,
        subMenus = {"joinradio1", "joinradio2", "joinradio3", "joinradio4", "joinradio5", "joinradio6", "joinradio7" }
    },
    {
        id = "Ambulance",
        displayName = "Ambulance",
        icon = "#hospital-amb",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isMedic and onDuty)
        end,
        subMenus = {"medic:status", "medic:revive", "medic:treat"}
    },
    {
        id = "housemenu",
        displayName = "Realestate",
        icon = "#animation-business",
        functionName = "qb-realestate:client:OpenHouseListMenu",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isRealestate)
        end,
    },
    {
        id = "HouseOptions",
        displayName = "Home",
        icon = "#house-home",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and exports['qb-houses']:isInHouse())
        end,
        subMenus = {"house:setstash", "house:setoutfit", "house:setlogout", "house:givekeys", "house:decorate"}
    },
    {
        id = "HouseOptions",
        displayName = "Home",
        icon = "#house-home",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and not exports['qb-houses']:isInHouse())
        end,
        subMenus = {"house:doorlock", "house:givekeys", "house:enter"}
    },
    {
        id = "Stretcher",
        displayName = "Stretcher",
        icon = "#hospital-amb",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isCloseVeh() and isMedic and onDuty and not IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus ={"medic:stretcherspawn", "medic:stretcherremove"}
    },
    {
        id = "Tow",
        displayName = "Tow",
        icon = "#tow-job",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isTow)
        end,
        subMenus = {"tow:togglenpc", "tow:vehicle"}
    },
    {
        id = "Taxi",
        displayName = "Taxi",
        icon = "#tow-job",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isTaxi)
        end,
        subMenus = {"taxi:npc", "taxi-meter", "taxi:startmeter"}
    },
    {
        id = "Vehicle",
        displayName = "Vehicle",
        icon = "#general-car",
        functionName = "veh:options",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and not isPolice and IsPedInAnyVehicle(PlayerPedId(), true))
        end,
    },
    {
        id = "Emotes",
        displayName = "Emotes",
        icon = "#general-emotes",
        functionName = "animations:client:EmoteMenu",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"])
        end
    },
    {
        id = "Bennys",
        displayName = "Bennys",
        icon = "#bennys",
        functionName = "qb-customs:client:repair",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inBennys or inBennys2 or inPaletoRepair or inSandyRepair and IsPedInAnyVehicle(PlayerPedId(), true))
        end
    },
    {
        id = "TunerRepair",
        displayName = "Repair Station",
        icon = "#bennys",
        functionName = "qb-customs:client:repair",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inTuner and isTuner and onDuty and IsPedInAnyVehicle(PlayerPedId(), true))
        end
    },
    {
        id = "TunerCustoms",
        displayName = "6STR Customs",
        icon = "#car-tilt",
        functionName = "enter:tunershop",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inTunerShop and isTuner and onDuty and IsPedInAnyVehicle(PlayerPedId(), true))
        end
    },
    {
        id = "PDMECH",
        displayName = "Bennys",
        icon = "#bennys",
        functionName = "qb-customs:pdmenu",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inPdMech and isPolice and onDuty and IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "GiveCarKeys",
        displayName = "Give Car Keys",
        icon = "#car-key",
        functionName = "vehiclekeys:client:GiveKeys",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isCloseVeh() or IsPedInAnyVehicle(PlayerPedId(), true))
        end
    },
    {
        id = "general:depots",
        displayName = "Depot",
        icon = "#warehouse",
        functionName = "Garages:OpenDepot",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inDepots and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "open-garage-housing",
        displayName = "Vehicle List",
        icon = "#warehouse",
        functionName = "Garages:OpenHouseGarage",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            local isAtHouseGarage = false
            QBCore.Functions.TriggerCallback('qb-garages:isAtHouseGar', function(result)
                isAtHouseGarage = result
            end)
            Wait(100)
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isAtHouseGarage and not isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "park-vehicle-garage-housing",
        displayName = "Park",
        icon = "#parking",
        functionName = "Garages:StoreInHouseGarage",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            local isAtHouseGarage = false
            QBCore.Functions.TriggerCallback('qb-garages:isAtHouseGar', function(result)
                isAtHouseGarage = result
            end)
            Wait(100)
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isAtHouseGarage and isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "open-garage",
        displayName = "Vehicle List",
        icon = "#warehouse",
        functionName = "Garages:Open",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inGarage and not isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "park-vehicle-garage",
        displayName = "Park",
        icon = "#parking",
        functionName = "Garages:Store",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inGarage and isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
}

newSubMenus = { -- NOTE basicly, what will be happen after clicking these buttons and icon of them
    ['vehicle:radar'] = {
        title = 'Toggle Radar',
        icon = '#tachometer-alt',
        functionName = "wk:toggleRadar",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and IsPedInAnyVehicle(PlayerPedId(), false))
       end,
    },
    ['vehicle:extras'] = {
        title = 'Toggle Extras',
        icon = '#car-mechanic',
        functionName = "qb-vehiclemenu:client:extrasMenu"
    },
    ['vehicle:menu'] = {
        title = 'Vehicle Menu',
        icon = '#car',
        functionName = "veh:options"
    },
    ['vehicle:riflerack'] = {
        title = 'Rifle Back',
        icon = '#raygun',
        functionName = "police:client:riflerack",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty)
        end
    },
    ['vehicle:flip'] = {
        title = 'Flip Vehicle',
        icon = '#fas fa-car-burst',
        functionName = "qb:flipvehicle"
    },
    ['vehicle:autodrive'] = {
        title = 'Auto Drive',
        icon = '#tachometer-alt',
        functionName = "autopilot:start"
    },
    ['general:givenum'] = {
        title = "Give contact",
        icon = "#general-contact",
        functionName = "qb-phone:client:GiveContactDetails"
    }, 
    ["expressions:angry"] = {
        title="Angry",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Drunk",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Electrocuted",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Grumpy",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Happy",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Injured",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Joyful",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Mouth Breather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="One Eye",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Shocked",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Sleeping",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="smug",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculative",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Stressed",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Sulking",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Weird",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="Weird2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    },
    ['blips:togglehair'] = {
        title = "Hair Dresser",
        icon = "#blips-barbershop",
        functionName = "hairDresser:ToggleHair"
    },
    ['blips:toggletattoo'] = {
        title = "Tattoo",
        icon = "#blips-tattooshop",
        functionName = "tattoo:ToggleTattoo"
    },
    ['blips:toggleclothing'] = {
        title = "Clothing",
        icon = "#blips-clothing",
        functionName = "clothing:ToggleClothing"
    },
    ['fk:galeri'] = {
        title = "PDM",
        icon = "#blips-garages",
        functionName = "fk:galeri"
    },
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-swagger",
        functionName = "AnimSet:Hurry"
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },	
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swag",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "Gangster",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Sassy3",
        icon = "#animation-sassy",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "Sassy2",
        icon = "#animation-sassy",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Normal",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['general:rob'] = {
        title = "Rob",
        icon = "#general-contact",
        functionName = "police:client:RobPlayer" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    },
    ['drug:sell'] = {
        title = "Cornersell",
        icon = "#general-drug",
        functionName = "qb-drugs:client:cornerselling"
    },
    ['general:putinvehicle'] = {
        title = "Seat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:server:PutPlayerInVehicle"
    },
    ['general:cuff'] = {
        title = "Cuff",
        icon = "#general-cuff",
        functionName = "police:client:CuffPlayer"
    },
    --  POLICE 
    ['police:statuscheck'] = {
        title = "Status Check",
        icon = "#police-checkplayerstatus",
        functionName = "hospital:client:CheckStatus"
    },
    ['police:searchplayer'] = {
        title = "Search player",
        icon = "#police-search",
        functionName = "police:client:SearchPlayer"
    },
    ['police:jail'] = {
        title = "Jail Player",
        icon = "#police-jail",
        functionName = "police:client:JailPlayer"
    },
    ['police:seizecash'] = {
        title = "Seize Cash",
        icon = "#police-seize",
        functionName = "police:client:SeizeCash"
    },
    ['police:bill'] = {
        title = "Bill",
        icon = "#general-cuff",
        functionName = "police:client:BillPlayer"
    },  
    ['police:mdt'] = {
        title = "MDT",
        icon = "#mdt",
        functionName = "mdt:OpenMDT"
    },
    ['police:takeoffmask'] = {
        title = "Mask",
        icon = "#cuffs-remove-mask",
        functionName = "police:client:takeoffmask" 
    },
    ['police:checkvehicle'] = {
        title = "Check Vehicle Status",
        icon = "#police-chechvehiclestatus",
        functionName = "qb-tunerchip:server:TuneStatus"     
    },  
    ['police:takedriverlicense'] = {
        title = "Revoke Drivers License",
        icon = "#police-revokelicense",
        functionName = "police:client:SeizeDriverLicense"     
    },  
    -- POLICE
    ['police:opengarage'] = {
        title = 'Job Veh',
		icon = '#garage',
		functionName = 'qb-garages:client:openJobVehList',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			isInJobGarage, lastJobVehicle = exports["qb-garages"]:isInJobStation('police')
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'police' and isInJobGarage and lastJobVehicle == nil then  
				if not IsPedInAnyVehicle(PlayerPedId()) then
					return true
				end
			end
			return false
		end      
    },
    ['police:storegarage'] = {
        title = 'Hide Job Veh',
		icon = '#general-parking',
		functionName = 'qb-garages:client:HideJobVeh',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			isInJobGarage, lastJobVehicle = exports["qb-garages"]:isInJobStation('police')
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'police' and isInJobGarage and lastJobVehicle ~= nil then  
				local ped = PlayerPedId()
				local pos = GetEntityCoords(ped)
				local curVeh = QBCore.Functions.GetClosestVehicle(pos)
				if IsPedInAnyVehicle(ped) then
					curVeh = GetVehiclePedIsIn(ped)
				end
				local plate = QBCore.Functions.GetPlate(curVeh)
				if exports["qb-vehiclekeys"]:HasVehicleKey(plate) and curVeh == lastJobVehicle then
					return true
				end
			end
			return false
		end    
    },
    ['police:spawnpion'] = {
        title = "Cone",
        icon = "#exclamation-triangle",
        functionName = "police:client:spawnCone"     
    },   
    ['police:spikes'] = {
        title = "Spikes",
        icon = "#tire-flat",
        functionName = "police:client:SpawnSpikeStrip" 
    },
    ['police:spawnschotten'] = {
        title = "Speed Limit Sign",
        icon = "#police-sign",
        functionName = "police:client:spawnSchotten"     
    },   
    ['police:spawntent'] = {
        title = "Tent",
        icon = "#campground",
        functionName = "police:client:spawnTent" 
    },
    ['police:revive'] = {
        title = "Revive",
        icon = "#hospital-revivep",
        functionName = "hospital:client:RevivePlayerPolice"
    },
    ['police:spawnverlichting'] = {
        title = "Light",
        icon = "#expressions-speculative",
        functionName = "police:client:spawnLight"     
    },
    ['police:spawnhek'] = {
        title = "Barier",
        icon = "#torii-gate",
        functionName = "police:client:spawnBarier"     
    },
    ['police:del'] = {
        title = "Delete",
        icon = "#police-del",
        functionName = "police:client:deleteObject"     
    },
    ['joinradio1'] = {
        title = "Police/EMS",
        icon = "1",
        functionName = "qb-radio:client:JoinRadioChannel1"     
    },
    ['joinradio2'] = {
        title = "Police Only",
        icon = "2",
        functionName = "qb-radio:client:JoinRadioChannel2"     
    },
    ['joinradio3'] = {
        title = "PD Scene 1",
        icon = "3",
        functionName = "qb-radio:client:JoinRadioChannel3"     
    },
    ['joinradio4'] = {
        title = "PD Scene 2",
        icon = "4",
        functionName = "qb-radio:client:JoinRadioChannel4"     
    },
    ['joinradio5'] = {
        title = "PD Scene 3",
        icon = "5",
        functionName = "qb-radio:client:JoinRadioChannel5"     
    },
    ['joinradio6'] = {
        title = "PD Scene 4",
        icon = "6",
        functionName = "qb-radio:client:JoinRadioChannel6"     
    },
    ['joinradio7'] = {
        title = "PD Scene 5",
        icon = "7",
        functionName = "qb-radio:client:JoinRadioChannel7"     
    },
    ['joinradio8'] = {
        title = "EMS",
        icon = "8",
        functionName = "qb-radio:client:JoinRadioChannel8"     
    },
    ['joinradio9'] = {
        title = "PD Training",
        icon = "9",
        functionName = "qb-radio:client:JoinRadioChannel9"     
    },
    ['police:escort'] = {
        title = "Escort",
        icon = "#general-escort",
        functionName = "police:client:EscortPlayer",
        enableMenu = function()
            return not isDead
        end
    },
    ['police:checkvin'] = {
        title = "Check Vin",
        icon = "#police-chechvehiclestatus",
        functionName = "jl-carboost:client:checkvin",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isPolice and onDuty)
        end
    },
    -- HOSPITAL
    ['medic:status'] = {
        title = "StatusCheck",
        icon = "#general-cuff",
        functionName = "" 
    },
    ['medic:revive'] = {
        title = "Revive",
        icon = "#hospital-revivep",
        functionName = "hospital:client:RevivePlayer"
    },
    ['medic:treat'] = {
        title = "Heal wounds",
        icon = "#hospital-treat",
        functionName = "hospital:client:TreatWounds"
    },
    ['medic:stretcherspawn'] = {
        title = "Stretcher",
        icon = "#general-cuff",
        functionName = "qb-radialmenu:client:TakeStretcher" 
    }, 
    ['medic:stretcherremove'] = {
        title = "Stretcher Remove",
        icon = "#general-cuff",
        functionName = "qb-radialmenu:client:RemoveStretcher" 
    },  
    ['medic:opengarage'] = {
        title = 'Job Veh',
		icon = '#garage',
		functionName = 'qb-garages:client:openJobVehList',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			isInJobGarage, lastJobVehicle = exports["qb-garages"]:isInJobStation('ambulance')
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'ambulance' and isInJobGarage and lastJobVehicle == nil then  
				if not IsPedInAnyVehicle(PlayerPedId()) then
					return true
				end
			end
			return false
		end      
    },
    ['medic:storegarage'] = {
        title = 'Hide Job Veh',
		icon = '#general-parking',
		functionName = 'qb-garages:client:HideJobVeh',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			isInJobGarage, lastJobVehicle = exports["qb-garages"]:isInJobStation('ambulance')
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'ambulance' and isInJobGarage and lastJobVehicle ~= nil then  
				local ped = PlayerPedId()
				local pos = GetEntityCoords(ped)
				local curVeh = QBCore.Functions.GetClosestVehicle(pos)
				if IsPedInAnyVehicle(ped) then
					curVeh = GetVehiclePedIsIn(ped)
				end
				local plate = QBCore.Functions.GetPlate(curVeh)
				if exports["qb-vehiclekeys"]:HasVehicleKey(plate) and curVeh == lastJobVehicle then
					return true
				end
			end
			return false
		end    
    },--TOW --TOW
    ['tow:togglenpc'] = {
        title = "Toggle Npc",
        icon = "#tow-mission",
        functionName = "jobs:client:ToggleNpc"
    }, 
    ['tow:vehicle'] = {
        title = "Tow vehicle",
        icon = "#tow-tow",
        functionName = "qb-tow:client:TowVehicle"
    },  -- Taxi
    ['taxi-meter'] = {
        title = "Toggle Meter",
        icon = "#tow-mission",
        functionName = "qb-taxi:client:toggleMeter"
    }, 
    ['taxi:npc'] = {
        title = "Taxi mission",
        icon = "#tow-tow",
        functionName = "qb-taxi:client:DoTaxiNpc"
    },  
    ['taxi:startmeter'] = {
        title = "Start/Stop Meter",
        icon = "#tow-tow",
        functionName = "qb-taxi:client:enableMeter"
    },
    ['set:extra'] = {
        title = "Exra",
        icon = "#tow-tow",
        functionName = "qb-radialmenu:client:setExtra"
    }, -- REAL ESTATE BELOW
    ['realestate:listofhouses'] = {
        title = "List of houses",
        icon = "#laptop-house",
        functionName = "qb-realestate:client:OpenHouseListMenu" 
    }, 
    ['realestate:addgarage'] = {
        title = "Add Garage",
        icon = "#general-parking",
        functionName = "qb-houses:client:addGarage" 
    }, 
    ['house:doorlock'] = {
        title = "Toggle Door lock",
        icon = "#house-doorlock",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['house:setstash'] = {  -- player housing options
        title = "Set Stash",
        icon = "#container-storage",
        functionName = "qb-houses:client:setstashLocation"
    },
    ['house:setoutfit'] = {
        title = "Set Outfit",
        icon = "#blips-clothing",
        functionName = "qb-houses:client:setoutfitLocation"
    },
    ['house:setlogout'] = {
        title = "Set Logout",
        icon = "#expressions-sleeping",
        functionName = "qb-houses:client:setlogoutLocation"
    },
    ['house:givekeys'] = {
        title = "Give House Keys",
        icon = "#general-apart-givekey",
        functionName = "qb-houses:client:giveHouseKey"
    },
    ['house:enter'] = {
        title = "Enter House",
        icon = "#door-open",
        functionName = "qb-houses:client:EnterHouse"
    },
    ['house:decorate'] = {
        title = "Decorate house",
        icon = "#house-decorate",
        functionName = "qb-houses:client:decorate",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and exports['qb-houses']:isInHouse())
        end,
    },
}
    

RegisterNetEvent("isJudge") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff") -- opposite of the above
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("isTow") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTow", function()
    isTow = true
end)

RegisterNetEvent("isTowOff") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTowOff", function()
    isTow = false
end)

RegisterNetEvent("isTaxi") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTaxi", function()
    isTaxi = true
end)

RegisterNetEvent("isTaxiOff") -- opposite of the above
AddEventHandler("isTaxiOff", function()
    isTaxi = false
end)

RegisterNetEvent("isRealestate") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isRealestate", function()
    isRealestate = true
end)

RegisterNetEvent("isRealestateOff") -- opposite of the above
AddEventHandler("isRealestateOff", function()
    isRealestate = false
end)

RegisterNetEvent("isTuner") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTuner", function()
    isTuner = true
end)

RegisterNetEvent("isTunerOff") -- opposite of the above
AddEventHandler("isTunerOff", function()
    isTuner = false
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate") -- dont edit this unless you don't use qb-core
AddEventHandler("QBCore:Client:OnJobUpdate", function(jobInfo)
    myJob = jobInfo.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isRealestate and myJob ~= "realestate" then isRealestate = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if isTow and myJob ~= "tow" then isTow = false end
    if isTaxi and myJob ~= "taxi" then isTaxi = false end
    if isTuner and myJob ~= "tuner" then isTuner = false end
    if myJob == "police" then isPolice = true end
    if myJob == "tow" then isTow = true end
    if myJob == "taxi" then isTaxi = true end
    if myJob == "tuner" then isTuner = true end
    if myJob == "ambulance" then isMedic = true end
    if myJob == "realestate" then isRealestate = true end
end)

RegisterNetEvent('QBCore:Client:SetDuty') -- dont edit this unless you don't use qb-core
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    myJob = QBCore.Functions.GetPlayerData().job.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isRealestate and myJob ~= "realestate" then isRealestate = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if isTuner and myJob ~= "tuner" then isTuner = false end
    if myJob == "police" then isPolice = true onDuty = duty end
    if myJob == "ambulance" then isMedic = true onDuty = duty end
    if myJob == "realestate" then isRealestate = true onDuty = duty end
    if myJob == "tuner" then isTuner = true onDuty = duty end
end)

RegisterNetEvent('pd:deathcheck1') -- YOU SHOULD ADD THIS IN YOUR ambulancejob system, basically let the function trigger here when the ped playing anim and add this to
-- your revived function so everytime if person dies, this will be triggered to isDead = true, if he get revived this will be triggered to isDead = false
AddEventHandler('pd:deathcheck1', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)


RegisterNetEvent("police:currentHandCuffedState") -- add this your police:client:GetCuffed @qb-policejob\client\interactions.lua
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed)
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank") -- add this to your oxygentank wear place, idk where is this for qb-inventory so find out please
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)


RegisterNetEvent('police:client:PutInVehicle')
AddEventHandler('police:client:PutInVehicle', function()
    if isEscorted then
    end
end)

CreateThread(function()
    for k, v in pairs(Garages) do 
        exports["qb-polyzone"]:AddBoxZone("garages", vector3(Garages[k].polyzone.x, Garages[k].polyzone.y, Garages[k].polyzone.z), Garages[k].polyzone1, Garages[k].polyzone2, {
            name="garages",
            heading=Garages[k].heading,
            minZ = Garages[k].minZ,
            maxZ = Garages[k].maxZ,
            debugPoly = false
        }) 
    end
    for k, v in pairs(GangGarages) do
        exports["qb-polyzone"]:AddBoxZone("ganggarages", vector3(GangGarages[k].polyzone.x, GangGarages[k].polyzone.y, GangGarages[k].polyzone.z), GangGarages[k].polyzone1, GangGarages[k].polyzone2, {
            name="ganggarages",
            heading=GangGarages[k].heading,
            minZ = GangGarages[k].minZ,
            maxZ = GangGarages[k].maxZ,
            debugPoly = false
        }) 
    end
    for k, v in pairs(JobGarages) do
        exports["qb-polyzone"]:AddBoxZone("jobgarages", vector3(JobGarages[k].polyzone.x, JobGarages[k].polyzone.y, JobGarages[k].polyzone.z), JobGarages[k].polyzone1, JobGarages[k].polyzone2, {
            name="jobgarages",
            heading=JobGarages[k].heading,
            minZ = JobGarages[k].minZ,
            maxZ = JobGarages[k].maxZ,
            debugPoly = false
        }) 
    end
    for k, v in pairs(Depots) do
        exports["qb-polyzone"]:AddBoxZone("depots", vector3(Depots[k].polyzone.x, Depots[k].polyzone.y, Depots[k].polyzone.z), Depots[k].polyzone1, Depots[k].polyzone2, {
            name="depots",
            heading=Depots[k].heading,
            minZ = Depots[k].minZ,
            maxZ = Depots[k].maxZ,
            debugPoly = false
        })
    end
end)
CreateThread(function()
    exports["qb-polyzone"]:AddBoxZone("Bennys", vector3(-39.1, -1053.51, 28.4), 6.8, 4.8, {
        name="Bennys",
        heading = 339,
        debugPoly = false,
        minZ = 27.4,
        maxZ = 31.2
    })

    exports["qb-polyzone"]:AddBoxZone("Bennys2", vector3(-221.75, -1329.9, 30.89), 4.2, 7.4, {
        name="Bennys2",
        heading=0,
        debugPoly = false,
        minZ = 29.89,
        maxZ = 32.49
    })

    exports["qb-polyzone"]:AddBoxZone("TunerRepair", vector3(125.07, -3041.25, 7.08), 3.2, 6.4, {
        name="TunerRepair",
        heading=0,
        debugPoly = false,
        minZ = 6.08,
        maxZ = 8.88
    })

    exports["qb-polyzone"]:AddBoxZone("TunerShop", vector3(144.94, -3030.44, 7.04), 6.2, 3.6, {
        name="TunerShop",
        heading=0,
        debugPoly = false,
        minZ = 6.04,
        maxZ = 8.04
    })

    exports["qb-polyzone"]:AddBoxZone("pdmech", vector3(452.02, -975.89, 25.7), 4.4, 12.8, {
        name="pdmech",
        heading=0,
        debugPoly = false,
        minZ = 24.7,
        maxZ = 27.5
    })

    exports["qb-polyzone"]:AddBoxZone("SandyRepair", vector3(1182.56, 2640.36, 37.76), 7.8, 4.0, {
        name="SandyRepair",
        heading=0,
        debugPoly = false,
        minZ = 36.76,
        maxZ = 39.36
    })

    exports["qb-polyzone"]:AddBoxZone("PaletoRepair", vector3(111.42, 6627.03, 31.79), 8.4, 4.6, {
        name="PaletoRepair",
        heading=43,
        debugPoly = false,
        minZ = 30.79,
        maxZ = 33.39
    })

    exports["qb-polyzone"]:AddBoxZone("Ottos", vector3(832.39, -805.53, 26.33), 4.2, 6.2, {
        name="Ottos",
        heading=0,
        debugPoly = false,
        minZ=25.33,
        maxZ=27.93
    })
end)

RegisterNetEvent('qb-polyzone:enter')
AddEventHandler('qb-polyzone:enter', function(name)
    local InVehicle = IsPedInAnyVehicle(PlayerPedId())
    if name == "garages" then
        inGarage = true
        exports['qb-ui']:showInteraction('Parking')
    elseif name == "ganggarages" then
        inGarage = true
        exports['qb-ui']:showInteraction('Parking')
    elseif name == "jobgarages" then
        inGarage = true
        exports['qb-ui']:showInteraction('Parking')
    elseif name == "depots" then
        inDepots = true
        exports['qb-ui']:showInteraction('Depot')
    elseif name == "Bennys" then
        if InVehicle then
            inBennys = true
            exports['qb-ui']:showInteraction("Bennys")
        end
    elseif name == "Bennys2" then
        if InVehicle then
            inBennys2 = true
            exports['qb-ui']:showInteraction("Bennys")
        end
    elseif name == "TunerRepair" then
        if InVehicle then
            inTuner = true
            if PlayerJob.name == "tuner" and onDuty then
                exports['qb-ui']:showInteraction("Repair Station")
            end
        end
    elseif name == "TunerShop" then
        if InVehicle then
            inTunerShop = true
            if PlayerJob.name == "tuner" and onDuty then
                exports['qb-ui']:showInteraction("6STR Customs")
            end
        end
    elseif name == "pdmech" then
        if InVehicle then
            inPdMech = true
            exports['qb-ui']:showInteraction("Vehicle Station")
        end
    elseif name == "SandyRepair" then
        if InVehicle then
            inSandyRepair = true
            exports['qb-ui']:showInteraction("Bennys")
        end
    elseif name == "PaletoRepair" then
        if InVehicle then
            inPaletoRepair = true
            exports['qb-ui']:showInteraction("Bennys")
        end
    elseif name == "Ottos" then
        if InVehicle then
            inTunerShop = true
            if PlayerJob.name == "ottos" and onDuty then
                exports['qb-ui']:showInteraction("Repair Station")
            end
        end
    end
end)

RegisterNetEvent('qb-polyzone:exit')
AddEventHandler('qb-polyzone:exit', function(name)
    if name == "garages" then
        inGarage = false
        exports['qb-ui']:hideInteraction()
    elseif name == "ganggarages" then
        inGarage = false
        exports['qb-ui']:hideInteraction()
    elseif name == "jobgarages" then
        inGarage = false
        exports['qb-ui']:hideInteraction()
    elseif name == "depots" then
        inDepots = false
        exports['qb-ui']:hideInteraction()
    elseif name == "Bennys" then
        inBennys = false
        exports['qb-ui']:hideInteraction()
    elseif name == "Bennys2" then
        inBennys2 = false
        exports['qb-ui']:hideInteraction()
    elseif name == "TunerRepair" then
        inTuner = false
        if PlayerJob.name == "tuner" and onDuty then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "TunerShop" then
        inTunerShop = false
        if PlayerJob.name == "tuner" and onDuty then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "pdmech" then
        inPdMech = false
        exports['qb-ui']:hideInteraction()
    elseif name == "SandyRepair" then
        inSandyRepair = false
        exports['qb-ui']:hideInteraction()
    elseif name == "PaletoRepair" then
        inPaletoRepair = false
        exports['qb-ui']:hideInteraction()
    elseif name == "Ottos" then
        inTunerShop = false
        if PlayerJob.name == "ottos" and onDuty then
            exports['qb-ui']:hideInteraction()
        end
    end
end)

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains
}