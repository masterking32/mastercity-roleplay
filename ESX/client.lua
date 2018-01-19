ESX = nil
local PlayerData                = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


function DrawText3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.5, 0.5)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
		ClearDrawOrigin()
    end
end


Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
        for i = 1, #doorList do
            local playerCoords = GetEntityCoords( GetPlayerPed(-1) )
            local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, GetHashKey(doorList[i]["objName"]), false, false, false)
            
            local objectCoordsDraw = GetEntityCoords( closeDoor )            
            local playerDistance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], true)
			local job = tostring(exports['esx_policejob']:getJob())


                        
            if(playerDistance < 1.25) then
                
                if doorList[i]["locked"] == true then
                    DrawText3d(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "[E] ~r~Locked")
                else
                    DrawText3d(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "[E] ~g~Unlocked")
                end
				
                if job == 'police' and IsControlJustPressed(1,51) then
                    if doorList[i]["locked"] == true then
                        FreezeEntityPosition(closeDoor, false)
                        if(i==10 or i==11) then
                            doorList[10]["locked"] = false
                            doorList[11]["locked"] = false
                        elseif(i==12 or i==13) then
                            doorList[12]["locked"] = false
                            doorList[13]["locked"] = false
                        else
                            doorList[i]["locked"] = false
                        end
                    else
                        FreezeEntityPosition(closeDoor, true)
                        if(i==10 or i==11) then
                            doorList[10]["locked"] = true
                            doorList[11]["locked"] = true
                        elseif(i==12 or i==13) then
                            doorList[12]["locked"] = true
                            doorList[13]["locked"] = true
                        else
                            doorList[i]["locked"] = true
                        end
                    end
                    TriggerServerEvent('door:update', i, doorList[i]["locked"]) -- Broadcast new state of the door to everyone
                end
            else
                FreezeEntityPosition(closeDoor, doorList[i]["locked"])
            end
        end
    end
end)

doorList = {
    -- Mission Row To locker room & roof
    [1] = { ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.69815063477, ["y"]= -986.46911621094,["z"]= 30.689594268799,["locked"]= true,["txtX"]=450.104,["txtY"]=-986.388,["txtZ"]=31.739},
    -- Mission Row Armory
    [2] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 452.61877441406, ["y"]= -982.7021484375,["z"]= 30.689598083496,["locked"]= true,["txtX"]=453.079,["txtY"]=-982.600,["txtZ"]=31.739},
    -- Mission Row Captain Office
    [3] = { ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.23818969727, ["y"]= -980.63006591797,["z"]= 30.689598083496,["locked"]= true,["txtX"]=447.200,["txtY"]=-980.010,["txtZ"]=31.739},
    -- Mission Row To downstairs right
    [4] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.97, ["y"]= -989.033,["z"]= 30.6896,["locked"]= true,["txtX"]=444.020,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row To downstairs left
    [5] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 445.37, ["y"]= -988.705,["z"]= 30.6896,["locked"]= true,["txtX"]=445.350,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row Main cells
    [6] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 463.815, ["y"]= -992.686,["z"]= 24.9149,["locked"]= true,["txtX"]=463.815,["txtY"]=-992.686,["txtZ"]=25.064},
    -- Mission Row Cell 1
    [7] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    -- Mission Row Cell 2
    [8] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    -- Mission Row Cell 3
    [9] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
    -- Mission Row Backdoor in
    [10] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.126, ["y"]= -1002.78,["z"]= 24.9149,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Backdoor out
    [11] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.18, ["y"]= -1004.31,["z"]= 24.9152,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Rooftop In
    [12] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 465.467, ["y"]= -983.446,["z"]= 43.6918,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
    -- Mission Row Rooftop Out
    [13] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 462.979, ["y"]= -984.163,["z"]= 43.6919,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
	-- Mission Row Locker room
	[14] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 451.98, ["y"]= -987.266,["z"]= 30.69,["locked"]= true,["txtX"]=451.98,["txtY"]=-987.266,["txtZ"]=31.30},
	-- SANDY SHORES MAIN DOOR
    [15] = { ["objName"] = "v_ilev_shrfdoor", ["x"]= 1855.105, ["y"]= 3683.516,["z"]= 34.266,["locked"]= true,["txtX"]=1855.105,["txtY"]=3683.516,["txtZ"]=35.00},
	-- Paleto Bay MAIN DOORS
	[16] = { ["objName"] = "v_ilev_shrf2door", ["x"]= -443.14, ["y"]= 6015.685,["z"]= 31.716,["locked"]= true,["txtX"]=-443.14,["txtY"]=6015.685,["txtZ"]=32.00},
	[17] = { ["objName"] = "v_ilev_shrf2door", ["x"]= -443.951, ["y"]= 6016.622,["z"]= 31.716,["locked"]= true,["txtX"]=-443.951,["txtY"]=6016.622,["txtZ"]=32.00},	
}


RegisterNetEvent('door:state')
AddEventHandler('door:state', function(id, isLocked)
    if type(doorList[id]) ~= nil then -- Check if door exists
        doorList[id]["locked"] = isLocked -- Change state of door
    end
end)

