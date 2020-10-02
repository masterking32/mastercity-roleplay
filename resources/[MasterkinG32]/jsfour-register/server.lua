local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

math.randomseed(math.floor(os.time() + math.random(100)))

-- Player loaded
AddEventHandler('es:playerLoaded', function( source )
  getIdentity(source, function(data)
    print(data.firstname)
    if data.firstname == '' or data.firstname == nil or data.firstname == 0 or data.firstname == '0' then
      TriggerClientEvent('jsfour-register:open', source)
    else
      print('JSFOUR Successfully Loaded Identity For ' .. data.firstname .. ' ' .. data.lastname)
    end
  end)
end)

-- Register the player
ESX.RegisterServerCallback('jsfour-register:register', function(source, cb, data)
  local identifier = GetPlayerIdentifiers(source)[1]
  local lastdigits = math.random(9) .. math.random(9) .. math.random(9) .. math.random(9)
  MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `email` = @email, `phone` = @phone, `sex` = @sex, `height` = @height, `lastdigits` = @lastdigits WHERE identifier = @identifier",
  {
    ['@identifier']   = identifier,
    ['@firstname']    = data.firstname,
    ['@lastname']     = data.lastname,
    ['@dateofbirth']  = data.dateofbirth,
    ['@sex']          = data.sex,
    ['@height']       = data.height,
    ['@email']        = data.email,
    ['@phone']        = data.phone,
    ['@lastdigits']   = lastdigits
  },
  function( result )
    MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height, lastdigits, email, phone) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height, @lastdigits, @email, @phone)',
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']          = data.sex,
      ['@height']       = data.height,
      ['@email']        = data.email,
      ['@phone']        = data.phone,
      ['@lastdigits']   = lastdigits
    },
    function( result )
      -- Done
      cb(true)
    end)
  end)
end)

-- Get Identity
function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
  MySQL.Async.fetchAll("SELECT identifier, firstname, lastname, dateofbirth, sex, height, lastdigits FROM `users` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1].firstname ~= nil then
      local data = {
        identifier  = result[1].identifier,
        firstname  = result[1].firstname,
        lastname  = result[1].lastname,
        dateofbirth  = result[1].dateofbirth,
        email  = result[1].email,
        phone  = result[1].phone,
        sex      = result[1].sex,
        height    = result[1].height,
        lastdigits = result[1].lastdigits
      }
      callback(data)
    else
      local data = {
        identifier   = '',
        firstname   = '',
        lastname   = '',
        dateofbirth = '',
        email = '',
        phone = '',
        sex     = '',
        height     = ''
      }
      callback(data)
    end
  end)
end

-- Help messages
TriggerEvent('es:addGroupCommand', 'idhelp', "user", function(source, args, user)
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "ESX_IDENTITY Commands")
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "/delchar - Ta bort din karaktär och gör en ny")
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "IDHelp", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "List Your Characters"})

-- /Delchar
TriggerEvent('es:addCommand', 'delchar', function(source, args, user)
  getIdentity(source, function( data )
    if data.identifier ~= nil then
      MySQL.Async.execute('DELETE FROM characters WHERE identifier = @identifier',
        { ['@identifier'] = data.identifier }
      )
      MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `email` = @email, `phone` = @phone, `sex` = @sex, `height` = @height, `lastdigits` = @lastdigits WHERE identifier = @identifier",
      {
        ['@identifier']   = data.identifier,
        ['@firstname']    = 0,
        ['@lastname']     = 0,
        ['@dateofbirth']  = 0,
        ['@email'] 		  = 0,
        ['@phone'] 		  = 0,
        ['@sex']          = 0,
        ['@height']       = 0,
        ['@lastdigits']   = 0
      },
      function ( result )
        TriggerClientEvent('jsfour-register:open', source)
      end)
    end
  end)
end)

function setIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function updateIdentity(playerId, data, callback)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= xPlayer.identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			TriggerEvent('esx_identity:characterUpdated', playerId, data)
			callback(true)
		end
	end)
end

function deleteIdentity(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= xPlayer.identifier,
		['@firstname']		= '',
		['@lastname']		= '',
		['@dateofbirth']	= '',
		['@sex']			= '',
		['@height']			= '',
	})
end
