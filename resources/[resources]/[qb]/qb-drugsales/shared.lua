
Config = {}
Config.Debug = true -- \ Set to true to enable debugging
Config.Core = "qb-core" -- \ The name of the core (Default: qb-core)
Config.Target = "qb-target" -- \ The target name (Default: qb-target)
Config.MinimumCops = 3 -- \ Minimum cops required to sell drugs
Config.GiveBonusOnPolice = true -- \ Give bonus on selling drugs to police (Edit on server side)
Config.ChanceSell = 70 -- \ Chance to sell drug (in %)
Config.Zones = { -- \ Sell zones (these zones are linked with the certain drugs check below)
    ['groove'] = {
		points = {
            vector2(250.90760803223, -1866.3974609375),
            vector2(146.70475769043, -1990.5447998047),
            vector2(130.3134765625, -2034.3944091797),
            vector2(95.291275024414, -2030.4129638672),
            vector2(88.095336914062, -2009.6634521484),
            vector2(68.878730773926, -1978.8924560547),
            vector2(-153.59761047363, -1779.4030761719),
            vector2(-97.692588806152, -1750.6363525391),
            vector2(-50.927833557129, -1733.6020507812),
            vector2(49.590217590332, -1689.9705810547)
        },
        minZ = 18.035144805908,
        maxZ = 75.059997558594,
    },
    ['groove2'] = {
		points = {
            vector2(469.03424072266, -1656.9465332031),
            vector2(537.26745605469, -1713.8753662109),
            vector2(561.02502441406, -1728.4215087891),
            vector2(585.94036865234, -1739.0633544922),
            vector2(577.02569580078, -1834.9709472656),
            vector2(567.84497070312, -1851.1324462891),
            vector2(542.61309814453, -1880.0740966797),
            vector2(398.50073242188, -1947.7969970703),
            vector2(298.67376708984, -1859.9350585938)
        },
        minZ = 18.035144805908,
        maxZ = 75.059997558594,
    },
}

Config.ZoneDrugs = { -- \ Names should be same as zone names
    [1] = {zone="sellzonegroove", item = 'cokebaggy', price = math.random(10, 20)},
    [2] = {zone="sellzonegroove", item = 'meth', price = math.random(10, 20)},
    [3] = {zone="sellzonegroove2", item = 'cokebaggy', price = math.random(10, 20)},
    [4] = {zone="sellzonegroove2", item = 'meth', price = math.random(10, 20)},
}

Config.BlacklistPeds = { -- \ Ped models that should be blacklisted
    "mp_m_shopkeep_01",
    "s_m_y_ammucity_01",
    `mp_m_weapexp_01`,
    `ig_bankman`,
    `S_F_Y_Casino_01`,
    `cs_lifeinvad_01`,
    `mp_m_waremech_01`,
    `ig_hunter`,
}