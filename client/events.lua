RegisterNetEvent("mythic_progbar:client:progress")
AddEventHandler("mythic_progbar:client:progress", function(action, cb)
    Progress(action, cb)
end)

RegisterNetEvent("mythic_progbar:client:ProgressWithStartEvent")
AddEventHandler("mythic_progbar:client:ProgressWithStartEvent", function(action, start, finish)
    ProgressWithStartEvent(action, start, finish)
end)

RegisterNetEvent("mythic_progbar:client:ProgressWithTickEvent")
AddEventHandler("mythic_progbar:client:ProgressWithTickEvent", function(action, tick, finish)
    ProgressWithTickEvent(action, tick, finish)
end)

RegisterNetEvent("mythic_progbar:client:ProgressWithStartAndTick")
AddEventHandler("mythic_progbar:client:ProgressWithStartAndTick", function(action, start, tick, finish)
    ProgressWithStartAndTick(action, start, tick, finish)
end)

RegisterNetEvent("mythic_progbar:client:cancel")
AddEventHandler("mythic_progbar:client:cancel", function()
	Cancel()
end)

RegisterNetEvent("mythic_progbar:client:actionCleanup")
AddEventHandler("mythic_progbar:client:actionCleanup", function()
	ActionCleanup()
end)

RegisterNUICallback('actionFinish', function(data, cb)
	Finish()
end)