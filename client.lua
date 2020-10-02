ESX = nil

local showBankBlips = true
local atBank = false
local bankMenu = true
local inMenu = false
local atATM = false
local bankColor = "green"

local bankLocations = {
    {i = 108, c = 77, x = 241.727, y = 220.706, z = 106.286, s = 0.8, n = "Pacific Bank"}, -- blip id, blip color, x, y, z, scale, name/label
	{i = 108, c = 0, x = 150.266, y = -1040.203, z = 29.374, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -1212.980, y = -330.841, z = 37.787, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -2962.582, y = 482.627, z = 15.703, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -112.202, y = 6469.295, z = 31.626, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = 314.187, y = -278.621, z = 54.170, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -351.534, y = -49.529, z = 49.042, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = 1175.0643310547, y = 2706.6435546875, z = 38.094036102295, s = 0.7, n = "Bank 7"},
	
	{i = 277, x = -386.733, y = 6045.953, z = 31.501, s = 0.7, n = "ATM"},
	{i = 277, x = -284.037, y = 6224.385, z = 31.187, s = 0.7, n = "ATM"},
	{i = 277, x = -284.037, y = 6224.385, z = 31.187, s = 0.7, n = "ATM"},
	{i = 277, x = -135.165, y = 6365.738, z = 31.101, s = 0.7, n = "ATM"},
	{i = 277, x = -110.753, y = 6467.703, z = 31.784, s = 0.7, n = "ATM"},
	{i = 277, x = -94.9690, y = 6455.301, z = 31.784, s = 0.7, n = "ATM"},
	{i = 277, x = 155.4300, y = 6641.991, z = 31.784, s = 0.7, n = "ATM"},
	{i = 277, x = 174.6720, y = 6637.218, z = 31.784, s = 0.7, n = "ATM"},
	{i = 277, x = 1703.138, y = 6426.783, z = 32.730, s = 0.7, n = "ATM"},
	{i = 277, x = 1735.114, y = 6411.035, z = 35.164, s = 0.7, n = "ATM"},
	{i = 277, x = 1702.842, y = 4933.593, z = 42.051, s = 0.7, n = "ATM"},
	{i = 277, x = 1967.333, y = 3744.293, z = 32.272, s = 0.7, n = "ATM"},
	{i = 277, x = 1821.917, y = 3683.483, z = 34.244, s = 0.7, n = "ATM"},
	{i = 277, x = 1174.532, y = 2705.278, z = 38.027, s = 0.7, n = "ATM"},
	{i = 277, x = 540.0420, y = 2671.007, z = 42.177, s = 0.7, n = "ATM"},
	{i = 277, x = 2564.399, y = 2585.100, z = 38.016, s = 0.7, n = "ATM"},
	{i = 277, x = 2558.683, y = 349.6010, z = 108.050, s = 0.7, n = "ATM"},
	{i = 277, x = 2558.051, y = 389.4817, z = 108.660, s = 0.7, n = "ATM"},
	{i = 277, x = 1077.692, y = -775.796, z = 58.218, s = 0.7, n = "ATM"},
	{i = 277, x = 1139.018, y = -469.886, z = 66.789, s = 0.7, n = "ATM"},
	{i = 277, x = 1168.975, y = -457.241, z = 66.641, s = 0.7, n = "ATM"},
	{i = 277, x = 1153.884, y = -326.540, z = 69.245, s = 0.7, n = "ATM"},
	{i = 277, x = 381.2827, y = 323.2518, z = 103.270, s = 0.7, n = "ATM"},
	{i = 277, x = 236.4638, y = 217.4718, z = 106.840, s = 0.7, n = "ATM"},
	{i = 277, x = 265.0043, y = 212.1717, z = 106.780, s = 0.7, n = "ATM"},
	{i = 277, x = 285.2029, y = 143.5690, z = 104.970, s = 0.7, n = "ATM"},
	{i = 277, x = 157.7698, y = 233.5450, z = 106.450, s = 0.7, n = "ATM"},
	{i = 277, x = -164.568, y = 233.5066, z = 94.919, s = 0.7, n = "ATM"},
	{i = 277, x = -1827.04, y = 785.5159, z = 138.020, s = 0.7, n = "ATM"},
	{i = 277, x = -1409.39, y = -99.2603, z = 52.473, s = 0.7, n = "ATM"},
	{i = 277, x = -1205.35, y = -325.579, z = 37.870, s = 0.7, n = "ATM"},
	{i = 277, x = -1215.64, y = -332.231, z = 37.881, s = 0.7, n = "ATM"},
	{i = 277, x = -2072.41, y = -316.959, z = 13.345, s = 0.7, n = "ATM"},
	{i = 277, x = -2975.72, y = 379.7737, z = 14.992, s = 0.7, n = "ATM"},
	{i = 277, x = -2962.60, y = 482.1914, z = 15.762, s = 0.7, n = "ATM"},
	{i = 277, x = -2955.70, y = 488.7218, z = 15.486, s = 0.7, n = "ATM"},
	{i = 277, x = -3044.22, y = 595.2429, z = 7.595, s = 0.7, n = "ATM"},
	{i = 277, x = -3144.13, y = 1127.415, z = 20.868, s = 0.7, n = "ATM"},
	{i = 277, x = -3241.10, y = 996.6881, z = 12.500, s = 0.7, n = "ATM"},
	{i = 277, x = -3241.11, y = 1009.152, z = 12.877, s = 0.7, n = "ATM"},
	{i = 277, x = -1305.40, y = -706.240, z = 25.352, s = 0.7, n = "ATM"},
	{i = 277, x = -538.225, y = -854.423, z = 29.234, s = 0.7, n = "ATM"},
	{i = 277, x = -711.156, y = -818.958, z = 23.768, s = 0.7, n = "ATM"},
	{i = 277, x = -717.614, y = -915.880, z = 19.268, s = 0.7, n = "ATM"},
	{i = 277, x = -526.566, y = -1222.90, z = 18.434, s = 0.7, n = "ATM"},
	{i = 277, x = -256.831, y = -719.646, z = 33.444, s = 0.7, n = "ATM"},
	{i = 277, x = -203.548, y = -861.588, z = 30.205, s = 0.7, n = "ATM"},
	{i = 277, x = 112.4102, y = -776.162, z = 31.427, s = 0.7, n = "ATM"},
	{i = 277, x = 112.9290, y = -818.710, z = 31.386, s = 0.7, n = "ATM"},
	{i = 277, x = 119.9000, y = -883.826, z = 31.191, s = 0.7, n = "ATM"},
	{i = 277, x = 149.4551, y = -1038.95, z = 29.366, s = 0.7, n = "ATM"},
	{i = 277, x = -846.304, y = -340.402, z = 38.687, s = 0.7, n = "ATM"},
	{i = 277, x = -1204.35, y = -324.391, z = 37.877, s = 0.7, n = "ATM"},
	{i = 277, x = -1216.27, y = -331.461, z = 37.773, s = 0.7, n = "ATM"},
	{i = 277, x = -56.1935, y = -1752.53, z = 29.452, s = 0.7, n = "ATM"},
	{i = 277, x = -261.692, y = -2012.64, z = 30.121, s = 0.7, n = "ATM"},
	{i = 277, x = -273.001, y = -2025.60, z = 30.197, s = 0.7, n = "ATM"},
	{i = 277, x = 314.187, y = -278.621, z = 54.170, s = 0.7, n = "ATM"},
	{i = 277, x = -351.534, y = -49.529, z = 49.042, s = 0.7, n = "ATM"},
	{i = 277, x = 24.589, y = -946.056, z = 29.357, s = 0.7, n = "ATM"},
	{i = 277, x = -254.112, y = -692.483, z = 33.616, s = 0.7, n = "ATM"},
	{i = 277, x = -1570.197, y = -546.651, z = 34.955, s = 0.7, n = "ATM"},
	{i = 277, x = -1415.909, y = -211.825, z = 46.500, s = 0.7, n = "ATM"},
	{i = 277, x = -1430.112, y = -211.014, z = 46.500, s = 0.7, n = "ATM"},
	{i = 277, x = 33.232, y = -1347.849, z = 29.497, s = 0.7, n = "ATM"},
	{i = 277, x = 129.216, y = -1292.347, z = 29.269, s = 0.7, n = "ATM"},
	{i = 277, x = 287.645, y = -1282.646, z = 29.659, s = 0.7, n = "ATM"},
	{i = 277, x = 289.012, y = -1256.545, z = 29.440, s = 0.7, n = "ATM"},
	{i = 277, x = 295.839, y = -895.640, z = 29.217, s = 0.7, n = "ATM"},
	{i = 277, x = 1686.753, y = 4815.809, z = 42.008, s = 0.7, n = "ATM"},
	{i = 277, x = -302.408, y = -829.945, z = 32.417, s = 0.7, n = "ATM"},
	{i = 277, x = 5.134, y = -919.949, z = 29.557, s = 0.7, n = "ATM"},
	{i = 277, x = 527.26, y = -160.76, z = 57.09, s = 0.7, n = "ATM"},

	{i = 277, x = -867.19, y = -186.99, z = 37.84, s = 0.7, n = "ATM"},
	{i = 277, x = -821.62, y = -1081.88, z = 11.13, s = 0.7, n = "ATM"},
	{i = 277, x = -1315.32, y = -835.96, z = 16.96, s = 0.7, n = "ATM"},
	{i = 277, x = -660.71, y = -854.06, z = 24.48, s = 0.7, n = "ATM"},
	{i = 277, x = -1109.73, y = -1690.81, z = 4.37, s = 0.7, n = "ATM"},
	{i = 277, x = -1091.5, y = 2708.66, z = 18.95, s = 0.7, n = "ATM"},
	{i = 277, x = 1171.98, y = 2702.55, z = 38.18, s = 0.7, n = "ATM"},
	{i = 277, x = 2683.09, y = 3286.53, z = 55.24, s = 0.7, n = "ATM"},
	{i = 277, x = 89.61, y = 2.37, z = 68.31, s = 0.7, n = "ATM"},
	{i = 277, x = -30.3, y = -723.76, z = 44.23, s = 0.7, n = "ATM"},
	{i = 277, x = -28.07, y = -724.61, z = 44.23, s = 0.7, n = "ATM"},
	{i = 277, x = -613.24, y = -704.84, z = 31.24, s = 0.7, n = "ATM"},
	{i = 277, x = -618.84, y = -707.9, z = 30.5, s = 0.7, n = "ATM"},
	{i = 277, x = -1289.23, y = -226.77, z = 42.45, s = 0.7, n = "ATM"},
	{i = 277, x = -1285.6, y = -224.28, z = 42.45, s = 0.7, n = "ATM"},
	{i = 277, x = -1286.24, y = -213.39, z = 42.45, s = 0.7, n = "ATM"},
	{i = 277, x = -1282.54, y = -210.45, z = 42.45, s = 0.7, n = "ATM"},
}

