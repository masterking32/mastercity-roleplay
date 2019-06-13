RegisterNetEvent("mythic_notify:client:SendAlert")
AddEventHandler("mythic_notify:client:SendAlert", function(data)
	DoHudText(data.type, data.text)
end)

function DoShortHudText(type, text)
	SendNUIMessage({
		action = 'shortnotif',
		type = type,
		text = text
	})
end

function DoHudText(type, text)
	SendNUIMessage({
		action = 'notif',
		type = type,
		text = text
	})
end

function DoLongHudText(type, text)
	SendNUIMessage({
		action = 'longnotif',
		type = type,
		text = text
	})
end

function DoCustomHudText(type, text, length)
	SendNUIMessage({
		action = 'customnotif',
		type = type,
		text = text,
		length = length
	})
end
