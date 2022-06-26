local DRUNK_ANIM_SET = "move_m@drunk@verydrunk"
local DRUNK_DRIVING_EFFECTS = {
    1, -- brake
    7, --turn left + accelerate
    8, -- turn right + accelerate
    23, -- accelerate
    4, -- turn left 90 + braking
    5, -- turn right 90 + braking
}

-- [ Code ] --

-- [ Functions ] --

function CreateLog(Type, Log, Data)
    QBCore.Functions.TriggerCallback('qb-admin/server/create-log', function(result)
    end, Type, Log, Data)
end

function ToggleDevMode(Bool)
    TriggerEvent('qb-admin:client:ToggleDevmode')
    if Bool then
        while Bool do
            Wait(200)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end

function UpdateMenu()
    local Bans = GetBans()
    local Players = GetPlayers()
    local Logs = GetLogs()
    SendNUIMessage({
        Action = 'Update',
        Debug = Config.Settings['Debug'],

        Bans = Bans,
        AllPlayers = Players,
        Logs = Logs,
        AdminItems = Config.AdminMenus,
        Favorited = Config.FavoritedItems,
        PinnedPlayers = Config.PinnedTargets,
        MenuOptions = Config.AdminOptions,
        BanTypes = Config.BanTimeCategories,
    })
end

function SetKvp(Name, Data, Type)
    SetResourceKvp(Name, Data)
    RefreshMenu(Type)
end

function ResetMenuKvp()
    SetResourceKvp("qb-admin-favorites", "[]")
    SetResourceKvp("qb-admin-pinned_targets", "[]")
    SetResourceKvp("qb-admin-options", "[]")
    Config.FavoritedItems = {}
    Config.PinnedTargets = {}
    Config.AdminOptions = {}
    RefreshMenu('All')
end

function RefreshMenu(Type)
    if Type == 'Favorites' then
        -- Favorites
        if GetResourceKvpString("qb-admin-favorites") == nil or GetResourceKvpString("qb-admin-favorites") == "[]" then
            Config.FavoritedItems = GenerateFavorites()
            SetResourceKvp("qb-admin-favorites", json.encode(Config.FavoritedItems))
        else
            Config.FavoritedItems = json.decode(GetResourceKvpString("qb-admin-favorites"))
        end
    elseif Type == 'Targets' then
        if GetResourceKvpString("qb-admin-pinned_targets") == nil or GetResourceKvpString("qb-admin-pinned_targets") == "[]" then
            Config.PinnedTargets = GeneratePinnedPlayers()
            SetResourceKvp("qb-admin-pinned_targets", json.encode(Config.PinnedTargets))    
        else
            Config.PinnedTargets = json.decode(GetResourceKvpString("qb-admin-pinned_targets"))
        end
    elseif Type == 'Options'then
        if GetResourceKvpString("qb-admin-options") == nil or GetResourceKvpString("qb-admin-options") == "[]" then
            Config.AdminOptions = GenerateAdminOptions()
            SetResourceKvp("qb-admin-options", json.encode(Config.AdminOptions))
        else
            Config.AdminOptions = json.decode(GetResourceKvpString("qb-admin-options"))
        end
    elseif Type == 'All' then
        if GetResourceKvpString("qb-admin-favorites") == nil or GetResourceKvpString("qb-admin-favorites") == "[]" then
            Config.FavoritedItems = GenerateFavorites()
            SetResourceKvp("qb-admin-favorites", json.encode(Config.FavoritedItems))
        else
            Config.FavoritedItems = json.decode(GetResourceKvpString("qb-admin-favorites"))
        end
        if GetResourceKvpString("qb-admin-pinned_targets") == nil or GetResourceKvpString("qb-admin-pinned_targets") == "[]" then
            Config.PinnedTargets = GeneratePinnedPlayers()
            SetResourceKvp("qb-admin-pinned_targets", json.encode(Config.PinnedTargets))    
        else
            Config.PinnedTargets = json.decode(GetResourceKvpString("qb-admin-pinned_targets"))
        end
        if GetResourceKvpString("qb-admin-options") == nil or GetResourceKvpString("qb-admin-options") == "[]" then
            Config.AdminOptions = GenerateAdminOptions()
            SetResourceKvp("qb-admin-options", json.encode(Config.AdminOptions))
        else
            Config.AdminOptions = json.decode(GetResourceKvpString("qb-admin-options"))
        end
    end
    UpdateMenu()