-- ATM Object Models
local ATMs = {
    {o = -870868698, c = 'blue'}, 
    {o = -1126237515, c = 'blue'}, 
    {o = -1364697528, c = 'red'}, 
    {o = 506770882, c = 'green'}
}

Citizen.CreateThread(function()
	while ESX == nil or ORP == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(2000)
	end
	Citizen.Wait(2000)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if playerNearBank() and not inMenu then
            DisplayHelpText("Press ~INPUT_PICKUP~ to access your bank")
            if IsControlJustPressed(0, 38) then
                openPlayersBank('bank')
                local ped = GetPlayerPed(-1)
            end
        end
        if IsControlJustPressed(0, 322) then
            inMenu = false
            SetNuiFocus(false, false)
            SendNUIMessage({type = 'close'})
        end
    end
end)

RegisterCommand('atm', function(source, args) -- Command to access ATM when players are near instead of spam notifications when near an ATM
    if playerNearATM() then
        openPlayersBank('atm')
        local ped = GetPlayerPed(-1)
    else
        exports['mythic_notify']:DoHudText('error', 'You are not near an ATM')
    end
end)

function openPlayersBank(type, color)
    local dict = 'anim@amb@prop_human_atm@interior@male@enter'
    local anim = 'enter'
    local ped = GetPlayerPed(-1)
    local time = 2500

    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(7)
    end

    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    exports['progressBars']:startUI(time, "Inserting card...")
    Citizen.Wait(time)
    ClearPedTasks(ped)
    if type == 'bank' then
        inMenu = true
        SetNuiFocus(true, true)
        bankColor = "green"
        SendNUIMessage({type = 'openBank', color = bankColor})
        TriggerServerEvent('orp:bank:balance')
        atATM = false
    elseif type == 'atm' then
        inMenu = true
        SetNuiFocus(true, true)
        SendNUIMessage({type = 'openBank', color = bankColor})
        TriggerServerEvent('orp:bank:balance')
        atATM = true
    end
