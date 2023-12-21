
local path = minetest.get_modpath("ethereal") .. "/schematics/"
local dpath = minetest.get_modpath("default") .. "/schematics/"


-- load schematic tables
dofile(path .. "bamboo_bush.lua")
dofile(path .. "bamboo_tree.lua")
dofile(path .. "brylark_tree.lua")
dofile(path .. "bush.lua")
dofile(path .. "gnarltree.lua")
dofile(path .. "jogan_tree.lua")
dofile(path .. "mushroom.lua")
dofile(path .. "palm_tree.lua")
dofile(path .. "pine_tree.lua")
dofile(path .. "uneti_tree.lua")
dofile(path .. "volcanol.lua")
dofile(path .. "volcanom.lua")
dofile(path .. "waterlily.lua")
dofile(path .. "wroshyr_tree.lua")


-- helper function
local add_schem = function(a, b, c, d, e, f, g, h, i, j, k)

	-- if not 1 then biome disabled, don't add
	if g ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		schematic = f,
		flags = "place_center_x, place_center_z",
		replacements = h,
		spawn_by = i,
		num_spawn_by = j,
		rotation = k
	})
end


-- wroshyr tree
add_schem({"ethereal:jungle_dirt"}, 0.0025, {"junglee"}, 1, 100, ethereal.wroshyr_tree, 1)

-- uneti tree
add_schem({"default:snow_dirt"}, 0.01, {"alpine"}, 120, 140, ethereal.uneti_tree, 1)

-- brylark tree
add_schem({"ethereal:jungle_dirt"}, 0.01, {"junglee"}, 1, 100, ethereal.brylark_tree, 1)

-- giant mushroom
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:fungus_dirt"},
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"fungus"},
	y_min = 1,
	y_max = 100,
	schematic = ethereal.mushroom,
	flags = "place_center_x, place_center_z",
	spawn_by = "ethereal:fungus_dirt",
	num_spawn_by = 6,
})

-- small lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:charred_dirt"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"volcanic"},
	y_min = 1,
	y_max = 100,
	schematic = ethereal.volcanom,
	flags = "place_center_x, place_center_z",
	spawn_by = "ethereal:charred_dirt",
	num_spawn_by = 8,
})

-- large lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:charred_dirt"},
	sidelen = 80,
	fill_ratio = 0.003,
	biomes = {"volcanic"},
	y_min = 1,
	y_max = 100,
	schematic = ethereal.volcanol,
	flags = "place_center_x, place_center_z",
	spawn_by = "ethereal:charred_dirt",
	num_spawn_by = 8,
	rotation = "random",
})

-- pine tree
add_schem({"ethereal:cold_dirt"}, 0.025, {"snowy"}, 10, 40, ethereal.pine_tree, 1)
add_schem({"default:snow_dirt"}, 0.025, {"alpine"}, 40, 140, ethereal.pine_tree, 1)

-- jogan tree
add_schem({"ethereal:grass_dirt"}, 0.02, {"jumble"}, 1, 100, ethereal.jogan_tree, 1)
add_schem({"ethereal:grass_dirt"}, 0.03, {"grassy"}, 1, 100, ethereal.jogan_tree, 1)
add_schem({"ethereal:prairie_dirt"}, 0.01, {"prairie"}, 1, 100, ethereal.jogan_tree, 1)

-- palm tree
add_schem({"default:sand"}, 0.0025, {"desert_ocean"}, 1, 1, ethereal.palm_tree, 1)
add_schem({"default:sand"}, 0.0025, {"plains_ocean"}, 1, 1, ethereal.palm_tree, 1)
add_schem({"default:sand"}, 0.0025, {"sandclay"}, 1, 1, ethereal.palm_tree, 1)
add_schem({"default:sand"}, 0.0025, {"sandstone_ocean"}, 1, 1, ethereal.palm_tree, 1)
--add_schem({"default:sand"}, 0.0025, {"mesa_ocean"}, 1, 1, ethereal.palm_tree, 1)
add_schem({"default:sand"}, 0.0025, {"grove_ocean"}, 1, 1, ethereal.palm_tree, 1)
add_schem({"default:sand"}, 0.0025, {"grassy_ocean"}, 1, 1, ethereal.palm_tree, 1)

-- bamboo tree
add_schem({"ethereal:bamboo_dirt"}, 0.025, {"bamboo"}, 1, 100, ethereal.bamboo_tree, 1)

-- bamboo_bush
add_schem({"ethereal:bamboo_dirt"}, 0.08, {"bamboo"}, 1, 100, ethereal.bamboo_bush, 1)

-- gnarltree
add_schem({"ethereal:swamp_dirt"}, 0.02, {"swamp"}, 1, 100, ethereal.gnarltree, 1)

-- bush
add_schem({"ethereal:grass_dirt"}, 0.08, {"grassy"}, 1, 100, ethereal.bush, 1)


-- default bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:grass_dirt", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 137,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"deciduous_forest", "grassytwo", "jumble"},
	y_min = 1,
	y_max = 31000,
	schematic = dpath .. "bush.mts",
	flags = "place_center_x, place_center_z"
})
