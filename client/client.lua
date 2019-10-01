Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(1, 289) then
            if true then
                SetNuiFocus(true, true)
                SendNUIMessage({type = 'openGuideHud'})
            end
        end
    end
end)

RegisterNUICallback('closeGuideHud', function(data, cb)
	SetNuiFocus(false, false)
end)