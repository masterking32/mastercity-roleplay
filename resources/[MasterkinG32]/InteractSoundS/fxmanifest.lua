fx_version 'adamant'

game 'gta5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
	'client/html/sounds/seatbelt.ogg',
	'client/html/sounds/buckle.ogg',
	'client/html/sounds/unbuckle.ogg'
})
