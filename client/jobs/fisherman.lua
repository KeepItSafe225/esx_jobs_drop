Config.Jobs.fisherman = {

	BlipInfos = {
		Sprite = 68,
		Color = 38
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = "benson",
			Trailer = "none",
			HasCaution = true
		},

		Boat = {
			Spawner = 2,
			Hash = "tug",
			Trailer = "none",
			HasCaution = false
		}

	},

	Zones = {

		CloakRoom = {
			-- Pos   = {x = 868.39, y = -1639.75, z = 29.33},
			Pos   = {x = 726.83, y = 4169.57, z = 40.5},
			Size = {x = 1.5, y = 1.5, z = 1.5},
			Color = {r = 204, g = 204, b = 0},
			Marker= 20,
			Blip  = true,
			Name  = _U('fm_fish_locker'),
			Type  = "cloakroom",
			Hint  = _U('cloak_change'),
			GPS = {x = 726.83, y = 4169.57, z = 40.5},
		},

		FishingSpot_1 = {
			Pos   = {x = 714.49, y = 4092.58, z = 34.7},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Marker= 20,
			Blip  = true,
			Name  = _U('fm_fish_area'),
			Type  = "work",
			Hint  = _U('fm_fish_button'),
			GPS   = 0,
			Item = {
				{
					name   = _U('fm_fish'),
					db_name= "fish",
					time   = 2000,
					max    = 100,
					add    = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop   = 100
				}
			},

		},
		FishingSpot_2 = {
			Pos   = {x = 712.28, y = 4092.58, z = 34.7},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 1.0, y = 1.0, z = 1.0},
			Marker= 20,
			Blip  = false,
			Name  = _U('fm_fish_area'),
			Type  = "work",
			Hint  = _U('fm_fish_button'),
			GPS   = 0,
			Item = {
				{
					name   = _U('fm_fish'),
					db_name= "fish",
					time   = 2500,
					max    = 100,
					add    = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop   = 100
				}
			},

		},

		Delivery = {
			Pos   = {x = -1012.64, y = -1354.62, z = 5.56},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 27,
			Blip  = true,
			Name  = _U('delivery_point'),
			Type  = "delivery",
			Spawner = 2,
			Hint  = _U('fm_deliver_fish'),
			GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
			Item = {
				{
				name   = _U('delivery'),
				time   = 1000,
				remove = 1,
				max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
				price  = 5,
				requires = "fish",
				requires_name = _U('fm_fish'),
				drop   = 100
				}
			}
		}

	}
}
