
local S = ethereal.intllib

-- helper function
local add_biome = function(a, l, m, n, o, p, b, c, d, e, f, g, nd, na, ns)

	-- if not 1 then biome disabled, don't add
	if p ~= 1 then return end

	minetest.register_biome({
		name = a,
		node_dust = b,
		node_top = c,
		depth_top = d,
		node_filler = e,
		depth_filler = f,
		node_stone = g,
--		node_water_top = h,
--		depth_water_top = i,
--		node_water = j,
--		node_river_water = k,
		y_min = l,
		y_max = m,
		heat_point = n,
		humidity_point = o,

		node_dungeon = nd or "default:cobble",
		node_dungeon_alt = (nd and "") or "default:mossy_cobble",
		node_dungeon_stair = ns or "stairs:stair_cobble"
	})
end


-- always registered biomes
--add_biome("mountain", 140, 31000, 50, 50, 1,
	--nil, "default:snow", 1, "default:snow_block", 2)

add_biome("mountain", 140, 2000, 50, 50, 1,
	nil, "default:snow", 1, "default:snow_block", 2)

add_biome("grassland", 3, 71, 45, 65, 1,
	nil, "ethereal:grass_dirt", 1, "default:dirt", 3)

add_biome("underground", -31000, -192, 50, 50, 1,
	nil, nil, nil, nil, nil)


-- biomes with disable setting

add_biome("desert", 3, 23, 35, 20, ethereal.desert,
	nil, "default:desert_sand", 1, "default:desert_sand", 3, "default:desert_stone",
	"default:desert_stone", nil, "stairs:stair_desert_stone")

add_biome("desert_ocean", -192, 3, 35, 20, ethereal.desert,
	nil, "default:sand", 1, "default:sand", 2, "default:desert_stone",
	"default:desert_stone", nil, "stairs:stair_desert_stone")


add_biome("bamboo", 25, 70, 45, 75, ethereal.bamboo,
	nil, "ethereal:bamboo_dirt", 1, "default:dirt", 3)


add_biome("mesa", 1, 71, 25, 28, ethereal.mesa,
	nil, "ethereal:savanna_dirt", 1, "bakedclay:orange", 15)

add_biome("mesa_ocean", -192, 1, 25, 28, ethereal.mesa,
	nil, "default:sand", 1, "default:sand", 2)


-- was 'snowy' biome
add_biome("coniferous_forest", 4, 40, 10, 40, ethereal.snowy,
	nil, "ethereal:cold_dirt", 1, "default:dirt", 2)

add_biome("taiga", 40, 140, 10, 40, ethereal.alpine,
	nil, "ethereal:snow_dirt", 1, "default:dirt", 2)


add_biome("deciduous_forest", 3, 91, 13, 40, ethereal.grassy,
	nil, "ethereal:grass_dirt", 1, "default:dirt", 3)

add_biome("deciduous_forest_ocean", -31000, 3, 13, 40, ethereal.grassy,
	nil, "default:sand", 2, "default:gravel", 1)


add_biome("caves", 4, 41, 15, 25, ethereal.caves,
	nil, "default:desert_stone", 3, "air", 8)


add_biome("cold", 2, 41, 15, 30, ethereal.cold,
	nil, "ethereal:cold_dirt", 1, "default:dirt", 3)


add_biome("grassytwo", 1, 91, 15, 40, ethereal.grassytwo,
	nil, "ethereal:grass_dirt", 1, "default:dirt", 3)