end

function IsPlayerAdmin()
    local Retval = false
    if Group ~= nil then
        if (Group == 'admin' or Group == 'god') then
            Retval = true
        end
    end
    return Retval
end

function DebugLog(Message)
    if Config.Settings['Debug'] then
        print('[DEBUG]: ', Message)
    end
end

function DrawText3D(Coords, Text)
    local OnScreen, _X, _Y = World3dToScreen2d(Coords.x, Coords.y, Coords.z)
    SetTextScale(0.3, 0.3)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(Text)
    DrawText(_X, _Y)
end

function roundDecimals(num, decimals)
	local mult = math.pow(10, decimals or 0)
	return math.floor(num * mult + 0.5) / 100
end

function DeletePlayerBlips()
    if AllPlayerBlips ~= nil then
        for k, v in pairs(AllPlayerBlips) do
            RemoveBlip(v) 
        end
        AllPlayerBlips = {}
    end
end

-- Get

function GetPlayersInArea(Coords, Radius)
	local Prom = promise:new()
	QBCore.Functions.TriggerCallback('qb-admin/server/get-active-players-in-radius', function(Players)
		Prom:resolve(Players)
	end, Coords, Radius)
	return Citizen.Await(Prom)
end

function GetBans()
    local Prom = promise:new()
    QBCore.Functions.TriggerCallback("qb-admin/server/get-bans", function(Bans)
        Prom:resolve(Bans)
    end)
    return Citizen.Await(Prom)
end

function GetPlayers()
    local Prom = promise:new()
    QBCore.Functions.TriggerCallback("qb-admin/server/get-players", function(Players)
        Prom:resolve(Players)
    end)
    return Citizen.Await(Prom)
end

function GetJobs()
    local JobList = {}
    for k, v in pairs(QBShared.Jobs) do
        JobList[#JobList + 1] = {
            Text = v.label,
            Label = ' ['..k..']'
        }
        -- table.sort(JobList, function(a, b)
        --     return a.Label < b.Label
        -- end)
    end
    return JobList
end

function GetLogs()
    local Prom = promise:new()
    QBCore.Functions.TriggerCallback("qb-admin/server/get-logs", function(Logs)
        Prom:resolve(Logs)
    end)
    return Citizen.Await(Prom)
end

function GetInventoryItems()
    local Inventory = {}
    for k, v in pairs(QBShared.Items) do
        Inventory[#Inventory + 1] = {
            Text = v.name
        }
        -- table.sort(Inventory, function(a, b)
        --     return a.Text < b.Text
        -- end)
    end
    return Inventory
end

function GetAddonVehicles()
    local AddonVehicles = {}
    for k, v in pairs(QBShared.Vehicles) do
        if Config.Settings['Cars']['Custom'] then
            if v['category'] == Config.Settings['Cars']['CustomCat'] then
                AddonVehicles[#AddonVehicles + 1] = {
                    Text = k,
                    Label = ' ['..v['brand']..' '..v['name']..']'
                }
            end
        else
            AddonVehicles[#AddonVehicles + 1] = {
                Text = k,
                Label = ' ['..v['brand']..' '..v['name']..']'
            }
        end
    end
    return AddonVehicles
end

-- Generate

function GenerateFavorites()
    local Retval = {}
    for _, Menu in pairs(Config.AdminMenus) do
        for k, v in pairs(Menu.Items) do
            Retval[v.Id] = false
        end
    end
    return Retval
end

function GeneratePinnedPlayers()
    local Retval = {}
    local Players = GetPlayers()
    for k, v in pairs(Players) do
        Retval[v.License] = false
    end
    return Retval
