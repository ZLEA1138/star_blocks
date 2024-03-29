local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node("mesecons:wire_off", {
	drawtype = "raillike",
	tiles = {"wire.png", "wire_curved.png", "wire_t_junction.png", "wire_mesecon_crossing.png"},
	inventory_image = "wire.png",
	wield_image = "wire.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},
	},
	groups = {dig_immediate=3, mesecon=1, mesecon_conductor_craftable=1},
	description= S("Wire"),
	mesecons = {conductor={
		state = mesecon.state.off,
		onstate = "mesecons:wire_on"
	}}
})

minetest.register_node("mesecons:wire_on", {
	drawtype = "raillike",
	tiles = {"wire.png", "wire_curved.png", "wire_t_junction.png", "wire_crossing.png"},
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},
	},
	groups = {dig_immediate=3, not_in_creaive_inventory=1, mesecon=1},
	drop = "mesecons:wire_off 1",
	light_source = minetest.LIGHT_MAX-11,
	mesecons = {conductor={
		state = mesecon.state.on,
		offstate = "mesecons:wire_off"
	}}
})
