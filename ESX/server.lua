ESX = nil
isLocked = nil
doorList = {1,2,3,4,5,6,7,8,9,10,11,12,13}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('door:update')
AddEventHandler('door:update', function(id, isLocked)
    if (id ~= nil and isLocked ~= nil) then -- Make sure values got sent
		TriggerClientEvent('door:state', -1, id, isLocked)
		
    end
end)

AddEventHandler('esx:playerLoaded', function(source)
	local isLocked = true
	local id = doorList[i]
    TriggerClientEvent('door:state', -1, id, isLocked)

end)

RegisterServerEvent('esx_doors:getDoors')
AddEventHandler('esx_doors:getDoors', function(id, isLocked)
    if (id ~= nil and isLocked ~= nil) then -- Make sure values got sent
        TriggerClientEvent('door:state', -1, id, isLocked)
    end
end)
