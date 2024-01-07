local S = default.get_translator

-- VARIABLES
local cracky = 2

local maxlevel = 2
local uses = 20
local fleshy = 6
local crackytime = 0.80
local crumblytime = 0.40
local choppytime = 1.00
local snappytime = 0.35



-- NODES
-- ore
minetest.register_node("ores:stone_with_ferrum", {
	description = "Ferrum Ore",
	tiles = {"stone.png^ferrum_ore.png"},
	groups = {cracky = cracky},
	drop = "ores:ferrum_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- block
minetest.register_node("ores:ferrum_block", {
	description = "Ferrum Block",
	tiles = {"ferrum_block.png"},
	is_ground_content = false,
	groups = {cracky = (cracky - 1), level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:ferrum_block",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
	}
})

-- stair
stairs.register_stair_and_slab(
	"ferrum_block",
	"ores:ferrum_block",
	{cracky = (cracky - 1), level = 2},
	{"ferrum_block.png"},
	"Ferrum Stair",
	"Ferrum Slab",
	default.node_sound_metal_defaults()
)

-- door
doors.register("door_durasteel", {
		tiles = {{name = "door_ferrum.png", backface_culling = true}},
		description = "Ferrum Door",
		inventory_image = "door_ferrum_inv.png",
		protected = true,
		groups = {node = 1, cracky = (cracky - 1), level = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		gain_open = 0.2,
		gain_close = 0.2,
		recipe = {
			{"ores:ferrum_ingot", "ores:ferrum_ingot"},
			{"ores:ferrum_ingot", "ores:ferrum_ingot"},
			{"ores:ferrum_ingot", "ores:ferrum_ingot"},
		}
})

-- trapdoor
doors.register_trapdoor("ores:trapdoor_ferrum", {
	description = "Ferrum Trapdoor",
	inventory_image = "trapdoor_ferrum.png",
	wield_image = "trapdoor_ferrum.png",
	tile_front = "trapdoor_ferrum.png",
	tile_side = "trapdoor_ferrum_side.png",
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	gain_open = 0.2,
	gain_close = 0.2,
	groups = {cracky = (cracky - 1), level = 2, door = 1},
})

minetest.register_craft({
	output = "ores:trapdoor_ferrum",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "ores:ferrum_ingot"},
	}
})

-- sign
minetest.register_node("ores:sign_wall_ferrum", {
		description = "Ferrum Sign",
		drawtype = "nodebox",
		tiles = {"sign_wall_ferrum.png"},
		inventory_image = "sign_ferrum.png",
		wield_image = "sign_ferrum.png",
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
		groups = {cracky = cracky, attached_node = 1},
		legacy_wallmounted = true,
		sounds = default.node_sound_metal_defaults(),

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

minetest.register_craft({
	output = "ores:sign_wall_ferrum 3",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"", "group:stick", ""},
	}
})

-- ladder
minetest.register_node("ores:ladder_ferrum", {
	description = "Ferrum Ladder",
	drawtype = "signlike",
	tiles = {"ladder_ferrum.png"},
	inventory_image = "ladder_ferrum.png",
	wield_image = "ladder_ferrum.png",
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
	groups = {cracky = cracky},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "ores:ladder_ferrum 15",
	recipe = {
		{"ores:ferrum_ingot", "", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "", "ores:ferrum_ingot"},
	}
})



-- ITEMS
-- raw lump
minetest.register_craftitem("ores:ferrum_lump", {
	description = "Ferrum Lump",
	inventory_image = "ferrum_lump.png"
})

-- ingot
minetest.register_craftitem("ores:ferrum_ingot", {
	description = "Ferrum Ingot",
	inventory_image = "ferrum_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "ores:ferrum_ingot",
	recipe = "ores:ferrum_lump",
})

minetest.register_craft({
	output = "ores:ferrum_ingot 9",
	recipe = {
		{"ores:ferrum_block"},
	}
})



-- ENTITIES



-- TOOLS
-- pick
minetest.register_tool("ores:pick_ferrum", {
	description = "Ferrum Pickaxe",
	inventory_image = "pick_ferrum.png",
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
	output = "ores:pick_ferrum",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

-- shovel
minetest.register_tool("ores:shovel_ferrum", {
	description = "Ferrum Shovel",
	inventory_image = "shovel_ferrum.png",
	wield_image = "shovel_ferrum.png^[transformR90",
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
	output = "ores:shovel_ferrum",
	recipe = {
		{"ores:ferrum_ingot"},
		{"group:stick"},
		{"group:stick"}
	}
})

-- axe
minetest.register_tool("ores:axe_ferrum", {
	description = "Ferrum Axe",
	inventory_image = "axe_ferrum.png",
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
	output = "ores:axe_ferrum",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"ores:ferrum_ingot", "group:stick"},
		{"", "group:stick"}
	}
})

minetest.register_craft({
	output = "ores:axe_ferrum",
	recipe = {
		{"ores:ferrum_ingot", "ores:ferrum_ingot"},
		{"group:stick", "ores:ferrum_ingot"},
		{"group:stick", ""}
	}
})

-- sword
minetest.register_tool("ores:sword_ferrum", {
	description = "Ferrum Sword",
	inventory_image = "sword_ferrum.png",
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
	output = "ores:sword_ferrum",
	recipe = {
		{"ores:ferrum_ingot"},
		{"ores:ferrum_ingot"},
		{"group:stick"}
	}
})