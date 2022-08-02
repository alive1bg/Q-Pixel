--[[ Citizen.CreateThread(function()


RequestIpl("prologue06_int_np")
	
    local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
	
end) ]]