local LastSex = -1
local LoadSkin = nil
local LoadClothes = nil
local Character = {}

for i=1, #Config.Components, 1 do
	Character[Config.Components[i].name] = Config.Components[i].value
end

function LoadDefaultModel(malePed, cb)
	local playerPed = PlayerPedId()
	local characterModel

	if malePed then
		characterModel = `mp_m_freemode_01`
	else
		characterModel = `mp_f_freemode_01`
	end

	RequestModel(characterModel)

	CreateThread(function()
		while not HasModelLoaded(characterModel) do
			Wait(0)
		end

		if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
			SetPlayerModel(PlayerId(), characterModel)
			SetPedDefaultComponentVariation(playerPed)
		end

		SetModelAsNoLongerNeeded(characterModel)

		if cb ~= nil then
			cb()
		end

		TriggerEvent('skinchanger:modelLoaded')
	end)
end

function GetMaxVals()
	local playerPed = PlayerPedId()

	local data = {
		sex = 1,
		face = 45,
		skin = 45,
		nosew = 10,
		noseh = 10,
		nosel = 10,
		nosebh = 10,
		nosepl = 10,
		noset = 10,
		eyebh = 10,
		eyebf = 10,
		cbh = 10,
		cbw = 10,
		chw = 10,
		eyeop = 10,
		lipst = 10,
		jbw = 10,
		jbbl = 10,
		chbbl = 10,
		chbble = 10,
		chbw = 10,
		chho = 10,
		neckt = 10,
		age_1 = GetNumHeadOverlayValues(3)-1,
		age_2 = 10,
		beard_1 = GetNumHeadOverlayValues(1)-1,
		beard_2 = 10,
		beard_3 = GetNumHairColors()-1,
		beard_4 = GetNumHairColors()-1,
		hair_1 = GetNumberOfPedDrawableVariations(playerPed, 2) - 1,
		hair_2 = GetNumberOfPedTextureVariations(playerPed, 2, Character['hair_1']) - 1,
		hair_color_1 = GetNumHairColors()-1,
		hair_color_2 = GetNumHairColors()-1,
		eye_color = 31,
		eyebrows_1 = GetNumHeadOverlayValues(2)-1,
		eyebrows_2 = 10,
		eyebrows_3 = GetNumHairColors()-1,
		eyebrows_4 = GetNumHairColors()-1,
		makeup_1 = GetNumHeadOverlayValues(4)-1,
		makeup_2 = 10,
		makeup_3 = GetNumHairColors()-1,
		makeup_4 = GetNumHairColors()-1,
		lipstick_1 = GetNumHeadOverlayValues(8)-1,
		lipstick_2 = 10,
		lipstick_3 = GetNumHairColors()-1,
		lipstick_4 = GetNumHairColors()-1,
		blemishes_1 = GetNumHeadOverlayValues(0)-1,
		blemishes_2 = 10,
		blush_1 = GetNumHeadOverlayValues(5)-1,
		blush_2 = 10,
		blush_3 = GetNumHairColors()-1,
		complexion_1 = GetNumHeadOverlayValues(6)-1,
		complexion_2 = 10,
		sun_1 = GetNumHeadOverlayValues(7)-1,
		sun_2 = 10,
		moles_1 = GetNumHeadOverlayValues(9)-1,
		moles_2 = 10,
		chest_1 = GetNumHeadOverlayValues(10)-1,
		chest_2 = 10,
		chest_3 = GetNumHairColors()-1,
		bodyb_1 = GetNumHeadOverlayValues(11)-1,
		bodyb_2 = 10,
		ears_1 = GetNumberOfPedPropDrawableVariations(playerPed, 2) - 1,
		ears_2 = GetNumberOfPedPropTextureVariations(playerPed, 2, Character['ears_1'] - 1),
		tshirt_1 = GetNumberOfPedDrawableVariations(playerPed, 8) - 1,
		tshirt_2 = GetNumberOfPedTextureVariations(playerPed, 8, Character['tshirt_1']) - 1,
		torso_1 = GetNumberOfPedDrawableVariations(playerPed, 11) - 1,
		torso_2 = GetNumberOfPedTextureVariations(playerPed, 11, Character['torso_1']) - 1,
		decals_1 = GetNumberOfPedDrawableVariations(playerPed, 10) - 1,
		decals_2 = GetNumberOfPedTextureVariations(playerPed, 10, Character['decals_1']) - 1,
		arms = GetNumberOfPedDrawableVariations(playerPed, 3) - 1,
		arms_2 = 10,
		pants_1 = GetNumberOfPedDrawableVariations(playerPed, 4) - 1,
		pants_2 = GetNumberOfPedTextureVariations(playerPed, 4, Character['pants_1']) - 1,
		shoes_1 = GetNumberOfPedDrawableVariations(playerPed, 6) + 1,
		shoes_2 = GetNumberOfPedTextureVariations(playerPed, 6, Character['shoes_1']) + 1,
		mask_1 = GetNumberOfPedDrawableVariations(playerPed, 1) - 1,
		mask_2 = GetNumberOfPedTextureVariations(playerPed, 1, Character['mask_1']) - 1,
		bproof_1 = GetNumberOfPedDrawableVariations(playerPed, 9) - 1,
		bproof_2 = GetNumberOfPedTextureVariations(playerPed, 9, Character['bproof_1']) - 1,
		chain_1 = GetNumberOfPedDrawableVariations(playerPed, 7) - 1,
		chain_2 = GetNumberOfPedTextureVariations(playerPed, 7, Character['chain_1']) - 1,
		bags_1 = GetNumberOfPedDrawableVariations(playerPed, 5) - 1,
		bags_2 = GetNumberOfPedTextureVariations(playerPed, 5, Character['bags_1']) - 1,
		helmet_1 = GetNumberOfPedPropDrawableVariations(playerPed, 0) - 1,
		helmet_2 = GetNumberOfPedPropTextureVariations(playerPed, 0, Character['helmet_1']) - 1,
		glasses_1 = GetNumberOfPedPropDrawableVariations(playerPed, 1) - 1,
		glasses_2 = GetNumberOfPedPropTextureVariations(playerPed, 1, Character['glasses_1'] - 1),
		watches_1 = GetNumberOfPedPropDrawableVariations(playerPed, 6) - 1,
		watches_2 = GetNumberOfPedPropTextureVariations(playerPed, 6, Character['watches_1']) - 1,
		bracelets_1 = GetNumberOfPedPropDrawableVariations(playerPed, 7) - 1,
		bracelets_2 = GetNumberOfPedPropTextureVariations(playerPed, 7, Character['bracelets_1'] - 1)
	}

	return data
