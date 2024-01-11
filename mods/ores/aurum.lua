-- VARIABLES
local cracky = 2



-- NODES
-- ore
minetest.register_node("ores:stone_with_aurum", {
	description = "Aurum Ore",
	tiles = {"stone.png^aurum_ore.png"},
	groups = {cracky = cracky},
	drop = "ores:aurum_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- block
minetest.register_node("ores:aurum_block", {
	description = "Aurum Block",
	tiles = {"aurum_block.png"},
	is_ground_content = false,
	groups = {cracky = (cracky - 1), level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:aurum_block",
	recipe = {
		{"ores:aurum_ingot", "ores:aurum_ingot", "ores:aurum_ingot"},
		{"ores:aurum_ingot", "ores:aurum_ingot", "ores:aurum_ingot"},
		{"ores:aurum_ingot", "ores:aurum_ingot", "ores:aurum_ingot"},
	}
})

-- stair
stairs.register_stair_and_slab(
	"aurum_block",
	"ores:aurum_block",
	{cracky = (cracky - 1), level = 2},
	{"aurum_block.png"},
	"Aurum Stair",
	"Aurum Slab",
	default.node_sound_metal_defaults()
)



-- ITEMS
-- raw lump
minetest.register_craftitem("ores:aurum_lump", {
	description = "Aurum Lump",
	inventory_image = "aurum_lump.png"
})

-- ingot
minetest.register_craftitem("ores:aurum_ingot", {
	description = "Aurum Ingot",
	inventory_image = "aurum_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "ores:aurum_ingot",
	recipe = "ores:aurum_lump",
})

minetest.register_craft({
	output = "ores:aurum_ingot 9",
	recipe = {
		{"ores:aurum_block"},
	}
})



-- ENTITIES



-- TOOLS