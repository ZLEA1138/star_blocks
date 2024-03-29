-- The BLINKY_PLANT

local S = minetest.get_translator(minetest.get_current_modname())

local toggle_timer = function (pos)
	local timer = minetest.get_node_timer(pos)
	if timer:is_started() then
		timer:stop()
	else
		timer:start(mesecon.setting("blinky_plant_interval", 3))
	end
end

local on_timer = function (pos)
	local node = minetest.get_node(pos)
	if(mesecon.flipstate(pos, node) == "on") then
		mesecon.receptor_on(pos)
	else
		mesecon.receptor_off(pos)
	end
	toggle_timer(pos)
end

mesecon.register_node("mesecons_blinkyplant:clock", {
	description="System Clock",
	drawtype = "nodebox",
	inventory_image = "clock_off.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = true,
	sounds = mesecon.node_sound.leaves,
	selection_box = {
		type = "fixed",
		fixed = { -8/16, -8/16, -8/16, 8/16, -5/16, 8/16 },
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16, -8/16, 8/16, -7/16, 8/16 }, -- bottom slab
			{ -5/16, -7/16, -5/16, 5/16, -6/16, 5/16 }, -- circuit board
			{ -3/16, -6/16, -3/16, 3/16, -5/16, 3/16 }, -- IC
		}
	},
	on_timer = on_timer,
	on_rightclick = function(pos, _, clicker)
		if minetest.is_protected(pos, clicker and clicker:get_player_name() or "") then
			return
		end

		toggle_timer(pos)
	end,
	on_construct = toggle_timer
},{
	tiles = {
		"clock_off.png",
		"microcontroller_bottom.png",
		"clock_side.png",
		"clock_side.png",
		"clock_side.png",
		"clock_side.png"
	},
	groups = {dig_immediate=3},
	mesecons = {receptor = { state = mesecon.state.off }}
},{
	tiles = {
		"clock_on.png",
		"microcontroller_bottom.png",
		"clock_side.png",
		"clock_side.png",
		"clock_side.png",
		"clock_side.png"
	},
	groups = {dig_immediate=2, not_in_creative_inventory=1},
	mesecons = {receptor = { state = mesecon.state.on }}
})

minetest.register_craft({
	output = "mesecons_blinkyplant:clock_off 1",
	recipe = {
		{'',                                  'group:mesecon_conductor_craftable', ''},
		{'group:mesecon_conductor_craftable', 'ores:aurum_ingot',                  'group:mesecon_conductor_craftable'},
		{'',                                  'group:mesecon_conductor_craftable', ''},
	}
})
