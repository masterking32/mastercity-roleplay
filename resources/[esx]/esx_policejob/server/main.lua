ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'police', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'police', _U('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent('esx_policejob:giveWeapon')
AddEventHandler('esx_policejob:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, ammo)
end)


RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('esx_policejob:handcuff', target)
	else
		print(('esx_policejob: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
	TriggerClientEvent('esx_policejob:drag', target, source)
end)

RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
	TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_policejob:OutVehicle', target)
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
				-- TriggerEvent('DiscordBot:ToDiscord', 'pwi', xPlayer.name, 'Withdrawn x' ..count ..' '..inventoryItem.label ,'user', source, true, false)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)

end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

	end)

end)

RegisterCommand('findnumber', function(source, args, users)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == "police" and xPlayer.job.grade > 0 then
        if args[1] then
            if string.len(args[1]) == 10 then
            local number = tonumber(args[1])
                if number then
                    MySQL.Async.fetchAll('SELECT playerName FROM users WHERE phone_number=@number', 
                    {
                        ['@number'] =  number
                    }, function(data)
                        if data[1] then
							TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', " ^0 In Shomare be naame ^3" .. string.gsub(data[1].playerName, "_", " ") .. " ^0Ast!"} })
                        else
							TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', "^0 In shomare vojoud nadarad"} })
                        end
                    end)
                else
					TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', " ^0Shoma dar ghesmat Shomare vaghat mitavanid adad vared konid!"} })
                end
            else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', " ^0Shomare bayad 11 raghami bashad!"} })
            end
        else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', " ^0Shoma dar ghesmat Shomare chizi vared nakardid!"} })
        end
    else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', " ^0Shoma police nistid!"} })
    end
end)

ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].playerName
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					cb(string.gsub(result2[1].playerName, "_", " "), true)
				else
					cb(string.gsub(result2[1].playerName, "_", " "), true)
				end

			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)

	end)

end)

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)

	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
		-- TriggerEvent('DiscordBot:ToDiscord', 'pwi', xPlayer.name, 'Deposited ' .. weaponName ,'user', source, true, false)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)

end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, 500)
	-- TriggerEvent('DiscordBot:ToDiscord', 'pwi', xPlayer.name, 'Withdrawn ' .. weaponName ,'user', source, true, false)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)

end)


ESX.RegisterServerCallback('esx_policejob:buy', function(source, cb, amount)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
		if account.money >= amount then
			account.removeMoney(amount)
			cb(true)
		else
			cb(false)
		end
	end)

end)

ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source
	
	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_policejob:updateBlip', -1)
		end
	end	
end)

RegisterServerEvent('esx_policejob:spawned')
AddEventHandler('esx_policejob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_policejob:forceBlip')
AddEventHandler('esx_policejob:forceBlip', function()
	TriggerClientEvent('esx_policejob:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'police')
	end
end)

RegisterServerEvent('esx_policejob:message')
AddEventHandler('esx_policejob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

RegisterServerEvent('esx_policejob:soundplay')
AddEventHandler('esx_policejob:soundplay', function(soundFile, soundVolume, x, y, plate, name, IsDistress)
local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do

		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])	

		if xPlayer.job.name == "police" and xPlayer.job.grade > 0 then
			if xPlayer.source ~= source then
				TriggerEvent('InteractSound_SV:PlayOnOne', xPlayer.source, soundFile, soundVolume)
				if IsDistress then
					TriggerClientEvent('esx_policejob:setwaypoint', xPlayer.source, x, y)
				end
			end
			if IsDistress then
				if plate ~= nil then
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Police Department', 'Notification', "~r~".. string.gsub(plate, " ", "") .. " ~w~Panic alarm ra feshar dad!", 'CHAR_CALL911', 1)
				else
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Police Department', 'Notification', "~r~".. tostring(name) .. " ~w~Panic alarm ra feshar dad!", 'CHAR_CALL911', 1)
				end
			elseif IsDistress == false then
				if plate ~= nil then
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Police Department', 'Notification', "~r~".. string.gsub(plate, " ", "") .. " ~w~Darkhast ~o~10-70 ~w~kard!", 'CHAR_CALL911', 1)
				else
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Police Department', 'Notification', "~r~".. tostring(name) .. " ~w~Darkhast ~o~10-70 ~w~kard!", 'CHAR_CALL911', 1)
				end
			end
		end
	end
end)

RegisterServerEvent('esx_policejob:showBackUP')
AddEventHandler('esx_policejob:showBackUP', function(x, y)
	local xPlayers = ESX.GetPlayers()	

	for i=1, #xPlayers, 1 do

		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])	

		if xPlayer.job.name == "police" and xPlayer.job.grade > 0 then

			TriggerClientEvent('esx_policejob:showNotification', xPlayer.source, x, y)

		end

	end
