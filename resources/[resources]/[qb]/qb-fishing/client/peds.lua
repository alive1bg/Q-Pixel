-- --============================================================== Exports
exports[Config.targetExport]:AddTargetModel(`mp_m_weapexp_01`, {
    options = {
        {
            event = "qb-client:BoatMenu",
            icon = "fas fa-anchor",
            label = "Boat Rental",
            location = 1 --LaPuerta
        },
		{
            event = "qb-client:buyFishingGear",
            icon = "fas fa-fish",
            label = "Fishing Gear",
        },
    },
    distance = 10.0
})

exports[Config.targetExport]:AddTargetModel(`u_m_m_filmdirector`, {
    options = {
        {
            event = "qb-client:BoatMenu",
            icon = "fas fa-anchor",
            label = "Boat Rental",
            location = 2 --PaletoCove
        },
		{
            event = "qb-client:buyFishingGear",
            icon = "fas fa-fish",
            label = "Fishing Gear",
        },
    },
    distance = 10.0
})

exports[Config.targetExport]:AddTargetModel(`s_m_o_busker_01`, {
    options = {
        {
            event = "qb-client:BoatMenu",
            icon = "fas fa-anchor",
            label = "Boat Rental",
            location = 3 --ElGordo
        },
		{
            event = "qb-client:buyFishingGear",
            icon = "fas fa-fish",
            label = "Fishing Gear",
        },
    },
    distance = 10.0
})

exports[Config.targetExport]:AddTargetModel(`ig_cletus`, {
    options = {
        {
            event = "qb-client:BoatMenu",
            icon = "fas fa-anchor",
            label = "Boat Rental",
            location = 4 --ActDam
        },
		{
            event = "qb-client:buyFishingGear",
            icon = "fas fa-fish",
            label = "Fishing Gear",
        },
    },
    distance = 10.0
})

exports[Config.targetExport]:AddTargetModel(`a_m_m_hillbilly_01`, {
    options = {
        {
            event = "qb-client:BoatMenu",
            icon = "fas fa-anchor",
            label = "Boat Rental",
            location = 5 --AlamoSea
        },
		{
            event = "qb-client:buyFishingGear",
            icon = "fas fa-fish",
            label = "Fishing Gear",
        },
    },
    distance = 10.0
})

exports[Config.targetExport]:AddTargetModel(`s_m_y_busboy_01`, {
    options = {
        {
            event = "qb-client:SellLegalFish",
            icon = "fa fa-fish",
            label = "Sell Fish",
        },
		{
            event = "qb-client:SellillegalFish",
            icon = "fa fa-fish",
            label = "Sell Exotic Fish",
        },
    },
    distance = 10.0
})
