local PlayerData                = {}
ESX                             = nil

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Citizen.Wait(1000)
    TriggerServerEvent("charselect:select")
    Visible()
end)

RegisterNetEvent("charselect:register")
AddEventHandler("charselect:register", function()
    Citizen.Wait(1000)
    TriggerEvent("charselect:animation", false)
    SetEntityCoords(PlayerPedId(), 409.42, -1001.14, -99.90, 0.0, 0.0, 0.0, true)
    Visible()
end)

RegisterNetEvent("charselect:enable")
AddEventHandler("charselect:enable", function()
    enable = false
end)

local enable = false
local heading = 360.00
local signmodel = GetHashKey("prop_police_id_board")
local textmodel = GetHashKey("prop_police_id_text")
local scaleform = {}
local text = {}
local cam = nil
local cam2 = nil
local cam3 = nil
local cam4 = nil
local coords = nil
local enable = true
local SignProp1 = {}
local SignProp2 = {}

Citizen.CreateThread(function()
  scaleform = LoadScaleform("mugshot_board_01")
  text = CreateNamedRenderTargetForModel("ID_TEXT", textmodel)

  while text do
      Citizen.Wait(1)
      SetTextRenderId(text) -- set render target
      Set_2dLayer(4)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
      DrawScaleformMovie(scaleform, 0.40, 0.35, 0.80, 0.75, 255, 255, 255, 255, 0)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
      SetTextRenderId(GetDefaultScriptRendertargetRenderId())
  end
end)

RegisterNetEvent("charselect:animation")
AddEventHandler("charselect:animation", function(status)
    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        enable = true
        Session()
        CreateCam()
        TriggerServerEvent("charselect:createsign") 
        TriggerServerEvent("charselect:lastpos")
        AnimationIntro()
        SpawnCharacter()   
        Citizen.Wait(5000)
        if status == true then
            while enable == true do
                Citizen.Wait(1)
                ESX.ShowHelpNotification("Press ~INPUT_FRONTEND_ACCEPT~ to select character.")
                RequestAnimDict("mp_character_creation@customise@male_a")
                TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 8.0, -8.0, -1, 0, 1, 0, 0, 0)
                if IsControlJustReleased(1, 201) then
                    SpawnEntity()
                end
            end
        end
        if status == false then
            while enable == true do
                Citizen.Wait(1)
                ESX.ShowHelpNotification("Press ~INPUT_FRONTEND_ACCEPT~ to go to the character creation.")
                RequestAnimDict("mp_character_creation@customise@male_a")
                TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 8.0, -8.0, -1, 0, 1, 0, 0, 0)
                if IsControlJustReleased(1, 201) then
                    CreateChar()
                end
            end
        end
    end)
end)

RegisterNetEvent("charselect:createsign")
AddEventHandler("charselect:createsign", function(name, job, money) 
    SignProp1 = CreateObject(signmodel, 1, 1, 1, false, true, false)
    SignProp2 = CreateObject(textmodel, 1, 1, 1, false, true, false)

    AttachEntityToEntity(SignProp1, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58868), 0.12, 0.24, 0.0, 5.0, 0.0, 70.0, true, true, false, false, 2, true);
    AttachEntityToEntity(SignProp2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58868), 0.12, 0.24, 0.0, 5.0, 0.0, 70.0, true, true, false, false, 2, true);

    local ScaleformMovie = RequestScaleformMovie("MUGSHOT_BOARD_01")

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    while HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
        PushScaleformMovieFunction(ScaleformMovie, "SET_BOARD")
        PushScaleformMovieFunctionParameterString(job)
        PushScaleformMovieFunctionParameterString(name)
        PushScaleformMovieFunctionParameterString("LOS SANTOS POLICE DEPT")
        PushScaleformMovieFunctionParameterString(money)
        PushScaleformMovieFunctionParameterString(0)
        PushScaleformMovieFunctionParameterString(5)
        PushScaleformMovieFunctionParameterString(0)
        PopScaleformMovieFunctionVoid()
    end
end)

RegisterNetEvent("charselect:lastpos")
AddEventHandler("charselect:lastpos", function(position) 
    coords = position
end)

