
local S = ethereal.intllib

-- vines
minetest.register_node("ethereal:vine", {
	description = S("Vine"),
	drawtype = "signlike",
	tiles = {"vine.png"},
	inventory_image = "vine.png",
	wield_image = "vine.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted"
	},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_craft({
	output = "ethereal:vine 2",
	recipe = {
		{"group:leaves", "", "group:leaves"},
		{"", "group:leaves", ""},
		{"group:leaves", "", "group:leaves"}
	}
})

-- Fern
minetest.register_node("ethereal:fern", {
	description = S("Fern"),
	drawtype = "plantlike",
	visual_scale = 1.4,
	tiles = {"fern.png"},
	inventory_image = "fern.png",
	wield_image = "fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:fern_tubers"}, rarity = 6},
			{items = {"ethereal:fern"}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16}
	}
})

-- Boston Ferns sometimes drop edible Tubers (heals 1/2 heart when eaten)
minetest.register_craftitem("ethereal:fern_tubers", {
	description = S("Fern Tubers"),
	inventory_image = "fern_tubers.png",
	groups = {food_tuber = 1, flammable = 2},
	on_use = minetest.item_eat(1)
})

-- Snowy Grass (not Flammable - too cold to burn)
minetest.register_node("ethereal:snowy_grass", {
	description = S("Snowy Grass"),
	drawtype = "plantlike",
	visual_scale = 0.9,
	tiles = {"snowy_grass.png"},
	inventory_image = "snowy_grass.png",
	wield_image = "snowy_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 5 / 16, 5 / 16}
	}
})
