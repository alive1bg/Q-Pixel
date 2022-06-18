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
    casinoPed = CreatePed(26, model, 990.83, 30.86, 71.47 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 57.052 )
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    -- Inside Track
    model = GetHashKey("S_M_Y_Doorman_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 998.66, 69.09, 70.06 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 190.937)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

--     -- ambient workers
    model = GetHashKey("u_f_m_casinoshop_01") -- clothing
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 963.0, 20.74, 71.46 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 281.85)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_casino_01") -- restricted door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 990.46301, 23.760438, 71.46109 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 66.791336)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(0, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("s_m_y_casino_01") -- management door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1019.2449, 67.375801, 69.860664 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 223.07846)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(1, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("s_m_y_casino_01") -- management door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1008.24, 62.79, 70.46 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 195.18)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(7, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- front desk
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 965.36, 48.04, 71.7 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 149.65)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(1, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- front desk
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 966.71209, 47.209846, 71.700889 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 145.60322)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(11, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- black jack standby
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1040.22, 43.94, 69.46 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 57.8)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(13, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_F_Y_Casino_01") -- entrance of table games
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 999.83, 46.39, 71.06 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    SetModelAsNoLongerNeeded(model)
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 115.56)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(1, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- 2nd car wheel close lady
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 972.85, 41.72, 72.15 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 220.37)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(12, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)


    model = GetHashKey("S_F_Y_Casino_01") -- back near pokies
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 996.96, 35.35, 71.06 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 23.92)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(13, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- main floor dude near car wheel spin thing
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 983.23889, 37.737941, 71.461044 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 260.79254)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(8, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- inside track dude 2
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 992.97, 64.31, 70.46 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 261.06)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(5, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- next to car spinner
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 974.901, 34.128, 71.91 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 1.995)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(3, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_F_Y_Casino_01") -- bar staff
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 980.4, 25.51, 71.46 - 1.00, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 332.13)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(3, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("S_M_Y_Casino_01") -- front door
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 933.62, 41.631, 80.089, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 56.923)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothesMen(6, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- front door -- need to fix arms
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 933.011, 40.807, 80.089, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 54.913)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(10, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_valet_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 925.235, 50.921, 80.106, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 55.601)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 952.54968, 21.686431, 71.904518 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 352.16427)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(4, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_doorman_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 935.7796, 45.338371, 81.100379 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 101.64885)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_m_y_doorman_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 930.9793, 37.230464, 81.100372 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 8.8185768)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("s_f_y_casino_01") -- keep
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 987.95, 42.32, 71.27 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 248.82)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(4, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

--     -- ==================================================================================================================--
--     -- ==================================================================================================================--locals-
--     -- ==================================================================================================================--

    model = GetHashKey("a_m_m_paparazzi_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 972.53936, 27.989217, 71.461082 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 273.02282)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_tourist_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 973.71435, 29.745031, 71.461059 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 267.054)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("a_f_y_vinewood_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 984.89556, 28.538919, 71.461082 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 351.20642)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    model = GetHashKey("cs_tom")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 983.4168, 29.589271, 71.461082 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 205.3164)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    model = GetHashKey("cs_jimmyboston")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 987.71032, 33.966289, 71.732299 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 45.727722)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    model = GetHashKey("cs_carbuyer")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 984.98925, 33.476303, 71.461082 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 345.16589)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    model = GetHashKey("a_m_y_clubcust_03")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 991.0415, 36.090263, 71.174911 - 1.1, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 23.49122)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    model = GetHashKey("cs_gurk")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 981.75805, 42.050205, 71.906455 - 0.93, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 110.04167)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    model = GetHashKey("cs_lazlow_2")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 980.29144, 36.756786, 71.906166 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 50.301143)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    model = GetHashKey("a_m_y_clubcust_03")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 980.30438, 33.593296, 71.460998 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 197.04962)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_y_bevhills_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end vector4(979.58898, 32.049667, 71.460998, 308.60614)
    casinoPed = CreatePed(26, model, 979.58898, 32.049667, 71.460998 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 308.60614)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_vinewood_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 983.13647, 24.100822, 71.461082 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 334.2922)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 986.49041, 50.657352, 71.060607 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 177.97274)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 990.35046, 52.321819, 71.060638 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 215.71334)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_m_malibu_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 993.39654, 48.428535, 71.060638 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 196.97523)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("a_f_y_vinewood_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1018.6442, 52.289546, 69.865303 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 266.40615)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("s_m_m_hairdress_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1023.5665, 44.956447, 69.865196 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 28.564308)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1029.7368, 47.454658, 69.460067 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 309.61425)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("u_f_m_miranda_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1032.1009, 55.042308, 69.460304 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 252.3386)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    model = GetHashKey("cs_carbuyer")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1035.6674, 60.634498, 69.460311 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 205.73907)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("cs_dale")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1031.0651, 44.83897, 69.865303 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 162.90045)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1032.4754, 37.403224, 69.86528 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 21.474321)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_y_hipster_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1029.5802, 42.057621, 69.86589 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 142.8202)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("u_f_m_miranda_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1036.666, 43.407089, 69.459335 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 331.10214)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 1034.0401, 50.985885, 69.079681 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 306.38113)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_m_m_prolhost_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 988.12371, 22.254632, 70.976131 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 35.163822)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_CHAIR", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 986.50177, 20.473411, 70.866131 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 54.299049)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 987.30712, 21.437465, 69.866131, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 48.546337)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_m_m_stlat_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 983.11022, 23.023683, 71.19099 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 77.471549)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_CHAIR_FOOD", 0, true)

    model = GetHashKey("a_f_y_scdressy_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 980.46685, 16.355519, 70.955805 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 2.3374636)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_CHAIR_UPRIGHT", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 983.51318, 17.342206, 70.880356 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 31.831968)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 971.17456, 33.541519, 71.470748 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 218.99371)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_STAND_IMPATIENT", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model, 990.61773, 38.778751, 71.060707 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 23.696472)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)

    -- ON DESK

    model = GetHashKey("a_m_m_malibu_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 973.64843, 16.755548, 70.907058 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 11.839679)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 976.07635, 16.852035, 70.907058 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 350.53961)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 979.01885, 16.281663, 70.907058 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 359.2388)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_m_m_stlat_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 982.08239, 16.698879, 70.907058 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 17.920671)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 984.76422, 18.265134, 70.907058 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 33.390048)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", 0, true)

    -- ON BAR

    model = GetHashKey("a_f_y_bevhills_04")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model ,  977.15693, 25.402185, 71.461074 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 64.899696)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", 0, true)

    model = GetHashKey("a_m_m_malibu_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 976.61837, 26.130261, 71.261074 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 230.19139)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", 0, true)

    model = GetHashKey("ig_taostranslator")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 935.392, 27.821, 70.834 -1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 326.627)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 981.61743, 26.665792, 71.461074 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 318.02835)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 979.74224, 28.057027, 71.461059 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 233.84405)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 980.21716, 27.358528, 71.461059 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 177.95036)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_PARTYING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 978.86804, 27.28058, 71.461059 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 10.183652)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)

    model = GetHashKey("a_f_y_genhot_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    casinoPed = CreatePed(26, model , 978.08789, 27.743103, 71.461059 - 1.0, true)
    while not DoesEntityExist(casinoPed) do
        Wait(0)
    end
    FreezeEntityPosition(casinoPed, true)
    SetEntityHeading(casinoPed, 249.62475)
    SetEntityInvincible(casinoPed, true)
    SetPedConfigFlag(casinoPed, 185, true)
    SetPedConfigFlag(casinoPed, 108, true)
    SetPedResetFlag(casinoPed, 249, 1)
    SetPedAsEnemy(casinoPed, 0)
    SetEntityCanBeDamaged(casinoPed, 0)
    SetPedCanEvasiveDive(casinoPed, 0)
    SetPedCanRagdollFromPlayerImpact(casinoPed, 0)
    SetBlockingOfNonTemporaryEvents(casinoPed, 1)
    TaskSetBlockingOfNonTemporaryEvents(casinoPed, 1)
    SetCasinoPedClothes(randomNumber, casinoPed)
    TaskStartScenarioInPlace(casinoPed, "WORLD_HUMAN_SMOKING", 0, true)
end

function setBlackjackDealerPedVoiceGroup(randomNumber,casinoPed)
    if randomNumber == 0 then
        SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_WHITE_01"))
	elseif randomNumber == 1 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_ASIAN_01"))
    elseif randomNumber == 2 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_ASIAN_02"))
    elseif randomNumber == 3 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_ASIAN_01"))
    elseif randomNumber == 4 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_WHITE_01"))
	elseif randomNumber == 5 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_WHITE_02"))
    elseif randomNumber == 6 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_M_Y_Casino_01_WHITE_01"))	
    elseif randomNumber == 7 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_ASIAN_01"))	
    elseif randomNumber == 8 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_ASIAN_02"))
    elseif randomNumber == 9 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_ASIAN_01"))
    elseif randomNumber == 10 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_ASIAN_02"))
    elseif randomNumber == 11 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_LATINA_01"))
    elseif randomNumber == 12 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_LATINA_02"))
    elseif randomNumber == 13 then
		SetPedVoiceGroup(casinoPed, GetHashKey("S_F_Y_Casino_01_LATINA_01"))
    end
end

function SetCasinoPedClothes(randomNumber, casinoPed)
    if randomNumber == 0 then 
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 1 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 3, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 2 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 3, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 3 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 3, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 4 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 5 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 6 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 7 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 3, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 8 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 3, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 9 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 3, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 10 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 11 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
            SetPedPropIndex(casinoPed, 1, 0, 0, false)
    elseif randomNumber == 12 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 3, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 1, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
    elseif randomNumber == 13 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 1, 0)
        SetPedPropIndex(casinoPed, 1, 0, 0, false)
	end
end

function SetCasinoPedClothesMen(randomNumber, casinoPed)
    if randomNumber == 0 then 
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 2, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 1 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 2 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 3 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 4 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 5 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 6 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 7 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 1, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 8 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 1, 1, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 9 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 2, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 10 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 2, 1, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 11 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
        SetPedPropIndex(casinoPed, 1, 0, 0, false)
    elseif randomNumber == 12 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 3, 1, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 3, 1, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
    elseif randomNumber == 13 then
        SetPedDefaultComponentVariation(casinoPed)
        SetPedComponentVariation(casinoPed, 0, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 1, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 2, 4, 0, 0)
        SetPedComponentVariation(casinoPed, 3, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 4, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 6, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 7, 0, 1, 0)
        SetPedComponentVariation(casinoPed, 8, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 10, 0, 0, 0)
        SetPedComponentVariation(casinoPed, 11, 0, 0, 0)
        SetPedPropIndex(casinoPed, 1, 0, 0, false)
	end
end