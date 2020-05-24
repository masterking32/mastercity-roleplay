Config = {}
Config.Locale = 'en'

-- Enable the below if you want to stop people from pressing enter immediately 
-- and having boring default characters
Config.DefaultPrevention = true

-- Increase the amount of items you want to check that are default for better
-- default prevention, the more you have here the more the player will need to
-- change before starting. Items types are available below
-- [component name] = component id
Config.DefaultItemsToCheck = {
	['tshirt_1'] = 0,
	['torso_1'] = 0,
	['shoes_1'] = 0
}

-- The message to display to the user if they haven't changed the items listed above
Config.DefaultMessage = "~r~You cannot join with the default configuration.\n Please change your look!"

-- All the components to show on the menu, they will be displayed in this order
Config.Components = {
	-- Body
	{label = _U('sex'), name = 'sex', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('face'), name = 'face', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('skin'), name = 'skin', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('nosew'), name = 'nosew', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('noseh'), name = 'noseh', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('nosel'), name = 'nosel', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('nosebh'), name = 'nosebh', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('nosepl'), name = 'nosepl', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('noset'), name = 'noset', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyebh'), name = 'eyebh', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyebf'), name = 'eyebf', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('cbh'), name = 'cbh', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('cbw'), name = 'cbw', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('chw'), name = 'chw', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyeop'), name = 'eyeop', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('lipst'), name = 'lipst', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('jbw'), name = 'jbw', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('jbbl'), name = 'jbbl', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('chbbl'), name = 'chbbl', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('chbble'), name = 'chbble', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('chbw'), name = 'chbw', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('chho'), name = 'chho', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('neckt'), name = 'neckt', value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('bodyb'), name = 'bodyb_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('bodyb_size'), name = 'bodyb_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('wrinkles'), name = 'age_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('wrinkle_thickness'), name = 'age_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('blemishes'), name = 'blemishes_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('blemishes_size'), name = 'blemishes_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('complexion'), name = 'complexion_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('complexion_1'), name = 'complexion_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('sun'), name = 'sun_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('sun_1'), name = 'sun_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('freckles'), name = 'moles_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('freckles_1'), name = 'moles_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 

	-- Makeup
	{label = _U('blush'), name = 'blush_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('blush_1'), name = 'blush_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('blush_color'), name = 'blush_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('makeup_type'), name = 'makeup_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('makeup_thickness'), name = 'makeup_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('makeup_color_1'), name = 'makeup_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('makeup_color_2'), name = 'makeup_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('lipstick_type'), name = 'lipstick_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('lipstick_thickness'), name = 'lipstick_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('lipstick_color_1'), name = 'lipstick_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('lipstick_color_2'), name = 'lipstick_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 

	-- Hair
	{label = _U('hair_1'), name = 'hair_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('hair_2'), name = 'hair_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('hair_color_1'), name = 'hair_color_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('hair_color_2'), name = 'hair_color_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('eye_color'), name = 'eye_color', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyebrow_size'), name = 'eyebrows_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyebrow_type'), name = 'eyebrows_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyebrow_color_1'), name = 'eyebrows_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('eyebrow_color_2'), name = 'eyebrows_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('beard_type'), name = 'beard_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('beard_size'), name = 'beard_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('beard_color_1'), name = 'beard_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('beard_color_2'), name = 'beard_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('chest_hair'), name = 'chest_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('chest_hair_1'), name = 'chest_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('chest_color'), name = 'chest_3', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 

	-- Clothing
	{label = _U('tshirt_1'), name = 'tshirt_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15}, 
	{label = _U('tshirt_2'), name = 'tshirt_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15, textureof = 'tshirt_1'}, 
	{label = _U('torso_1'), name = 'torso_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15}, 
	{label = _U('torso_2'), name = 'torso_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15, textureof = 'torso_1'}, 
	{label = _U('decals_1'), name = 'decals_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15}, 
	{label = _U('decals_2'), name = 'decals_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15, textureof = 'decals_1'}, 
	{label = _U('arms'), name = 'arms', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15}, 
	{label = _U('arms_2'), name = 'arms_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.15}, 
	{label = _U('pants_1'), name = 'pants_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = -0.5}, 
	{label = _U('pants_2'), name = 'pants_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = -0.5, textureof = 'pants_1'}, 
	{label = _U('shoes_1'), name = 'shoes_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = -0.8}, 
	{label = _U('shoes_2'), name = 'shoes_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = -0.8, textureof = 'shoes_1'}, 
	{label = _U('mask_1'), name = 'mask_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('mask_2'), name = 'mask_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'mask_1'}, 
	{label = _U('bproof_1'), name = 'bproof_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('bproof_2'), name = 'bproof_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bproof_1'}, 
	{label = _U('chain_1'), name = 'chain_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('chain_2'), name = 'chain_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'chain_1'}, 
	{label = _U('helmet_1'), name = 'helmet_1', value = -1, min = -1, zoomOffset = 0.6, camOffset = 0.65, componentId = 0}, 
	{label = _U('helmet_2'), name = 'helmet_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'helmet_1'}, 
	{label = _U('glasses_1'), name = 'glasses_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65}, 
	{label = _U('glasses_2'), name = 'glasses_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'glasses_1'}, 
	{label = _U('watches_1'), name = 'watches_1', value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('watches_2'), name = 'watches_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'watches_1'}, 
	{label = _U('bracelets_1'), name = 'bracelets_1', value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('bracelets_2'), name = 'bracelets_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bracelets_1'}, 
	{label = _U('bag'), name = 'bags_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15}, 
	{label = _U('bag_color'), name = 'bags_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bags_1'}, 
	{label = _U('ear_accessories'), name = 'ears_1', value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.65}, 
	{label = _U('ear_accessories_color'), name = 'ears_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65, textureof = 'ears_1'}
}