-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:tavifruit_trunk", {
	description = "Tavifruit Trunk",
	tiles = {
		"tavifruit_trunk_top.png",
		"tavifruit_trunk_top.png",
		"tavifruit_trunk.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:tavifruit_trunk",
	burntime = 30,
})

-- wood
minetest.register_node("wood:tavifruit_wood", {
	description = "Tavifruit Wood",
	tiles = {"tavifruit_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:tavifruit_wood 4",
	recipe = {{"wood:tavifruit_trunk"}},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:tavifruit_wood",
	burntime = 7,
})

-- leaves
minetest.register_node("wood:tavifruit_leaves", {
	description = "Tavifruit Leaves",
	drawtype = "plantlike",
	tiles = {"tavifruit_leaves.png"},
	inventory_image = "tavifruit_leaves.png",
	wield_image = "tavifruit_leaves.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:tavifruit_sapling"}, rarity = 10},
			{items = {"wood:tavifruit_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:tavifruit_trunk"},
	leaves = {"wood:tavifruit_leaves"},
	radius = 3
})

--tavifruit fruit
minetest.register_node("wood:tavifruit", {
	description = "Tavifruit",
	drawtype = "plantlike",
	tiles = {"tavifruit.png"},
	inventory_image = "tavifruit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "wood:tavifruit", param2 = 1})
	end
})

-- sapling
minetest.register_node("wood:tavifruit_sapling", {
	description = "Tavifruit Tree Sapling",
	drawtype = "plantlike",
	tiles = {"tavifruit_tree_sapling.png"},
	inventory_image = "tavifruit_tree_sapling.png",
	wield_image = "tavifruit_tree_sapling.png",
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
	grown_height = 6
})

-- stair
stairs.register_stair_and_slab(
	"tavifruit_wood",
	"wood:tavifruit_wood",
	{choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	{"tavifruit_wood.png"},
	"Tavifruit Wood Stair",
	"Tavifruit Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_tavifruit", {
	description = "Tavifruit Fence",
	texture = "tavifruit_wood.png",
	material = "wood:tavifruit_wood",
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
	recipe = "wood:fence_tavifruit",
	burntime = 7,
})

default.register_fence_rail("wood:fence_rail_tavifruit", {
	description = "Tavifruit Fence Rail",
	texture = "tavifruit_wood.png",
	material = "wood:tavifruit_wood",
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
	recipe = "wood:fence_rail_tavifruit",
	burntime = 7,
})

doors.register_fencegate("wood:fence_gate_tavifruit", {
	description = "Tavifruit Fence Gate",
	texture = "tavifruit_wood.png",
	material = "wood:tavifruit_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_gate_tavifruit_closed",
	burntime = 7,
})