function Session()
    Citizen.Wait(1000)
    DoScreenFadeOut(1000)
    Citizen.Wait(10000)
    SetEntityHeading(PlayerPedId(), 350.0)
    DisplayRadar(false) 
    DoScreenFadeIn(1000)
end

function CreateCam()
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 415.55, -998.50, -99.29, 0.00, 0.00, 89.75, 50.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 2000, true, true) 
end

function AnimationIntro()
    RequestAnimDict("mp_character_creation@lineup@male_a")
    Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_a", "intro", 1.0, 1.0, 5900, 0, 1, 0, 0, 0)
    Citizen.Wait(5700)
    RequestAnimDict("mp_character_creation@customise@male_a")
    Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 1.0, 1.0, -1, 0, 1, 0, 0, 0)
end

function SpawnEntity()
    RequestAnimDict("mp_character_creation@lineup@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_a", "outro", 1.0, 1.0, 9000, 0, 1, 0, 0, 0)
    Citizen.Wait(8000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    DeleteObject(SignProp1)
    DeleteObject(SignProp2)
    if coords.x > 390.00 and coords.x < 440.00 then
    SetEntityCoords(PlayerPedId(), -205.90, -1012.74, 30.20, 0.0, 0.0, 0.0, false)
    else
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z+2.0, 0.0, 0.0, 0.0, false)
    end
    RenderScriptCams(false, true, 500, true, true)                                              
    enable = false
    DisplayRadar(true)
    Collision(false)
end

function CreateChar()
    RequestAnimDict("mp_character_creation@lineup@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_a", "outro", 1.0, 1.0, 9000, 0, 1, 0, 0, 0)
    Citizen.Wait(8000)
    DeleteObject(SignProp1)
    DeleteObject(SignProp2)
    CharCreator()
end

function CharCreator()
    DoScreenFadeOut(2000)
    Citizen.Wait(2000) 
    DestroyAllCams(true)
    cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.92, -1000.72, -99.01, 0.00, 0.00, 0.00, 50.00, false, 0)
    SetCamActive(cam3, true)
    Citizen.Wait(500)
    DoScreenFadeIn(2000)
    SetEntityCoords(PlayerPedId(), 405.59, -997.18, -99.00, 0.0, 0.0, 0.0, true)
    SetEntityHeading(PlayerPedId(), 90.00)
    Citizen.Wait(100)
    cam4 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -99.00, 0.00, 0.00, 0.00, 70.00, false, 0)
    PointCamAtCoord(cam4, 402.99, -998.02, -99.00)
    SetCamActiveWithInterp(cam4, cam3, 5000, true, true)
    RequestAnimDict("mp_character_creation@customise@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 7000, 0, 1, 0, 0, 0)
    Citizen.Wait(7000)
    RenderScriptCams(false, true, 500, true, true)      
    Citizen.Wait(100)
    SetPlayerModel(PlayerPedId(), "mp_m_freemode_01")
    TriggerEvent('esx_skin:openSaveableMenu', PlayerPedId())
end

function SpawnCharacter()
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 413.40, -998.43, -99.01, 0.00, 0.00, 89.75, 50.00, false, 0)
    PointCamAtCoord(cam2, 413.40, -998.43, -99.01)
    SetCamActiveWithInterp(cam2, cam, 5000, true, true)
end

function Collision()
    for i=1,256 do
        if NetworkIsPlayerActive(i) then
            SetEntityVisible(GetPlayerPed(i), false, false)
            SetEntityVisible(PlayerPedId(), true, true)
            SetEntityNoCollisionEntity(GetPlayerPed(i), GetPlayerPed(-1), false)
        end
    end
end

function Visible()
    while enable == true do
        Citizen.Wait(0)
        Collision()
    end
end

function LoadScaleform (scaleform)
    local text = RequestScaleformMovie(scaleform)

    if text ~= 0 then
        while not HasScaleformMovieLoaded(text) do
            Citizen.Wait(0)
        end
    end

    return text
end

function CreateNamedRenderTargetForModel(name, model)
    local text = 0
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, 0)
    end
    if not IsNamedRendertargetLinked(model) then
        LinkNamedRendertarget(model)
    end
    if IsNamedRendertargetRegistered(name) then
        text = GetNamedRendertargetRenderId(name)
    end

    return text
end
