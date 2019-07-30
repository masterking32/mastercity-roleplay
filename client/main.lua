RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
	DoCustomHudText(data.type, data.text, data.length)
end)

RegisterNetEvent('mythic_notify:client:PersistentHudText')
AddEventHandler('mythic_notify:client:PersistentHudText', function(data)
	PersistentHudText(data.action, data.id, data.type, data.text)
end)

function DoShortHudText(type, text)
	SendNUIMessage({
		type = type,
		text = text,
		length = 1000
	})
end

function DoHudText(type, text)
	SendNUIMessage({
		type = type,
		text = text,
		length = 2500
	})
end

function DoLongHudText(type, text)
	SendNUIMessage({
		type = type,
		text = text,
		length = 5000
	})
end

function DoCustomHudText(type, text, length)
	SendNUIMessage({
		type = type,
		text = text,
		length = length
	})
end

function PersistentHudText(action, id, type, text)
	if action:upper() == 'START' then
		SendNUIMessage({
			persist = action,
			id = id,
			type = type,
			text = text
		})
	elseif action:upper() == 'END' then
		SendNUIMessage({
			persist = action,
			id = id
		})
	end
end