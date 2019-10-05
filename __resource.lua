resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

name 'Mythic Framework Progress Bar'
author 'Alzar - https://github.com/Alzar'
version 'v1.0.1'

ui_page('html/index.html') 

client_scripts {
    'client/functions.lua',
    'client/events.lua',
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',

    'html/css/bootstrap.min.css',
    'html/js/jquery.min.js',
}

exports {
    'Progress',
    'ProgressWithStartEvent',
    'ProgressWithTickEvent',
    'ProgressWithStartAndTick'
}