end

function playerNearATM() -- Check if a player is near ATM when they use command /atm
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    for i = 1, #ATMs do
        local atm = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, ATMs[i].o, false, false, false)
        local atmPos = GetEntityCoords(atm)
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, atmPos.x, atmPos.y, atmPos.z, true)
        if dist < 1.5 then
            bankColor = ATMs[i].c
            return true
        end
    end
end

function playerNearBank() -- Checks if a player is near a bank
    local pos = GetEntityCoords(GetPlayerPed(-1))

    for _, search in pairs(bankLocations) do
        local dist = GetDistanceBetweenCoords(search.x, search.y, search.z, pos.x, pos.y, pos.z, true)

        if dist <= 1.0 then
            color = "green"
            return true
        end
    end
end

local blipsLoaded = false

Citizen.CreateThread(function() -- Add bank blips
    while true do
        Citizen.Wait(2000)
        if not blipsLoaded then
            for k, v in ipairs(bankLocations) do
                local blip = AddBlipForCoord(v.x, v.y, v.z)
		        SetBlipSprite(blip, v.i)
		        SetBlipScale(blip, v.s)
		        SetBlipAsShortRange(blip, true)
			    SetBlipColour(blip, v.c)
		        BeginTextCommandSetBlipName("STRING")
		        AddTextComponentString(tostring(v.n))
		        EndTextCommandSetBlipName(blip) 
            end
            blipsLoaded = true
        end
    end
end)

