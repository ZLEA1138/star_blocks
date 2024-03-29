
--[[ Spawn Template, defaults to values shown if line not provided

mobs:spawn({

	name = "",

		- Name of mob, must be provided e.g. "mymod:my_mob"

	nodes = {"group:soil, "group:stone"},

		- Nodes to spawn on top of.

	neighbors = {"air"},

		- Nodes to spawn beside.

	min_light = 0,

		- Minimum light level.

	max_light = 15,

		- Maximum light level, 15 is sunlight only.

	interval = 30,

		- Spawn interval in seconds.

	chance = 5000,

		- Spawn chance, 1 in every 5000 nodes.

	active_object_count = 1,

		- Active mobs of this type in area.

	min_height = -31000,

		- Minimum height level.

	max_height = 31000,

		- Maximum height level.

	day_toggle = nil,

		- Daytime toggle, true to spawn during day, false for night, nil for both

	on_spawn = nil,

		- On spawn function to run when mob spawns in world

	on_map_load = nil,

		- On map load, when true mob only spawns in newly generated map areas
})
]]--


-- Apis

mobs:spawn({
	name = "mobs_animal:apis",
	nodes = {"group:flower"},
	min_light = 14,
	interval = 60,
	chance = 7000,
	min_height = 3,
	max_height = 200,
	day_toggle = true,
})

-- Auris Bellus

mobs:spawn({
	name = "mobs_animal:aurisbellus",
	nodes = {"ethereal:grass_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

-- Pullum

mobs:spawn({
	name = "mobs_animal:pullum",
	nodes = {"ethereal:grass_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

-- Bovin

mobs:spawn({
	name = "mobs_animal:bovin",
	nodes = {"ethereal:grass_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

-- Felis

mobs:spawn({
	name = "mobs_animal:felis",
	nodes = {"ethereal:grass_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 10000,
	min_height = 5,
	max_height = 50,
	day_toggle = true,
})

-- Tavin Bear

mobs:spawn({
	name = "mobs_animal:tavinbear",
	nodes = {"ethereal:bamboo_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 10,
	max_height = 80,
	day_toggle = true,
})

-- Penguin

--mobs:spawn({
--	name = "mobs_animal:penguin",
--	nodes = {"default:snow_block"},
--	min_light = 14,
--	interval = 60,
--	chance = 20000,
--	min_height = 0,
--	max_height = 200,
--	day_toggle = true,
--})

-- Mus

mobs:spawn({
	name = "mobs_animal:mus",
	nodes = {"default:stone"},
	min_light = 3,
	max_light = 9,
	interval = 60,
	chance = 8000,
	max_height = 0,
})

-- Schaap

mobs:spawn({
	name = "mobs_animal:schaap_white",
	nodes = {"ethereal:grass_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})

-- Porcus

mobs:spawn({
	name = "mobs_animal:porcus",
	nodes = {"ethereal:savanna_dirt"},
	neighbors = {"group:dry_grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})
