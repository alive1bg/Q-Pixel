--[[
	DECOR_TYPE_FLOAT = 1,
	DECOR_TYPE_BOOL = 2,
	DECOR_TYPE_INT = 3,
	DECOR_TYPE_UNK = 4,
	DECOR_TYPE_TIME = 5
]]
DecorRegister('hasNeons', 2)
DecorRegister('hasDriftTyres', 2)

local Flags = {}

Flags.hasNeons = function(pVehicle, toggle)
	DecorSetBool(pVehicle, 'hasNeons', toggle)
end

Flags.hasDriftTyres = function(pVehicle, toggle)
	DecorSetBool(pVehicle, 'hasDriftTyres', toggle)
end

local function hasFlags(pEntity, pFlag)
	return DecorGetBool(pEntity, pFlag)
end
exports('hasFlag', hasFlags)

local function setFlags(pEntity, pFlag, pToggle)
	if Flags[pFlag] then
		Flags[pFlag](pEntity, pToggle)
	end
end
exports('setFlag', setFlags)