-- MOVESTONE
-- Non-sticky:
-- Moves along mesecon lines
-- Pushes all blocks in front of it
--
-- Sticky one
-- Moves along mesecon lines
-- Pushes all block in front of it
-- Pull all blocks in its back

local S = minetest.get_translator(minetest.get_current_modname())

-- settings:
local timer_interval = 1 / mesecon.setting("movestone_speed", 3)
local max_push = mesecon.setting("movestone_max_push", 50)
local max_pull = mesecon.setting("movestone_max_pull", 50)

-- helper functions:
local function get_movestone_direction(rulename, is_vertical)
	if is_vertical then
		if rulename.z > 0 then
			return {x = 0, y = -1, z = 0}
		elseif rulename.z < 0 then
			return {x = 0, y = 1, z = 0}
		elseif rulename.x > 0 then
			return {x = 0, y = -1, z = 0}
		elseif rulename.x < 0 then
			return {x = 0, y = 1, z = 0}
		end
	else
		if rulename.z > 0 then
			return {x = -1, y = 0, z = 0}
		elseif rulename.z < 0 then
			return {x = 1, y = 0, z = 0}
		elseif rulename.x > 0 then
			return {x = 0, y = 0, z = -1}
		elseif rulename.x < 0 then
			return {x = 0, y = 0, z = 1}
		end
	end
end

-- registration functions:
function mesecon.register_movestone(name, def, is_sticky, is_vertical)
	local function movestone_move(pos, node, rulename)
		local direction = get_movestone_direction(rulename, is_vertical)
		local frontpos = vector.add(pos, direction)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")

		-- ### Step 1: Push nodes in front ###
		local success, stack, oldstack = mesecon.mvps_push(frontpos, direction, max_push, owner)
		if not success then
			if stack == "protected" then
				meta:set_string("infotext", "Can't move: protected area on the way")
				return
			end
			minetest.get_node_timer(pos):start(timer_interval)
			return
		end
		mesecon.mvps_move_objects(frontpos, direction, oldstack)

		-- ### Step 2: Move the movestone ###
		minetest.set_node(frontpos, node)
		local meta2 = minetest.get_meta(frontpos)
		meta2:set_string("owner", owner)
		minetest.remove_node(pos)
		mesecon.on_dignode(pos, node)
		mesecon.on_placenode(frontpos, node)
		minetest.get_node_timer(frontpos):start(timer_interval)
		minetest.sound_play("movestone", { pos = pos, max_hear_distance = 20, gain = 0.5 }, true)

		-- ### Step 3: If sticky, pull stack behind ###
		if is_sticky then
			local backpos = vector.subtract(pos, direction)
			local success, _, oldstack = mesecon.mvps_pull_all(backpos, direction, max_pull, owner)
			if success then
				mesecon.mvps_move_objects(backpos, vector.multiply(direction, -1), oldstack, -1)
			end
		end

		-- ### Step 4: Let things fall ###
		minetest.check_for_falling(vector.add(pos, {x=0, y=1, z=0}))
	end

	def.is_ground_content = false

	def.mesecons = {effector = {
		action_on = function(pos, node, rulename)
			if rulename and not minetest.get_node_timer(pos):is_started() then
				movestone_move(pos, node, rulename)
			end
		end,
		rules = mesecon.rules.default,
	}}

	def.after_place_node = mesecon.mvps_set_owner

	def.on_punch = function(pos, _, player)
		local player_name = player and player.get_player_name and player:get_player_name()
		if mesecon.mvps_claim(pos, player_name) then
			minetest.get_node_timer(pos):start(timer_interval)
			minetest.chat_send_player(player_name, "Reclaimed mover")
		end
	end

	def.on_timer = function(pos)
		local sourcepos = mesecon.is_powered(pos)
		if not sourcepos then
			return
		end
		local rulename = vector.subtract(sourcepos[1], pos)
		mesecon.activate(pos, minetest.get_node(pos), rulename, 0)
	end

	def.on_blast = mesecon.on_blastnode

	minetest.register_node(name, def)
