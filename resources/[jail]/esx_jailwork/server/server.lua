ESX	= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- TriggerEvent('es:addCommand', 'jail', function(src, args, user)

-- 	local xPlayer = ESX.GetPlayerFromId(src)

-- 	if xPlayer.job.name == "police" then
-- 	if args[1] and args[2] and args[3] then
-- 	if tonumber(args[1]) then
-- 	if tonumber(args[2]) then
-- 	if tonumber(args[2]) <= 60 then

-- 	local jailPlayer 	= tonumber(args[1])
-- 	local jailTime 		= tonumber(args[2])
-- 	local jailReason 	= table.concat(args, " ",3)
-- 	local jailPlayerName= ESX.GetPlayerFromId(jailPlayer).name
-- 	if GetPlayerName(jailPlayer) ~= nil then

-- 		if jailTime ~= nil then

-- 			MySQL.Async.fetchAll(
-- 			'SELECT jail FROM users WHERE identifier=@identifier',
-- 			{
-- 				['@identifier'] = GetPlayerIdentifier(jailPlayer)
-- 			}, function(result)
-- 				if result[1].jail == 0 then
					
-- 					JailPlayer(jailPlayer, jailTime, nil)
-- 					-- TriggerEvent('DiscordBot:ToDiscord', 'jail', 'Jail Log', string.gsub(jailPlayerData.name, "_", " ") .. " (" .. GetPlayerName(jailPlayer) .. ")" .. ' tavasot ' .. string.gsub(xPlayer.name, "_", " ") .. " (" .. GetPlayerName(src) .. ")" .. ' jail shod be modat ' .. jailTime .. ' daghighe be dalil: ' .. jailReason,'user', true, source, false)

-- 					TriggerClientEvent("esx:showNotification", src, GetPlayerName(jailPlayer) .. " Zendani shod baraye ~r~~h~" .. jailTime .. " ~w~Daghighe!")
-- 					TriggerClientEvent('chat:addMessage', -1, { args = { "^4[POLICE]^3 ",  "^3" .. jailPlayerName .. " ^0Zendani shod be elate^8:^0 " .. jailReason }, color = { 249, 166, 0 } })
-- 				else
-- 					TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Player mored nazar ghablan zendani shode ast.")
-- 				end
-- 			end)
-- 		else
-- 			TriggerClientEvent("esx:showNotification", src, "Zaman na motabar!")
-- 		end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Player mored nazar online nist!")
-- 	end

-- 	end

-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Zaman zendan nemitavanad bishtar az 60 daghighe bashad.")
-- 	end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma dar ghesmat Zaman faghat mitavanid adad vared konid.")
-- 	end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma dar ghesmat ID faghat mitavanid adad vared konid.")
-- 	end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Syntax vared shode eshtebah ast.")
-- 	end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma police nistid!")
-- 	end

-- end, {help = "Jahat jail kardan player", params = { { name="ID", help="ID player mored nazar" }, { name="Makan", help="Entekhab makan jail mitavanad jail ya prison bashad" }, { name="Zaman", help="Zaman jail" }, { name="Dalil", help="Dalil jail" } }})
TriggerEvent('es:addAdminCommand', 'ajail', 2, function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)

	if args[1] and args[2] and args[3] then
		if tonumber(args[1]) then
			if tonumber(args[2]) then

			local jailPlayer 	= tonumber(args[1])
			local jailTime 		= tonumber(args[2])
			local jailReason 	= table.concat(args, " ",3)

				if GetPlayerName(jailPlayer) ~= nil then

					if jailTime ~= nil then

						if jailReason then
							local jailPlayerData = ESX.GetPlayerFromId(jailPlayer)

							TriggerClientEvent('chat:addMessage', -1, { args = { "[^1AdminJail^0]",  }, color = { 249, 0, 0 } })

							TriggerClientEvent('chat:addMessage', -1, {
								template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 168, 0, 0.4); border-radius: 3px;"><i class="far fa-newspaper"></i> ^1AdminJail<br>  {1}</div>',
								args = { GetPlayerName(source), "^1" .. GetPlayerName(jailPlayer) .. "^0 be Dalile^1 " .. jailReason .. "^0 Be modat ^2" .. jailTime .. " ^0Daghighe Admin jail shod" }
							})

							JailPlayer(jailPlayer, jailTime, 2 , nil)
								TriggerEvent('DiscordBot:ToDiscord', 'ajail', 'Jail Log', string.gsub(jailPlayerData.name, "_", " ") .. " (" .. GetPlayerName(jailPlayer) .. ")" .. ' tavasot ' .. string.gsub(xPlayer.name, "_", " ") .. " (" .. GetPlayerName(source) .. ")" .. ' jail shod be modat ' .. jailTime .. ' daghighe be dalil: ' .. jailReason,'user', source, true, false)

							TriggerClientEvent("esx:showNotification", source, GetPlayerName(jailPlayer) .. " Zendani shod baraye ~r~~h~" .. jailTime .. " ~w~Daghighe!")
						else
							TriggerClientEvent("esx:showNotification", source, "Lotfan Dalil Jail Ra Zekr Farmayid!")
						end
					else
						TriggerClientEvent("esx:showNotification", source, "Zaman na motabar ast!")
					end
				else
					TriggerClientEvent('chat:addMessage', -1, { args = { "[^1SYSTEM^0]", "Player  mored nazar online nist!"}, color = { 255, 0, 0 } })
				end
			else
				TriggerClientEvent('chat:addMessage', -1, { args = { "[^1SYSTEM^0]", "Shoma dar ghesmat Zaman faghat mitavanid adad vared konid."}, color = { 255, 0, 0 } })
			end
		else
			TriggerClientEvent('chat:addMessage', -1, { args = { "[^1SYSTEM^0]", "Shoma dar ghesmat ID faghat mitavanid adad vared konid."}, color = { 255, 0, 0 } })
		end
	else
		TriggerClientEvent('chat:addMessage', -1, { args = { "[^1SYSTEM^0]", "Syntax vared shode eshtebah ast."}, color = { 255, 0, 0 } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "Admin Jail", params = {{name = "PlayerID", help = "Id Playeri ke Online hast"}, {name = "Time", help = "Be Daqiqe Time ro vared konid"}, {name = "Reason", help = "Dalil Jail"}}})

