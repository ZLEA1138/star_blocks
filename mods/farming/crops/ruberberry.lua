
local S = farming.translate
local a = farming.recipe_items

-- ruberberries
minetest.register_craftitem("farming:ruberberries", {
	description = S("Wild Ruberberries"),
	inventory_image = "ruberberries.png",
	groups = {
		compostability = 48,seed = 2, food_ruberberries = 1, food_ruberberry = 1,
		food_berry = 1, flammable = 2
	},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:ruberberry_1")
	end,
	on_use = minetest.item_eat(1)
})

-- ruberberry muffin (thanks to sosogirl123 @ deviantart.com for muffin image)
minetest.register_craftitem("farming:muffin_ruberberry", {
	description = S("Ruberberry Muffin"),
	inventory_image = "ruberberry_muffin.png",
	on_use = minetest.item_eat(2),
	groups = {compostability = 65}
})

minetest.register_craft({
	output = "farming:muffin_ruberberry 2",
	recipe = {
		{"group:food_ruberberries", "group:food_bread", "group:food_ruberberries"}
	}
})

-- Ruberberry Pie
minetest.register_craftitem("farming:ruberberry_pie", {
	description = S("Ruberberry Pie"),
	inventory_image = "ruberberry_pie.png",
	on_use = minetest.item_eat(6),
	groups = {compostability = 75}
})

minetest.register_craft({
	output = "farming:ruberberry_pie",
	recipe = {
		{"group:food_flour", "group:food_sugar", "group:food_ruberberries"},
		{"", a.baking_tray, ""}
	},
	replacements = {{"group:food_baking_tray", "farming:baking_tray"}}
})

-- Red Dye
minetest.register_craft({
	output = a.dye_red,
	recipe = {{"farming:ruberberries"}}
})

-- ruberberry definition
local def = {
	drawtype = "plantlike",
	tiles = {"ruberberry_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		handy = 1, snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = farming.sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:ruberberry_1", table.copy(def))

-- stage 2
def.tiles = {"ruberberry_2.png"}
minetest.register_node("farming:ruberberry_2", table.copy(def))

-- stage 3
def.tiles = {"ruberberry_3.png"}
minetest.register_node("farming:ruberberry_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"ruberberry_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"farming:ruberberries 2"}, rarity = 1},
		{items = {"farming:ruberberries"}, rarity = 2},
		{items = {"farming:ruberberries"}, rarity = 3}
	}
}
minetest.register_node("farming:ruberberry_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:ruberberries"] = {
	crop = "farming:ruberberry",
	seed = "farming:ruberberries",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}

-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:grass_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.ruberberry,
		spread = {x = 100, y = 100, z = 100},
		seed = 678,
		octaves = 3,
		persist = 0.6
	},
	y_min = 3,
	y_max = 15,
	decoration = "farming:ruberberry_4"
})
