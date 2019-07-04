local playerInjury = {}

function GetCharsInjuries(source)
    return playerInjury[source]
end

RegisterServerEvent('mythic_hospital:server:SyncInjuries')
AddEventHandler('mythic_hospital:server:SyncInjuries', function(data)
	local src = source
    local char =  exports['mythic_base']:getPlayerFromId(src).getChar()
    local cData = char.getCharData()

    playerInjury[cData.id] = data
end)