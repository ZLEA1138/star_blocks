-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:palm_trunk", {
	description = "Palm Trunk",
	tiles = {
		"palm_trunk_top.png",
		"palm_trunk_top.png",
		"palm_trunk.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:palm_trunk",
	burntime = 30,
})

-- wood
minetest.register_node("wood:palm_wood", {
	description = "Palm Wood",
	tiles = {"palm_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:palm_wood 4",
	recipe = {{"wood:palm_trunk"}},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:palm_wood",
	burntime = 7,
})

-- leaves
minetest.register_node("wood:palm_leaves", {
	description = "Palm Leaves",
	drawtype = "plantlike",
	tiles = {"palm_leaves.png"},
	inventory_image = "palm_leaves.png",
	wield_image = "palm_leaves.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:palm_sapling"}, rarity = 10},
			{items = {"wood:palm_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:palm_trunk"},
	leaves = {"wood:palm_leaves"},
	radius = 3
})

-- sapling
minetest.register_node("wood:palm_sapling", {
	description = "Palm Tree Sapling",
	drawtype = "plantlike",
	tiles = {"palm_tree_sapling.png"},
	inventory_image = "palm_tree_sapling.png",
	wield_image = "palm_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {
		snappy = 2, dig_immediate = 3, flammable = 2,
		ethereal_sapling = 1, attached_node = 1, sapling = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	grown_height = 9
})

-- stair
stairs.register_stair_and_slab(
	"palm_wood",
	"wood:palm_wood",
	{choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	{"palm_wood.png"},
	"Palm Wood Stair",
	"Palm Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_palm", {
	description = "Palm Fence",
	texture = "palm_wood.png",
	material = "wood:palm_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	check_for_pole = true,
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_palm",
	burntime = 5,
})

default.register_fence_rail("wood:fence_rail_palm", {
	description = "Palm Fence Rail",
	texture = "palm_wood.png",
	material = "wood:palm_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_rail_palm",
	burntime = 5,
})

doors.register_fencegate("wood:fence_gate_palm", {
	description = "Palm Fence Gate",
	texture = "palm_wood.png",
	material = "wood:palm_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_gate_palm_closed",
	burntime = 5,
})



-- ITEMS
-- palm wax
minetest.register_craftitem("wood:palm_wax", {
	description = "Palm Wax",
	inventory_image = "palm_wax.png",
	wield_image = "palm_wax.png"
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "wood:palm_wax",
	recipe = "wood:palm_leaves"
})