QBCore = exports['qb-core']:GetCoreObject()

local accessCheckCache = {}
local accessCheckCacheTimer = {}
local businesses = {}
local businessesCacheTimer = nil

local securedAccesses = {}

function setSecuredAccesses(pAccesses, pType)
    securedAccesses[pType] = pAccesses
    accessCheckCache[pType] = {}
    accessCheckCacheTimer[pType] = {}
end

function clearAccessCache()
    for accessType, _ in pairs(accessCheckCache) do
        accessCheckCacheTimer[accessType] = {}
    end
end

RegisterNetEvent('QBCore:Player:SetPlayerData', function()
    clearAccessCache()
end)


function isPD(job)
    return job == "police"
end

function isDR(job)
    return job == "ambulance" or job == "doctor" or job == "hospital"
end

function isCID(certs)
	return certs["cid"] or false
end

function getBusinesses()
    if businessesCacheTimer ~= nil and businessesCacheTimer + 60000 > GetGameTimer() then -- 1 minute
        return businesses
    end
    local characterId = QBCore.Functions.GetPlayerData().citizenid
    local _, employment = RPC.execute("GetEmploymentInformation", { character = { id = characterId } })
    businesses = employment
    return businesses
end

function hasSecuredAccess(pId, pType)
    if accessCheckCacheTimer[pType][pId] ~= nil and accessCheckCacheTimer[pType][pId] + 60000 > GetGameTimer() then -- 1 minute
        return accessCheckCache[pType][pId] == true
    end

    accessCheckCacheTimer[pType][pId] = GetGameTimer()

    local user = QBCore.Functions.GetPlayerData()

    local job = user.job.name

	--local jobExtras = user.JobExtras.certs

    local characterId = QBCore.Functions.GetPlayerData().citizenid
    local secured = securedAccesses[pType][pId]

    if not secured then return end
    if secured.forceUnlocked then
		print("Here?")
      return false
    end

    if      (secured.access.job and secured.access.job[job] or false)
        or  (secured.access.job["PD"] ~= nil and isPD(job))
        or  (secured.access.job["DR"] ~= nil and isDR(job))
		or  (secured.access.job["CID"] ~= nil and isCID(jobExtras))
        or  (secured.access.job["Public"] ~= nil)
        or  (secured.access.cid ~= nil and secured.access.cid[characterId] ~= nil)
    then
        accessCheckCache[pType][pId] = true
        return true
    end

    --if secured.access.item ~= nil then
    --    accessCheckCacheTimer[pType][pId] = 0
    --    for i, v in pairs(secured.access.item) do
    --        if exports["np-inventory"]:hasEnoughOfItem(i, 1, false) then
    --            return true
    --        end
    --    end
    --end

    --local employment = getBusinesses()
    --for _, business in pairs(employment) do
    --    if secured.access.business and secured.access.business[business.code] == true then
    --        for _, permission in pairs(business.permissions) do
    --            if permission == "property_keys" then
    --                accessCheckCache[pType][pId] = true
    --                return true
    --            end
    --        end
    --    end
    --end
    accessCheckCache[pType][pId] = false
    return false
end