add_biome("grassytwo_ocean", -192, 1, 15, 40, ethereal.grassytwo,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("prairie", 3, 26, 20, 40, ethereal.prairie,
	nil, "ethereal:prairie_dirt", 1, "default:dirt", 3)

add_biome("prairie_ocean", -192, 1, 20, 40, ethereal.prairie,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("jumble", 1, 71, 25, 50, ethereal.jumble,
	nil, "ethereal:grass_dirt", 1, "default:dirt", 3)

add_biome("jumble_ocean", -192, 1, 25, 50, ethereal.jumble,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("junglee", 1, 71, 30, 60, ethereal.junglee,
	nil, "ethereal:jungle_dirt", 1, "default:dirt", 3)

add_biome("junglee_ocean", -192, 1, 30, 60, ethereal.junglee,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("grove", 3, 23, 45, 35, ethereal.grove,
	nil, "ethereal:grass_dirt", 1, "default:dirt", 3)

add_biome("grove_ocean", -192, 2, 45, 35, ethereal.grove,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("mediterranean", 3, 50, 20, 45, ethereal.mediterranean,
	nil, "ethereal:grass_dirt", 1, "default:dirt", 3)


add_biome("mushroom", 3, 50, 45, 55, ethereal.mushroom,
	nil, "ethereal:fungus_dirt", 1, "default:dirt", 3)

add_biome("mushroom_ocean", -192, 2, 45, 55, ethereal.mushroom,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("sandstone", 3, 23, 50, 20, ethereal.sandstone,
	nil, "default:sandstone", 1, "default:sandstone", 1, "default:sandstone",
	"default:sandstone", nil, "stairs:stair_sandstone")

add_biome("sandstone_ocean", -192, 2, 50, 20, ethereal.sandstone,
	nil, "default:sand", 1, "default:sand", 2, "default:sandstone",
	"default:sandstone", nil, "stairs:stair_sandstone")


add_biome("quicksand", 1, 1, 50, 38, ethereal.quicksand,
	nil, "ethereal:quicksand", 3, "default:gravel", 1)


add_biome("plains", 3, 25, 65, 25, ethereal.plains,
	nil, "ethereal:dry_dirt", 1, "default:dirt", 3)

add_biome("plains_ocean", -192, 2, 55, 25, ethereal.plains,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("savanna", 3, 50, 55, 25, ethereal.savanna,
	nil, "ethereal:savanna_dirt", 1, "default:dirt", 3)

add_biome("savanna_ocean", -192, 1, 55, 25, ethereal.savanna,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("charred", 5, 20, 75, 10, ethereal.charred,
	nil, "ethereal:charred_dirt", 1, "ethereal:charred_dirt", 3)

add_biome("charred_ocean", -192, 4, 75, 10, ethereal.charred,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("sandclay", 1, 11, 65, 2, ethereal.sandclay,
	nil, "default:sand", 3, "default:clay", 2)


add_biome("swamp", 1, 7, 80, 90, ethereal.swamp,
	nil, "ethereal:swamp_dirt", 1, "default:dirt", 3)

add_biome("swamp_ocean", -192, 1, 80, 90, ethereal.swamp,
	nil, "default:sand", 2, "default:clay", 2)


minetest.register_biome({
	name = "glacier",
	node_dust = "default:snow_block",
	node_top = "default:snow_block",
	depth_top = 1,
	node_filler = "default:snow_block",
	depth_filler = 3,
	node_stone = "default:ice",
	node_water_top = "default:ice",
	depth_water_top = 10,
	node_river_water = "default:ice",
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	node_dungeon = "ethereal:ice_brick",--"default:ice",
	node_dungeon_stair = "stairs:stair_ice",
	y_min = -8,
	--y_max = 31000,
	y_max = 2000,
	heat_point = 0,
	humidity_point = 50,
})

minetest.register_biome({
	name = "glacier_ocean",
	node_dust = "default:snow_block",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	y_min = -112,
	y_max = -9,
	heat_point = 0,
	humidity_point = 50,
})


minetest.register_biome({
	name = "tundra_highland",
	node_dust = "default:snow",
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	y_max = 180,
	y_min = 47,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra",
	node_top = "default:permafrost_with_stones",
	depth_top = 1,
	node_filler = "default:permafrost",
	depth_filler = 1,
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	vertical_blend = 4,
	y_max = 46,
	y_min = 2,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra_beach",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 2,
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	vertical_blend = 1,
	y_max = 1,
	y_min = -3,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	vertical_blend = 1,
	y_max = -4,
	y_min = -112,
	heat_point = 0,
	humidity_point = 40,
})
