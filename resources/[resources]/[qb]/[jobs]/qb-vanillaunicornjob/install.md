Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

Update v1.2.2:
	- Removed while loops from menu's to reduce lag
	- Changed item name from install.md being incorrect
		- "mint" was supposed to be "mintleaf"
	- Fixes Beers and Coffees not giving items at the end of progress bars

Update v1.2:
    - Treat this update as a new install.
    - Complete rewrite of the script
        - Now includes dynamic menu and crafting systems
        - Change items and their requirements in the config
		- Think of it as an example of a new framework for my scripts
    - Complete redo of the drinks menu
        - 10 New Cocktails
        - 10 New Ingredients
        - 4 New drinks
        - 3 new foods
    - Removed most food items as they were a admittedly a lazy duplicate of henhouse
        - Added 3 new food menu items
        - Sliders
        - Tacos
        - Tater-tots
    - Optimizations to Pole and Chair code
        - While loops now run at 50 instead of 7
        - Changes idle time from 0.03 to 0.01
    - Upped alcohol effects from 8 seconds max to 60 seconds max.
	
Update v1.1:
	- Payment systems removed/changed in favour of support for my free payment script jim-payments: https://github.com/jimathy/jim-payments#
		- Add this script to your server and payment systems will work as normal with extra features
		- This change removes events from client.lua and server.lua
	- Added item checkmarks to qb-menu's to show if you have the required items or not
		- This adds changes to client.lua
	- QoL Fixes
	- New items added
		- Added new drinks to fridge and beer tap
		
-------------------------------------------------------------------------------------------------

UPDATING THE SHARED

If you are updating a live server while people have some items in their inventories you need to leave in the old "removed" items
If not, skip adding these as there is a bigger batch of items to add

