WIP its not Fully finished

Original Nitrous Script from qb-tunerchip with modifications

Purge System

Purge Flow Rate with different size of Purge Effect depends of Purge Flow Rate

When nitro or purge finished give you empty bottle which you can to refill

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Add item into shared/items.lua
```lua
['emptynitrous'] 				 	 = {['name'] = 'emptynitrous', 			  	  		['label'] = 'Empty Bottle', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'emptynitrous.png', 				['unique'] = true, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Empty bottle of nitrous. You have to Refil'},
```

Import nitrous.sql into your DataBase

Add image from inventory-image into your inventory script

Big Thanks to NotReload for helping me alot with function for saving in DataBase
