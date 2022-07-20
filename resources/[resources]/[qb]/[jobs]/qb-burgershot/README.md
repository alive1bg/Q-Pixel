# BurgerShotJob-for-qb 
# Author 'Dankbudbaker#2880'
 
Simple job using bt-target to build burgers, fill sodas, fry the fries, Sign On/Off work, Drivethru Tray and Front counter Tray for the BurgerShot MLO and stashes for stuff.

Requirements :

Qb Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/qbcore-framework/PolyZone

Qb target - https://github.com/BerkieBb/qb-target

Qb menu https://github.com/qbcore-framework/qb-menu

Qb input https://github.com/qbcore-framework/qb-input

qb mangement https://github.com/qbcore-framework/qb-mangement

Dp emotes https://github.com/qbcore-framework/dpemotes

Installation : 

1 - Drag & drop the qb-burgershot-job

2 - You need these to add the items into qb-core shared.lua

	--Burger Shot
	['burger-bleeder'] 				 = {['name'] = 'burger-bleeder', 			 	['label'] = 'Bleeder', 						['weight'] = 600, 		['type'] = 'item', 		['image'] = 'burger-bleeder.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'What a bloody burger'},
	['burger-moneyshot'] 			 = {['name'] = 'burger-moneyshot', 			 	['label'] = 'Money-Shot', 					['weight'] = 600, 		['type'] = 'item', 		['image'] = 'burger-moneyshot.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Is there money in this?'},
	['burger-torpedo'] 				 = {['name'] = 'burger-torpedo', 			 	['label'] = 'Torpedo', 						['weight'] = 600, 		['type'] = 'item', 		['image'] = 'burger-torpedo.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Doesn\'t this belong in a submarine.'},
	['burger-heartstopper'] 		 = {['name'] = 'burger-heartstopper', 			['label'] = 'Heart-Stopper', 				['weight'] = 600, 		['type'] = 'item', 		['image'] = 'burger-heartstopper.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'My heart can\'t take this.'},
	['burger-meatfree'] 		 	 = {['name'] = 'burger-meatfree', 				['label'] = 'MeatFree', 					['weight'] = 525, 		['type'] = 'item', 		['image'] = 'burger-meatfree.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Sates Hunger.'},
	['burger-softdrink'] 			 = {['name'] = 'burger-softdrink', 				['label'] = 'Soft Drink', 					['weight'] = 425, 		['type'] = 'item', 		['image'] = 'burger-softdrink.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Have a nice sip.'},
	['burger-coffee'] 			     = {['name'] = 'burger-coffee', 				['label'] = 'Hot Coffee',     				['weight'] = 325, 		['type'] = 'item', 		['image'] = 'burger-coffee.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Beware is hot!'},
	['burger-milkshake'] 		     = {['name'] = 'burger-milkshake', 				['label'] = 'Vanilla Milkshake', 			['weight'] = 325, 		['type'] = 'item', 		['image'] = 'burger-milkshake.png',     ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Beware is freezing!'},
	['burger-fries'] 				 = {['name'] = 'burger-fries', 			 	  	['label'] = 'Large Fries', 					['weight'] = 325, 		['type'] = 'item', 		['image'] = 'burger-fries.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Fries or chips? #ComeAtMe'},
	['burger-bun'] 				 	 = {['name'] = 'burger-bun', 			 	  	['label'] = 'Buns', 						['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-bun.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Nice and warm and crunchy.'},
	['burger-meat'] 				 = {['name'] = 'burger-meat', 			 	  	['label'] = 'Cooked Meat', 					['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-meat.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Hmm nice juicy piece of meat.'},
	['burger-lettuce'] 				 = {['name'] = 'burger-lettuce', 			 	['label'] = 'Lettuce', 						['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-lettuce.png', 	    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'This looks like a peice of lettuce.'},
	['burger-raw'] 				 	 = {['name'] = 'burger-raw', 			 		['label'] = 'Raw Meat', 					['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-raw.png', 	        ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'You can\'t eat this.'},
	['burger-potato'] 				 = {['name'] = 'burger-potato', 			 	['label'] = 'Raw Potatoes', 				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-potato.png', 	    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Nice peeling.'},
	['burger-ticket'] 				 = {['name'] = 'burger-ticket', 			 	['label'] = 'Receipt', 	     				['weight'] = 150, 		['type'] = 'item', 		['image'] = 'burger-ticket.png', 	    ['unique'] = false,   	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Here is an order that needs to be made quickly!'},
	['burgerbox'] 				 	 = {['name'] = 'burgerbox', 			 	    ['label'] = 'Burger Box', 	     	    	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'burger-box.png', 	        ['unique'] = true,   	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'There are nice things in here.'},
	['burger-pallet'] 				 = {['name'] = 'burger-pallet', 			 	['label'] = 'Pallet of Ingredients', 		['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'burger-pallet.png', 	    ['unique'] = true,   	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'This box is filled with burgershot ingredients.'},
	['burger-cheese'] 				 = {['name'] = 'burger-cheese', 			 	['label'] = 'Cheese', 						['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-cheese.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Hmm a nice peice of cheese.'},
	['burger-bag'] 				     = {['name'] = 'burger-bag', 			 	    ['label'] = 'Burgershot Delivery Bag', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'burger-bag.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Customer\'s order for delivery.'},
	['burger-toy1'] 		 		 = {['name'] = 'burger-toy1', 					['label'] = 'Action Figure', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'action-figure.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'An Action Figure From the late 90\'s'},
	['burger-toy2'] 		 		 = {['name'] = 'burger-toy2', 					['label'] = 'Pink Teddy', 					['weight'] = 50, 		['type'] = 'item', 		['image'] = 'beaniebaby.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A Fluffy Pink Teddy from the Atic'},
	['burger-cyborg'] 		 		 = {['name'] = 'burger-cyborg', 				['label'] = 'Rare Cyborg Toy', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'burger-cyborg.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'An Cyborg Action Figure with a usb port'},
	['activated-cyborg'] 		 	 = {['name'] = 'activated-cyborg', 				['label'] = 'Rare Activated Cyborg Toy',	['weight'] = 50, 		['type'] = 'item', 		['image'] = 'activated-cyborg.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'An Activated Cyborg Action Figure with a usb port'},
	['burger-laptop'] 		 		 = {['name'] = 'burger-laptop', 				['label'] = 'Mini Laptop Toy', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'burger-laptop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Burgershot Mini Laptop Toy'},
	['burger-eggman'] 		 		 = {['name'] = 'burger-eggman', 			    ['label'] = 'Mr. Egg Man', 			    	['weight'] = 50, 		['type'] = 'item', 		['image'] = 'eggman.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Burgershots Mr. Egg Man with a usb port'},
	['burger-usb'] 		 		     = {['name'] = 'burger-usb', 					['label'] = 'Burgershot Usb Drive', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'burger-usb.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A Burgershot Branded Usb Drive'},
	['heartstopper-meal'] 		 	 = {['name'] = 'heartstopper-meal', 			['label'] = 'Heart-Stopper Meal', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'heartstopper-meal.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['moneyshot-meal'] 		 	 	 = {['name'] = 'moneyshot-meal', 				['label'] = 'Money-Shot Meal', 				['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'moneyshot-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['torpedo-meal'] 		 	 	 = {['name'] = 'torpedo-meal', 					['label'] = 'Torpedo Meal', 				['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'torpedo-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['meatfree-meal'] 		 	 	 = {['name'] = 'meatfree-meal', 				['label'] = 'Meat Free Meal', 				['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'meatfree-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['bleeder-meal'] 		 	 	 = {['name'] = 'bleeder-meal', 					['label'] = 'Bleeder Meal', 				['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'bleeder-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['heartstopper-meal-shake'] 	 = {['name'] = 'heartstopper-meal-shake', 		['label'] = 'Heart-Stopper Shake Meal', 	['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'heartstopper-meal.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['moneyshot-meal-shake'] 		 = {['name'] = 'moneyshot-meal-shake', 			['label'] = 'Money-Shot Shake Meal', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'moneyshot-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['torpedo-meal-shake'] 		 	 = {['name'] = 'torpedo-meal-shake', 			['label'] = 'Torpedo Shake Meal', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'torpedo-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['meatfree-meal-shake'] 		 = {['name'] = 'meatfree-meal-shake', 			['label'] = 'Meat Free Shake Meal', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'meatfree-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['bleeder-meal-shake'] 		 	 = {['name'] = 'bleeder-meal-shake', 			['label'] = 'Bleeder Shake Meal', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'bleeder-meal.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An Amazing Meal with a chance of a toy.'},
	['burger-milk'] 				 = {['name'] = 'burger-milk', 			 	  	['label'] = '2% White Milk', 				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-milk.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Hmm nice fresh milk. I hope you keep this cold'},
	['burger-cream'] 				 = {['name'] = 'burger-cream', 			 		['label'] = 'IceCream Cream', 				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-cream.png', 	    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'IceCream Cream Mixture.'},
	['burger-syrup'] 				 = {['name'] = 'burger-syrup', 			 		['label'] = 'High Fructose Syrup', 			['weight'] = 125, 		['type'] = 'item', 		['image'] = 'burger-syrup.png', 	    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Burgershot High Fructose Syrup.'},
	['burger-icecream']              = {['name'] = 'burger-icecream',               ['label'] = 'Ice Cream',                 	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'bsicecream.png',           ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ice Cream.'},
    ['burger-donut']                 = {['name'] = 'burger-donut',                         ['label'] = 'Strawberry Sprinkles Donut',                     	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'donut.png',             	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A delicious donut!'},
	['burger-icecreamcone']          = {['name'] = 'burger-icecreamcone',           ['label'] = 'Ice Cream Cone',       		['weight'] = 100,     	['type'] = 'item',      ['image'] = 'icecreamcone.png',         ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ice Cream.'},
	['burger-donutchoc']                 = {['name'] = 'burger-donutchoc',                         ['label'] = 'Chocolate Glaze Donut',                     	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'donutchoc.png',             	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A delicious donut!'},
	['burger-donutcherry']                 = {['name'] = 'burger-donutcherry',                         ['label'] = 'Cherry Glaze Donut',                     	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'donutcherry.png',             	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A delicious donut!'},
	['burger-donutlemon']                 = {['name'] = 'burger-donutlemon',                         ['label'] = 'Lemon Glaze Donut',                     	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'donutlemon.png',             	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A delicious donut!'},
	['burger-donutglaze']                 = {['name'] = 'burger-donutglaze',                         ['label'] = 'Glaze Donut',                     	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'donutglazed.png',             	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A delicious donut!'},
	['burger-donutglaze']                 = {['name'] = 'burger-donutglaze',                         ['label'] = 'Glaze Donut',                     	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'donutglazed.png',             	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A delicious donut!'},
	['slicedonion']             = {['name'] = 'slicedonion',              ['label'] = 'Sliced Onion',         ['weight'] = 1000,    ['type'] = 'item',    ['image'] = 'slicedonion.png',       ['unique'] = false,   ['useable'] = false,   ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A slice of cream pie!'},
	['burger-creampie']             = {['name'] = 'burger-creampie',              ['label'] = 'Slice of Cream Pie',         ['weight'] = 1000,    ['type'] = 'item',    ['image'] = 'creampie.png',       ['unique'] = false,   ['useable'] = true,   ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Tasty onion rings!'},
	['burger-chickennuggets']             = {['name'] = 'burger-chickennuggets',              ['label'] = 'Chicken Nuggets',         ['weight'] = 2500,    ['type'] = 'item',    ['image'] = 'chickennuggets.png',       ['unique'] = false,   ['useable'] = true,   ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Tasty Chicken Nuggets!'},
	['burger-onionrings']             = {['name'] = 'burger-onionrings',              ['label'] = 'Onion Rings',         ['weight'] = 2500,    ['type'] = 'item',    ['image'] = 'onionrings.png',       ['unique'] = false,   ['useable'] = true,   ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Tasty Onion Rings!'},
	['frozennuggets']             = {['name'] = 'frozennuggets',              ['label'] = 'Frozen Chicken Nuggets',         ['weight'] = 1000,    ['type'] = 'item',    ['image'] = 'frozennuggets.png',       ['unique'] = false,   ['useable'] = false,   ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Frozen Chicken Nuggets!'},
	

You need these to add the the job into qb-core shared.lua

    ['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 175
			},
			['1'] = {
				name = 'Crew Member',
				payment = 185
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 195
			},
			['3'] = {
				name = 'Manager',
				payment = 205
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 215
			},
		},
	},



3 - You need to make the items consumables in qb-smallresources/server/Consumables.lua

QBCore.Functions.CreateUseableItem("burger-icecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("burger-donut", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Donut", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-donutchoc", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Donut", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-donutcherry", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Donut", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-donutlemon", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Donut", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-donutglaze", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Donut", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-creampie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Donut", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-chickennuggets", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-onionrings", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-fries", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Fries", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-meatfree", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-bleeder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-moneyshot", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-torpedo", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-softdrink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkSoda", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-coffee", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Coffee", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-milkshake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkSoda", source, item.name)
    end
end)

3 - You need to make the items consumables in qb-smallresources/client/Consumables.lua

RRegisterNetEvent("consumables:client:Fries", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"fries"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
 --       TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
        TriggerServerEvent("QBCore:Server:AddItem", itemName, 1)
    end)
end)

RegisterNetEvent("consumables:client:Donut", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
  --      TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end, function() -- Cancel
        TriggerServerEvent("QBCore:Server:AddItem", itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:DrinkSoda", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
 --       TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end, function() -- Cancel
        TriggerServerEvent("QBCore:Server:AddItem", itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:DrinkCoffee", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking coffee..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
--        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end, function() -- Cancel
        TriggerServerEvent("QBCore:Server:AddItem", itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

4 - You need add these to consumables in qb-smallresources/config.lua

     --burgershot
    ["burger-bleeder"] = math.random(34, 54),
    ["burger-moneyshot"] = math.random(37, 56),
    ["burger-heartstopper"] = math.random(45, 65),
    ["burger-meatfree"] = math.random(30, 50),
    ["burger-torpedo"] = math.random(35, 52),
    ["burger-fries"] = math.random(15, 25),
    ["burger-chickennuggets"] = math.random(15, 25),
    ["burger-onionrings"] = math.random(15, 25),
    ["burger-icecream"] = math.random(7,10),
    ["burger-donut"] = math.random(6, 10),
    ["burger-donutchoc"] = math.random(6, 10),
    ["burger-donutcherry"] = math.random(6, 10),
    ["burger-donutlemon"] = math.random(6, 10),
    ["burger-donutglaze"] = math.random(6, 10),
    ["burger-creampie"] = math.random(6, 10),


5- NOTE I use the burgershot mlo with drivethru and crew quarters and bosses office. if you use a diffrent mlo you will need to change the location aka the coords (vector3) to make it match up with with your mlo... You need add these to your config.lua under config.boxzones using berkieb's qb-target (you will have to change the locations based on your mlo and put it where it works for you, as i use a custom made mlo for myself)

    ["BurgershotDuty"] = {
    name = "BurgershotDuty",
    coords = vector3(-1191.48, -900.53, 14.25),
    length = 1.1,
    width = 0.3,
    heading = 212.0,
    debugPoly = false,
    minZ = 14.25,
    maxZ = 15.33,
    options = {
        {
            type = "client",
            targeticon = 'fas fa-eye', 
            event = "qb-burgershotjob:DutyB",
            icon = "far fa-clipboard",
            label = "Clock In/Out",
            job = "burgershot",
        }
    },
    distance = 3.0
    },
    ["BurgerShotJob"] = {
        name = "BurgerShotJob",
        coords = vector3(-1196.64, -904.80, 13.04),
        length = 0.8,
        width = 2.5,
        heading = 302,
        debugPoly = false,
        minZ = 13.04,
        maxZ = 14.50,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:startjob",
                icon = "far fa-clipboard",
                label = "Start Job",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["BurgersCounter"] = {
        name = "BurgersCounter",
        coords =vector3(-1198.558, -897.416, 13.830132),
        length = 0.9,
        width = 1,
        heading = 125,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotmenu:burgershotmainmanu",
                icon = "fas fa-hamburger",
                label = "Burgershot Burger Menu",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["BurgershotWashHands"] = {
        name = "BurgershotWasHands",
        coords = vector3(-1200.291, -901.0861, 13.975964),
        length = 0.8,
        width = 0.7,
        heading = 123.5,
        debugPoly = false,
        minZ = 13.53,
        maxZ = 14.29,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:washHands",
                icon = "fas fa-hand-holding-water",
                label = "Wash your Hands!",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["SodaFountain"] = {
        name = "SodaFountain",
        coords = vector3(-1200.03, -895.47, 14.74),
        length = 1.1,
        width = 2.1,
        heading = 125,
        debugPoly = false,
        minZ = 14.00,
        maxZ = 14.73,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotmenu:DrinkMenu",
                icon = "fas fa-filter",
                label = "Burgershot Drink Menu",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["TomatoCounter"] = {
        name = "TomatoCounter",
        coords = vector3(-1198.447, -898.4566, 13.664762),
        length = 1.0,
        width = 1.1,
        heading = 29.83,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:makeTomato",
                icon = "fas fa-hamburger",
                label = "Cut Tomatoes",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:makeOnions",
                icon = "fas fa-hamburger",
                label = "Cut Onions",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["Fries"] = {
        name = "Fries",
        coords = vector3(-1202.03, -898.62, 13.03),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareFries",
                icon = "fas fa-box",
                label = "Make Fries",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareOnionRings",
                icon = "fas fa-box",
                label = "Make Onion Rings",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareChickenNuggets",
                icon = "fas fa-box",
                label = "Make Chicken Nuggets",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["MeatGrill"] = {
        name = "MeatGrill",
        coords = vector3(-1202.83, -897.28, 13.98),
        length = 0.8,
        width = 1.45,
        heading = 304.5,
        debugPoly = false,
        minZ = 13.99,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:BakeMeat",
                icon = "fas fa-box",
                label = "Grill Raw Meat",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["DriveThruWindow"] = {
        name = "DriveThruWindow",
        coords = vector3(-1193.82, -906.99, 12.79),
        length = 1,
        width = 2,
        heading = 171.50,
        debugPoly = false,
        minZ = 12.79,
        maxZ =  15.40,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:DriveThru",
                icon = "fas fa-box",
                label = "Drive Thru",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["FrontCounterTray1"] = {
        name = "FrontCounterTray1",
        coords = vector3(-1196.01, -891.45, 14.03),
        length = 0.5,
        width = 0.5,
        heading = 122,
        debugPoly = false,
        minZ = 14.03,
        maxZ = 14.30,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Tray1",
                icon = "fas fa-box",
                label = "Tray 1",
            }
        },
        distance = 3.0
    },
    ["FrontCounterTray2"] = {
        name = "FrontCounterTray2",
        coords = vector3(-1194.67, -893.23, 14.03),
        length = 0.5,
        width = 0.5,
        heading = 122,
        debugPoly = false,
        minZ = 14.03,
        maxZ = 14.30,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Tray2",
                icon = "fas fa-box",
                label = "Tray 2",
            }
        },
        distance = 3.0
    },
    ["HotTrayStorage"] = {
        name = "HotTrayStorage",
        coords = vector3(-1197.56, -894.57, 13.00),
        length = 1,
        width = 4.5,
        heading = 304.5,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.87,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Storage",
                icon = "fas fa-box",
                label = "BurgerShot Storage",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["BurgerFridge"] = {
        name = "BurgerFridge",
        coords = vector3(-1196.63, -902.0, 13.05),
        length = 0.8,
        width = 1.55,
        heading = 32.5,
        debugPoly = false,
        minZ = 13.05,
        maxZ = 15.47,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:FoodStorage",
                icon = "fas fa-box",
                label = "BurgerShot Fridge",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["UnloadBurgeshotIngredients"] = {
        name = "UnloadBurgeshotIngredients",
        coords = vector3(-1204.985, -891.8149, 13.984722),
        length = 4,
        width = 4,
        heading = 214,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 15.49,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Unloadbox",
                icon = "fas fa-box",
                label = "Unload Ingredients",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["Icecream"] = {
        name = "Ice Cream",
        coords = vector3(-1193.029, -895.7907, 14.0616),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:icecream",
                icon = "fas fa-ice-cream",
                label = "Make Ice Cream",
                job = "burgershot",
            }
        },
        distance = 1.5
    },
    ["donut"] = {
        name = "Donut",
        coords = vector3(-1203.854, -895.6851, 14.44202),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:donut",
                icon = "fas fa-box",
                label = "Get a Donut",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:creampie",
                icon = "fas fa-box",
                label = "Get a Slice of Cream Pie",
                job = "burgershot",
            }
        },
        distance = 1.5
    },
    ["BSRegister1"] = {
        name = "BSRegister1",
        coords = vector3(-1195.27, -892.34, 13.98),
        length = 0.7,
        width = 0.7,
        heading = 90.5,
        debugPoly = false,
        minZ = 14.23,
        maxZ = 14.45,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
        distance = 3.0
    },
    ["BSRegister2"] = {
        name = "BSRegister2",
        coords = vector3(-1194.27, -893.87, 14.06),
        length = 0.7,
        width = 0.7,
        heading = 90.5,
        debugPoly = false,
        minZ = 14.23,
        maxZ = 14.45,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
        ["vinnysWarehouse"] = {
            name = "vinnysWarehouse",
            coords = vector3(858.65527, -3202.554, 5.994996),
            length = 2.5,
            width = 1.1,
            heading = 93.5,
            debugPoly = false,
            minZ = 5.0,
            maxZ = 7.29,
            options = {
                --pizza this
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-pizzathis:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "pizzathis",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-uwujob:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "uwu",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-bahama:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "bahama",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-burgershotjob:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "burgershot",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-pearls:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "pearls",
                },
            },
            distance = 3.0
        },

	
You need add these to your config.lua under config.targetmodels using berkieb's bt-target (if you use different you will have to format and put it where it works for you.)	

	["BurgershotGarage"] = {
		models = {
		    `csb_talcc`,
		},
		options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
            	event = "qb-burgershotmenu:menu",
                icon = "fas fa-car",
				label = "BurgerShot Garage",
                job = "burgershot",
                canInteract  = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                    local dist = #(GetEntityCoords(PlayerPedId()) - vector3(-1177.112, -892.277, 13.909599))
                    if dist > 6 then
                        return false  -- This will return false if the entity interacted with is a player and otherwise returns true
                    elseif dist < 7 then 
                        return true 
                    end
                end,
            },
		},
		distance = 3.0
	},



5 - add the pictures included to your inventory as well as the sounds to interact-sound.


6 - under /html/js/lawyers.js in qb-phone

Under this: 
	SetupLawyers = function(data) {
        $(".lawyers-list").html("");
        var lawyers = [];
        var realestate = [];
        var hayes = [];
        var taxi = [];
        var ambulance = [];
		(addhere)

add this where it says (addhere) above:
		
		var burgershot = []; 

then under this:

			if (lawyer.typejob == "realestate") {
                realestate.push(lawyer);
            }

add this: 

			if (lawyer.typejob == "burgershot") {
                burgershot.push(lawyer);
            }

			


Then under this:
	
		$(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(255, 0, 0);">Ambulance (' + ambulance.length + ')</h1>');

        if (ambulance.length > 0) {
            $.each(ambulance, function(i, lawyer5) {
                var element = '<div class="lawyer-list" id="lawyerid5-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: rgb(255, 0, 0);">' + (lawyer5.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer5.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid5-" + i).data('LawyerData', lawyer5);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">There is no ems available.</div></div>'
            $(".lawyers-list").append(element);
        }


Add this :
		$(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(102, 0, 204);">Burgershot (' + burgershot.length + ')</h1>');

        if (burgershot.length > 0) {
            $.each(burgershot, function(i, lawyer6) {
                var element = '<div class="lawyer-list" id="lawyerid6-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: rgb(102, 0, 204);">' + (lawyer6.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer6.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid6-" + i).data('LawyerData', lawyer6);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">There are no employees available.</div></div>'
            $(".lawyers-list").append(element);
        }



Then under this: 

		$(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(255, 0, 0);">Ambulance (' + ambulance.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">There are no ambulance personnel a available.</div></div>'
        $(".lawyers-list").append(element);

add this:

		$(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(102, 0, 204);">Burgershot (' + burgershot.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">There are no delivery drivers available.</div></div>'
        $(".lawyers-list").append(element);



find this under qb-phone/server/main.lua

	QBCore.Functions.CreateCallback('qb-phone:server:GetCurrentLawyers', function(source, cb)
	    local Lawyers = {}
	    for k, v in pairs(QBCore.Functions.GetPlayers()) do
	        local Player = QBCore.Functions.GetPlayer(v)
	        if Player ~= nil then
	            if (Player.PlayerData.job.name == 'lawyer' or Player.PlayerData.job.name == 'realestate' or Player.PlayerData.job.name == 'mechanic' or Player.PlayerData.job.name == 'taxi' or Player.PlayerData.job.name == 'police' or Player.	PlayerData.job.name == 'ambulance') and Player.PlayerData.job.onduty then
	                table.insert(Lawyers, {
	                    name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
	                    phone = Player.PlayerData.charinfo.phone,
	                    typejob = Player.PlayerData.job.name,
	                })
	            end
	        end
	    end
	    cb(Lawyers)
	end)


Replace with this:

	QBCore.Functions.CreateCallback('qb-phone:server:GetCurrentLawyers', function(source, cb)
        local Lawyers = {}
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            local Player = QBCore.Functions.GetPlayer(v)
            if Player ~= nil then
                if (Player.PlayerData.job.name == "lawyer" or Player.PlayerData.job.name == "realestate" or
                    Player.PlayerData.job.name == "hayes" or Player.PlayerData.job.name == "taxi" or
                    Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "ambulance" or
                    Player.PlayerData.job.name == "burgershot" or Player.PlayerData.job.name == "pizzathis" or 
                    Player.PlayerData.job.name == "uwu" or Player.PlayerData.job.name == "bahama" or 
                    Player.PlayerData.job.name == "mechanic") and Player.PlayerData.job.onduty then
                    Lawyers[#Lawyers+1] = {
                        name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
                        phone = Player.PlayerData.charinfo.phone,
                        typejob = Player.PlayerData.job.name
                    }
                end
            end
        end
        cb(Lawyers)
    end)

8. add these to your dp emotes client/AnimationList.lua

    ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["fries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Eat", AnimationOptions =
   {
        Prop = "prop_food_bs_chips",
        PropBone = 18905,
        PropPlacement = {0.12, 0.028, 0.001, 10.0, 175.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},
   ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions =
   {
       Prop = 'prop_food_bs_juice02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

9. Add this to qb-management cl_config.lua

under Config.BossMenus = { add this 

    ['burgershot'] = {
        vector3(-1177.857, -895.3328, 13.984732),
    },

under Config.BossMenuZones = { add this 

    ['burgershot'] = {
        { coords = vector3(-1178.07, -896.11, 13.984732), length = 0.35, width = 0.45, heading = 351.0, minZ = 12.58, maxZ = 14.68 }, -- DONE
    },