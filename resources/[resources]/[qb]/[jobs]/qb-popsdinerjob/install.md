Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS


Update v1.1:
	- Optimzation update
		- Script now uses polyzones and better loops to lower idle times
		- Runs at 0.00ms idle
	- Inventory images added to qb-menu

-------------------------------------------------------------------------------------------------

INSTALLATION

Add the item images to your inventory script

[qb] > qb-inventory > html > images

-------------------------------------------------------------------------------------------------

THESE GO IN YOUR SHARED.LUA IN nchub:

If you use my other scripts always double check there aren't duplicates

Under the QBShared.Items = {
	--qb-Popsdiner
	["baconeggs"] 					= {["name"] = "baconeggs",  	    		["label"] = "Bacon and Eggs",			["weight"] = 100, 		["type"] = "item", 		["image"] = "baconeggs.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["bltsandwich"] 				= {["name"] = "bltsandwich",  	    		["label"] = "BLT Sandwich",				["weight"] = 100, 		["type"] = "item", 		["image"] = "bltsandwich.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["cheeseburger"] 				= {["name"] = "cheeseburger",  	    		["label"] = "Cheese Burger",			["weight"] = 100, 		["type"] = "item", 		["image"] = "cheeseburger.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["cheesesandwich"] 				= {["name"] = "cheesesandwich",  	    	["label"] = "Cheese Sandwich",			["weight"] = 100, 		["type"] = "item", 		["image"] = "cheesesandwich.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["eggsandwich"] 				= {["name"] = "eggsandwich",  	    		["label"] = "Eggs Sandwich",			["weight"] = 100, 		["type"] = "item", 		["image"] = "eggsandwich.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["grilledwrap"] 				= {["name"] = "grilledwrap",  	    		["label"] = "Grilled Wrap",				["weight"] = 100, 		["type"] = "item", 		["image"] = "grilledwrap.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["hamburger"] 					= {["name"] = "hamburger",  	    		["label"] = "Hamburger",				["weight"] = 100, 		["type"] = "item", 		["image"] = "hamburger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["hamcheesesandwich"] 			= {["name"] = "hamcheesesandwich",  	    ["label"] = "Ham and Cheese Sandwich",	["weight"] = 100, 		["type"] = "item", 		["image"] = "hamcheesesandwich.png",["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["hamsandwich"] 				= {["name"] = "hamsandwich",  	    		["label"] = "Ham Sandwich",				["weight"] = 100, 		["type"] = "item", 		["image"] = "hamsandwich.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["ranchwrap"] 					= {["name"] = "ranchwrap",  	    		["label"] = "Ranch Wrap",				["weight"] = 100, 		["type"] = "item", 		["image"] = "ranchwrap.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["sausageeggs"] 				= {["name"] = "sausageeggs",  	    		["label"] = "Sausage and Eggs",			["weight"] = 100, 		["type"] = "item", 		["image"] = "sausageeggs.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["steakburger"] 				= {["name"] = "steakburger",  	    		["label"] = "Steak Burger",				["weight"] = 100, 		["type"] = "item", 		["image"] = "steakburger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["toastbacon"] 					= {["name"] = "toastbacon",  	    		["label"] = "Bacon and Toast",			["weight"] = 100, 		["type"] = "item", 		["image"] = "toastbacon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["tunasandwich"] 				= {["name"] = "tunasandwich",  	    		["label"] = "Tuna Sandwich",			["weight"] = 100, 		["type"] = "item", 		["image"] = "tunasandwich.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["veggiewrap"] 					= {["name"] = "veggiewrap",  	    		["label"] = "Veggie Wrap",				["weight"] = 100, 		["type"] = "item", 		["image"] = "veggiewrap.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	
	["carrotcake"] 					= {["name"] = "carrotcake",  	    		["label"] = "Carrot Cake",				["weight"] = 100, 		["type"] = "item", 		["image"] = "carrotcake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["cheesecake"] 					= {["name"] = "cheesecake",  	    		["label"] = "Cheese Cake",				["weight"] = 100, 		["type"] = "item", 		["image"] = "cheesecake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["chocpudding"] 				= {["name"] = "chocpudding",  	    		["label"] = "Chocolate Pudding",		["weight"] = 100, 		["type"] = "item", 		["image"] = "chocpudding.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["jelly"] 						= {["name"] = "jelly",  	    			["label"] = "Jelly",					["weight"] = 100, 		["type"] = "item", 		["image"] = "jelly.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["popdonut"] 					= {["name"] = "popdonut",  	    			["label"] = "Donut",					["weight"] = 100, 		["type"] = "item", 		["image"] = "popdonut.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["popicecream"] 				= {["name"] = "popicecream",  	    		["label"] = "Ice Cream",				["weight"] = 100, 		["type"] = "item", 		["image"] = "popicecream.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },

	["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	
	--Ingredients
	["chickenbreast"] 				= {["name"] = "chickenbreast",  	    	["label"] = "Chicken Breast",			["weight"] = 100, 		["type"] = "item", 		["image"] = "chickenbreast.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["jimsausages"] 				= {["name"] = "jimsausages",  	    		["label"] = "Sausages",					["weight"] = 100, 		["type"] = "item", 		["image"] = "jimsausages.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["jimeggs"] 					= {["name"] = "jimeggs",  	    			["label"] = "Eggs",						["weight"] = 100, 		["type"] = "item", 		["image"] = "jimeggs.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["ham"] 						= {["name"] = "ham",  	     				["label"] = "Ham",						["weight"] = 100, 		["type"] = "item", 		["image"] = "ham.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["fish"] 						= {["name"] = "fish",  	     				["label"] = "CatFish",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "fish.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Catfish", ['hunger'] = math.random(40, 50) },
	["meat"] 						= {["name"] = "meat",  	     				["label"] = "Meat",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "meat.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A slab of Meat", ['hunger'] = math.random(40, 50) },
	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Chocolate Bar", ['hunger'] = math.random(20, 30) },
	["lettuce"] 	 			 	 = {["name"] = "lettuce",       			["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["cheddar"] 					 = {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Slice of Cheese"},

	--SODA
	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },


Under the QBShared.Jobs = {

	['popsdiner'] = {
		label = 'Pop\'s Diner',
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

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)
SOME OF THESE REQUIRE THE CONTRACT DLC

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {

	--qb-popsdiner
   ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
   {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
   {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
	
		
---------------------------------------------------------------------------------------------------


Within the config.lua of qb-bossmenu
This adds the boss menu location upstairs in the office

	['popsdiner'] = vector3(1590.57, 6457.95, 26.01),

---------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------

To give commission per sale compeleted to the person who sent the payment through the system
	
	- Go to [qb] > qb-phone > config.lua and add popsdiner to this table at the top.
	
		Config.BillingCommissions = { -- This is a percentage (0.10) == 10%
			mechanic = 0.10,
			popsdiner = 0.10
		}
		
---------------------------------------------------------------------------------------------------