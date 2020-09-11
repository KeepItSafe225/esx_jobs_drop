Config.Jobs.lumberjack = {

	BlipInfos = {
		Sprite = 237,
		Color = 4
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = "phantom",
			Trailer = "trailers",
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = {x = -552.69, y = 5348.48, z = 75.0},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 20,
			Blip = true,
			Name = _U("lj_locker_room"),
			Type = "cloakroom",
			Hint = _U("cloak_change")
		},

		Wood_1 = {
			Pos = {x = -531.92, y = 5372.79, z = 70.50},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 20,
			Blip = true,
			Name = _U("lj_mapblip"),
			Type = "work",
			Item = {
				{
					name = _U("lj_wood"),
					db_name = "wood",
					time = 2500,
					max = 20,
					add = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("lj_pickup")
		},

		Wood_2 = {
			Pos = {x = -531.0, y = 5385.67, z = 70.50},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 20,
			Blip = false,
			Name = _U("lj_mapblip"),
			Type = "work",
			Item = {
				{
					name = _U("lj_wood"),
					db_name = "wood",
					time = 2500,
					max = 20,
					add = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("lj_pickup")
		},

		Planks_1 = {
			Pos = {x = -510.50, y = 5276.13, z = 80.61},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 20,
			Blip = true,
			Name = _U("lj_board"),
			Type = "work",
			Item = {
				{
					name = _U("lj_planks"),
					db_name = "packaged_plank",
					time = 3000,
					max = 100,
					add = 5,
					remove = 1,
					requires = "wood",
					requires_name = _U("lj_wood"),
					drop = 100
				}
			},
			Hint = _U("lj_pick_boards")
		},

		Planks_2 = {
			Pos = {x = -506.7, y = 5263.23, z = 80.61},
			Size = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 20,
			Blip = false,
			Name = _U("lj_board"),
			Type = "work",
			Item = {
				{
					name = _U("lj_planks"),
					db_name = "packaged_plank",
					time = 3000,
					max = 100,
					add = 5,
					remove = 1,
					requires = "wood",
					requires_name = _U("lj_wood"),
					drop = 100
				}
			},
			Hint = _U("lj_pick_boards")
		},

		Delivery = {
			Pos = {x = 1201.35, y = -1327.51, z = 34.25},
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 27,
			Blip = true,
			Name = _U("delivery_point"),
			Type = "delivery",
			Spawner = 1,
			Item = {
				{
					name = _U("delivery"),
					time = 1000,
					remove = 1,
					max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 5,
					requires = "packaged_plank",
					requires_name = _U("lj_planks"),
					drop = 100
				}
			},
			Hint = _U("lj_deliver_button")
		}

	}
}
