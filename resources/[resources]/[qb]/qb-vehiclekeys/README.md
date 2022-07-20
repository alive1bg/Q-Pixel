# qb-vehiclekeys
qb-vehiclekeys compatible with qb-lock
all credits go to FjamZoo#0001, i just fixed some errors like hotwire and when lockpicking all vehicles doors unlocking, randomized the amount of circles and the speed
credits to [(https://github.com/JustLazzy)](https://github.com/JL-Development/qb-vehiclekeys)
updated by Hipsher#7013 to work with most recent qb-core

## Dependencies

 + qb-lock https://github.com/Tex27/qb-lock
 + qb-core https://github.com/qbcore-framework/qb-core
 + boosting hack https://github.com/Lionh34rt/boostinghack
 + ps-dispatch https://github.com/Project-Sloth/ps-dispatch for my dispatch but can be changed in client/main.lua and look for ps-dispatch and change it to qb-dispatch

## Preview
https://vimeo.com/722815222

## Add Item
Go to your qb-core/shared/items.lua and add this line

['security_system_device']       = {['name'] = 'security_system_device',        ['label'] = 'Security System Hacking Device', ['weight'] = 100,    ['type'] = 'item',       ['image'] = 'security_system_device.png',		['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'This device look sus'},

## Add image
open qb-inventory or lj-inventory html/images and drag the security_system_device.png into there.

## License
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
