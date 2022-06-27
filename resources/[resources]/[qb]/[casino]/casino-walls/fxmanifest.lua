fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

escrow_ignore {

}

shared_scripts {
	'config.lua',
}


client_scripts{
	'@PolyZone/client.lua',
    	'@PolyZone/CircleZone.lua',
	'client/*.lua'
} 

server_scripts{
	'server/*.lua'
} 
