CreateThread(function()
	CasinoPeds()
end)

function CasinoPeds()
    -- Employee
    model = GetHashKey("u_f_m_casinocash_01") -- cash zone
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,990.83, 30.86, 71.47 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 57.052 )
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    -- Inside Track
    model = GetHashKey("S_M_Y_Doorman_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 998.66, 69.09, 70.06 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 190.937)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

--     -- ambient workers
    model = GetHashKey("u_f_m_casinoshop_01") -- clothing
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,963.0, 20.74, 71.46 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 281.85)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_casino_01") -- restricted door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 990.46301, 23.760438, 71.46109 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 66.791336)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("s_m_y_casino_01") -- management door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 1019.2449, 67.375801, 69.860664 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 223.07846)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("s_m_y_casino_01") -- management door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 1008.24, 62.79, 70.46 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 195.18)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- front desk
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 965.36, 48.04, 71.7 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  149.65)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- black jack standby
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 1040.22, 43.94, 69.46 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 57.8)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- entrance of table games
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 999.83, 46.39, 71.06 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 115.56)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- 2nd car wheel close lady
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 972.85, 41.72, 72.15 - 1.00, true) 
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 220.37)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)


    model = GetHashKey("s_f_y_casino_01") -- back near pokies
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 996.96, 35.35, 71.06 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 23.92)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- main floor dude near car wheel spin thing
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 983.23889, 37.737941, 71.461044 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 260.79254)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- inside track dude 2
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 992.97, 64.31, 70.46 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 261.06)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- next to car spinner
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 974.901, 34.128, 71.91 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 1.995)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_F_Y_Casino_01") -- bar staff
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(1, model , 980.4, 25.51, 71.46 - 1.00, true) 
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 332.13)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, false)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- front door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 933.62, 41.631, 80.089, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  56.923)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- front door -- need to fix arms
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 933.011, 40.807, 80.089, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 54.913)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- outside -- side entrance double door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 985.97, 80.53, 80.99 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 35.262)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_valet_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 925.235, 50.921, 80.106, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 55.601)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 952.54968, 21.686431, 71.904518 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 352.16427)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_doorman_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 935.7796, 45.338371, 81.100379 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 101.64885)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_doorman_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 930.9793, 37.230464, 81.100372 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 8.8185768)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

--     -- ==================================================================================================================--
--     -- ==================================================================================================================--locals-
--     -- ==================================================================================================================--
    model = GetHashKey("a_m_m_paparazzi_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 949.985, 54.927, 70.433, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 172.611)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_tourist_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 943.266, 64.802, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 267.054)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("a_f_y_vinewood_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 943.723, 65.612, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  173.907)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    model = GetHashKey("cs_tom")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 942.68, 38.882, 70.834, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 154.872)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("cs_jimmyboston")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 942.057, 38.012, 70.834, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,   329.05)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    model = GetHashKey("cs_carbuyer")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 929.239, 28.97, 70.834, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  281.783)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    model = GetHashKey("a_m_y_clubcust_03")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 928.8, 29.857, 70.834, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  283.934)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    model = GetHashKey("cs_gurk")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 934.337, 37.499, 71.279, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 168.193)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    model = GetHashKey("cs_lazlow_2")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,935.38, 37.579, 71.279, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  180.215)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_y_clubcust_03")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,927.904, 41.925, 71.274, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  179.576)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_m_y_bevhills_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 953.208, 61.601, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  339.76)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_vinewood_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 953.94, 61.392, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 344.716)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 955.158, 61.174, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  356.136)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 965.489, 72.251, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  196.752)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_m_malibu_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 964.468, 71.471, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  221.392)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("a_f_y_vinewood_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 987.52, 57.652, 68.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  204.379)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("s_m_m_hairdress_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 986.732, 57.113, 68.866, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  222.62)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 982.362, 46.761, 69.238, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  0.99)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("u_f_m_miranda_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 969.109, 46.507, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 82.089)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("cs_carbuyer")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,  969.066, 47.366, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 83.4)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("cs_dale")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,968.666, 45.528, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,  81.227)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 961.332, 52.542, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,203.484)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_y_hipster_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,  988.817, 49.03, 68.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 352.551)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("u_f_m_miranda_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 989.748, 49.294, 68.832, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 6.127)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 962.446, 52.816, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 207.774)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_m_prolhost_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 945.779, 22.762, 70.279, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 44.244)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_CHAIR", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 945.09, 21.745, 70.279, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 51.433)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 940.96, 18.807, 70.305, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 17.935)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_m_m_stlat_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 941.913, 19.163, 70.288, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 18.65)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_CHAIR_FOOD", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 932.517, 18.882, 70.313, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 7.469)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_CHAIR_UPRIGHT", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 933.335, 19.048, 70.33, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 357.385)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 935.98, 28.242, 70.834, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped,233.585)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 962.431, 51.656, 69.833, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 29.831)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    -- ON DESK

    model = GetHashKey("a_m_m_malibu_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 973.64843, 16.755548, 70.907058 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 11.839679)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 976.07635, 16.852035, 70.907058 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 350.53961)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 979.01885, 16.281663, 70.907058 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 359.2388)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_m_m_stlat_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 982.08239, 16.698879, 70.907058 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 17.920671)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 984.76422, 18.265134, 70.907058 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 33.390048)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    -- ON BAR

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,  977.15693, 25.402185, 71.461074 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 64.899696)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", 0, true)

    model = GetHashKey("a_m_m_malibu_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 976.61837, 26.130261, 71.261074 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 230.19139)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 935.392, 27.821, 70.834 -1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 326.627)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 981.61743, 26.665792, 71.461074 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 318.02835)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 979.74224, 28.057027, 71.461059 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 233.84405)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 980.21716, 27.358528, 71.461059 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 177.95036)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 978.86804, 27.28058, 71.461059 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 10.183652)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model , 978.08789, 27.743103, 71.461059 - 1.0, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 249.62475)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)
end