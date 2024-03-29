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
-- trunk
minetest.register_node("wood:ferrumwood_trunk", {
	description = "Ferrumwood Trunk",
	tiles = {
		"ferrumwood_trunk_top.png",
		"ferrumwood_trunk_top.png",
		"ferrumwood_trunk.png"
	},
	groups = {cracky = cracky},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- wood
minetest.register_node("wood:ferrumwood_wood", {
	description = "Ferrumwood Wood",
	tiles = {"ferrumwood_wood.png"},
	is_ground_content = false,
	groups = {cracky = (cracky + 1)},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:ferrumwood_wood 4",
	recipe = {{"wood:ferrumwood_trunk"}},
})

-- leaves
minetest.register_node("wood:ferrumwood_leaves", {
	description = "Ferrumwood Leaves",
	drawtype = "plantlike",
	tiles = {"ferrumwood_leaves.png"},
	inventory_image = "ferrumwood_leaves.png",
	wield_image = "ferrumwood_leaves.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:ferrumwood_sapling"}, rarity = 20},
			{items = {"wood:ferrumwood_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:ferrumwood_trunk"},
	leaves = {"wood:ferrumwood_leaves"},
	radius = 3
})

-- sapling
minetest.register_node("wood:ferrumwood_sapling", {
	description = "Ferrumwood Tree Sapling",
	drawtype = "plantlike",
	tiles = {"ferrumwood_tree_sapling.png"},
	inventory_image = "ferrumwood_tree_sapling.png",
	wield_image = "ferrumwood_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {
		snappy = 2, dig_immediate = 3,
		ethereal_sapling = 1, attached_node = 1, sapling = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	grown_height = 19
})

-- stair
stairs.register_stair_and_slab(
	"ferrumwood_wood",
	"wood:ferrumwood_wood",
	{cracky = (cracky + 1)},
	{"ferrumwood_wood.png"},
	"Ferrumwood Wood Stair",
	"Ferrumwood Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_ferrumwood", {
	description = "Ferrumwood Fence",
	texture = "ferrumwood_wood.png",
	material = "wood:ferrumwood_wood",
	groups = {cracky = (cracky + 1)},
	sounds = default.node_sound_wood_defaults(),
	check_for_pole = true,
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		}
	}
})

default.register_fence_rail("wood:fence_rail_ferrumwood", {
	description = "Ferrumwood Fence Rail",
	texture = "ferrumwood_wood.png",
	material = "wood:ferrumwood_wood",
	groups = {cracky = (cracky + 1)},
	sounds = default.node_sound_wood_defaults(),
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		}
	}
})

doors.register_fencegate("wood:fence_gate_ferrumwood", {
	description = "Ferrumwood Fence Gate",
	texture = "ferrumwood_wood.png",
	material = "wood:ferrumwood_wood",
	groups = {cracky = (cracky + 1)}
})

-- door
doors.register("door_ferrumwood", {
	tiles = {{ name = "door_ferrumwood.png", backface_culling = true }},
	description = "Ferrumwood Door",
	inventory_image = "door_ferrumwood_inv.png",
	groups = {node = 1, cracky = (cracky + 1)},
	gain_open = 0.06,
	gain_close = 0.13,
	recipe = {
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood"},
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood"},
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood"},
	}
})

-- trapdoor
doors.register_trapdoor("wood:trapdoor_ferrumwood", {
	description = "Ferrumwood Trapdoor",
	inventory_image = "trapdoor_ferrumwood.png",
	wield_image = "trapdoor_ferrumwood.png",
	tile_front = "trapdoor_ferrumwood.png",
	tile_side = "trapdoor_ferrumwood_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
	groups = {cracky = (cracky + 1), door = 1},
})

minetest.register_craft({
	output = "wood:trapdoor_ferrumwood 2",
	recipe = {
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood", "wood:ferrumwood_wood"},
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood", "wood:ferrumwood_wood"},
		{"",                     "",                     ""},
	}
})



-- ITEMS
-- stick
minetest.register_craftitem("wood:stick_ferrumwood", {
	description = "Ferrumwood Stick",
	inventory_image = "stick_ferrumwood.png",
	groups = {},
})



-- ENTITIES
-- boat TODO



-- TOOLS
-- pick
minetest.register_tool("wood:pick_ferrumwood", {
	description = "Ferrumwood Pickaxe",
	inventory_image = "pick_ferrumwood.png",
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
	output = "wood:pick_ferrumwood",
	recipe = {
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood",  "wood:ferrumwood_wood"},
		{"",                     "wood:stick_ferrumwood", ""},
		{"",                     "wood:stick_ferrumwood", ""}
	}
})

-- shovel
minetest.register_tool("wood:shovel_ferrumwood", {
	description = "Ferrumwood Shovel",
	inventory_image = "shovel_ferrumwood.png",
	wield_image = "shovel_ferrumwood.png^[transformR90",
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
	output = "wood:shovel_ferrumwood",
	recipe = {
		{"wood:ferrumwood_wood"},
		{"wood:stick_ferrumwood"},
		{"wood:stick_ferrumwood"}
	}
})

-- axe
minetest.register_tool("wood:axe_ferrumwood", {
	description = "Ferrumwood Axe",
	inventory_image = "axe_ferrumwood.png",
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
	output = "wood:axe_ferrumwood",
	recipe = {
		{"wood:ferrumwood_wood", "wood:ferrumwood_wood"},
		{"wood:ferrumwood_wood", "wood:stick_ferrumwood"},
		{"",                     "wood:stick_ferrumwood"}
	}
})

minetest.register_craft({
	output = "wood:axe_ferrumwood",
	recipe = {
		{"wood:ferrumwood_wood",  "wood:ferrumwood_wood"},
		{"wood:stick_ferrumwood", "wood:ferrumwood_wood"},
		{"wood:stick_ferrumwood", ""}
	}
})

-- sword
minetest.register_tool("wood:sword_ferrumwood", {
	description = "Ferrumwood Sword",
	inventory_image = "sword_ferrumwood.png",
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
	output = "wood:sword_ferrumwood",
	recipe = {
		{"wood:ferrumwood_wood"},
		{"wood:ferrumwood_wood"},
		{"wood:stick_ferrumwood"}
	}
})