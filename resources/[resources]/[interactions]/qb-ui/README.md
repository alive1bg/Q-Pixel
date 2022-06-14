# Feature is the same like qb-drawtext but replace position with type of color like nopixel inspired

# qb-ui

A NUI DrawText with a few different config options. Please make sure you handle the showing and hiding as if done incorrectly it will just repeatadly send nui messages.

## How to use

|Function or Event | Description |
|--|--|
| `exports['qb-ui']:showInteraction('message','type')` | This is a client export that will draw a message at the specified position (listed below) |
| `exports['qb-ui']:hideInteraction()` | This will hide the text display |

Type accepted are:

* info
* success
* error
* classic

## License

    qb-ui
    Copyright (C) 2022 Zea Ra

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