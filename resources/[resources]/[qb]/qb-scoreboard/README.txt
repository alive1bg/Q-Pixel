   _________   ________  ___                                              
  / __/  _/ | / / __/  |/  /                                              
 / _/_/ / | |/ / _// /|_/ /                                               
/_/ /___/ |___/___/_/  /_/                                                
                                                                          
   _______   __   ________  ____      _________  ___   ___  _____  _______
  / __/ _ | / /  / __/ __/ / __/___  /_  __/ _ \/ _ | / _ \/  _/ |/ / ___/
 _\ \/ __ |/ /__/ _/_\ \   > _/_ _/   / / / , _/ __ |/ // // //    / (_ / 
/___/_/ |_/____/___/___/  |_____/    /_/ /_/|_/_/ |_/____/___/_/|_/\___/ 
                                                     

JOIN MY DISCORD - http://discord.gg/5bskZZ7

==============================================================================================

INSTALL INSTRUCTIONS:                                                

1. Goto "esx_kashacters" > client > main.lua > Find the following Thread

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            Wait(500)

----------------------------------------------

THEN ADD THE FOLLOW INSIDE THE ABOVE THREAD:

TriggerServerEvent("qb-scoreboard:AddPlayer")

----------------------------------------------

IT SHOULD THEN LOOK LIKE THIS:

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            Wait(500)
	    TriggerServerEvent("qb-scoreboard:AddPlayer")
	    TriggerEvent("kashactersC:SetupCharacters")
            return -- break the loop
        end
    end
end)

OR IF YOU USE MY NOPIXEL KASHACTERS IT SHOULD LIKE THIS:

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            Wait(500)
	    TriggerServerEvent("qb-scoreboard:AddPlayer")
	    TriggerEvent("kashactersC:WelcomePage")
	    TriggerEvent("kashactersC:SetupCharacters")
            return -- break the loop
        end
    end
end)

----------------------------------------------

2. Thats it! Enjoy!