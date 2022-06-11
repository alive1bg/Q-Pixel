local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fp-weedshop:client:openjointstash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Joint Storage", {maxweight = 1000000, slots = 20})
    TriggerEvent("inventory:client:SetCurrentStash", "Joint Storage")
end)

RegisterNetEvent('fp-weedshop:client:opencounter', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "WeedShopCounter", {maxweight = 1000000, slots = 6})
    TriggerEvent("inventory:client:SetCurrentStash", "WeedShopCounter")
end)

RegisterNetEvent("fp-weedshop:client:openshop", function()
  TriggerServerEvent("inventory:server:OpenInventory", "shop", "Weed Shop Items", Config.Items)
end)

RegisterNetEvent('qb-weedshop:client:pickkog', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("fp_weedshop", "Picking OG-Kush marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('fp-weedshop:server:GetOGKush')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
end)

RegisterNetEvent('qb-weedshop:client:pickHaze', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("fp_weedshop", "Picking Purple-Haze marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('fp-weedshop:server:GetPurpleHaze')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
end)

RegisterNetEvent('qb-weedshop:client:pickAK47', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("fp_weedshop", "Picking AK47 marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('fp-weedshop:server:GetAK47')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
end)

RegisterNetEvent('qb-weedshop:client:pickSkunk', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("fp_weedshop", "Picking Skunk marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('fp-weedshop:server:GetSkunk')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
end)

RegisterNetEvent('qb-weedshop:client:pickWidow', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("fp_weedshop", "Picking White-Widow marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('fp-weedshop:server:GetWhiteWidow')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
end)

RegisterNetEvent('qb-weedshop:client:pickAmnesia', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("fp_weedshop", "Picking Amnesia marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('fp-weedshop:server:GetAmnesia')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
end)

------------- OGKush -------------

RegisterNetEvent("fp-weedshop:client:RollOGKushh", function()
    	QBCore.Functions.TriggerCallback('fp-weedshop:server:HasOGKush', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("fp_weedshop", "Rolling Up OG-Kush..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('fp-weedshop:server:GiveAndRemoveOGKushh')
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify("You don't have the required items!", "error")
        end
    end)
end)

------------- Purple-Haze -------------

RegisterNetEvent("fp-weedshop:client:RollPurpleHaze", function()
    	QBCore.Functions.TriggerCallback('fp-weedshop:server:HasPurpleHaze', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("fp_weedshop", "Rolling Up Purple-Haze..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('fp-weedshop:server:GiveAndRemovePurpleHaze')
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify("You don't have the required items!", "error")
        end
    end)
end)

------------- AK47 -------------

RegisterNetEvent("fp-weedshop:client:RollAK47", function()
    	QBCore.Functions.TriggerCallback('fp-weedshop:server:HasAK47', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("fp_weedshop", "Rolling Up AK47..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('fp-weedshop:server:GiveAndRemoveAK47')
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify("You don't have the required items!", "error")
        end
    end)
end)

------------- Skunk -------------

RegisterNetEvent("fp-weedshop:client:RollSkunk", function()
    	QBCore.Functions.TriggerCallback('fp-weedshop:server:HasSkunk', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("fp_weedshop", "Rolling Up Skunk..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('fp-weedshop:server:GiveAndRemoveSkunk')
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify("You don't have the required items!", "error")
        end
    end)
end)

------------- White-Widow -------------

RegisterNetEvent("fp-weedshop:client:RollWhiteWidow", function()
    	QBCore.Functions.TriggerCallback('fp-weedshop:server:HasWhiteWidow', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("fp_weedshop", "Rolling Up White-Widow..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('fp-weedshop:server:GiveAndRemoveWhiteWidow')
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify("You don't have the required items!", "error")
        end
    end)
end)

------------- Amnesia -------------

RegisterNetEvent("fp-weedshop:client:RollAmnesia", function()
    	QBCore.Functions.TriggerCallback('fp-weedshop:server:HasAmnesia', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("fp_weedshop", "Rolling Up Amnesia..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('fp-weedshop:server:GiveAndRemoveAmnesia')
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify("You don't have the required items!", "error")
        end
    end)
end)

------------- OGKush -------------

RegisterNetEvent("fp-weedshop:client:GrindOGKushh", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasToGrindOGKush', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Griding OG-Kush Bud..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveGrindedOGKushh')
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- Purple-Haze -------------

RegisterNetEvent("fp-weedshop:client:GrindPurpleHaze", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasToGrindPurpleHaze', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Griding Purple-Haze Bud..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveGrindedPurpleHaze')
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- AK47 -------------

RegisterNetEvent("fp-weedshop:client:GrindAK47", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasToGrindAK47', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Griding AK47 Bud..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveGrindedAK47')
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- Skunk -------------

RegisterNetEvent("fp-weedshop:client:GrindSkunk", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasToGrindSkunk', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Griding Skunk Bud..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveGrindedSkunk')
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- White-Widow -------------

RegisterNetEvent("fp-weedshop:client:GrindWhiteWidow", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasToGrindWhiteWidow', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Griding White-Widow Bud..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveGrindedWhiteWidow')
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- Amnesia -------------

RegisterNetEvent("fp-weedshop:client:GrindAmnesia", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasToGrindAmnesia', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Griding Amnesia Bud..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveGrindedAmnesia')
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- OGKush -------------

RegisterNetEvent("fp-weedshop:client:BrownieOG-Kush", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasBrownieMixOGKush', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Mixing OG-Kush With Brownie Mix..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveItemBrownieOGKushh')
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- Purple-Haze -------------

RegisterNetEvent("fp-weedshop:client:BrowniePurple-Haze", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasBrownieMixPurpleHaze', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Mixing Purple-Haze With Brownie Mix..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveItemBrowniePurpleHaze')
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- AK47 -------------

RegisterNetEvent("fp-weedshop:client:BrownieAK47", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasBrownieMixAK47', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Mixing AK47 With Brownie Mix..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveItemBrownieAK47')
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- Skunk -------------

RegisterNetEvent("fp-weedshop:client:BrownieSkunk", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasBrownieMixSkunk', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Mixing Skunk With Brownie Mix..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveItemBrownieSkunk')
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- White-Widow -------------

RegisterNetEvent("fp-weedshop:client:BrownieWhite-Widow", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasBrownieMixWhiteWidow', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Mixing White-Widow With Brownie Mix..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveItemBrownieWhiteWidow')
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

------------- Amnesia -------------

RegisterNetEvent("fp-weedshop:client:BrownieAmnesia", function()
  QBCore.Functions.TriggerCallback('fp-weedshop:server:HasBrownieMixAmnesia', function(HasItems)  
    if HasItems then
      RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
      TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" ,1.0, 1.0, -1, 16, 1, true, true, true)
      QBCore.Functions.Progressbar("fp_weedshop", "Mixing Amnesia With Brownie Mix..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('fp-weedshop:server:GiveItemBrownieAmnesia')
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
      end)
  else
      QBCore.Functions.Notify("You don't have the required items!", "error")
    end
end)
end)

function RequestAnimationDict(AnimDict)
  RequestAnimDict(AnimDict)
  while not HasAnimDictLoaded(AnimDict) do
      Citizen.Wait(1)
  end
end

function RequestAnimationDict(ad)
  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do
      Citizen.Wait(1)
  end
end

function Armour(EffectTime, Multiplier)
  while EffectTime > 0 do
    Citizen.Wait(1000)
    EffectTime = EffectTime - 1
      local armor = GetPedArmour(PlayerPedId())
      SetPedArmour(PlayerPedId(), math.ceil(armor + Multiplier))
  end
  EffectTime = 0
end

local ped = PlayerPedId()
local health = GetEntityHealth(ped)

RegisterNetEvent("fp-weedshop:client:smokejointogkush", function(item)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Lighting Joint..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            end
            TriggerServerEvent('QBCore:Server:RemoveItem', "og_kush", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["og_kush"], "remove")
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
          ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
  end
end)

RegisterNetEvent("fp-weedshop:client:smokejointpurplehaze", function(item)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Lighting Joint..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            end
            TriggerServerEvent('QBCore:Server:RemoveItem', "purple_haze", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["purple_haze"], "remove")
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
          ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
    end
end)

RegisterNetEvent("fp-weedshop:client:smokejointak47", function(item)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Lighting Joint..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            end
            TriggerServerEvent('QBCore:Server:RemoveItem', "ak47", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ak47"], "remove")
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
          ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
    end
end)

RegisterNetEvent("fp-weedshop:client:smokejointskunk", function(item)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Lighting Joint..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            end
            TriggerServerEvent('QBCore:Server:RemoveItem', "skunk", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["skunk"], "remove")
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
          ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
    end
end)

RegisterNetEvent("fp-weedshop:client:smokejointwhitewidow", function(item)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Lighting Joint..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            end
            TriggerServerEvent('QBCore:Server:RemoveItem', "white_widow", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["white_widow"], "remove")
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
          ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
    end
end)

RegisterNetEvent("fp-weedshop:client:smokejointamnesia", function(item)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Lighting Joint..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            end
            TriggerServerEvent('QBCore:Server:RemoveItem', "amnesia", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["amnesia"], "remove")
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
          ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
    end
end)

RegisterNetEvent("fp-weedshop:client:eatbrownie", function(item)
  local time = math.random(5000,7500)
  local light = QBCore.Functions.HasItem('lighter')
    if light then
      QBCore.Functions.Progressbar("fp_weedshop", "Eating Brownie..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
      }, {}, {}, {}, function() -- Done
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
            end
            Wait(time)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(time)
            WeedEffect()
            if Config.AddHealth then
            SetEntityHealth(ped, health + math.random(Config.MinOfHealthPerJoint, Config.MaxOfHealthPerJoint))
            elseif Config.AddArmor then
            Armour(Config.AmountOfArmorPerJoint, Config.AmountOfArmorMultiplier)
            elseif Config.ReliefStress then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MinOfStressReliefPerJoint, Config.MaxOfStressReliefPerJoint))
          end
        end, function() -- Cancel
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
      QBCore.Functions.Notify("You don't have a lighter", "error")
    end
end)

function WeedEffect()
  local playerPed = PlayerPedId()
  
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
      Citizen.Wait(0)
    end
    SetTimecycleModifier("spectator6")
    SetPedMotionBlur(playerPed, true)
    AnimpostfxPlay("ChopVision", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
    if Config.SetEffectDrunk then
      
        SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
        --vvvvvvvvvvvvvvvv
        Citizen.Wait(Config.HighTime)
        --^^^^^^^^^^^^^^^^
        --Time of effect
      --  after wait stop all effects
        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        SetPedIsDrunk(PlayerPedId(), false)        
        SetPedMotionBlur(playerPed, false)
        ResetPedMovementClipset(PlayerPedId())
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
    else
    --vvvvvvvvvvvvvvvv
    Citizen.Wait(Config.HighTime)
    --^^^^^^^^^^^^^^^^
    --Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(PlayerPedId(), false)        
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(PlayerPedId())
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
    end
end
