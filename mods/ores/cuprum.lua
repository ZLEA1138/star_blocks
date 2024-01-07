-- VARIABLES
local cracky = 2

local maxlevel = 2
local uses = 20
local fleshy = 6
local crackytime = 0.90
local crumblytime = 0.45
local choppytime = 1.15
local snappytime = 0.375



-- NODES
-- ore
minetest.register_node("ores:stone_with_cuprum", {
	description = "Cuprum Ore",
	tiles = {"stone.png^cuprum_ore.png"},
	groups = {cracky = cracky},
	drop = "ores:cuprum_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- cuprum block
minetest.register_node("ores:cuprum_block", {
	description = "Cuprum Block",
	tiles = {"cuprum_block.png"},
	is_ground_content = false,
	groups = {cracky = (cracky - 1), level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:cuprum_block",
	recipe = {
		{"ores:cuprum_ingot", "ores:cuprum_ingot", "ores:cuprum_ingot"},
		{"ores:cuprum_ingot", "ores:cuprum_ingot", "ores:cuprum_ingot"},
		{"ores:cuprum_ingot", "ores:cuprum_ingot", "ores:cuprum_ingot"},
	}
})

-- aereus block
minetest.register_node("ores:aereus_block", {
	description = "Aereus Block",
	tiles = {"aereus_block.png"},
	is_ground_content = false,
	groups = {cracky = (cracky - 1), level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:aereus_block",
	recipe = {
		{"ores:aereus_ingot", "ores:aereus_ingot", "ores:aereus_ingot"},
		{"ores:aereus_ingot", "ores:aereus_ingot", "ores:aereus_ingot"},
		{"ores:aereus_ingot", "ores:aereus_ingot", "ores:aereus_ingot"},
	}
})

-- cuprum stair
stairs.register_stair_and_slab(
	"cuprum_block",
	"ores:cuprum_block",
	{cracky = (cracky - 1), level = 2},
	{"cuprum_block.png"},
	"Cuprum Stair",
	"Cuprum Slab",
	default.node_sound_metal_defaults()
)

-- aereus stair
stairs.register_stair_and_slab(
	"aereus_block",
	"ores:aereus_block",
	{cracky = (cracky - 1), level = 2},
	{"aereus_block.png"},
	"Aereus Stair",
	"Aereus Slab",
	default.node_sound_metal_defaults()
)



-- ITEMS
-- raw lump
minetest.register_craftitem("ores:cuprum_lump", {
	description = "Cuprum Lump",
	inventory_image = "cuprum_lump.png"
})

-- cuprum ingot
minetest.register_craftitem("ores:cuprum_ingot", {
	description = "Cuprum Ingot",
	inventory_image = "cuprum_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "ores:cuprum_ingot",
	recipe = "ores:cuprum_lump",
})

minetest.register_craft({
	output = "ores:cuprum_ingot 9",
	recipe = {
		{"ores:cuprum_block"},
	}
})

-- aereus ingot
minetest.register_craftitem("ores:aereus_ingot", {
	description = "Aereus Ingot",
	inventory_image = "aereus_ingot.png"
})

minetest.register_craft({
	output = "ores:aereus_ingot 9",
	recipe = {
		{"ores:cuprum_ingot", "ores:cuprum_ingot", "ores:cuprum_ingot"},
		{"ores:cuprum_ingot", "ores:stannum_ingot", "ores:cuprum_ingot"},
		{"ores:cuprum_ingot", "ores:cuprum_ingot", "ores:cuprum_ingot"},
	}
})

minetest.register_craft({
	output = "ores:aereus_ingot 9",
	recipe = {
		{"ores:aereus_block"},
	}
})



-- ENTITIES



-- TOOLS
-- pick
minetest.register_tool("ores:pick_aereus", {
	description = "Aereus Pickaxe",
	inventory_image = "pick_aereus.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1] = (crackytime * 4), [2] = (crackytime * 2), [3] = crackytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = (fleshy - 2)},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_craft({
	output = "ores:pick_aereus",
	recipe = {
		{"ores:aereus_ingot", "ores:aereus_ingot", "ores:aereus_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

-- shovel
minetest.register_tool("ores:shovel_aereus", {
	description = "Aereus Shovel",
	inventory_image = "shovel_aereus.png",
	wield_image = "shovel_aereus.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1] = (crumblytime * 4), [2] = (crumblytime * 2), [3] = crumblytime}, uses = (uses * 1.5), maxlevel = maxlevel},
		},
		damage_groups = {fleshy = (fleshy - 3)},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_craft({
	output = "ores:shovel_aereus",
	recipe = {
		{"ores:aereus_ingot"},
		{"group:stick"},
		{"group:stick"}
	}
})

-- axe
minetest.register_tool("ores:axe_aereus", {
	description = "Aereus Axe",
	inventory_image = "axe_aereus.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1] = (choppytime * 2.5), [2] = (choppytime * 1.5), [3] = choppytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = (fleshy - 2)},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_craft({
	output = "ores:axe_aereus",
	recipe = {
		{"ores:aereus_ingot", "ores:aereus_ingot"},
		{"ores:aereus_ingot", "group:stick"},
		{"", "group:stick"}
	}
})

minetest.register_craft({
	output = "ores:axe_aereus",
	recipe = {
		{"ores:aereus_ingot", "ores:aereus_ingot"},
		{"group:stick", "ores:aereus_ingot"},
		{"group:stick", ""}
	}
})

-- sword
minetest.register_tool("ores:sword_aereus", {
	description = "Aereus Sword",
	inventory_image = "sword_aereus.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1] = (snappytime * 7), [2] = (snappytime * 3.5), [3] = snappytime}, uses = (uses * 1.5), maxlevel = maxlevel},
		},
		damage_groups = {fleshy = fleshy},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_craft({
	output = "ores:sword_aereus",
	recipe = {
		{"ores:aereus_ingot"},
		{"ores:aereus_ingot"},
		{"group:stick"}
	}
})