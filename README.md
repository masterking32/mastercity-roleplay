
# FiveM - Character Selection

**This script adds character selection animations when entering the game. In addition, you can create a character in the next room**

Installation:

es_extended:

1. Go to es_extended/client/main.lua.
2. Replace lines 66-86 to:
```
AddEventHandler('playerSpawned', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(1)
	end

	local playerPed = PlayerPedId()

	-- Restore position
	if ESX.PlayerData.lastPosition and spawned > 0 then
		SetEntityCoords(playerPed, ESX.PlayerData.lastPosition.x, ESX.PlayerData.lastPosition.y, ESX.PlayerData.lastPosition.z)
	end

	Citizen.Wait(1000)

	if spawned == 0 then
		spawned = 1
		SetEntityCoords(PlayerPedId(), 409.42, -1001.14, -99.90, 0.0, 0.0, 0.0, true)
	end

	TriggerEvent('esx:restoreLoadout') -- restore loadout

	isLoadoutLoaded, isPlayerSpawned, isDead = true, true, false

	if Config.EnablePvP then
		SetCanAttackFriendly(playerPed, true, false)
		NetworkSetFriendlyFireOption(true)
	end
end)
```

Into line 4 insert:
```
local spawned = 0
```

esx_skin:
1. Go to esx_skin/client/main.lua.
2. Insert it to line 250 or 269 if you have esx_skin with NPC select:

```
DoScreenFadeOut(1000)
Citizen.Wait(1500)
SetEntityCoords(PlayerPedId(), -205.90, -1012.74, 30.20, 0.0, 0.0, 0.0, true)
TriggerEvent("charselect:enable")
Citizen.Wait(1000)
DoScreenFadeIn(1000)
DisplayRadar(true)
```

esx_identity:
1. Go to esx_identity/client/main.lua.
2. Replace lines 89-92 to:

```
TriggerServerEvent('esx_identity:setIdentity', data, myIdentifiers)
EnableGui(false)
Citizen.Wait(500)
TriggerEvent('charselect:register')
SetTimecycleModifier('default')
```
