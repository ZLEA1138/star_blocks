local S = default.get_translator

-- VARIABLES
local choppy = 2

local maxlevel = 1
local uses = 10
local fleshy = 2
local crackytime = 1.60
local crumblytime = 0.60
local choppytime = 1.50
local snappytime = 0.40



-- NODES
-- ladder
minetest.register_node("wood:ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"ladder_wood.png"},
	inventory_image = "ladder_wood.png",
	wield_image = "ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = choppy, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:ladder_wood 5",
	recipe = {
		{"group:stick", "",            "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "",            "group:stick"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:ladder_wood",
	burntime = 7,
})

-- sign
minetest.register_node("wood:sign_wall_wood", {
	description = "Wooden Sign",
	drawtype = "nodebox",
	tiles = {"sign_wall_wood.png"},
	inventory_image = "sign_wood.png",
	wield_image = "sign_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	use_texture_alpha = "opaque",
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
		wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
		wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
	},
	groups = {choppy = choppy, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
	
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local player_name = sender:get_player_name()
		if minetest.is_protected(pos, player_name) then
			minetest.record_protection_violation(pos, player_name)
			return
		end
		local text = fields.text
		if not text then
			return
		end
		if string.len(text) > 512 then
			minetest.chat_send_player(player_name, S("Text too long"))
			return
		end
		default.log_player_action(sender, "wrote \"" .. text ..
			"\" to the sign at", pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("text", text)
		
		if #text > 0 then
		meta:set_string("infotext", S('"@1"', text))
		else
			meta:set_string("infotext", '')
		end
	end,
})

-- chest
default.chest.register_chest("wood:chest_wood", {
	description = "Wooden Chest",
	tiles = {
		"chest_wood_top.png",
		"chest_wood_top.png",
		"chest_wood_side.png",
		"chest_wood_side.png",
		"chest_wood_front.png",
		"chest_wood_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "default_chest_open",
	sound_close = "default_chest_close",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2},
})

minetest.register_craft({
	output = "wood:chest_wood",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "",           "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:chest_wood",
	burntime = 30,
})

-- locked chest
default.chest.register_chest("wood:chest_wood_locked", {
	description = "Locked Wooden Chest",
	tiles = {
		"chest_wood_top.png",
		"chest_wood_top.png",
		"chest_wood_side.png",
		"chest_wood_side.png",
		"chest_wood_lock.png",
		"chest_wood_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "default_chest_open",
	sound_close = "default_chest_close",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2},
	protected = true,
})

minetest.register_craft({
	output = "wood:chest_wood_locked",
	recipe = {
		{"group:wood", "group:wood",        "group:wood"},
		{"group:wood", "ores:ferrum_ingot", "group:wood"},
		{"group:wood", "group:wood",        "group:wood"},
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "wood:chest_wood_locked",
	recipe = {"wood:chest_wood", "ores:ferrum_ingot"},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:chest_wood_locked",
	burntime = 30,
})

-- door
doors.register("door_wood", {
	tiles = {{ name = "door_wood.png", backface_culling = true }},
	description = "Wooden Door",
	inventory_image = "door_wood_inv.png",
	groups = {node = 1, choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2},
	gain_open = 0.06,
	gain_close = 0.13,
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood",
	burntime = 14,
})

-- trapdoor
doors.register_trapdoor("wood:trapdoor_wood", {
	description = "Wooden Trapdoor",
	inventory_image = "trapdoor_wood.png",
	wield_image = "trapdoor_wood.png",
	tile_front = "trapdoor_wood.png",
	tile_side = "trapdoor_wood_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2, door = 1},
})

minetest.register_craft({
	output = "wood:trapdoor_wood 2",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:trapdoor_wood",
	burntime = 7,
})



-- ITEMS
-- stick
minetest.register_craftitem("wood:stick", {
	description = "Stick",
	inventory_image = "stick.png",
	groups = {stick = 1, flammable = 2},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:stick",
	burntime = 1,
})

minetest.register_alias("default:stick", "wood:stick")



-- ENTITIES
-- boat TODO



-- TOOLS
-- pick
minetest.register_tool("wood:pick_wood", {
	description = "Wooden Pickaxe",
	inventory_image = "pick_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times = {[3] = crackytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = fleshy},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1, flammable = 2}
})

minetest.register_craft({
	output = "wood:pick_wood",
	recipe = {
		{"group:wood", "group:wood",  "group:wood"},
		{"",           "group:stick", ""},
		{"",           "group:stick", ""}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:pick_wood",
	burntime = 6,
})

-- shovel
minetest.register_tool("wood:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "shovel_wood.png",
	wield_image = "shovel_wood.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times = {[1] = (crumblytime * 5), [2] = (crumblytime * 2.5), [3] = crumblytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = fleshy},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1, flammable = 2}
})

minetest.register_craft({
	output = "wood:shovel_wood",
	recipe = {
		{"group:wood"},
		{"group:stick"},
		{"group:stick"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:shovel_wood",
	burntime = 4,
})

-- axe
minetest.register_tool("wood:axe_wood", {
	description = "Wooden Axe",
	inventory_image = "axe_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times = {[2] = (choppytime * 2), [3] = choppytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = fleshy},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1, flammable = 2}
})

minetest.register_craft({
	output = "wood:axe_wood",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:stick"},
		{"",           "group:stick"}
	}
})

minetest.register_craft({
	output = "wood:axe_wood",
	recipe = {
		{"group:wood",  "group:wood"},
		{"group:stick", "group:wood"},
		{"group:stick", ""}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:axe_wood",
	burntime = 6,
})

-- sword
minetest.register_tool("wood:sword_wood", {
	description = "Wooden Sword",
	inventory_image = "sword_wood.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy = {times = {[2] = (snappytime * 4), [3] = snappytime}, uses = uses, maxlevel = maxlevel},
		},
		damage_groups = {fleshy = fleshy},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1, flammable = 2}
})

minetest.register_craft({
	output = "wood:sword_wood",
	recipe = {
		{"group:wood"},
		{"group:wood"},
		{"group:stick"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:sword_wood",
	burntime = 5,
})