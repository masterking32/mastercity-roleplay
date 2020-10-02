resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/ui.html"

files {
	"nui/ui.html",
    "nui/background.jpg",
    "nui/slides/slide1.png",
    "nui/slides/slide2.png",
    "nui/slides/slide3.png",
    "nui/slides/slide4.png",
    "nui/slides/slide5.png",
   	"nui/ui.js", 
   	"nui/slider.js",
   	"nui/gothicb.ttf",
   	"nui/signpainter.ttf",
   	"nui/bootstrap.min.js",
   	"nui/bootstrap.min.css",
   	"nui/tutorial_config.js",
   	"nui/btn-right.png",
   	"nui/btn-right-hover.png",
   	"nui/btn-left-hover.png",
   	"nui/spawn.png",
   	"nui/spawn-hover.png",
   	"nui/responsive.css",
	"nui/btn-left.png"
}

client_script 'click.lua'
client_script 'client.lua'
server_script 'server.lua'