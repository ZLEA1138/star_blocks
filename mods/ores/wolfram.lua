-- VARIABLES
local cracky = 1

local maxlevel = 2
local uses = 30
local fleshy = 8
local crackytime = 0.50
local crumblytime = 0.30
local choppytime = 0.50
local snappytime = 0.30



-- NODES
-- ore
minetest.register_node("ores:stone_with_wolfram", {
	description = "Wolfram Ore",
	tiles = {"stone.png^wolfram_ore.png"},
	groups = {cracky = cracky},
	drop = "ores:wolfram_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- block
minetest.register_node("ores:wolfram_block", {
	description = "Wolfram Block",
	tiles = {"wolfram_block.png"},
	is_ground_content = false,
	groups = {cracky = cracky, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:wolfram_block",
	recipe = {
		{"ores:wolfram_ingot", "ores:wolfram_ingot", "ores:wolfram_ingot"},
		{"ores:wolfram_ingot", "ores:wolfram_ingot", "ores:wolfram_ingot"},
		{"ores:wolfram_ingot", "ores:wolfram_ingot", "ores:wolfram_ingot"},
	}
})

-- stair
stairs.register_stair_and_slab(
	"wolfram_block",
	"ores:wolfram_block",
	{cracky = cracky, level = 2},
	{"wolfram_block.png"},
	"Wolfram Stair",
	"Wolfram Slab",
	default.node_sound_metal_defaults()
)



-- ITEMS
-- raw lump
minetest.register_craftitem("ores:wolfram_lump", {
	description = "Wolfram Lump",
	inventory_image = "wolfram_lump.png"
})

-- ingot
minetest.register_craftitem("ores:wolfram_ingot", {
	description = "Wolfram Ingot",
	inventory_image = "wolfram_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "ores:wolfram_ingot",
	recipe = "ores:wolfram_lump",
})

minetest.register_craft({
	output = "ores:wolfram_ingot 9",
	recipe = {
		{"ores:wolfram_block"},
	}
})



-- ENTITIES



-- TOOLS
-- pick
minetest.register_tool("ores:pick_wolfram", {
	description = "Wolfram Pick",
	inventory_image = "pick_wolfram.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1] = (crackytime * 4), [2] = (crackytime * 2), [3] = crackytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = (fleshy - 2)},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_craft({
	output = "ores:pick_wolfram",
	recipe = {
		{"ores:wolfram_ingot", "ores:wolfram_ingot", "ores:wolfram_ingot"},
		{"",                   "group:stick",        ""},
		{"",                   "group:stick",        ""}
	}
})

-- shovel
minetest.register_tool("ores:shovel_wolfram", {
	description = "Wolfram Shovel",
	inventory_image = "shovel_wolfram.png",
	wield_image = "shovel_wolfram.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
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
	output = "ores:shovel_wolfram",
	recipe = {
		{"ores:wolfram_ingot"},
		{"group:stick"},
		{"group:stick"}
	}
})

-- axe
minetest.register_tool("ores:axe_wolfram", {
	description = "Wolfram Axe",
	inventory_image = "axe_wolfram.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
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
	output = "ores:axe_wolfram",
	recipe = {
		{"ores:wolfram_ingot", "ores:wolfram_ingot"},
		{"ores:wolfram_ingot", "group:stick"},
		{"",                   "group:stick"}
	}
})

minetest.register_craft({
	output = "ores:axe_wolfram",
	recipe = {
		{"ores:wolfram_ingot", "ores:wolfram_ingot"},
		{"group:stick",        "ores:wolfram_ingot"},
		{"group:stick",        ""}
	}
})

-- sword
minetest.register_tool("ores:sword_wolfram", {
	description = "Wolfram Sword",
	inventory_image = "sword_wolfram.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
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
	output = "ores:sword_wolfram",
	recipe = {
		{"ores:wolfram_ingot"},
		{"ores:wolfram_ingot"},
		{"group:stick"}
	}
})