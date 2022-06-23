fx_version 'bodacious'
games { 'rdr3', 'gta5' }

lua54 'yes'

escrow_ignore {
}


ui_page "html/index.html"

files{
    "html/index.html",
    "html/*.js",
    "html/*.css",
	"html/*.ogg",
}

client_scripts {
    "client/cl_*.lua"
}