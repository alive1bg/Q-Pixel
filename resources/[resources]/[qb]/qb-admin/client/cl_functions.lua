-- [ Code ] --

-- [ Functions ] --

-- Editable

-- Toggles devmode on and off.
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

-- Other

function DebugLog(Message)
    if Config.MenuDebug then
        print('[DEBUG]: ', Message)
    end
end

function UpdateMenu()
    local Bans = GetBans()
    local Players = GetPlayers()
    SendNUIMessage({
        Action = 'Update',
        Bans = Bans,
        AllPlayers = Players,
        AdminItems = Config.AdminMenus,
        Favorited = Config.FavoritedItems,
        PinnedPlayers = Config.PinnedTargets,
        MenuSettings = Config.AdminSettings
    })
end

function SetKvp(Name, Data, Type)
    SetResourceKvp(Name, Data)
    RefreshMenu(Type)
end

function RefreshMenu(Type)
    if Type == 'Favorites' then
        -- Favorites
        if GetResourceKvpString("qb-admin:favorites") == nil or GetResourceKvpString("qb-admin:favorites") == "[]" then
            Config.FavoritedItems = GenerateFavorites()
            SetResourceKvp("qb-admin:favorites", json.encode(Config.FavoritedItems))
        else
            Config.FavoritedItems = json.decode(GetResourceKvpString("qb-admin:favorites"))
        end
    elseif Type == 'Targets' then
        if GetResourceKvpString("qb-admin:pinned_targets") == nil or GetResourceKvpString("qb-admin:pinned_targets") == "[]" then
            Config.PinnedTargets = GeneratePinnedPlayers()
            SetResourceKvp("qb-admin:pinned_targets", json.encode(Config.PinnedTargets))    
        else
            Config.PinnedTargets = json.decode(GetResourceKvpString("qb-admin:pinned_targets"))
        end
    elseif Type == 'Settings'then
        if GetResourceKvpString("qb-admin:settings") == nil or GetResourceKvpString("qb-admin:settings") == "[]" then
            Config.AdminSettings = GenerateAdminSettings()
            SetResourceKvp("qb-admin:settings", json.encode(Config.AdminSettings))
        else
            Config.AdminSettings = json.decode(GetResourceKvpString("qb-admin:settings"))
        end
    elseif Type == 'All' then
        if GetResourceKvpString("qb-admin:favorites") == nil or GetResourceKvpString("qb-admin:favorites") == "[]" then
            Config.FavoritedItems = GenerateFavorites()
            SetResourceKvp("qb-admin:favorites", json.encode(Config.FavoritedItems))
        else
            Config.FavoritedItems = json.decode(GetResourceKvpString("qb-admin:favorites"))
        end
        if GetResourceKvpString("qb-admin:pinned_targets") == nil or GetResourceKvpString("qb-admin:pinned_targets") == "[]" then
            Config.PinnedTargets = GeneratePinnedPlayers()
            SetResourceKvp("qb-admin:pinned_targets", json.encode(Config.PinnedTargets))    
        else
            Config.PinnedTargets = json.decode(GetResourceKvpString("qb-admin:pinned_targets"))
        end
        if GetResourceKvpString("qb-admin:settings") == nil or GetResourceKvpString("qb-admin:settings") == "[]" then
            Config.AdminSettings = GenerateAdminSettings()
            SetResourceKvp("qb-admin:settings", json.encode(Config.AdminSettings))
        else
            Config.AdminSettings = json.decode(GetResourceKvpString("qb-admin:settings"))
        end
    end
    UpdateMenu()
end

-- Get

function GetPlayersInArea(Coords, Radius)
	local Prom = promise:new()
	Mercy.Functions.TriggerCallback('qb-admin:server:get-active-players-in-radius', function(Players)
		Prom:resolve(Players)
	end, Coords, Radius)
	return Citizen.Await(Prom)
end

function GetPlayers()
    local Promise = promise:new()
    Mercy.Functions.TriggerCallback("qb-admin:server:get-players", function(Players)
        Promise:resolve(Players)
    end)
    return Citizen.Await(Promise)
end

function GetBans()
    local Promise = promise:new()
    Mercy.Functions.TriggerCallback("qb-admin:server:get-bans", function(Bans)
        Promise:resolve(Bans)
    end)

    local Bans = Citizen.Await(Promise)
    local BanList = {}

    for k, v in pairs(Bans) do
        table.insert(BanList, {
            Text = ("%s (%s)"):format(v.name, v.steam),
            Steam = v.steam,
            BanId = v.id,
        })
    end

    return BanList
end

function GetJobs()
    local JobList = {}
    for k, v in pairs(QBShared.Jobs) do
        table.insert(JobList, {
            Text = k,
            Label = ' ['..v.label..']'
        })
    end
    return JobList
end

function GetInventoryItems()
    local Inventory = {}
    for k, v in pairs(QBShared.Items) do
        table.insert(Inventory, {
            Text = v['name']
        });
    end
    return Inventory
end

function GetAddonVehicles()
    local AddonVehicles = {}
    for k, v in pairs(QBShared.Vehicles) do
        -- if v['category'] == 'custom' then -- Enable if you don't want all cars but only cars with 'category' custom
            table.insert(AddonVehicles, {
                Text = k,
                Label = ' ['..v['brand']..' '..v['name']..']'
            })
        -- end
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

function GenerateAdminSettings()
    local Retval = {}
    -- Default Size
    Retval['DefaultSize'] = "Small"
    -- Tooltips
    Retval['Tooltips'] = true
    -- Bind Open
    Retval['BindOpen'] = true

    return Retval
end

function DeletePlayerBlips()
    local BlipData = Mercy.Functions.GetAllBlipsData('Blips')
    for k, v in pairs(BlipData) do
        local BlipName = string.sub(k, 1, 10)
        if BlipName == 'admin-blip' then
            Mercy.Functions.RemoveBlip(k)
        end
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
