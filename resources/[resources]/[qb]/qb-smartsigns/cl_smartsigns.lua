L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
    L0_2 = L0_2
    L0_2 = true
    if L0_2 then
        L0_2 = pairs
        L1_2 = config
        L1_2 = L1_2.signs
        L0_2, L1_2, L2_2 = L0_2(L1_2)
        for L3_2, L4_2 in L0_2, L1_2, L2_2 do
            L5_2 = config
            L5_2 = L5_2.signs
            L5_2 = L5_2[L3_2]
            L5_2.loaded = false
            L5_2 = config
            L5_2 = L5_2.signs
            L5_2 = L5_2[L3_2]
            L5_2.signProp = 0
            L5_2 = config
            L5_2 = L5_2.signs
            L5_2 = L5_2[L3_2]
            L6_2 = {}
            L7_2 = ""
            L8_2 = ""
            L9_2 = ""
            L6_2[1] = L7_2
            L6_2[2] = L8_2
            L6_2[3] = L9_2
            L5_2.text = L6_2
            L5_2 = config
            L5_2 = L5_2.signs
            L5_2 = L5_2[L3_2]
            L5_2 = L5_2.defaultText
            if L5_2 ~= nil then
                L5_2 = 1
                L6_2 = 3
                L7_2 = 1
                for L8_2 = L5_2, L6_2, L7_2 do
                    L9_2 = config
                    L9_2 = L9_2.signs
                    L9_2 = L9_2[L3_2]
                    L9_2 = L9_2.defaultText
                    L9_2 = L9_2[L8_2]
                    if L9_2 ~= nil then
                        L9_2 = string
                        L9_2 = L9_2.len
                        L10_2 = config
                        L10_2 = L10_2.signs
                        L10_2 = L10_2[L3_2]
                        L10_2 = L10_2.defaultText
                        L10_2 = L10_2[L8_2]
                        L9_2 = (L9_2(L10_2))
                        if L9_2 < 15 then
                            L9_2 = config
                            L9_2 = L9_2.signs
                            L9_2 = L9_2[L3_2]
                            L9_2 = L9_2.text
                            L10_2 = string
                            L10_2 = L10_2.lower
                            L11_2 = config
                            L11_2 = L11_2.signs
                            L11_2 = L11_2[L3_2]
                            L11_2 = L11_2.defaultText
                            L11_2 = L11_2[L8_2]
                            L10_2 = (L10_2(L11_2))
                            L9_2[L8_2] = L10_2
                            L9_2 = config
                            L9_2 = L9_2.main
                            L9_2 = L9_2.developerMode
                            if L9_2 then
                                L9_2 = print
                                L10_2 = "[Smart Signs] - Sign ID: "
                                L11_2 = L3_2
                                L12_2 = " Default Text Set: "
                                L13_2 = config
                                L13_2 = L13_2.signs
                                L13_2 = L13_2[L3_2]
                                L13_2 = L13_2.text
                                L13_2 = L13_2[L8_2]
                                L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
                                L9_2(L10_2)
                            end
                        end
                    else
                        L9_2 = config
                        L9_2 = L9_2.signs
                        L9_2 = L9_2[L3_2]
                        L9_2 = L9_2.text
                        L9_2[L8_2] = ""
                    end
                end
            end
            L5_2 = config
            L5_2 = L5_2.signs
            L5_2 = L5_2[L3_2]
            L6_2 = {}
            L5_2.textProps = L6_2
            L5_2 = config
            L5_2 = L5_2.signs
            L5_2 = L5_2[L3_2]
            L6_2 = {}
            L7_2 = {}
            L8_2 = {}
            L9_2 = {}
            L6_2[1] = L7_2
            L6_2[2] = L8_2
            L6_2[3] = L9_2
            L5_2.letters = L6_2
        end
        L0_2 = TriggerServerEvent
        L1_2 = "SmartSigns:requestDataServer"
        L0_2(L1_2)
        L0_2 = config
        L0_2 = L0_2.main
        L0_2 = L0_2.developerMode
        if L0_2 then
            L0_2 = print
            L1_2 = "[Smart Signs] - Requesting sign data from server"
            L0_2(L1_2)
        end
    end
    L0_2 = AddEventHandler
    L1_2 = "loadSign"
    function L2_2(A0_3)
        local L1_3,
            L2_3,
            L3_3,
            L4_3,
            L5_3,
            L6_3,
            L7_3,
            L8_3,
            L9_3,
            L10_3,
            L11_3,
            L12_3,
            L13_3,
            L14_3,
            L15_3,
            L16_3,
            L17_3,
            L18_3,
            L19_3,
            L20_3,
            L21_3,
            L22_3,
            L23_3,
            L24_3,
            L25_3
        A0_3 = A0_3
        L1_3 = true
        if L1_3 then
            L1_3 = config
            L1_3 = L1_3.signs
            L1_3 = L1_3[A0_3]
            L1_3.loaded = true
            L1_3 = config
            L1_3 = L1_3.main
            L1_3 = L1_3.developerMode
            if L1_3 then
                L1_3 = print
                L2_3 = "[Smart Signs] - Requesting model: "
                L3_3 = tostring
                L4_3 = config
                L4_3 = L4_3.main
                L4_3 = L4_3.signModelName
                L3_3 = (L3_3(L4_3))
                L2_3 = L2_3 .. L3_3
                L1_3(L2_3)
            end
            L1_3 = RequestModel
            L2_3 = config
            L2_3 = L2_3.main
            L2_3 = L2_3.signModelName
            L1_3(L2_3)
            while "SetModelAsNoLongerNeeded" do
                L1_3 = HasModelLoaded
                L2_3 = config
                L2_3 = L2_3.main
                L2_3 = L2_3.signModelName
                L1_3 = (L1_3(L2_3))
                if L1_3 then
                    break
                end
                L1_3 = Wait
                L2_3 = 0
                L1_3(L2_3)
            end
            L1_3 = config
            L1_3 = L1_3.signs
            L1_3 = L1_3[A0_3]
            L2_3 = CreateObject
            L3_3 = config
            L3_3 = L3_3.main
            L3_3 = L3_3.signModelName
            L4_3 = config
            L4_3 = L4_3.signs
            L4_3 = L4_3[A0_3]
            L4_3 = L4_3.sign
            L4_3 = L4_3[1]
            L5_3 = false
            L6_3 = true
            L7_3 = true
            L2_3 = (L2_3(L3_3, L4_3, L5_3, L6_3, L7_3))
            L1_3.signProp = L2_3
            while true do
                L1_3 = DoesEntityExist
                L2_3 = config
                L2_3 = L2_3.signs
                L2_3 = L2_3[A0_3]
                L2_3 = L2_3.signProp
                L1_3 = (L1_3(L2_3))
                if L1_3 then
                    break
                end
                L1_3 = Wait
                L2_3 = 0
                L1_3(L2_3)
            end
            L1_3 = config
            L1_3 = L1_3.main
            L1_3 = L1_3.developerMode
            if L1_3 then
                L1_3 = print
                L2_3 = "[Smart Signs] - Creating sign object ID: "
                L3_3 = config
                L3_3 = L3_3.signs
                L3_3 = L3_3[A0_3]
                L3_3 = L3_3.signProp
                L2_3 = L2_3 .. L3_3
                L1_3(L2_3)
            end
            L1_3 = FreezeEntityPosition
            L2_3 = config
            L2_3 = L2_3.signs
            L2_3 = L2_3[A0_3]
            L2_3 = L2_3.signProp
            L3_3 = true
            L1_3(L2_3, L3_3)
            L1_3 = SetEntityCoords
            L2_3 = config
            L2_3 = L2_3.signs
            L2_3 = L2_3[A0_3]
            L2_3 = L2_3.signProp
            L3_3 = config
            L3_3 = L3_3.signs
            L3_3 = L3_3[A0_3]
            L3_3 = L3_3.sign
            L3_3 = L3_3[1]
            L3_3 = L3_3.x
            L4_3 = config
            L4_3 = L4_3.main
            L4_3 = L4_3.signOffset
            L4_3 = L4_3[1]
            L3_3 = L3_3 + L4_3
            L4_3 = config
            L4_3 = L4_3.signs
            L4_3 = L4_3[A0_3]
            L4_3 = L4_3.sign
            L4_3 = L4_3[1]
            L4_3 = L4_3.y
            L5_3 = config
            L5_3 = L5_3.main
            L5_3 = L5_3.signOffset
            L5_3 = L5_3[2]
            L4_3 = L4_3 + L5_3
            L5_3 = config
            L5_3 = L5_3.signs
            L5_3 = L5_3[A0_3]
            L5_3 = L5_3.sign
            L5_3 = L5_3[1]
            L5_3 = L5_3.z
            L6_3 = config
            L6_3 = L6_3.main
            L6_3 = L6_3.signOffset
            L6_3 = L6_3[3]
            L5_3 = L5_3 + L6_3
            L6_3 = true
            L7_3 = true
            L8_3 = true
            L9_3 = false
            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
            L1_3 = SetEntityHeading
            L2_3 = config
            L2_3 = L2_3.signs
            L2_3 = L2_3[A0_3]
            L2_3 = L2_3.signProp
            L3_3 = config
            L3_3 = L3_3.signs
            L3_3 = L3_3[A0_3]
            L3_3 = L3_3.sign
            L3_3 = L3_3[2]
            L1_3(L2_3, L3_3)
            L1_3 = SetModelAsNoLongerNeeded
            L2_3 = config
            L2_3 = L2_3.main
            L2_3 = L2_3.signModelName
            L1_3(L2_3)
            L1_3 = config
            L1_3 = L1_3.main
            L1_3 = L1_3.developerMode
            if L1_3 then
                L1_3 = print
                L2_3 = "[Smart Signs] - Setting model: "
                L3_3 = tostring
                L4_3 = config
                L4_3 = L4_3.main
                L4_3 = L4_3.signModelName
                L3_3 = (L3_3(L4_3))
                L4_3 = " as no longer needed"
                L2_3 = L2_3 .. L3_3 .. L4_3
                L1_3(L2_3)
            end
            L1_3 = 1
            L2_3 = 3
            L3_3 = 1
            for L4_3 = L1_3, L2_3, L3_3 do
                L5_3 = config
                L5_3 = L5_3.signs
                L5_3 = L5_3[A0_3]
                L5_3 = L5_3.text
                L5_3 = L5_3[L4_3]
                if L5_3 ~= "" then
                    L5_3 = 1
                    L6_3 = config
                    L6_3 = L6_3.signs
                    L6_3 = L6_3[A0_3]
                    L6_3 = L6_3.text
                    L6_3 = L6_3[L4_3]
                    L6_3 = #L6_3
                    L7_3 = 1
                    for L8_3 = L5_3, L6_3, L7_3 do
                        L9_3 = config
                        L9_3 = L9_3.main
                        L9_3 = L9_3.developerMode
                        if L9_3 then
                            L9_3 = print
                            L10_3 = "[Smart Signs] - Creating line: "
                            L11_3 = L4_3
                            L12_3 = " Text: "
                            L13_3 = config
                            L13_3 = L13_3.signs
                            L13_3 = L13_3[A0_3]
                            L13_3 = L13_3.text
                            L13_3 = L13_3[L4_3]
                            L10_3 = L10_3 .. L11_3 .. L12_3 .. L13_3
                            L9_3(L10_3)
                        end
                        L9_3 = config
                        L9_3 = L9_3.signs
                        L9_3 = L9_3[A0_3]
                        L9_3 = L9_3.text
                        L9_3 = L9_3[L4_3]
                        L10_3 = L9_3
                        L9_3 = L9_3.sub
                        L11_3 = L8_3
                        L12_3 = L8_3
                        L9_3 = (L9_3(L10_3, L11_3, L12_3))
                        L10_3 = config
                        L10_3 = L10_3.letterModels
                        L10_3 = L10_3[L9_3]
                        if L10_3 ~= nil then
                            L10_3 = config
                            L10_3 = L10_3.main
                            L10_3 = L10_3.developerMode
                            if L10_3 then
                                L10_3 = print
                                L11_3 = "[Smart Signs] - Creating object for letter: "
                                L12_3 = L9_3
                                L11_3 = L11_3 .. L12_3
                                L10_3(L11_3)
                            end
                            L10_3 = RequestModel
                            L11_3 = config
                            L11_3 = L11_3.letterModels
                            L11_3 = L11_3[L9_3]
                            L10_3(L11_3)
                            while true do
                                L10_3 = HasModelLoaded
                                L11_3 = config
                                L11_3 = L11_3.letterModels
                                L11_3 = L11_3[L9_3]
                                L10_3 = (L10_3(L11_3))
                                if L10_3 then
                                    break
                                end
                                L10_3 = Wait
                                L11_3 = 0
                                L10_3(L11_3)
                            end
                            L10_3 = config
                            L10_3 = L10_3.signs
                            L10_3 = L10_3[A0_3]
                            L10_3 = L10_3.letters
                            L10_3 = L10_3[L4_3]
                            L11_3 = CreateObject
                            L12_3 = config
                            L12_3 = L12_3.letterModels
                            L12_3 = L12_3[L9_3]
                            L13_3 = config
                            L13_3 = L13_3.signs
                            L13_3 = L13_3[A0_3]
                            L13_3 = L13_3.sign
                            L13_3 = L13_3[1]
                            L14_3 = false
                            L15_3 = true
                            L16_3 = true
                            L11_3 = (L11_3(L12_3, L13_3, L14_3, L15_3, L16_3))
                            L10_3[L8_3] = L11_3
                            while true do
                                L10_3 = DoesEntityExist
                                L11_3 = config
                                L11_3 = L11_3.signs
                                L11_3 = L11_3[A0_3]
                                L11_3 = L11_3.letters
                                L11_3 = L11_3[L4_3]
                                L11_3 = L11_3[L8_3]
                                L10_3 = (L10_3(L11_3))
                                if L10_3 then
                                    break
                                end
                                L10_3 = Wait
                                L11_3 = 0
                                L10_3(L11_3)
                            end
                            L10_3 = config
                            L10_3 = L10_3.main
                            L10_3 = L10_3.developerMode
                            if L10_3 then
                                L10_3 = print
                                L11_3 = "[Smart Signs] - Object "
                                L12_3 = config
                                L12_3 = L12_3.signs
                                L12_3 = L12_3[A0_3]
                                L12_3 = L12_3.letters
                                L12_3 = L12_3[L4_3]
                                L12_3 = L12_3[L8_3]
                                L13_3 = " created for letter: "
                                L14_3 = L9_3
                                L11_3 = L11_3 .. L12_3 .. L13_3 .. L14_3
                                L10_3(L11_3)
                            end
                            L10_3 = FreezeEntityPosition
                            L11_3 = config
                            L11_3 = L11_3.signs
                            L11_3 = L11_3[A0_3]
                            L11_3 = L11_3.letters
                            L11_3 = L11_3[L4_3]
                            L11_3 = L11_3[L8_3]
                            L12_3 = true
                            L10_3(L11_3, L12_3)
                            L10_3 = SetEntityHeading
                            L11_3 = config
                            L11_3 = L11_3.signs
                            L11_3 = L11_3[A0_3]
                            L11_3 = L11_3.letters
                            L11_3 = L11_3[L4_3]
                            L11_3 = L11_3[L8_3]
                            L12_3 = config
                            L12_3 = L12_3.signs
                            L12_3 = L12_3[A0_3]
                            L12_3 = L12_3.sign
                            L12_3 = L12_3[2]
                            L10_3(L11_3, L12_3)
                            L10_3 = AttachEntityToEntity
                            L11_3 = config
                            L11_3 = L11_3.signs
                            L11_3 = L11_3[A0_3]
                            L11_3 = L11_3.letters
                            L11_3 = L11_3[L4_3]
                            L11_3 = L11_3[L8_3]
                            L12_3 = config
                            L12_3 = L12_3.signs
                            L12_3 = L12_3[A0_3]
                            L12_3 = L12_3.signProp
                            L13_3 = -1
                            L14_3 = config
                            L14_3 = L14_3.letterPositions
                            L14_3 = L14_3.mainLevel
                            L14_3 = L14_3[L8_3]
                            L14_3 = L14_3[1]
                            L15_3 = config
                            L15_3 = L15_3.letterPositions
                            L15_3 = L15_3.mainLevel
                            L15_3 = L15_3[L8_3]
                            L15_3 = L15_3[2]
                            L16_3 = config
                            L16_3 = L16_3.letterPositions
                            L16_3 = L16_3.mainLevel
                            L16_3 = L16_3[L8_3]
                            L16_3 = L16_3[3]
                            L17_3 = config
                            L17_3 = L17_3.letterPositions
                            L17_3 = L17_3.levelOffset
                            L18_3 = L4_3 - 1
                            L17_3 = L17_3 * L18_3
                            L16_3 = L16_3 - L17_3
                            L17_3 = 0
                            L18_3 = 0
                            L19_3 = 0
                            L20_3 = true
                            L21_3 = true
                            L22_3 = true
                            L23_3 = false
                            L24_3 = 1
                            L25_3 = true
                            L10_3(
                                L11_3,
                                L12_3,
                                L13_3,
                                L14_3,
                                L15_3,
                                L16_3,
                                L17_3,
                                L18_3,
                                L19_3,
                                L20_3,
                                L21_3,
                                L22_3,
                                L23_3,
                                L24_3,
                                L25_3
                            )
                            L10_3 = SetModelAsNoLongerNeeded
                            L11_3 = config
                            L11_3 = L11_3.letterModels
                            L11_3 = L11_3[L9_3]
                            L10_3(L11_3)
                        end
                    end
                end
            end
        end
    end
    L0_2(L1_2, L2_2)
    L0_2 = AddEventHandler
    L1_2 = "unloadSign"
    function L2_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
        A0_3 = A0_3
        L1_3 = true
        if L1_3 then
            L1_3 = config
            L1_3 = L1_3.signs
            L1_3 = L1_3[A0_3]
            L1_3.loaded = false
            L1_3 = config
            L1_3 = L1_3.main
            L1_3 = L1_3.developerMode
            if L1_3 then
                L1_3 = print
                L2_3 = "[Smart Signs] - Deleting Sign Prop: "
                L3_3 = config
                L3_3 = L3_3.signs
                L3_3 = L3_3[A0_3]
                L3_3 = L3_3.signProp
                L4_3 = " for Sign ID: "
                L5_3 = A0_3
                L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3
                L1_3(L2_3)
            end
            L1_3 = DoesEntityExist
            L2_3 = config
            L2_3 = L2_3.signs
            L2_3 = L2_3[A0_3]
            L2_3 = L2_3.signProp
            L1_3 = (L1_3(L2_3))
            if L1_3 then
                L1_3 = DeleteEntity
                L2_3 = config
                L2_3 = L2_3.signs
                L2_3 = L2_3[A0_3]
                L2_3 = L2_3.signProp
                L1_3(L2_3)
            end
            L1_3 = 1
            L2_3 = 3
            L3_3 = 1
            for L4_3 = L1_3, L2_3, L3_3 do
                L5_3 = 1
                L6_3 = config
                L6_3 = L6_3.signs
                L6_3 = L6_3[A0_3]
                L6_3 = L6_3.letters
                L6_3 = L6_3[L4_3]
                L6_3 = #L6_3
                L7_3 = 1
                for L8_3 = L5_3, L6_3, L7_3 do
                    L9_3 = DoesEntityExist
                    L10_3 = config
                    L10_3 = L10_3.signs
                    L10_3 = L10_3[A0_3]
                    L10_3 = L10_3.letters
                    L10_3 = L10_3[L4_3]
                    L10_3 = L10_3[L8_3]
                    L9_3 = (L9_3(L10_3))
                    if L9_3 then
                        L9_3 = DeleteEntity
                        L10_3 = config
                        L10_3 = L10_3.signs
                        L10_3 = L10_3[A0_3]
                        L10_3 = L10_3.letters
                        L10_3 = L10_3[L4_3]
                        L10_3 = L10_3[L8_3]
                        L9_3(L10_3)
                        L9_3 = config
                        L9_3 = L9_3.main
                        L9_3 = L9_3.developerMode
                        if L9_3 then
                            L9_3 = print
                            L10_3 = "[Smart Signs] - Deleting letter object: "
                            L11_3 = config
                            L11_3 = L11_3.signs
                            L11_3 = L11_3[A0_3]
                            L11_3 = L11_3.letters
                            L11_3 = L11_3[L4_3]
                            L11_3 = L11_3[L8_3]
                            L12_3 = " for Sign ID: "
                            L13_3 = A0_3
                            L10_3 = L10_3 .. L11_3 .. L12_3 .. L13_3
                            L9_3(L10_3)
                        end
                        while true do
                            L9_3 = DoesEntityExist
                            L10_3 = config
                            L10_3 = L10_3.signs
                            L10_3 = L10_3[A0_3]
                            L10_3 = L10_3.letters
                            L10_3 = L10_3[L4_3]
                            L10_3 = L10_3[L8_3]
                            L9_3 = (L9_3(L10_3))
                            if not L9_3 then
                                break
                            end
                            L9_3 = Wait
                            L10_3 = 0
                            L9_3(L10_3)
                        end
                    end
                end
            end
        end
    end
    L0_2(L1_2, L2_2)
    function L0_2(A0_3)
        local L1_3,
            L2_3,
            L3_3,
            L4_3,
            L5_3,
            L6_3,
            L7_3,
            L8_3,
            L9_3,
            L10_3,
            L11_3,
            L12_3,
            L13_3,
            L14_3,
            L15_3,
            L16_3,
            L17_3,
            L18_3,
            L19_3,
            L20_3,
            L21_3,
            L22_3,
            L23_3,
            L24_3,
            L25_3
        A0_3 = A0_3
        L1_3 = config
        L1_3 = L1_3.main
        L1_3 = L1_3.developerMode
        if L1_3 then
            L1_3 = print
            L2_3 = "[Smart Signs] - Reloading letters for Sign ID: "
            L3_3 = A0_3
            L2_3 = L2_3 .. L3_3
            L1_3(L2_3)
        end
        L1_3 = 1
        L2_3 = 3
        L3_3 = 1
        for L4_3 = L1_3, L2_3, L3_3 do
            L5_3 = config
            L5_3 = L5_3.signs
            L5_3 = L5_3[A0_3]
            L5_3 = L5_3.text
            L5_3 = L5_3[L4_3]
            if L5_3 ~= "" then
                L5_3 = 1
                L6_3 = config
                L6_3 = L6_3.signs
                L6_3 = L6_3[A0_3]
                L6_3 = L6_3.text
                L6_3 = L6_3[L4_3]
                L6_3 = #L6_3
                L7_3 = 1
                for L8_3 = L5_3, L6_3, L7_3 do
                    L9_3 = config
                    L9_3 = L9_3.main
                    L9_3 = L9_3.developerMode
                    if L9_3 then
                        L9_3 = print
                        L10_3 = "[Smart Signs] - Creating line: "
                        L11_3 = L4_3
                        L12_3 = " Text: "
                        L13_3 = config
                        L13_3 = L13_3.signs
                        L13_3 = L13_3[A0_3]
                        L13_3 = L13_3.text
                        L13_3 = L13_3[L4_3]
                        L10_3 = L10_3 .. L11_3 .. L12_3 .. L13_3
                        L9_3(L10_3)
                    end
                    L9_3 = config
                    L9_3 = L9_3.signs
                    L9_3 = L9_3[A0_3]
                    L9_3 = L9_3.text
                    L9_3 = L9_3[L4_3]
                    L10_3 = L9_3
                    L9_3 = L9_3.sub
                    L11_3 = L8_3
                    L12_3 = L8_3
                    L9_3 = (L9_3(L10_3, L11_3, L12_3))
                    L10_3 = config
                    L10_3 = L10_3.letterModels
                    L10_3 = L10_3[L9_3]
                    if L10_3 ~= nil then
                        L10_3 = RequestModel
                        L11_3 = config
                        L11_3 = L11_3.letterModels
                        L11_3 = L11_3[L9_3]
                        L10_3(L11_3)
                        while true do
                            L10_3 = HasModelLoaded
                            L11_3 = config
                            L11_3 = L11_3.letterModels
                            L11_3 = L11_3[L9_3]
                            L10_3 = (L10_3(L11_3))
                            if L10_3 then
                                break
                            end
                            L10_3 = Wait
                            L11_3 = 0
                            L10_3(L11_3)
                        end
                        L10_3 = config
                        L10_3 = L10_3.main
                        L10_3 = L10_3.developerMode
                        if L10_3 then
                            L10_3 = print
                            L11_3 = "[Smart Signs] - Creating object for letter: "
                            L12_3 = L9_3
                            L11_3 = L11_3 .. L12_3
                            L10_3(L11_3)
                        end
                        L10_3 = config
                        L10_3 = L10_3.signs
                        L10_3 = L10_3[A0_3]
                        L10_3 = L10_3.letters
                        L10_3 = L10_3[L4_3]
                        L11_3 = CreateObject
                        L12_3 = config
                        L12_3 = L12_3.letterModels
                        L12_3 = L12_3[L9_3]
                        L13_3 = config
                        L13_3 = L13_3.signs
                        L13_3 = L13_3[A0_3]
                        L13_3 = L13_3.sign
                        L13_3 = L13_3[1]
                        L14_3 = false
                        L15_3 = true
                        L16_3 = true
                        L11_3 = (L11_3(L12_3, L13_3, L14_3, L15_3, L16_3))
                        L10_3[L8_3] = L11_3
                        while true do
                            L10_3 = DoesEntityExist
                            L11_3 = config
                            L11_3 = L11_3.signs
                            L11_3 = L11_3[A0_3]
                            L11_3 = L11_3.letters
                            L11_3 = L11_3[L4_3]
                            L11_3 = L11_3[L8_3]
                            L10_3 = (L10_3(L11_3))
                            if L10_3 then
                                break
                            end
                            L10_3 = Wait
                            L11_3 = 0
                            L10_3(L11_3)
                        end
                        L10_3 = config
                        L10_3 = L10_3.main
                        L10_3 = L10_3.developerMode
                        if L10_3 then
                            L10_3 = print
                            L11_3 = "[Smart Signs] - Object "
                            L12_3 = config
                            L12_3 = L12_3.signs
                            L12_3 = L12_3[A0_3]
                            L12_3 = L12_3.letters
                            L12_3 = L12_3[L4_3]
                            L12_3 = L12_3[L8_3]
                            L13_3 = " created for letter: "
                            L14_3 = L9_3
                            L11_3 = L11_3 .. L12_3 .. L13_3 .. L14_3
                            L10_3(L11_3)
                        end
                        L10_3 = FreezeEntityPosition
                        L11_3 = config
                        L11_3 = L11_3.signs
                        L11_3 = L11_3[A0_3]
                        L11_3 = L11_3.letters
                        L11_3 = L11_3[L4_3]
                        L11_3 = L11_3[L8_3]
                        L12_3 = true
                        L10_3(L11_3, L12_3)
                        L10_3 = SetEntityHeading
                        L11_3 = config
                        L11_3 = L11_3.signs
                        L11_3 = L11_3[A0_3]
                        L11_3 = L11_3.letters
                        L11_3 = L11_3[L4_3]
                        L11_3 = L11_3[L8_3]
                        L12_3 = config
                        L12_3 = L12_3.signs
                        L12_3 = L12_3[A0_3]
                        L12_3 = L12_3.sign
                        L12_3 = L12_3[2]
                        L10_3(L11_3, L12_3)
                        L10_3 = AttachEntityToEntity
                        L11_3 = config
                        L11_3 = L11_3.signs
                        L11_3 = L11_3[A0_3]
                        L11_3 = L11_3.letters
                        L11_3 = L11_3[L4_3]
                        L11_3 = L11_3[L8_3]
                        L12_3 = config
                        L12_3 = L12_3.signs
                        L12_3 = L12_3[A0_3]
                        L12_3 = L12_3.signProp
                        L13_3 = -1
                        L14_3 = config
                        L14_3 = L14_3.letterPositions
                        L14_3 = L14_3.mainLevel
                        L14_3 = L14_3[L8_3]
                        L14_3 = L14_3[1]
                        L15_3 = config
                        L15_3 = L15_3.letterPositions
                        L15_3 = L15_3.mainLevel
                        L15_3 = L15_3[L8_3]
                        L15_3 = L15_3[2]
                        L16_3 = config
                        L16_3 = L16_3.letterPositions
                        L16_3 = L16_3.mainLevel
                        L16_3 = L16_3[L8_3]
                        L16_3 = L16_3[3]
                        L17_3 = config
                        L17_3 = L17_3.letterPositions
                        L17_3 = L17_3.levelOffset
                        L18_3 = L4_3 - 1
                        L17_3 = L17_3 * L18_3
                        L16_3 = L16_3 - L17_3
                        L17_3 = 0
                        L18_3 = 0
                        L19_3 = 0
                        L20_3 = true
                        L21_3 = true
                        L22_3 = true
                        L23_3 = false
                        L24_3 = 1
                        L25_3 = true
                        L10_3(
                            L11_3,
                            L12_3,
                            L13_3,
                            L14_3,
                            L15_3,
                            L16_3,
                            L17_3,
                            L18_3,
                            L19_3,
                            L20_3,
                            L21_3,
                            L22_3,
                            L23_3,
                            L24_3,
                            L25_3
                        )
                        L10_3 = SetModelAsNoLongerNeeded
                        L11_3 = config
                        L11_3 = L11_3.letterModels
                        L11_3 = L11_3[L9_3]
                        L10_3(L11_3)
                    else
                        L10_3 = config
                        L10_3 = L10_3.signs
                        L10_3 = L10_3[A0_3]
                        L10_3 = L10_3.letters
                        L10_3 = L10_3[L4_3]
                        L10_3[L8_3] = 0
                    end
                end
            end
        end
    end
    reloadLetters = L0_2
    function L0_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
        A0_3 = A0_3
        L1_3 = 1
        L2_3 = 3
        L3_3 = 1
        for L4_3 = L1_3, L2_3, L3_3 do
            L5_3 = 1
            L6_3 = config
            L6_3 = L6_3.signs
            L6_3 = L6_3[A0_3]
            L6_3 = L6_3.letters
            L6_3 = L6_3[L4_3]
            L6_3 = #L6_3
            L7_3 = 1
            for L8_3 = L5_3, L6_3, L7_3 do
                L9_3 = config
                L9_3 = L9_3.signs
                L9_3 = L9_3[A0_3]
                L9_3 = L9_3.letters
                L9_3 = L9_3[L4_3]
                L9_3 = L9_3[L8_3]
                if L9_3 ~= 0 then
                    L9_3 = DoesEntityExist
                    L10_3 = config
                    L10_3 = L10_3.signs
                    L10_3 = L10_3[A0_3]
                    L10_3 = L10_3.letters
                    L10_3 = L10_3[L4_3]
                    L10_3 = L10_3[L8_3]
                    L9_3 = (L9_3(L10_3))
                    if L9_3 then
                        L9_3 = DeleteEntity
                        L10_3 = config
                        L10_3 = L10_3.signs
                        L10_3 = L10_3[A0_3]
                        L10_3 = L10_3.letters
                        L10_3 = L10_3[L4_3]
                        L10_3 = L10_3[L8_3]
                        L9_3(L10_3)
                        L9_3 = config
                        L9_3 = L9_3.main
                        L9_3 = L9_3.developerMode
                        if L9_3 then
                            L9_3 = print
                            L10_3 = "[Smart Signs] - Deleting letter object: "
                            L11_3 = config
                            L11_3 = L11_3.signs
                            L11_3 = L11_3[A0_3]
                            L11_3 = L11_3.letters
                            L11_3 = L11_3[L4_3]
                            L11_3 = L11_3[L8_3]
                            L12_3 = " for Sign ID: "
                            L13_3 = A0_3
                            L10_3 = L10_3 .. L11_3 .. L12_3 .. L13_3
                            L9_3(L10_3)
                        end
                    end
                end
            end
        end
    end
    unloadLetters = L0_2
    L0_2 = RegisterNetEvent
    L1_2 = "SmartSigns:syncSignsClient"
    L0_2(L1_2)
    L0_2 = AddEventHandler
    L1_2 = "SmartSigns:syncSignsClient"
    function L2_2(A0_3, A1_3)
        local L2_3, L3_3, L4_3, L5_3, L6_3
        A0_3 = A0_3
        L2_3 = config
        L2_3 = L2_3.main
        L2_3 = L2_3.developerMode
        if L2_3 then
            L2_3 = print
            L3_3 = "[Smart Signs] - Sign ID: "
            L4_3 = A0_3
            L5_3 = " updated with new message"
            L3_3 = L3_3 .. L4_3 .. L5_3
            L2_3(L3_3)
        end
        L2_3 = config
        L2_3 = L2_3.signs
        L2_3 = L2_3[A0_3]
        L2_3 = L2_3.loaded
        if L2_3 then
            L2_3 = unloadLetters
            L3_3 = A0_3
            L2_3(L3_3)
            L2_3 = config
            L2_3 = L2_3.main
            L2_3 = L2_3.developerMode
            if L2_3 then
                L2_3 = print
                L3_3 = "[Smart Signs] - All letters are now unloaded for Sign ID: "
                L4_3 = A0_3
                L3_3 = L3_3 .. L4_3
                L2_3(L3_3)
            end
        end
        L2_3 = config
        L2_3 = L2_3.signs
        L2_3 = L2_3[A0_3]
        L3_3 = {}
        L4_3 = A1_3[1]
        L5_3 = A1_3[2]
        L6_3 = A1_3[3]
        L3_3[1] = L4_3
        L3_3[2] = L5_3
        L3_3[3] = L6_3
        L2_3.text = L3_3
        L2_3 = config
        L2_3 = L2_3.signs
        L2_3 = L2_3[A0_3]
        L2_3 = L2_3.loaded
        if L2_3 then
            L2_3 = reloadLetters
            L3_3 = A0_3
            L2_3(L3_3)
            L2_3 = config
            L2_3 = L2_3.main
            L2_3 = L2_3.developerMode
            if L2_3 then
                L2_3 = print
                L3_3 = "[Smart Signs] - All letters are now reloaded for Sign ID: "
                L4_3 = A0_3
                L3_3 = L3_3 .. L4_3
                L2_3(L3_3)
            end
        end
    end
    L0_2(L1_2, L2_2)
    L0_2 = RegisterNetEvent
    L1_2 = "SmartSigns:signDataClient"
    L0_2(L1_2)
    L0_2 = AddEventHandler
    L1_2 = "SmartSigns:signDataClient"
    function L2_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        A0_3 = A0_3
        L1_3 = config
        L1_3 = L1_3.main
        L1_3 = L1_3.developerMode
        if L1_3 then
            L1_3 = print
            L2_3 = "[Smart Signs] - Sign Data Received from Server"
            L1_3(L2_3)
        end
        L1_3 = pairs
        L2_3 = config
        L2_3 = L2_3.signs
        L1_3, L2_3, L3_3 = L1_3(L2_3)
        for L4_3, L5_3 in L1_3, L2_3, L3_3 do
            L6_3 = A0_3[L4_3]
            if L6_3 ~= nil then
                L6_3 = config
                L6_3 = L6_3.main
                L6_3 = L6_3.developerMode
                if L6_3 then
                    L6_3 = print
                    L7_3 = "[Smart Signs] - Sign Data Received for Sign ID: "
                    L8_3 = L4_3
                    L7_3 = L7_3 .. L8_3
                    L6_3(L7_3)
                end
                L6_3 = config
                L6_3 = L6_3.signs
                L6_3 = L6_3[L4_3]
                L7_3 = A0_3[L4_3]
                L6_3.text = L7_3
            end
        end
    end
    L0_2(L1_2, L2_2)
    L0_2 = AddEventHandler
    L1_2 = "onResourceStop"
    function L2_2(A0_3)
        local L1_3,
            L2_3,
            L3_3,
            L4_3,
            L5_3,
            L6_3,
            L7_3,
            L8_3,
            L9_3,
            L10_3,
            L11_3,
            L12_3,
            L13_3,
            L14_3,
            L15_3,
            L16_3,
            L17_3,
            L18_3,
            L19_3,
            L20_3
        A0_3 = A0_3
        L1_3 = GetCurrentResourceName
        L1_3 = (L1_3())
        if L1_3 == A0_3 then
            L1_3 = config
            L1_3 = L1_3.main
            L1_3 = L1_3.developerMode
            if L1_3 then
                L1_3 = print
                L2_3 = "[Smart Signs] - Resource stopped, running removal function"
                L1_3(L2_3)
            end
            L1_3 = pairs
            L2_3 = config
            L2_3 = L2_3.signs
            L1_3, L2_3, L3_3 = L1_3(L2_3)
            for L4_3, L5_3 in L1_3, L2_3, L3_3 do
                L6_3 = config
                L6_3 = L6_3.signs
                L6_3 = L6_3[L4_3]
                L6_3 = L6_3.signProp
                if L6_3 ~= nil then
                    L6_3 = DoesEntityExist
                    L7_3 = config
                    L7_3 = L7_3.signs
                    L7_3 = L7_3[L4_3]
                    L7_3 = L7_3.signProp
                    L6_3 = (L6_3(L7_3))
                    if L6_3 then
                        L6_3 = config
                        L6_3 = L6_3.main
                        L6_3 = L6_3.developerMode
                        if L6_3 then
                            L6_3 = print
                            L7_3 = "[Smart Signs] - Deleting Sign Prop: "
                            L8_3 = config
                            L8_3 = L8_3.signs
                            L8_3 = L8_3[L4_3]
                            L8_3 = L8_3.signProp
                            L9_3 = " for Sign ID: "
                            L10_3 = L4_3
                            L7_3 = L7_3 .. L8_3 .. L9_3 .. L10_3
                            L6_3(L7_3)
                        end
                        L6_3 = DeleteEntity
                        L7_3 = config
                        L7_3 = L7_3.signs
                        L7_3 = L7_3[L4_3]
                        L7_3 = L7_3.signProp
                        L6_3(L7_3)
                    end
                end
                L6_3 = 1
                L7_3 = 3
                L8_3 = 1
                for L9_3 = L6_3, L7_3, L8_3 do
                    L10_3 = 1
                    L11_3 = config
                    L11_3 = L11_3.signs
                    L11_3 = L11_3[L4_3]
                    L11_3 = L11_3.letters
                    L11_3 = L11_3[L9_3]
                    L11_3 = #L11_3
                    L12_3 = 1
                    for L13_3 = L10_3, L11_3, L12_3 do
                        L14_3 = config
                        L14_3 = L14_3.signs
                        L14_3 = L14_3[L4_3]
                        L14_3 = L14_3.letters
                        L14_3 = L14_3[L9_3]
                        L14_3 = L14_3[L13_3]
                        if L14_3 ~= nil then
                            L14_3 = DoesEntityExist
                            L15_3 = config
                            L15_3 = L15_3.signs
                            L15_3 = L15_3[L4_3]
                            L15_3 = L15_3.letters
                            L15_3 = L15_3[L9_3]
                            L15_3 = L15_3[L13_3]
                            L14_3 = (L14_3(L15_3))
                            if L14_3 then
                                L14_3 = DeleteEntity
                                L15_3 = config
                                L15_3 = L15_3.signs
                                L15_3 = L15_3[L4_3]
                                L15_3 = L15_3.letters
                                L15_3 = L15_3[L9_3]
                                L15_3 = L15_3[L13_3]
                                L14_3(L15_3)
                                L14_3 = config
                                L14_3 = L14_3.main
                                L14_3 = L14_3.developerMode
                                if L14_3 then
                                    L14_3 = print
                                    L15_3 = "[Smart Signs] - Deleting Letter Prop: "
                                    L16_3 = config
                                    L16_3 = L16_3.signs
                                    L16_3 = L16_3[L4_3]
                                    L16_3 = L16_3.letters
                                    L16_3 = L16_3[L9_3]
                                    L16_3 = L16_3[L13_3]
                                    L17_3 = " for Sign ID: "
                                    L18_3 = L4_3
                                    L19_3 = " Layer: "
                                    L20_3 = L9_3
                                    L15_3 = L15_3 .. L16_3 .. L17_3 .. L18_3 .. L19_3 .. L20_3
                                    L14_3(L15_3)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    L0_2(L1_2, L2_2)
end
L6_1(L7_1)