end


-- registration:
mesecon.register_movestone("mesecons_movestones:mover", {
	tiles = {
		"mover_side.png",
		"mover_side.png",
		"mover_arrow.png^[transformFX",
		"mover_arrow.png^[transformFX",
		"mover_arrow.png",
		"mover_arrow.png",
	},
	groups = {cracky = 3},
    description = S("Mover"),
	sounds = mesecon.node_sound.stone
}, false, false)

mesecon.register_movestone("mesecons_movestones:sticky_mover", {
	tiles = {
		"mover_side.png",
		"mover_side.png",
		"sticky_mover.png^[transformFX",
		"sticky_mover.png^[transformFX",
		"sticky_mover.png",
		"sticky_mover.png",
	},
	groups = {cracky = 3},
    description = S("Sticky Mover"),
	sounds = mesecon.node_sound.stone,
}, true, false)

mesecon.register_movestone("mesecons_movestones:mover_vertical", {
	tiles = {
		"mover_side.png",
		"mover_side.png",
		"mover_arrow.png^[transformFXR90",
		"mover_arrow.png^[transformR90",
		"mover_arrow.png^[transformFXR90",
		"mover_arrow.png^[transformR90",
	},
	groups = {cracky = 3},
    description = S("Vertical Mover"),
	sounds = mesecon.node_sound.stone
}, false, true)

mesecon.register_movestone("mesecons_movestones:sticky_mover_vertical", {
	tiles = {
		"mover_side.png^(glue.png^[opacity:127)",
		"mover_side.png^(glue.png^[opacity:127)",
		"mover_arrow.png^[transformFXR90",
		"mover_arrow.png^[transformR90",
		"mover_arrow.png^[transformFXR90",
		"mover_arrow.png^[transformR90",
	},
	groups = {cracky = 3},
    description = S("Vertical Sticky Mover"),
	sounds = mesecon.node_sound.stone,
}, true, true)


-- crafting:
-- base recipe:
minetest.register_craft({
	output = "mesecons_movestones:mover 2",
	recipe = {
		{"mesecons_gamecompat:stone",         "mesecons_gamecompat:stone",         "mesecons_gamecompat:stone"},
		{"group:mesecon_conductor_craftable", "group:mesecon_conductor_craftable", "group:mesecon_conductor_craftable"},
		{"mesecons_gamecompat:stone",         "mesecons_gamecompat:stone",         "mesecons_gamecompat:stone"},
	}
})

-- conversation:
minetest.register_craft({
	type = "shapeless",
	output = "mesecons_movestones:mover",
	recipe = {"mesecons_movestones:mover_vertical"},
})

minetest.register_craft({
	type = "shapeless",
	output = "mesecons_movestones:mover_vertical",
	recipe = {"mesecons_movestones:mover"},
})

minetest.register_craft({
	type = "shapeless",
	output = "mesecons_movestones:sticky_mover",
	recipe = {"mesecons_movestones:sticky_mover_vertical"},
})

minetest.register_craft({
	type = "shapeless",
	output = "mesecons_movestones:sticky_mover_vertical",
	recipe = {"mesecons_movestones:sticky_mover"},
})

-- make sticky:
minetest.register_craft({
	output = "mesecons_movestones:sticky_mover",
	recipe = {
		{"mesecons_materials:glue", "mesecons_movestones:mover", "mesecons_materials:glue"},
	}
})

minetest.register_craft({
	output = "mesecons_movestones:sticky_mover_vertical",
	recipe = {
		{"mesecons_materials:glue"},
		{"mesecons_movestones:movestone_vertical"},
		{"mesecons_materials:glue"},
	}
})


-- legacy code:
minetest.register_alias("mesecons_movestones:mover_active",
		"mesecons_movestones:mover")
minetest.register_alias("mesecons_movestones:sticky_mover_active",
		"mesecons_movestones:sticky_mover")
