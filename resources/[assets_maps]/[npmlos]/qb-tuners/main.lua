Citizen.CreateThread(function()

    RequestIpl("np_tunershop_milo_")
    interiorID = GetInteriorAtCoords(137.7009, -3029.3040, 11.7953)
    if IsValidInterior(interiorID)
    then
    EnableInteriorProp(interiorID,"balcony")
    RefreshInterior(interiorID)
    end
    end)
    