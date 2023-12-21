-- carts/rails.lua

-- support for MT game translation.
local S = carts.get_translator

carts:register_rail("carts:rail", {
	description = S("Rail"),
	tiles = {
		"rail_straight.png", "rail_curved.png",
		"rail_t_junction.png", "rail_crossing.png"
	},
	inventory_image = "rail_straight.png",
	wield_image = "rail_straight.png",
	groups = carts:get_rail_groups(),
}, {})

minetest.register_craft({
	output = "carts:rail 18",
	recipe = {
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
	}
})

carts:register_rail("carts:powerrail", {
	description = S("Powered Rail"),
	tiles = {
		"rail_straight_pwr.png", "rail_curved_pwr.png",
		"rail_t_junction_pwr.png", "rail_crossing_pwr.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = 5})

minetest.register_craft({
	output = "carts:powerrail 18",
	recipe = {
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
	}
})


carts:register_rail("carts:brakerail", {
	description = S("Brake Rail"),
	tiles = {
		"rail_straight_brk.png", "rail_curved_brk.png",
		"rail_t_junction_brk.png", "rail_crossing_brk.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = -3})

minetest.register_craft({
	output = "carts:brakerail 18",
	recipe = {
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "default:coal_lump", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
	}
})