end)

RegisterServerEvent('esx_policejob:playSoundRadio')
AddEventHandler('esx_policejob:playSoundRadio', function(soundFile, soundVolume)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do

		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])	

		if xPlayer.job.name == "police" and xPlayer.job.grade > 0 then

			if xPlayer.source ~= source then
				TriggerEvent('InteractSound_SV:PlayOnOne', xPlayer.source, soundFile, soundVolume)
			end

		end

	end
end)

ESX.RegisterServerCallback('esx_policejob:getitem', function(source, cb, item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('esx_policejob:getIcName', function(source, cb)
	xPlayer = ESX.GetPlayerFromId(source)

	characterName = string.gsub(exPlayer.getName(), "_", " ")
	cb(characterName)
end)

RegisterServerEvent('esx_policejob:requestarrest')
AddEventHandler('esx_policejob:requestarrest', function(targetid, playerheading, playerCoords, playerlocation)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local faction = true
	if xPlayer.job.name == 'police' then faction = 'police' end
    TriggerClientEvent('esx_policejob:getarrested', targetid, playerheading, playerCoords, playerlocation, faction)
    TriggerClientEvent('esx_policejob:doarrested', _source)
end)

RegisterServerEvent('esx_policejob:requestrelease')
AddEventHandler('esx_policejob:requestrelease', function(targetid, playerheading, playerCoords,  playerlocation)
    _source = source
    TriggerClientEvent('esx_policejob:getuncuffed', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('esx_policejob:douncuffing', _source)
end)

RegisterServerEvent('esx_policejob:SetCuffStatus')
AddEventHandler('esx_policejob:SetCuffStatus', function(status)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.set('Cuff', status)
end)

ESX.RegisterServerCallback('esx_policejob:IsHandCuffed', function(source, cb, target)
	local xTarget = ESX.GetPlayerFromId(target)

	if xTarget then
		cb(xTarget.get('Cuff'))
	end
end)

-- division commands
RegisterCommand('division', function(source, args, raws)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'police' and xPlayer.job.grade > 7 then

		local target = tonumber(args[1])
		if not target then
			TriggerClientEvent('esx:showNotification', source, 'Lotfan Id Player morde nazar ro vared konid')
			return
		end

		local division = args[2]
		if not division then
			TriggerClientEvent('esx:showNotification', source, 'Lotfan ye Division vared konid')
			return
		end

		local found = false
		division = string.lower(division)
		if division == 'swat' or division == 'sheriff' or 'police' then
			found = true
		end

		if not found then
			TriggerClientEvent('esx:showNotification', source, 'Shoma Hich kodom az division haye Tarif shode ro vared nakardid')
			return
		end

		target = ESX.GetPlayerFromId(target)
		if target and target.job.name == 'police' then
			if division == 'police' then
				MySQL.Async.execute('UPDATE users SET job_division = @division WHERE identifier = "-"', {
					['identifier'] = target.identifier
				})
				target.job.ext = nil
				TriggerClientEvent('esx:setJob', target.source, target.job)
			end
			
			if target.job.ext == division then
				TriggerClientEvent('esx:showNotification', source, 'Player morede nazare shoma az qabl dar in division bode ast')
			else
				MySQL.Async.execute('UPDATE users SET job_division = @division WHERE identifier = @identifier', {
					['division'] = division,
					['identifier'] = target.identifier
				})
				
				target.job.ext = division
				TriggerClientEvent('esx:setJob', target.source, target.job)
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'Player morde nazare shoma police ya online nist')
		end
	else
		TriggerClientEvent('esx:showNotification', source, 'Shoma Dastresi Estefade az in Command ro nadarid')
	end
end, false)


ESX.RegisterServerCallback('esx_policejob:getOtherPlayerDataCard', function(source, cb, target)

	local xPlayer = ESX.GetPlayerFromId(target)

	local identifier = GetPlayerIdentifiers(target)[1]

	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = identifier
	})

	local name 		= xPlayer.getName()
	local dob       = result[1].dateofbirth
	local height    = result[1].height
	local sex

	if result[1].skin ~= nil then
		skin = json.decode(result[1].skin)
		local isMale = skin.sex == 0
		if isMale then sex = 'Mard' else sex = 'Zan' end
	end

	local data = {
		name      = name,
		money	  = xPlayer.getMoney(),
		job       = xPlayer.job,
		inventory = xPlayer.inventory,
		weapons   = xPlayer.loadout,
		sex       = sex
	}

	TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
		if status ~= nil then
			data.drunk = math.floor(status.percent)
		end
	end)

	TriggerEvent('esx_license:getLicenses', target, function(licenses)
		data.licenses = licenses
		cb(data)
	end)

end)