end

local skinOptions = {'sex', 'face', 'skin', 'age_1', 'age_2', 'eye_color', 'beard_1', 'beard_2', 'beard_3', 'beard_4', 'hair_1', 'hair_2', 'hair_color_1', 'hair_color_2', 'eyebrows_1', 'eyebrows_2', 'eyebrows_3', 'eyebrows_4', 'makeup_1', 'makeup_2', 'makeup_3', 'makeup_4', 'lipstick_1', 'lipstick_2', 'lipstick_3', 'lipstick_4', 'blemishes_1', 'blemishes_2', 'blush_1', 'blush_2', 'blush_3', 'complexion_1', 'complexion_2', 'sun_1', 'sun_2', 'moles_1', 'moles_2', 'chest_1', 'chest_2', 'chest_3', 'bodyb_1', 'bodyb_2'}
function ApplySkin(skin, clothes)
	local playerPed = PlayerPedId()

	for k,v in pairs(skin) do
		Character[k] = v
	end

	if clothes ~= nil then
		for k,v in pairs(clothes) do
			local resultDefault = false
			for _, item in pairs(skinOptions) do
				if k == item then
					resultDefault = false
					break
				else
					resultDefault = true
				end
			end
			if resultDefault then
				Character[k] = v
			end
		end
	end

	SetPedHeadBlendData(playerPed, Character['face'], Character['face'], Character['face'], Character['skin'], Character['skin'], Character['skin'], 1.0, 1.0, 1.0, true)

	SetPedHairColor(playerPed, Character['hair_color_1'], Character['hair_color_2']) -- Hair Color
	SetPedHeadOverlay(playerPed, 3, Character['age_1'],	(Character['age_2'] / 10) + 0.0) -- Age + opacity
	SetPedHeadOverlay(playerPed, 1,	Character['beard_1'], (Character['beard_2'] / 10) + 0.0) -- Beard + opacity
	SetPedEyeColor(playerPed, Character['eye_color'], 0, 1) -- Eyes color
	SetPedHeadOverlay(playerPed, 2,	Character['eyebrows_1'], (Character['eyebrows_2'] / 10) + 0.0) -- Eyebrows + opacity
	SetPedHeadOverlay(playerPed, 4,	Character['makeup_1'], (Character['makeup_2'] / 10) + 0.0) -- Makeup + opacity
	SetPedHeadOverlay(playerPed, 8,	Character['lipstick_1'], (Character['lipstick_2'] / 10) + 0.0) -- Lipstick + opacity
	SetPedComponentVariation(playerPed, 2, Character['hair_1'], Character['hair_2'], 2) -- Hair
	SetPedHeadOverlayColor(playerPed, 1, 1,	Character['beard_3'], Character['beard_4']) -- Beard Color
	SetPedHeadOverlayColor(playerPed, 2, 1,	Character['eyebrows_3'], Character['eyebrows_4']) -- Eyebrows Color
	SetPedHeadOverlayColor(playerPed, 4, 1,	Character['makeup_3'], Character['makeup_4']) -- Makeup Color
	SetPedHeadOverlayColor(playerPed, 8, 1,	Character['lipstick_3'], Character['lipstick_4']) -- Lipstick Color
	SetPedHeadOverlay(playerPed, 5,	Character['blush_1'], (Character['blush_2'] / 10) + 0.0) -- Blush + opacity
	SetPedHeadOverlayColor(playerPed, 5, 2,	Character['blush_3']) -- Blush Color
	SetPedHeadOverlay(playerPed, 6,	Character['complexion_1'], (Character['complexion_2'] / 10) + 0.0) -- Complexion + opacity
	SetPedHeadOverlay(playerPed, 7,	Character['sun_1'], (Character['sun_2'] / 10) + 0.0) -- Sun Damage + opacity
	SetPedHeadOverlay(playerPed, 9,	Character['moles_1'], (Character['moles_2'] / 10) + 0.0) -- Moles/Freckles + opacity
	SetPedHeadOverlay(playerPed, 10, Character['chest_1'], (Character['chest_2'] / 10) + 0.0) -- Chest Hair + opacity
	SetPedHeadOverlayColor(playerPed, 10, 1, Character['chest_3']) -- Torso Color
	SetPedHeadOverlay(playerPed, 11, Character['bodyb_1'], (Character['bodyb_2'] / 10) + 0.0) -- Body Blemishes + opacity

	SetPedFaceFeature(playerPed, 0, (Character['nosew'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 1, (Character['noseh'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 2, (Character['nosel'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 3, (Character['nosebh'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 4, (Character['nosepl'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 5, (Character['noset'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 6, (Character['eyebh'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 7, (Character['eyebf'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 8, (Character['cbh'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 9, (Character['cbw'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 10, (Character['chw'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 11, (Character['eyeop'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 12, (Character['lipst'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 13, (Character['jbw'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 14, (Character['jbbl'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 15, (Character['chbbl'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 16, (Character['chbble'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 17, (Character['chbw'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 18, (Character['chho'] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 19, (Character['neckt'] / 10) + 0.0)


	if Character['ears_1'] == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex(playerPed, 2, Character['ears_1'], Character['ears_2'], 2) -- Ears Accessories
	end

	SetPedComponentVariation(playerPed, 8, Character['tshirt_1'], Character['tshirt_2'], 2) -- Tshirt
	SetPedComponentVariation(playerPed, 11, Character['torso_1'], Character['torso_2'], 2) -- torso parts
	SetPedComponentVariation(playerPed, 3, Character['arms'], Character['arms_2'], 2) -- Amrs
	SetPedComponentVariation(playerPed, 10, Character['decals_1'], Character['decals_2'], 2) -- decals
	SetPedComponentVariation(playerPed, 4, Character['pants_1'], Character['pants_2'], 2) -- pants
	SetPedComponentVariation(playerPed, 6, Character['shoes_1'], Character['shoes_2'], 2) -- shoes
	SetPedComponentVariation(playerPed, 1, Character['mask_1'], Character['mask_2'], 2) -- mask
	SetPedComponentVariation(playerPed, 9, Character['bproof_1'], Character['bproof_2'], 2) -- bulletproof
	SetPedComponentVariation(playerPed, 7, Character['chain_1'], Character['chain_2'], 2) -- chain
	SetPedComponentVariation(playerPed, 5, Character['bags_1'], Character['bags_2'], 2) -- Bag

	if Character['helmet_1'] == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex(playerPed, 0, Character['helmet_1'], Character['helmet_2'], 2) -- Helmet
	end

	if Character['glasses_1'] == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex(playerPed, 1, Character['glasses_1'], Character['glasses_2'], 2) -- Glasses
	end

	if Character['watches_1'] == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex(playerPed, 6, Character['watches_1'], Character['watches_2'], 2) -- Watches
	end

	if Character['bracelets_1'] == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex(playerPed, 7, Character['bracelets_1'], Character['bracelets_2'], 2) -- Bracelets
	end
end

AddEventHandler('skinchanger:loadDefaultModel', function(loadMale, cb)
	LoadDefaultModel(loadMale, cb)
end)

AddEventHandler('skinchanger:getData', function(cb)
	local components = json.decode(json.encode(Config.Components))

	for k,v in pairs(Character) do
		for i=1, #components, 1 do
			if k == components[i].name then
				components[i].value = v
			end
		end
	end

	cb(components, GetMaxVals())
end)

AddEventHandler('skinchanger:change', function(key, val)
	Character[key] = val

	if key == 'sex' then
		TriggerEvent('skinchanger:loadSkin', Character)
	else
		ApplySkin(Character)
	end
end)

AddEventHandler('skinchanger:getSkin', function(cb)
	cb(Character)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	ClearPedProp(PlayerPedId(), 0)

	if LoadSkin ~= nil then
		ApplySkin(LoadSkin)
		LoadSkin = nil
	end

	if LoadClothes ~= nil then
		ApplySkin(LoadClothes.playerSkin, LoadClothes.clothesSkin)
		LoadClothes = nil
	end
end)

RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb)
	if skin['sex'] ~= LastSex then
		LoadSkin = skin

		if skin['sex'] == 0 then
			TriggerEvent('skinchanger:loadDefaultModel', true, cb)
		else
			TriggerEvent('skinchanger:loadDefaultModel', false, cb)
		end
	else
		ApplySkin(skin)

		if cb ~= nil then
			cb()
		end
	end

	LastSex = skin['sex']
end)

RegisterNetEvent('skinchanger:loadClothes')
AddEventHandler('skinchanger:loadClothes', function(playerSkin, clothesSkin)
	if playerSkin['sex'] ~= LastSex then
		LoadClothes = {
			playerSkin	= playerSkin,
			clothesSkin	= clothesSkin
		}

		if playerSkin['sex'] == 0 then
			TriggerEvent('skinchanger:loadDefaultModel', true)
		else
			TriggerEvent('skinchanger:loadDefaultModel', false)
		end
	else
		ApplySkin(playerSkin, clothesSkin)
	end

	LastSex = playerSkin['sex']
end)

local playerSpawned = false
AddEventHandler('playerSpawned', function()
	playerSpawned = true
end)

CreateThread(function()
	while true do 
		Wait(0)
		if Config.DefaultPrevention and playerSpawned then
			local resultDefault = false
			for item, id in pairs(Config.DefaultItemsToCheck) do
				if Character[item] == id then
					resultDefault = true
					break
				else
					resultDefault = false
				end
			end
			if resultDefault then
				DisableAllControlActions(0)
				EnableControlAction(0, 174, true)
				EnableControlAction(0, 175, true)
				EnableControlAction(0, 173, true)
				EnableControlAction(0, 27, true)
				DefaultDetection()
			end
		end
	end
end)

function DefaultDetection()
	SetTextColour(0, 0, 0, 255)
	SetTextFont(4)
	SetTextScale(0.8, 0.8)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(2, 2, 0, 0, 0)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString("~r~You cannot join with the default configuration.\n Please change your look!")
	DrawText(0.5, 0.02)
end