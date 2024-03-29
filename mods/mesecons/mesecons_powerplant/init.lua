-- The POWER_PLANT
-- Just emits power. always.

local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node("mesecons_powerplant:fusion_reactor", {
	tiles = {"fusion_reactor.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 2, mesecon = 2},
	light_source = minetest.LIGHT_MAX-9,
	description=S("Fusion Reactor"),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, -0.5+0.7, 0.3},
	},
	sounds = mesecon.node_sound.leaves,
	mesecons = {receptor = {
		state = mesecon.state.on
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_powerplant:fusion_reactor 1",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot",     "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "uraniumstuff:uran_gem", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "ores:ferrum_ingot",     "ores:ferrum_ingot"},
	}
})
