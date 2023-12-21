-- VARIABLES
local cracky = 2



-- NODES
-- ore
minetest.register_node("ores:stone_with_stannum", {
	description = "Stannum Ore",
	tiles = {"stone.png^stannum_ore.png"},
	groups = {cracky = cracky},
	drop = "ores:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- block
minetest.register_node("ores:stannum_block", {
	description = "Stannum Block",
	tiles = {"stannum_block.png"},
	is_ground_content = false,
	groups = {cracky = (cracky - 1), level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:stannum_block",
	recipe = {
		{"ores:stannum_ingot", "ores:stannum_ingot", "ores:stannum_ingot"},
		{"ores:stannum_ingot", "ores:stannum_ingot", "ores:stannum_ingot"},
		{"ores:stannum_ingot", "ores:stannum_ingot", "ores:stannum_ingot"},
	}
})

-- stair
stairs.register_stair_and_slab(
	"stannum_block",
	"ores:stannum_block",
	{cracky = (cracky - 1), level = 2},
	{"stannum_block.png"},
	"Stannum Stair",
	"Stannum Slab",
	default.node_sound_metal_defaults()
)



-- ITEMS
-- raw lump
minetest.register_craftitem("ores:stannum_lump", {
	description = "Stannum Lump",
	inventory_image = "stannum_lump.png"
})

-- ingot
minetest.register_craftitem("ores:stannum_ingot", {
	description = "Stannum Ingot",
	inventory_image = "stannum_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "ores:stannum_ingot",
	recipe = "ores:stannum_lump",
})

minetest.register_craft({
	output = "ores:stannum_ingot 9",
	recipe = {
		{"ores:stannum_block"},
	}
})



-- ENTITIES



-- TOOLS