RegisterCommand("aunjail", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer.permission_level > 3 then

		if tonumber(args[1]) then
			local jailPlayer = args[1]

			if GetPlayerName(jailPlayer) ~= nil then
				local jailPlayerData = ESX.GetPlayerFromId(jailPlayer)
				TriggerClientEvent('chatMessage', src, "[AdminJail]", {255, 0, 0}, "^2" .. GetPlayerName(tonumber(args[1])) .. " ^0unjail shod!")
				UnJail(jailPlayer)
				TriggerEvent('DiscordBot:ToDiscord', 'ajail', 'Jail Log', string.gsub(jailPlayerData.name, "_", " ") .. " (" .. GetPlayerName(args[1]) .. ")" .. ' tavasot ' .. string.gsub(xPlayer.name, "_", " ") .. " (" .. GetPlayerName(src) .. ")" .. ' unjail shod','user', src, true, false)
			else
				TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Player mored nazar online nist!")
			end
		else
			TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma dar ghesmat ID faghat mitavanid adad vared konid.")
		end
	else
		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma admin nistid!")
	end
end)

-- TriggerEvent('es:addCommand', 'unjail', function(src, args)

-- 	local xPlayer = ESX.GetPlayerFromId(src)
-- 	local name = GetPlayerName(src)

-- 	if xPlayer["job"]["name"] == "police" then
--         if tonumber(args[1]) then
-- 		local jailPlayer = tonumber(args[1])

-- 		if GetPlayerName(jailPlayer) ~= nil then
-- 			jailPlayerData = ESX.GetPlayerFromId(jailPlayer)
-- 			TriggerClientEvent('chatMessage', src, "[POLICE]", {255, 0, 0}, "^2" .. jailPlayerData.name .. " ^0unjail shod!")
-- 			UnJail(jailPlayer)
-- 			-- TriggerEvent('DiscordBot:ToDiscord', 'jail', 'Jail Log', string.gsub(jailPlayerData.name, "_", " ") .. " (" .. GetPlayerName(jailPlayer) .. ")" .. ' tavasot ' .. string.gsub(xPlayer.name, "_", " ") .. " (" .. GetPlayerName(src) .. ")" .. ' unjail shod','user', true, source, false)
-- 		else
-- 			TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Player mored nazar online nist!")
-- 		end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma dar ghesmat ID faghat mitavanid adad vared konid.")
-- 	end
-- 	else
-- 		TriggerClientEvent('chatMessage', src, "[SYSTEM]", {255, 0, 0}, "Shoma police nistid!")
-- 	end
-- end, {help = "Jahat unjail kardan player", params = { { name="ID", help="ID player mored nazar" } }})

RegisterServerEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(targetSrc, jailTime, jailReason, status)
	local src 				= source
	local targetSrc 		= tonumber(targetSrc)
	local xPlayer 			= ESX.GetPlayerFromId(src)
	local jailPlayerData 	= ESX.GetPlayerFromId(targetSrc)

	if xPlayer.job.name == "police" then
		JailPlayer(targetSrc, jailTime, 2, nil)

		TriggerClientEvent('chat:addMessage', -1, { args = { "^4[POLICE]^3 ", "^3" .. jailPlayerData.name .. " ^0Zendani shod be elate^8:^0 " .. jailReason }, color = { 249, 166, 0 } })

		TriggerClientEvent("esx:showNotification", src, GetPlayerName(targetSrc) .. " Zendani shod baraye ~r~~h~" .. jailTime .. " ~w~Daghighe!")
	else
		TriggerEvent('Anticheat:AutoBan', src, {period = -1, reason = 'Talash Baraye Jail kardane Player ha'})
	end
end)

RegisterServerEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function(targetIdentifier, status)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local theJailPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if theJailPlayer ~= nil then
		UnJail(theJailPlayer.source)
		if status then
			-- TriggerEvent('DiscordBot:ToDiscord', 'jail', 'Jail Log', string.gsub(theJailPlayer.name, "_", " ") .. " (" .. GetPlayerName(theJailPlayer.source) .. ")" .. ' tavasot ' .. string.gsub(xPlayer.name, "_", " ") .. " (" .. GetPlayerName(src) .. ")" .. ' unjail shod','user', true, source, false)
			TriggerClientEvent("esx:showNotification", src, string.gsub(theJailPlayer.name, "_", " ")  .. " Azad shod!")
		end
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
		if status then

			MySQL.Async.fetchAll(
			'SELECT * FROM users WHERE identifier = @identifier',
			{
				['@identifier'] = targetIdentifier,
			}, function(result)

				-- TriggerEvent('DiscordBot:ToDiscord', 'jail', 'Jail Log', string.gsub(result[1].playerName, "_", " ") .. ' tavasot ' .. string.gsub(xPlayer.name, "_", " ") .. " (" .. GetPlayerName(src) .. ")" .. ' unjail shod','user', true, source, false)
				TriggerClientEvent("esx:showNotification", src, string.gsub(result[1].playerName, "_", " ")  .. " Azad shod!")
			end)
		end
	end
end)

RegisterServerEvent("esx-qalle-jail:changeJailStatusServerSided")
AddEventHandler("esx-qalle-jail:changeJailStatusServerSided", function(status)

	local src = source

	if type(status) ~= 'boolean' then
		print(('esx_jailwork: %s Sai kard value bejoz true ya false dar jail jay gozari konad!'):format(GetPlayerName(src)))
		return
	end

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer ~= nil then
		xPlayer.set('jailed', status)
	end

end)

RegisterServerEvent("esx-qalle-jail:jobSet")
AddEventHandler("esx-qalle-jail:jobSet", function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local grade = xPlayer.job.grade

	if xPlayer.job.name == "police" then

        xPlayer.setJob('police', -1 * grade)
		
	elseif xPlayer.job.name == "mecano" then

        xPlayer.setJob('mecano', -1 * grade)

	elseif xPlayer.job.name == "ambulance" then

        xPlayer.setJob('ambulance', -1 * grade)
	
	elseif xPlayer.job.name == "taxi" then

        xPlayer.setJob('taxi', -1 * grade)

	end

end)

RegisterServerEvent("esx-qalle-jail:updateJailTime")
AddEventHandler("esx-qalle-jail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

RegisterServerEvent("esx-qalle-jail:prisonWorkReward")
AddEventHandler("esx-qalle-jail:prisonWorkReward", function()
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)

	xPlayer.addMoney(math.random(25, 50))

	TriggerClientEvent("esx:showNotification", src, "Mamnoon ye kam pool bara ghaza gereftid")
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("esx-qalle-jail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("esx-qalle-jail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local xPlayer = ESX.GetPlayerFromId(source)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name =  string.gsub(result[i].firstname, "_", " "), jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then
			cb(true, JailTime)
		else
			cb(false)
		end

	end)
end)