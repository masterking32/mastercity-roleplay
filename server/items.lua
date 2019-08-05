ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----
ESX.RegisterUsableItem('gauze', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:gauze', source)
end)

ESX.RegisterUsableItem('bandage', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:bandage', source)
end)

ESX.RegisterUsableItem('firstaid', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:firstaid', source)
end)

ESX.RegisterUsableItem('medkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:medkit', source)
end)

ESX.RegisterUsableItem('vicodin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:vicodin', source)
end)

ESX.RegisterUsableItem('hydrocodone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:hydrocodone', source)
end)

ESX.RegisterUsableItem('morphine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:morphine', source)
end)