RegisterNetEvent('orp:bank:info')
AddEventHandler('orp:bank:info', function(balance)
    local id = PlayerId()
    local playerName = GetPlayerName(id)

    SendNUIMessage({
		type = "updateBalance",
		balance = balance,
        player = playerName,
		})
end)

RegisterNUICallback('deposit', function(data)
    if not atATM then
        TriggerServerEvent('orp:bank:deposit', tonumber(data.amount))
        TriggerServerEvent('orp:bank:balance')
    else
        exports['mythic_notify']:DoHudText('error', 'You cannot deposit money at an ATM')
    end
end)

RegisterNUICallback('withdrawl', function(data)
    TriggerServerEvent('orp:bank:withdraw', tonumber(data.amountw))
    TriggerServerEvent('orp:bank:balance')
end)

RegisterNUICallback('balance', function()
    TriggerServerEvent('orp:bank:balance')
end)

RegisterNetEvent('orp:balance:back')
AddEventHandler('orp:balance:back', function(balance)
    SendNUIMessage({type = 'balanceReturn', bal = balance})
end)

function closePlayersBank()
    local dict = 'anim@amb@prop_human_atm@interior@male@exit'
    local anim = 'exit'
    local ped = GetPlayerPed(-1)
    local time = 1800

    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(7)
    end

    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeAll'})
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    exports['progressBars']:startUI(time, "Retrieving card...")
    Citizen.Wait(time)
    ClearPedTasks(ped)
    inMenu = false
end

RegisterNUICallback('transfer', function(data)
    TriggerServerEvent('orp:bank:transfer', data.to, data.amountt)
    TriggerServerEvent('orp:bank:balance')
end)

RegisterNetEvent('orp:bank:notify')
AddEventHandler('orp:bank:notify', function(type, message)
    exports['mythic_notify']:DoHudText(type, message)
end)

AddEventHandler('onResourceStop', function(resource)
    inMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeAll'})
end)

RegisterNUICallback('NUIFocusOff', function()
    closePlayersBank()
end)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end