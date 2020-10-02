# My Test FiveM Roleplay Server!
It's my first working on the FiveM.

I collected some of the modules of the ES and ESX.

I hope that can help you to create a FiveM server from fresh.

# How to download

You can download the source with the Git.

    git clone https://github.com/masterking32/mastercity-roleplay
    cd mastercity-roleplay
    git submodule init
    git submodule update

## Server.cfg requirements

    add_ace resource.essentialmode command.sets allow
    add_ace resource.essentialmode command.add_principal allow
    add_ace resource.essentialmode command.add_ace allow
    add_principal group.admin group.user
    add_ace resource.extendedmode command.add_ace allow
    add_ace resource.extendedmode command.add_principal allow
    add_ace resource.extendedmode command.remove_principal allow
    
    set es_enableCustomData 1
    set mysql_connection_string "server=localhost;database=mastercity_new;userid=root;keepAlive=60"
    
    # These resources will start by default
    start mapmanager
    start chat
    start spawnmanager
    start sessionmanager
    start fivem
    start hardcap
    start rconlog
    #start scoreboard
    start baseevents
    
    set mysql_debug 1
    set mysql_debug_output "console"
    
    ###  MASTERKING32  ###
    
    ## BASE
    ensure mysql-async
    #start essentialmode
    #start esplugin_mysql
    #start es_admin2
    ensure extendedmode
    ensure cron
    
    ensure esx_menu_default
    ensure esx_menu_list
    ensure esx_menu_dialog
    
    ensure skinchanger
    start skincreator
    ensure esx_skin
    
    ##esx##
    start esx_identity
    #start jsfour-register
    start esx_society
    start esx_addonaccount
    start esx_addoninventory
    start esx_datastore
    start esx_billing
    start esx_vehicleshop
    start esx_license
    start esx_service
    #ensure mpcreator
    start esx_basicneeds
    start esx_doorlock
    start esx_status
    start esx_voice
    start esx_ambulancejob
    start esx_adminplus
    start esx_policejob
    start esx_jailwork
    start esx_jailhandler
    start jail
    start interact-sound
    #start tutorial
    
    ## Other
    start pNotify
    start UnknownlifeUI
    start Unknownlife_hud
    start InteractSoundS
    start orp-banking
    start mythic_notify
    start progressBars
    start VoiceRange
    start mythic_progbar
    start bob74_ipl
    #start mythic_hospital
    #start PillboxHospital
    #start Pillbox-Hospital-Interior
    start loadingscreen
    start guidehud
    ensure esx_addons_gcphone
    ensure gcphone
    ensure police5
    ensure policemustang

