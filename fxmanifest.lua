fx_version 'cerulean'
game 'gta5'

description 'QZ adminmenu adapted to ESX'
version '1.0.0'
ui_page 'html/index.html'

client_scripts {
    '@menuv/menuv.lua',
    'client/noclip.lua',
    'client/blipsnames.lua',
    'client/client.lua',
    'client/nombres.lua',
    'client/events.lua'
}

server_scripts {
    'server/server.lua',
    'server/nombres.lua'
}

files {
    'html/index.html',
    'html/index.js'
}

dependency 'menuv'

lua54 'yes'