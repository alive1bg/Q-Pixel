Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

Update v1.0.2:
	- Added config option for zones
		- zoneEable, enables or disables the chosen zone and its map blip
	- Added Debug messages to server.lua
		- helps..debug..any issues with the script
	- Missed chocolate completely from the list
		- Even the item check in client.lua was missing it.
	- Added more Custom Emotes
		- Didn't know there were acutal extra BM Coffee Props
		
-------------------------------------------------------------------------------------------------

INSTALLATION

Check the Config.lua for the settings you need to change


Config.Gabz = true enables Gabz Legion MLO features

Config.UncleJust = true enables UncleJust's Vinewood MLO features

-------------------------------------------------------------------------------------------------

Add the item images to your inventory script

[qb] > qb-inventory > html > images

-------------------------------------------------------------------------------------------------

THESE GO IN YOUR SHARED.LUA IN qb-core:

Under the QBShared.Items = {

	--qb-BeanMachine
	["beancoffee"] 					= {["name"] = "beancoffee",  	    		["label"] = "Coffe Beans",				["weight"] = 100, 		["type"] = "item", 		["image"] = "beancoffee.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["beandonut"] 					= {["name"] = "beandonut",  	    		["label"] = "Donut",					["weight"] = 100, 		["type"] = "item", 		["image"] = "popdonut.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["rhinohorn"] 					= {["name"] = "rhinohorn",  	    		["label"] = "Rhino Horn",				["weight"] = 100, 		["type"] = "item", 		["image"] = "rhinohorn.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["oystershell"] 				= {["name"] = "oystershell",  	    		["label"] = "Oyster Shell",				["weight"] = 100, 		["type"] = "item", 		["image"] = "oyster.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["watermelon"] 					= {["name"] = "watermelon",  	    		["label"] = "WaterMelon Slice",			["weight"] = 100, 		["type"] = "item", 		["image"] = "watermelon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30), ['thirst'] = math.random(20, 30) },

	["bigfruit"] 					= {["name"] = "bigfruit",  	    	 		["label"] = "The Big Fruit",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "bigfruit.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["highnoon"] 					= {["name"] = "highnoon",  	    	 		["label"] = "Highnoon",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "highnoon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["speedball"] 					= {["name"] = "speedball",  	    	 	["label"] = "The SpeedBall",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "speedball.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["gunkaccino"] 					= {["name"] = "gunkaccino",  	    	 	["label"] = "The Gunkaccino",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "gunkaccino.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["bratte"] 						= {["name"] = "bratte",  	    	 		["label"] = "The Bratte",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bratte.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["flusher"] 					= {["name"] = "flusher",  	    	 		["label"] = "The Flusher",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "flusher.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecocoffee"] 					= {["name"] = "ecocoffee",  	    	 	["label"] = "The Eco-ffee",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecoffee.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["caffeagra"] 					= {["name"] = "caffeagra",  	    	 	["label"] = "Caffeagra",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "caffeagra.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Chocolate Bar", ['hunger'] = math.random(20, 30) },
	["cheesecake"] 					= {["name"] = "cheesecake",  	    		["label"] = "Cheese Cake",				["weight"] = 100, 		["type"] = "item", 		["image"] = "cheesecake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["sugar"] 						= {["name"] = "sugar",  			     	["label"] = "Sugar",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "sugar.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["orange"] 				 		= {["name"] = "orange",  	     			["label"] = "Orange",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "orange.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "An Orange." },
	["milk"] 						= {["name"] = "milk",						["label"] = "Milk",						["weight"] = 300,		["type"] = "item",		["image"] = "burger-milk.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Carton of Milk", ['thirst'] = math.random(35, 54) },
	["chickenbreast"] 				= {["name"] = "chickenbreast",  	    	["label"] = "Chicken Breast",			["weight"] = 100, 		["type"] = "item", 		["image"] = "chickenbreast.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },

	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

Under the QBShared.Jobs = {

	['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},

-------------------------------------------------------------------------------------------------

The payment system that is being used is my free script, qb-payments

This system supports receipts being handed out to wokers who are clocked in and working
They can then trade this in at the bank for rewards


-------------------------------------------------------------------------------------------------

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {


	["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
	{ Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},   
	["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
	{ Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
	["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Crisps", AnimationOptions =
	{ Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
	   EmoteLoop = true, EmoteMoving = true, }}, 
	["bmcoffee1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee2", AnimationOptions =
	{ Prop = 'prop_fib_coffee', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
	   EmoteLoop = true, EmoteMoving = true, }},   
	["bmcoffee2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions =
	{ Prop = 'ng_proc_coffee_01a', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
	   EmoteLoop = true, EmoteMoving = true, }},
	["bmcoffee3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions =
	{ Prop = 'v_club_vu_coffeecup', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
	   EmoteLoop = true, EmoteMoving = true, }},
	["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions =
	{ Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    ["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions =
    { Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0},
       EmoteMoving = true, EmoteLoop = true, }},
	   
---------------------------------------------------------------------------------------------------

Within the config.lua of qb-bossmenu or qb-management:

ADD ONLY ONE, the bossmenu allows only ONE location per job. Adding multiple of the same job name simply uses the one at the bottom of the list.

This adds the boss menu location at clockin at Gabz Legion MLO:

	['beanmachine'] = vector3(126.62, -1035.76, 29.28),

This adds it to the clockin at UncleJust Vinewood MLO:

	['beanmachine'] = vector3(-635.41, 227.11, 82.35),

---------------------------------------------------------------------------------------------------