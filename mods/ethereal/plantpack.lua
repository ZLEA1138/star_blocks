
--= Register Biome Decoration Using Plants Mega Pack Lite

--= Desert Biome

-- Cactus
--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {"default:desert_sand", "default:sandstone"},
--	sidelen = 16,
--	fill_ratio = 0.005,
--	biomes = {"desert", "sandstone"},
--	decoration = {
--		"xanadu:cactus_echinocereus", "xanadu:cactus_matucana",
--		"xanadu:cactus_baseball", "xanadu:cactus_golden"
--	}
--})

-- Desert Plants
--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {"default:desert_sand", "default:sandstone", "default:sand"},
--	sidelen = 16,
--	fill_ratio = 0.004,
--	biomes = {"desert", "sandstone"},
--	decoration = {
--		"xanadu:desert_kangaroo", "xanadu:desert_brittle",
--		"xanadu:desert_ocotillo", "xanadu:desert_whitesage"
--	}
--})

--=  Prairie Biome

-- Grass
--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {"ethereal:prairie_dirt", "ethereal:grass_dirt"},
--	sidelen = 16,
--	fill_ratio = 0.005,
--	biomes = {"prairie", "deciduous_forest", "grassytwo"},
--	decoration = {
--		"xanadu:grass_prairie", "xanadu:grass_cord",
--		"xanadu:grass_wheatgrass", "xanadu:desert_whitesage"
--	}
--})

-- Flowers
--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {
--		"ethereal:prairie_dirt", "ethereal:grass_dirt",
--		"ethereal:bamboo_dirt"
--	},
--	sidelen = 16,
--	fill_ratio = 0.005,
--	biomes = {"prairie", "deciduous_forest", "grassytwo", "bamboo"},
--	decoration = {
--		"xanadu:flower_jacobsladder", "xanadu:flower_thistle",
--		"xanadu:flower_wildcarrot"
--	}
--})

--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {
--		"ethereal:prairie_dirt", "ethereal:grass_dirt"
--	},
--	sidelen = 16,
--	fill_ratio = 0.005,
--	biomes = {"prairie", "deciduous_forest", "grassytwo", "grove"},
--	decoration = {
--		"xanadu:flower_delphinium", "xanadu:flower_celosia",
--		"xanadu:flower_daisy", "xanadu:flower_bluerose"
--	}
--})

-- Shrubs
--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {
--		"ethereal:prairie_dirt", "ethereal:grass_dirt",
--		"ethereal:jungle_dirt"
--	},
--	sidelen = 16,
--	fill_ratio = 0.005,
--	biomes = {
--		"prairie", "deciduous_forest", "grassytwo", "grove", "junglee",
--		"grayness", "jumble"
--	},
--	decoration = {
--		"xanadu:shrub_kerria", "xanadu:shrub_spicebush"
--	}
--})

--= Jungle Biome

--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {"ethereal:jungle_dirt", "ethereal:grass_dirt"},
--	sidelen = 16,
--	fill_ratio = 0.007,
--	biomes = {"junglee", "jumble"},
--	decoration = {
--		"xanadu:rainforest_guzmania", "xanadu:rainforest_devil",
--		"xanadu:rainforest_lazarus", "xanadu:rainforest_lollipop",
--		"xanadu:mushroom_woolly"
--	}
--})

--= Cold Biomes

--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {
--		"ethereal:snow_dirt", "ethereal:cold_dirt"
--	},
--	sidelen = 16,
--	fill_ratio = 0.005,
--	biomes = {"coniferous_forest", "taiga", "grayness"},
--	decoration = {
--		"xanadu:mountain_edelweiss", "xanadu:mountain_armeria",
--		"xanadu:mountain_bellflower", "xanadu:mountain_willowherb",
--		"xanadu:mountain_bistort"
--	}
--})

--= Mushroom Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:fungus_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"mushroom"},
	decoration = {
		"flowers:mushroom_red", "flowers:mushroom_brown"
	}
})

--minetest.register_decoration({
--	name = "flowers:mushroom_red",
--	deco_type = "simple",
--	place_on = {"ethereal:fungus_dirt"},
--	sidelen = 16,
--	noise_params = {
--		offset = offset,
--		scale = scale,
--		spread = {x = 200, y = 200, z = 200},
--		seed = 329,
--		octaves = 3,
--		persist = 0.6
--	},
--	biomes = {"mushroom"},
--	y_max = 31000,
--	y_min = 1,
--	decoration = "flowers:mushroom_red"
--})

--= Lakeside

--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {"default:sand", "ethereal:grass_dirt"},
--	sidelen = 16,
--	fill_ratio = 0.015,
--	biomes = {
--		"sandclay", "deciduous_forest_ocean", "grassy", "grassytwo", "jumble", "swamp"},
--	decoration = {
--		"xanadu:wetlands_cattails", "xanadu:wetlands_pickerel",
--		"xanadu:wetlands_mannagrass", "xanadu:wetlands_turtle"
--	},
--	spawn_by = "default:water_source",
--	num_spawn_by = 1
--})

--= Harsh Biomes

--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {
--		"ethereal:fungus_dirt", "ethereal:grass_dirt",
--		"ethereal:cold_dirt",
--		"ethereal:snow_dirt", "ethereal:jungle_dirt",
--		"ethereal:prairie_dirt",
--		"ethereal:dry_dirt", "default:sand",
--		"default:desert_sand", "ethereal:bamboo_dirt"
--	},
--	sidelen = 16,
--	fill_ratio = 0.004,
--	biomes = {
--		"mushroom", "prairie", "grayness", "plains", "desert",
--		"junglee", "deciduous_forest", "grassytwo", "jumble", "coniferous_forest",
--		"taiga", "fiery", "mesa", "bamboo"
--	},
--	decoration = {
--		"xanadu:spooky_thornbush", "xanadu:spooky_baneberry"
--	}
--})

--= Poppy's growing in Clearing Biome in memory of RealBadAngel

--minetest.register_decoration({
--	deco_type = "simple",
--	place_on = {
--		"ethereal:grass_dirt",
--	},
--	sidelen = 16,
--	fill_ratio = 0.004,
--	biomes = {"grassland"},
--	decoration = {
--		"xanadu:poppy"
--	}
--})
