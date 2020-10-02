Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 8000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true
Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 5  * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 20000

Config.RespawnPoint = { coords = vector3(316.62, -1376.82, 31.92), heading = 52.24}

Config.Hospitals = {

	PillBoxHospital = {

		Blip = {
			coords = vector3(310.67, -595.75, 43.28),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(334.46, -594.25, 42.28)
		},

		Pharmacies = {
			vector3(311.97, -597.57, 42.28)
		},

		Vehicles = {
			{
				Spawner = vector3(293.07, -599.87, 43.3),
				InsideShop = vector3(321.37, -565.59, 90.61),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(296.59, -604.9, 43.06), heading = 71.04, radius = 4.0 },
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.49, -587.04, 74.17),
				InsideShop = vector3(350.75, -588.05, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(350.75, -588.05, 74.17), heading = 76.67, radius = 10.0 },
				}
			}
		},

		FastTravels = {
			{
				From = vector3(327.33, -603.3, 43.28),
				To = { coords = vector3(350.69, -588.03, 74.17), heading = 245.5 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},
			{
				From = vector3(338.53, -583.8, 74.17),
				To = { coords = vector3(329.68, -600.79, 43.28), heading = 80.5 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},
			
		},

		FastTravelsPrompt = {
			{
				From = vector3(332.227, -595.82, 43.28),
				To = { coords = vector3(280.07, -1348.97, 24.54), heading = 319.7 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(280.07, -1348.97, 24.54),
				To = { coords = vector3(332.227, -595.82, 43.28), heading = 160.55 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}

	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	emts = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	emtaparamedics = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	corporal = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	seniorparamedic = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	lieutenant = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	captain = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	major = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
	},

	assistantdirector = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}

	},

	director = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 100},
		{ model = 'dodgeems', label = 'dodgeems', price = 100}
		
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 150000 }
	},

	chief_doctor = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 150000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 300000 }
	},

	boss = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	emts = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	emtaparamedics = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	corporal = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	seniorparamedic = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	lieutenant = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }
	
	},

	captain = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	major = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	assistantdirector = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	},

	director = {
		{ model = 'polmav', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }

	}
}