Just add these instead replacing the whole list of VU items:

	["cubasil"] 					= {["name"] = "cubasil",  	     			["label"] = "Cucumber Basil",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cubasil.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Hand full of Cucumber and Basil", ['hunger'] = math.random(40, 50) },
	["mintleaf"] 					= {["name"] = "mintleaf",  	     			["label"] = "Mint",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "mint.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Mint Leaves", ['hunger'] = math.random(40, 50) },
	["peach"] 						= {["name"] = "peach",  	     			["label"] = "Peach",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "peach.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A peach", ['hunger'] = math.random(40, 50) },
	["strawberry"] 					= {["name"] = "strawberry",  	     		["label"] = "Strawberries",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "strawberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Strawberries", ['hunger'] = math.random(40, 50) },
	["lemon"] 				 		= {["name"] = "lemon",  	     			["label"] = "Lemon",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "lemon.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Lemon." },

	["midori"] 						= {["name"] = "midori",  	     			["label"] = "Midori",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "midori.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Midori", ['thirst'] = math.random(40, 50) },
	["pinejuice"] 					= {["name"] = "pinejuice",  	     		["label"] = "Pineapple Juice",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "pinejuice.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Pineapple Juice", ['thirst'] = math.random(40, 50) },
	["prosecco"] 					= {["name"] = "prosecco",  	     			["label"] = "Prosecco",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "prosecco.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Prosecco", ['thirst'] = math.random(40, 50) },
	["tequila"] 					= {["name"] = "tequila",  	     			["label"] = "Tequila",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tequila.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Tequila", ['thirst'] = math.random(40, 50) },
	["triplsec"] 					= {["name"] = "triplsec",  	     			["label"] = "Triple Sec",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "triplesec.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true, ["combinable"] = nil,   ["description"] = "Triple Sec", ['thirst'] = math.random(40, 50) },

	--Cocktails
	["amarettosour"] 				= {["name"] = "amarettosour",  	     		["label"] = "Amaretto Sour",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "amarettosour.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Amaretto Sour", ['thirst'] = math.random(40, 50) },
	["bellini"] 					= {["name"] = "bellini",  	     			["label"] = "Bellini",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "bellini.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Bellini", ['thirst'] = math.random(40, 50) },
	["cosmopolitan"] 				= {["name"] = "cosmopolitan",  	     		["label"] = "Cosmopolitan",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "cosmopolitan.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cosmopolitan", ['thirst'] = math.random(40, 50) },
	["longisland"] 					= {["name"] = "longisland",  	     		["label"] = "Long Island Ice tea",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "longisland.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Long Island Ice Tea", ['thirst'] = math.random(40, 50) },
	["margarita"] 					= {["name"] = "margarita",  	     		["label"] = "Margarita",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "margarita.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Margarita", ['thirst'] = math.random(40, 50) },
	["pinacolada"] 					= {["name"] = "pinacolada",  	     		["label"] = "Pina Colada",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "pinacolada.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Pine Colada", ['thirst'] = math.random(40, 50) },
	["sangria"] 					= {["name"] = "sangria",  	     			["label"] = "Sangria",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sangria.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Sangria", ['thirst'] = math.random(40, 50) },
	["screwdriver"] 				= {["name"] = "screwdriver",  	     		["label"] = "Screwdriver",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "screwdriver.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Screwdriver", ['thirst'] = math.random(40, 50) },
	["strawdaquiri"] 				= {["name"] = "strawdaquiri",  	     		["label"] = "Strawberry Daquiri",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "strawdaquiri.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Strawberry Daquiri", ['thirst'] = math.random(40, 50) },
	["strawmargarita"] 				= {["name"] = "strawmargarita",  	     	["label"] = "Strawberry Margarita",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "strawmargarita.png",["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Starberry Margarita", ['thirst'] = math.random(40, 50) },

	["vusliders"] 				 	= {["name"] = "vusliders",  	     		["label"] = "Sliders",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sliders.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Sliders", ['hunger'] = math.random(40, 50) },
	["vutacos"] 				 	= {["name"] = "vutacos",  	     			["label"] = "Tacos",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tacos.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Tacos", ['hunger'] = math.random(40, 50) },
	["tots"] 				 		= {["name"] = "tots",  	     				["label"] = "Tits or Tots",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "tots.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Sexy Tots", ['hunger'] = math.random(40, 50) },

-------------------------------------------------------------------------------------------------

INSTALLATION

Add the item images to your inventory script

[qb] > qb-inventory > html > images

-------------------------------------------------------------------------------------------------

THESE GO IN YOUR SHARED.LUA IN qb-core:

Under the QBShared.Items = {

	--VANILLA UNICORN
	--Drink Ingredients
	["cubasil"] 					= {["name"] = "cubasil",  	     			["label"] = "Cucumber Basil",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cubasil.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Hand full of Cucumber and Basil", ['hunger'] = math.random(40, 50) },
	["mintleaf"] 					= {["name"] = "mintleaf",  	     				["label"] = "Mint",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "mint.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Mint Leaves", ['hunger'] = math.random(40, 50) },
	["peach"] 						= {["name"] = "peach",  	     			["label"] = "Peach",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "peach.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A peach", ['hunger'] = math.random(40, 50) },
	["strawberry"] 					= {["name"] = "strawberry",  	     		["label"] = "Strawberries",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "strawberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Strawberries", ['hunger'] = math.random(40, 50) },
	["orange"] 				 		= {["name"] = "orange",  	     			["label"] = "Orange",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "orange.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "An Orange." },
	["lime"] 				 		= {["name"] = "lime",  	     				["label"] = "Lime",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "lime.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Lime." },
	["lemon"] 				 		= {["name"] = "lemon",  	     			["label"] = "Lemon",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "lemon.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Lemon." },
	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Chocolate Bar", ['hunger'] = math.random(20, 30) },

	["midori"] 						= {["name"] = "midori",  	     			["label"] = "Midori",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "midori.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Midori", ['thirst'] = math.random(40, 50) },
	["pinejuice"] 					= {["name"] = "pinejuice",  	     		["label"] = "Pineapple Juice",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "pinejuice.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Pineapple Juice", ['thirst'] = math.random(40, 50) },
	["prosecco"] 					= {["name"] = "prosecco",  	     			["label"] = "Prosecco",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "prosecco.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Prosecco", ['thirst'] = math.random(40, 50) },
	["tequila"] 					= {["name"] = "tequila",  	     			["label"] = "Tequila",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tequila.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Tequila", ['thirst'] = math.random(40, 50) },
	["triplsec"] 					= {["name"] = "triplsec",  	     			["label"] = "Triple Sec",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "triplesec.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true, ["combinable"] = nil,   ["description"] = "Triple Sec", ['thirst'] = math.random(40, 50) },

	["cranberry"] 				 	= {["name"] = "cranberry",  	     		["label"] = "Cranberry Juice",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cranberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cranberry Juice", ['thirst'] = math.random(20, 30) },
	["gin"] 					 	= {["name"] = "gin",  	     				["label"] = "Gin",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "gin.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Gin", ['thirst'] = math.random(20, 30) },
	["rum"] 					 	= {["name"] = "rum",  	     				["label"] = "Rum",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "rum.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Rum", ['thirst'] = math.random(20, 30) },
	["amaretto"] 					= {["name"] = "amaretto",  	     			["label"] = "Amaretto",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "amaretto.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Amaretto", ['thirst'] = math.random(20, 30) },
	
	--Cocktails
	["amarettosour"] 				= {["name"] = "amarettosour",  	     		["label"] = "Amaretto Sour",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "amarettosour.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Amaretto Sour", ['thirst'] = math.random(40, 50) },
	["bellini"] 					= {["name"] = "bellini",  	     			["label"] = "Bellini",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "bellini.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Bellini", ['thirst'] = math.random(40, 50) },
	["cosmopolitan"] 				= {["name"] = "cosmopolitan",  	     		["label"] = "Cosmopolitan",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "cosmopolitan.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cosmopolitan", ['thirst'] = math.random(40, 50) },
	["longisland"] 					= {["name"] = "longisland",  	     		["label"] = "Long Island Ice tea",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "longisland.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Long Island Ice Tea", ['thirst'] = math.random(40, 50) },
	["margarita"] 					= {["name"] = "margarita",  	     		["label"] = "Margarita",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "margarita.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Margarita", ['thirst'] = math.random(40, 50) },
	["pinacolada"] 					= {["name"] = "pinacolada",  	     		["label"] = "Pina Colada",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "pinacolada.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Pine Colada", ['thirst'] = math.random(40, 50) },
	["sangria"] 					= {["name"] = "sangria",  	     			["label"] = "Sangria",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sangria.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Sangria", ['thirst'] = math.random(40, 50) },
	["screwdriver"] 				= {["name"] = "screwdriver",  	     		["label"] = "Screwdriver",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "screwdriver.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Screwdriver", ['thirst'] = math.random(40, 50) },
	["strawdaquiri"] 				= {["name"] = "strawdaquiri",  	     		["label"] = "Strawberry Daquiri",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "strawdaquiri.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Strawberry Daquiri", ['thirst'] = math.random(40, 50) },
	["strawmargarita"] 				= {["name"] = "strawmargarita",  	     	["label"] = "Strawberry Margarita",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "strawmargarita.png",["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Starberry Margarita", ['thirst'] = math.random(40, 50) },

	--BEERS
	["ambeer"] 						= {["name"] = "ambeer",  	    	 		["label"] = "AM Beer",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ambeer.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["dusche"] 						= {["name"] = "dusche",  	    	 		["label"] = "Dusche Gold",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "dusche.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["logger"] 						= {["name"] = "logger",  	    	 		["label"] = "Logger Beer",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "logger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser"] 					= {["name"] = "pisswasser",  	    	 	["label"] = "Pißwasser",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser1.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser2"] 				= {["name"] = "pisswasser2",  	    	 	["label"] = "Pißwasser Stout",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser2.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser3"] 				= {["name"] = "pisswasser3",  	    	 	["label"] = "Pißwasser Pale Ale",		["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser3.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	
	--SODA
	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

	["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	
	--Food
	["nplate"] 						= {["name"] = "nplate",  	     			["label"] = "Nachos Plate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "nplate.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A plate of nachos and cheese", ['hunger'] = math.random(40, 50) },
	["vusliders"] 				 	= {["name"] = "vusliders",  	     		["label"] = "Sliders",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sliders.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Sliders", ['hunger'] = math.random(40, 50) },
	["vutacos"] 				 	= {["name"] = "vutacos",  	     			["label"] = "Tacos",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tacos.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Tacos", ['hunger'] = math.random(40, 50) },
	["tots"] 				 		= {["name"] = "tots",  	     				["label"] = "Tits or Tots",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "tots.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Sexy Tots", ['hunger'] = math.random(40, 50) },	

	--Food Ingredients
	["meat"] 						= {["name"] = "meat",  	     				["label"] = "Meat",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "meat.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A slab of Meat", ['hunger'] = math.random(40, 50) },
	["nachos"] 						= {["name"] = "nachos",  	     			["label"] = "Nachos",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "nachos.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bag of Nachos", ['hunger'] = math.random(40, 50) },
	["lettuce"] 	 			 	= {["name"] = "lettuce",       				["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["cheddar"] 					= {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Food" },
	["potato"] 						= {["name"] = "potato",						["label"] = "Potatoes",					["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Food" },

Under the QBShared.Jobs = {

	['vanilla'] = {
		label = 'Vanilla Unicorn',
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

The payment system that is being used is my free script, jim-payments

This system supports receipts being handed out to wokers who are clocked in and working
They can then trade this in at the bank for rewards

Grab it at: https://github.com/jimathy/jim-payments

-------------------------------------------------------------------------------------------------

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)
SOME OF THESE REQUIRE THE CONTRACT DLC

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {

	--Jim-VanillaUnicorn
   ["whiskeyb"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Whiskey Bottle", AnimationOptions =
   {    Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.08, 0.0, 0.05, 240.0, -60.0}, 
	   EmoteMoving = true, EmoteLoop = true }}, 
   ["rumb"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Rum Bottle", AnimationOptions =
   {    Prop = "prop_rum_bottle", PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
	   EmoteMoving = true, EmoteLoop = true }}, 
   ["icream"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Irish Cream Bottle", AnimationOptions =
   {    Prop = "prop_bottle_brandy", PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
	   EmoteMoving = true, EmoteLoop = true }}, 
   ["ginb"] =  {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Gin Bottle", AnimationOptions =
   {    Prop = "prop_tequila_bottle", PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
	   EmoteMoving = true, EmoteLoop = true }}, 
   ["vodkab"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Vodka Bottle", AnimationOptions =
   {   Prop = 'prop_vodka_bottle', PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
	   EmoteMoving = true, EmoteLoop = true }},      
   ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
   {   Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
       EmoteLoop = true, EmoteMoving = true, }}, 
   ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
   {    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
   {    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
   {    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
   {    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
   {    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},  
   ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
   {    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
   {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
   {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
	

---------------------------------------------------------------------------------------------------

Within the config.lua of qb-bossmenu
This adds the boss menu location in the back office

	['vanilla'] = vector3(95.36, -1293.61, 29.64),

---------------------------------------------------------------------------------------------------


If you wish to add a Job Required Personal Garage to the side of the building, add this under JobGarages = {

	["vanilla"] = {
        label = "Vanilla Unicorn",
        takeVehicle = vector3(142.43, -1282.63, 29.33),
        spawnPoint = vector4(149.75, -1284.3, 29.0, 211.99),
        putVehicle = vector3(142.43, -1282.63, 29.33),
        job = "vanilla"
    },
	