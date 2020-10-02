local ESX	 = nil
local open = false
local cam  = nil

-- ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Open the register form, (call from server)
RegisterNetEvent('jsfour-register:open')
AddEventHandler('jsfour-register:open', function()
	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end
	SetCamActive(cam,  true)
	RenderScriptCams(true,  false,  0,  true,  true)
	SetCamCoord(cam, -288.92544555664, -2443.6701660156, 591.98687744141)
	PointCamAtCoord(cam, -169.18321228027, -1056.4204101563, 129.99223327637)

	SetEntityCollision(GetPlayerPed(-1),  false,  false)
	SetEntityVisible(GetPlayerPed(-1),  false)
	FreezeEntityPosition(GetPlayerPed(-1), true);

	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		action = "open"
	})
end)

-- Register the player (call from javascript > send to server < callback from server)
RegisterNUICallback('register', function(data, cb)
	cb('ok')
	ESX.TriggerServerCallback('jsfour-register:register', function( success )
		if success then
			SetNuiFocus(false, false)
			open = false

			SendNUIMessage({
				action = "close"
			})

			DoScreenFadeOut(1000)
			Wait(1000)
			SetCamActive(cam,  false)
			RenderScriptCams(false,  false,  0,  true,  true)
			SetEntityCollision(GetPlayerPed(-1),  true,  true)
			SetEntityVisible(GetPlayerPed(-1),  true)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			--SetEntityCoords(GetPlayerPed(-1), -235.42385864258, -2002.8851318359, 23.685377120972)
			TriggerEvent('hud:loadMenu')
			DoScreenFadeIn(1000)
			Wait(1000)

		end
	end, data)
end)

-- Freeze player movements
Citizen.CreateThread(function()
    while true do
			Citizen.Wait(0)
      if open then
	      DisableControlAction(0, 1, true) -- LookLeftRight
	      DisableControlAction(0, 2, true) -- LookUpDown
	      DisableControlAction(0, 24, true) -- Attack
	      DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
	      DisableControlAction(0, 142, true) -- MeleeAttackAlternate
	      DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
      end
    end
end)
