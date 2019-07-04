local hospitalCheckin = { x = 308.06161499023, y = -595.19683837891, z = 43.291839599609, h = 180.4409942627 }
local pillboxTeleports = {
    { x = 325.48892211914, y = -598.75372314453, z = 43.291839599609, h = 64.513374328613, text = 'Press ~INPUT_CONTEXT~ ~s~to go to lower Pillbox Entrance' },
    { x = 355.47183227539, y = -596.26495361328, z = 28.773477554321, h = 245.85662841797, text = 'Press ~INPUT_CONTEXT~ ~s~to enter Pillbox Hospital' },
    { x = 359.57849121094, y = -584.90911865234, z = 28.817169189453, h = 245.85662841797, text = 'Press ~INPUT_CONTEXT~ ~s~to enter Pillbox Hospital' },
}

local bedOccupying = nil
local bedOccupyingData = nil

local inBedDict = 'switch@franklin@bed'
local inBedAnim = 'sleep_loop'
local getOutAnim = 'sleep_getup_rubeyes'

function PrintHelpText(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function LeaveBed()
    TaskPlayAnim(PlayerPedId(), inBedDict , getOutAnim ,8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(5000)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerServerEvent('mythic_hospital:server:LeaveBed', bedOccupying)

    bedOccupying = nil
    bedOccupyingData = nil
end

RegisterNetEvent('mythic_hospital:client:RPCheckPos')
AddEventHandler('mythic_hospital:client:RPCheckPos', function()
    TriggerServerEvent('mythic_hospital:server:RPRequestBed', GetEntityCoords(PlayerPedId()))
end)

RegisterNetEvent('mythic_hospital:client:RPSendToBed')
AddEventHandler('mythic_hospital:client:RPSendToBed', function(id, data)
    bedOccupying = id
    bedOccupyingData = data

    SetEntityCoords(PlayerPedId(), data.x, data.y, data.z - 0.3)
    RequestAnimDict(inBedDict)
    while not HasAnimDictLoaded(inBedDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), inBedDict , inBedAnim ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(PlayerPedId(), data.h - 90.0)

    Citizen.CreateThread(function()
        while bedOccupyingData ~= nil do
            Citizen.Wait(1)
            PrintHelpText('Press ~INPUT_VEH_DUCK~ to get up')
            if IsControlJustReleased(0, 73) then
                LeaveBed()
            end
        end
    end)
end)

RegisterNetEvent('mythic_hospital:client:SendToBed')
AddEventHandler('mythic_hospital:client:SendToBed', function(id, data)
    bedOccupying = id
    bedOccupyingData = data

    SetEntityCoords(PlayerPedId(), data.x, data.y, data.z - 0.3)
    RequestAnimDict(inBedDict)
    while not HasAnimDictLoaded(inBedDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), inBedDict , inBedAnim ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(PlayerPedId(), data.h - 90.0)

    Citizen.CreateThread(function ()
        Citizen.Wait(5)
        local player = PlayerPedId()

        exports['mythic_notify']:DoHudText('inform', 'Doctors Are Treating You')
        Citizen.Wait(5000)
        TriggerServerEvent('mythic_hospital:server:EnteredBed')
    end)
end)

RegisterNetEvent('mythic_hospital:client:FinishServices')
AddEventHandler('mythic_hospital:client:FinishServices', function()
    SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
    TriggerEvent('mythic_hospital:client:RemoveBleed')
    TriggerEvent('mythic_hospital:client:ResetLimbs')
    exports['mythic_notify']:DoHudText('inform', 'You\'ve Been Treated & Billed')
    LeaveBed()
end)

RegisterNetEvent('mythic_hospital:client:ForceLeaveBed')
AddEventHandler('mythic_hospital:client:ForceLeaveBed', function()
    LeaveBed()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if not exports['mythic_base']:GetIfChoosing() then
            local plyCoords = GetEntityCoords(PlayerPedId(), 0)
            local distance = #(vector3(hospitalCheckin.x, hospitalCheckin.y, hospitalCheckin.z) - plyCoords)
            if distance < 10 then
                DrawMarker(27, hospitalCheckin.x, hospitalCheckin.y, hospitalCheckin.z - 0.99, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)

                if not IsPedInAnyVehicle(PlayerPedId(), true) then
                    if distance < 1 then
                        PrintHelpText('Press ~INPUT_CONTEXT~ ~s~to check in')
                        if IsControlJustReleased(0, 54) then
                            if (GetEntityHealth(PlayerPedId()) < 200) or (IsInjuredOrBleeding()) then
                                exports['mythic_progbar']:Progress({
                                    name = "hospital_action",
                                    duration = 10500,
                                    label = "Checking In",
                                    useWhileDead = false,
                                    canCancel = true,
                                    controlDisables = {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    },
                                    animation = {
                                        animDict = "missheistdockssetup1clipboard@base",
                                        anim = "base",
                                        flags = 49,
                                    },
                                    prop = {
                                        model = "p_amb_clipboard_01",
                                        bone = 18905,
										coords = { x = 0.10, y = 0.02, z = 0.08 },
										rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                    },
                                    propTwo = {
                                        model = "prop_pencil_01",
                                        bone = 58866,
										coords = { x = 0.12, y = 0.0, z = 0.001 },
										rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                    },
                                }, function(status)
                                    if not status then
                                        TriggerServerEvent('mythic_hospital:server:RequestBed')
                                    end
                                end)
                            else
                                exports['mythic_notify']:DoHudText('error', 'You do not need medical attention')
                            end
                        end
                    end
                end
            else
                Citizen.Wait(1000)
            end
        end
    end
end)