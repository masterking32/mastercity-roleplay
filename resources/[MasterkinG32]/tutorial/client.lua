RegisterNetEvent("tutorial:spawn")
AddEventHandler("tutorial:spawn", function()
    DoScreenFadeOut(1000)
  	-- Here is where you set where you want to player to spawn after they complete the tutorial
    SetEntityCoords(GetPlayerPed(-1), tonumber("-1556.64"), tonumber("-3234.5"), tonumber("26.34"), 1, 0, 0, 1)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)   
end)





