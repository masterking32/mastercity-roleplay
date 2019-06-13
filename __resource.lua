resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

name 'Mythic Framework Notification System'
author 'Alzar - https://github.com/Alzar'
version 'v1.0.0'

ui_page {
    'html/ui.html',
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',
    'html/js/popper.min.js',
    'html/js/bootstrap.min.js',
    'html/css/bootstrap.min.css',
}

client_scripts {
	'client/main.lua'
}

exports {
	'DoShortHudText',
	'DoHudText',
	'DoLongHudText',
	'DoCustomHudText',
}