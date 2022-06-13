fx_version 'cerulean'
game 'gta5'

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/js/script.js', 
	'html/css/stylesheet.css',
}

client_scripts {
	'client/*.lua' 
}


exports {
	'TextUI',	
	'MenuUI',	
	'InputUI',
} 

lua54 'yes'