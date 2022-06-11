## Dependencies
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-input](https://github.com/qbcore-framework/qb-input)

## Features
* Simple Weed Dispensary Job
* Pick Weed To Craft Joints
* Craft Joints To Sell
* Payments

## Credits
* Thanks To Jim For Letting Me Use Images On qb-menu

## qb-core/shared0/items.lua

```
	["og_kush"] 					 = {["name"] = "og_kush", 			  	  		["label"] = "OG-Kush Joint", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "og-kush.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "OG-Kush Rolled Up"},
	["purple_haze"] 				 = {["name"] = "purple_haze", 			  	  	["label"] = "Purple-Haze Joint", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "purple-haze.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Purple-Haze Rolled Up"},
	["ak47"] 						 = {["name"] = "ak47", 			  	  		    ["label"] = "AK47 Joint", 				["weight"] = 50, 		["type"] = "item", 		["image"] = "ak47.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "AK47 Rolled Up"},
	["skunk"] 						 = {["name"] = "skunk", 			  	  		["label"] = "Skunk Joint", 				["weight"] = 50, 		["type"] = "item", 		["image"] = "skunk.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Skunk Rolled Up"},
	["white_widow"] 				 = {["name"] = "white_widow", 			  	  	["label"] = "White-Widow Joint", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "white-widow.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "White-Widow Rolled Up"},
	["amnesia"] 					 = {["name"] = "amnesia", 			  	  		["label"] = "Amnesia Joint", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "amnesia.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Amnesia Rolled Up"},

	["groundog_kush"] 				 = {["name"] = "groundog_kush", 			  	["label"] = "Ground OG-Kush", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "groundweed.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["groundpurple_haze"] 			 = {["name"] = "groundpurple_haze", 			["label"] = "Ground Purple-Haze", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "groundweed.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["groundak47"] 					 = {["name"] = "groundak47", 			  	  	["label"] = "Ground AK47", 				["weight"] = 50, 		["type"] = "item", 		["image"] = "groundweed.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["groundskunk"] 				 = {["name"] = "groundskunk", 			  	  	["label"] = "Ground Skunk", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "groundweed.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["groundwhite_widow"] 			 = {["name"] = "groundwhite_widow", 			["label"] = "Ground White-Widow", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "groundweed.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["groundamnesia"] 				 = {["name"] = "groundamnesia", 			  	["label"] = "Ground Amnesia", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "groundweed.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

	["weedgrinder"] 				 = {["name"] = "weedgrinder", 			  		["label"] = "Weed Grinder", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "weedgrinder.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["browniemix"] 				 	 = {["name"] = "browniemix", 			  		["label"] = "Brownie Mix", 				["weight"] = 50, 		["type"] = "item", 		["image"] = "browniemix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

	["og_kushbrownie"] 				 = {["name"] = "og_kushbrownie", 			  	["label"] = "OG-Kush Brownie", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "og_kushbrownie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["purple_hazebrownie"] 			 = {["name"] = "purple_hazebrownie", 			["label"] = "Purple-Haze Brownie", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "purple_hazebrownie.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["ak47brownie"] 				 = {["name"] = "ak47brownie", 			  		["label"] = "AK47 Brownie", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "ak47brownie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["skunkbrownie"] 				 = {["name"] = "skunkbrownie", 			  		["label"] = "Skunk Brownie", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "skunkbrownie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["white_widowbrownie"] 			 = {["name"] = "white_widowbrownie", 			["label"] = "White-Widow Brownie", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "white_widowbrownie.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["amnesiabrownie"] 				 = {["name"] = "amnesiabrownie", 			  	["label"] = "Amnesia Brownie", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "amnesiabrownie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

## qb-core/shared/jobs.lua

```
['weedshop'] = {
	label = 'Weed Dispensary',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = {
			name = 'Trainee',
			payment = 500
		},
		['1'] = {
			name = 'Employee',
			payment = 650
		},
		['2'] = {
			name = 'Sales Manager',
			payment = 850
		},
		['3'] = {
			name = 'Manager',
			payment = 1000
		},
		['4'] = {
			name = 'Boss',
			isboss = true,
			payment = 1500
		},
	},
},
```