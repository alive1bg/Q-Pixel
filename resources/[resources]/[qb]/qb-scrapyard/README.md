# qb-scrapyard
Scrapyard For QB-Core edited by oosayeroo
I have added the ability to strip vehicles of parts and then turn them in for materials. Configurable location so you can put wherever you like.

# Credits
```
qb-core team
madryx for his script that gave me the idea for this
jimathy for letting me use some of his images

```

Discord:https://discord.gg/3WYz3zaqG5

# Add to qb-core/shared/items
```
 -- qb-scrapyard
	['chop-brakes'] 			 	 = {['name'] = 'chop-brakes', 			  		['label'] = 'Brakes', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-brakes.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-bumper'] 			 	 = {['name'] = 'chop-bumper', 			  		['label'] = 'Bumper', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-bumper.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-door'] 			     	 = {['name'] = 'chop-door', 			  		['label'] = 'Door', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-door.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-trunk'] 			    	 = {['name'] = 'chop-trunk', 			  		['label'] = 'Trunk', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-trunk.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-tyre'] 			    	 = {['name'] = 'chop-tyre', 			  		['label'] = 'Tyre', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-tyre.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-exhaust'] 		   	 	 = {['name'] = 'chop-exhaust', 			  		['label'] = 'Exhaust', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-exhaust.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-headlight'] 			 	 = {['name'] = 'chop-headlight', 			  	['label'] = 'Headlight', 			   	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-headlight.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-hood'] 			    	 = {['name'] = 'chop-hood', 			  		['label'] = 'Hood', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-hood.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-internals'] 			 	 = {['name'] = 'chop-internals', 			  	['label'] = 'Internals', 			   	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-internals.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-mirror'] 			 	 = {['name'] = 'chop-mirror', 			  		['label'] = 'Mirror', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-mirror.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-suspension'] 		 	 = {['name'] = 'chop-suspension', 			  	['label'] = 'Suspension', 			   	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-suspension.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-rim'] 			     	 = {['name'] = 'chop-rim', 			     		['label'] = 'Rim', 			        	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-rim.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-seat'] 			    	 = {['name'] = 'chop-seat', 			  		['label'] = 'Seat', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-seat.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-engine'] 			 	 = {['name'] = 'chop-engine', 			  		['label'] = 'Engine', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-engine.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-transmission'] 	    	 = {['name'] = 'chop-transmission', 	 		['label'] = 'Transmission', 	    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-transmission.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-turbo'] 			     	 = {['name'] = 'chop-turbo', 		 	  		['label'] = 'Turbo', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-turbo.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
	['chop-nos'] 			     	 = {['name'] = 'chop-nos', 			     		['label'] = 'NOS', 		    	    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'chop-nos.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'change this'},
 ```

# Add Images from qb-scrapyard/images to qb-inventory/html/images

# To change values go to client/ main.lua/line 179 - 427

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

