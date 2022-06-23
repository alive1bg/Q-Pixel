fx_version 'cerulean'
game 'gta5'

lua54 'yes'

escrow_ignore {
}


ui_page 'index.html'

files {
  "index.html",
  "js/scripts.js",
  "js/jquery.js",
  "css/style.css"
}
client_script {
  "client.lua",
}

export "taskBar"
export "closeGuiFail"