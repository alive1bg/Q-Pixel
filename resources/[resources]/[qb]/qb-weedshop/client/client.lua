local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == Config.Job then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

CreateThread(function()
  if Config.Option == "drawtext" then 
      while true do
          sleep = 1500
          local pos = GetEntityCoords(PlayerPedId())
          local PlayerData = QBCore.Functions.GetPlayerData()

              if PlayerJob.name == Config.Job then
                  for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-duty"]) do
                      local dist = #(pos - v)
                          if dist < 1.8 then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 16, 227, 86, 86, false, false, false, true, false, false, false)                              if dist < 1.8 then
                                  sleep = 5
                                  if not onDuty then
                                      QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~g~E~w~ - Go on duty")
                                      --QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Go off duty")
                                  else
                                      QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~r~E~w~ - Go off duty")
                                      --QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go on duty")
                                  end
                                  if IsControlJustReleased(0, 38) then
                                      onDuty = not onDuty
                                      TriggerServerEvent("QBCore:ToggleDuty")
                                  end
                              end
                          elseif #(pos - v) < 1.5 then
                              sleep = false
                              QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Time Clock")
                          end
                      end
                  end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-counter"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Open Counter")
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("fp-weedshop:client:opencounter")
                    end
                elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Open Counter")
                end
            end

              if PlayerJob.name == Config.Job and QBCore.Functions.GetPlayerData().job.onduty then
              for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-bill"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 0.8 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Register")
                      if IsControlJustReleased(0, 38) then
                          TriggerEvent("fp-weedshop:client:billcitizen")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Register")
                  end
                end

              for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-jointstorage"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Storage")
                      if IsControlJustReleased(0, 38) then
                          TriggerEvent("fp-weedshop:client:openjointstash")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Storage")
                  end
              end

              for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-shop"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Shop")
                      if IsControlJustReleased(0, 38) then
                          TriggerEvent("fp-weedshop:client:openshop")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Shop")
                  end
              end

              for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-jointtable"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Joint Crafting")
                      if IsControlJustReleased(0, 38) then
                          TriggerEvent("fp-weedshop:client:jointcraftingtable")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Joint Crafting")
                  end
              end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-grindweed"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Grind Bud")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("fp-weedshop:client:weedgridingtable")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Grind Bud")
                    end
                end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-brownietable"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Brownie Crafting")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("fp-weedshop:client:browniecraftingtable")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Brownie Crafting")
                    end
                end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-vehicle"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 5 then
                        sleep = 5
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 16, 227, 86, 86, false, false, false, true, false, false, false)
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    sleep = 5
                                    QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~g~E~w~ - Store vehicle")
                                    sleep = 5
                                else
                                    QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~g~E~w~ - Garage")
                                    sleep = 5
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        local car = GetVehiclePedIsIn(PlayerPedId(), true)
                                        if GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true)) == GetHashKey("pony2") then
                                            QBCore.Functions.DeleteVehicle(car)
                                            QBCore.Functions.Notify("Vehicle Stored!", "success")
                                        else
                                            QBCore.Functions.Notify("You can't store this vehicle here!", "error")
                                        end
                                    else
                                        Vehicle()
                                    end
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "OG-Kush plant")
                            end 
                        end
                    end

              --Plants
                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-OG-Kush"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick OG-Kush plant")
                      if IsControlJustReleased(0, 38) then
                        TriggerEvent("qb-weedshop:client:pickkog")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "OG-Kush plant")
                  end
              end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-Purple-Haze"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick Purple-Haze plant")
                      if IsControlJustReleased(0, 38) then
                        TriggerEvent("qb-weedshop:client:pickHaze")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Purple-Haze plant")
                  end
              end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-AK47"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick AK47 plant")
                      if IsControlJustReleased(0, 38) then
                        TriggerEvent("qb-weedshop:client:pickAK47")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "AK47 plant")
                  end
              end

                for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-Skunk"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick Skunk plant")
                      if IsControlJustReleased(0, 38) then
                        TriggerEvent("qb-weedshop:client:pickSkunk")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Skunk plant")
                  end
              end

              for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-White-Widow"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick White-Widow plant")
                    if IsControlJustReleased(0, 38) then
                      TriggerEvent("qb-weedshop:client:pickWidow")
                    end
                elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "White-Widow plant")
                end
            end

              for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-Amnesia"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick Amnesia plant")
                    if IsControlJustReleased(0, 38) then
                      TriggerEvent("qb-weedshop:client:pickAmnesia")
                    end
                elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                    sleep = 5
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Amnesia plant")
                end
            end

            for k, v in pairs(Config.FPWEEDSHOP["fp-weedshop-duty"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 30.0 then
                    if QBCore.Functions.GetPlayerData().job.name == Config.Job then
                    end
                elseif #(pos - vector3(v.x, v.y, v.z)) >= 31.0 and onDuty then
                    TriggerServerEvent("QBCore:ToggleDuty")
                end
            end
  
          end
      Wait(sleep)
  end
  end
end)

function Vehicle()
    local coords = Config.FPWEEDSHOP["fp-weedshop-vehicle"][1]
    QBCore.Functions.SpawnVehicle("pony2", function(veh)
        SetVehicleNumberPlateText(veh, "WEED"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, 181.0)
        SetVehicleDirtLevel(veh, 0.1)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

CreateThread(function()
  for k,v in ipairs(Config.Blip["Coords"])do
      blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, Config.Blip.Sprite)
      SetBlipAsShortRange(blip, true)
      SetBlipScale(blip, Config.Blip.Scale)
      SetBlipColour(blip, Config.Blip.Color)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(tostring(Config.Blip.Name))
      EndTextCommandSetBlipName(blip)
  end
end)

RegisterNetEvent("fp-weedshop:client:billcitizen", function()
    local bill = exports["qb-input"]:ShowInput({
        header = "Create Receipt",
        submitText = "Bill Player",
        inputs = {
            {
                text = "Player ID",
                name = "playerid",
                type = "number",
                isRequired = true
            },
            {
                text = "Bill Amount ($)",
                name = "billprice",
                type = "number",
                isRequired = true
            },
            {
                text = "Bill Type", -- text you want to be displayed as a input header
                name = "billtype", -- name of the input should be unique otherwise it might override
                type = "radio", -- type of the input - Radio is useful for "or" options e.g; billtype = Cash OR Bill OR bank
                options = { -- The options (in this case for a radio) you want displayed, more than 6 is not recommended
                    { value = "bill", text = "Bill" }, -- Options MUST include a value and a text option
                    { value = "cash", text = "Cash" }, -- Options MUST include a value and a text option
                    { value = "bank", text = "Bank" }  -- Options MUST include a value and a text option
                }
            }
        }
    })
    if bill then
        if not bill.playerid or not bill.billprice or not bill.billtype then
            return
        else
            TriggerServerEvent("fp-weedshop:server:billedcitizen", bill.playerid, bill.billprice, bill.billtype)
        end
    end
end)