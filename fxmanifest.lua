fx_version 'cerulean'
game 'gta5'

name 'Tienda de carros'
description 'comprame un carro'
author 'Estudiantes de kamerr'

version '1.1.2'

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

shared_scripts {
    'config.lua'
}

ui_page "nui/nui.html"
files {
    'nui/nui.html',
    'nui/nui.css',
    'nui/nui.js',
    'nui/cursor.webp'
}