end

function GenerateAdminOptions()
    local Retval = {}
    -- Large Default
    Retval['LargeDefault'] = false
    -- Bind Open
    Retval['BindOpen'] = true
    -- Tooltips
    Retval['Tooltips'] = true
    -- Resizer
    Retval['Resizer'] = true

    return Retval
end

function CanBind()
    local Retval = false
    if Config.AdminOptions['BindOpen'] ~= nil and Config.AdminOptions['BindOpen'] then 
        Retval = true 
    end
    return Retval
end

-- Troll

-- Drunk

local function getRandomDrunkCarTask()
    math.randomseed(GetGameTimer())

    return DRUNK_DRIVING_EFFECTS[math.random(#DRUNK_DRIVING_EFFECTS)]
end

-- NOTE: We might want to check if a player already has an effect
function drunkThread()
    local playerPed = PlayerPedId()
    local isDrunk = true

    RequestAnimSet(DRUNK_ANIM_SET)
    while not HasAnimSetLoaded(DRUNK_ANIM_SET) do
        Wait(5)
    end

    SetPedMovementClipset(playerPed, DRUNK_ANIM_SET)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    SetPedIsDrunk(playerPed, true)
    SetTransitionTimecycleModifier("spectator5", 10.00)

    CreateThread(function()
        while isDrunk do
            local vehPedIsIn = GetVehiclePedIsIn(playerPed)
            local isPedInVehicleAndDriving = (vehPedIsIn ~= 0) and (GetPedInVehicleSeat(vehPedIsIn, -1) == playerPed)

            if isPedInVehicleAndDriving then
                local randomTask = getRandomDrunkCarTask()
                TaskVehicleTempAction(playerPed, vehPedIsIn, randomTask, 500)
            end

            Wait(5000)
        end
    end)

    Wait(30 * 1000)
    isDrunk = false
    SetTransitionTimecycleModifier("default", 10.00)
    StopGameplayCamShaking(true)
    ResetPedMovementClipset(playerPed)
    RemoveAnimSet(DRUNK_ANIM_SET)
end

-- Wild attack

local attackAnimalHashes = {
    GetHashKey("a_c_chimp"),
    GetHashKey("a_c_rottweiler"),
    GetHashKey("a_c_coyote")
}
local animalGroupHash = GetHashKey("Animal")
local playerGroupHash = GetHashKey("PLAYER")

function startWildAttack()
    -- Consts
    local playerPed = PlayerPedId()
    local animalHash = attackAnimalHashes[math.random(#attackAnimalHashes)]
    local coordsBehindPlayer = GetOffsetFromEntityInWorldCoords(playerPed, 100, -15.0, 0)
    local playerHeading = GetEntityHeading(playerPed)
    local belowGround, groundZ, vec3OnFloor = GetGroundZAndNormalFor_3dCoord(coordsBehindPlayer.x, coordsBehindPlayer.y, coordsBehindPlayer.z)

    -- Requesting model
    RequestModel(animalHash)
    while not HasModelLoaded(animalHash) do
        Wait(5)
    end
    SetModelAsNoLongerNeeded(animalHash)

    -- Creating Animal & setting player as enemy
    local animalPed = CreatePed(1, animalHash, coordsBehindPlayer.x, coordsBehindPlayer.y, groundZ, playerHeading, true, false)
    SetPedFleeAttributes(animalPed, 0, 0)
    SetPedRelationshipGroupHash(animalPed, animalGroupHash)
    TaskSetBlockingOfNonTemporaryEvents(animalPed, true)
    TaskCombatHatedTargetsAroundPed(animalPed, 30.0, 0)
    ClearPedTasks(animalPed)
    TaskPutPedDirectlyIntoMelee(animalPed, playerPed, 0.0, -1.0, 0.0, 0)
    SetRelationshipBetweenGroups(5, animalGroupHash, playerGroupHash)
    SetRelationshipBetweenGroups(5, playerGroupHash, animalGroupHash)
end