-- Translation support
local S = minetest.get_translator("mobs_animal")

-- Bee by KrupnoPavel (.b3d model by sirrobzeroone)

mobs:register_mob("mobs_animal:apis", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 2,
	armor = 200,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.5, 0.2},
	visual = "mesh",
	mesh = "mobs_bee.b3d",
	textures = {
		{"apis.png"}
	},
	blood_texture = "apis_inv.png",
	blood_amount = 1,
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_apis"
	},
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:mella", chance = 2, min = 1, max = 2}
	},
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -3,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		walk_start = 35,
		walk_end = 65
	},

	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 50, 90, 0, true, "mobs_animal:apis")
	end,

--	after_activate = function(self, staticdata, def, dtime)
--		print ("------", self.name, dtime, self.health)
--	end,
})

if not mobs.custom_spawn_animal then

	mobs:spawn({
		name = "mobs_animal:apis",
		nodes = {"group:flower"},
		min_light = 14,
		interval = 60,
		chance = 7000,
		min_height = 3,
		max_height = 200,
		day_toggle = true
	})
end


-- spawn egg
mobs:register_egg("mobs_animal:apis", S("Apis"), "apis_inv.png")


-- compatibility (only required if moving from old mobs to mobs_redo)
mobs:alias_mob("mobs:apis", "mobs_animal:apis")


-- mella
minetest.register_craftitem(":mobs:mella", {
	description = S("Mella"),
	inventory_image = "mella_inv.png",
	on_use = minetest.item_eat(4),
	groups = {food_mella = 1, food_sugar = 1, flammable = 1}
})


-- apishive (when placed spawns apis)
minetest.register_node(":mobs:apishive", {
	description = S("Apis Hive"),
	drawtype = "plantlike",
	tiles = {"apishive.png"},
	inventory_image = "apishive.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {oddly_breakable_by_hand = 3, flammable = 1, disable_suffocation = 1},
	sounds = default and default.node_sound_defaults(),

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)
		local gui_bg = default and default.gui_bg .. default.gui_bg_img .. default.gui_slots or ""

		meta:set_string("formspec", "size[8,6]"
			.. gui_bg
			.. "image[3,0.8;0.8,0.8;apis_inv.png]"
			.. "list[current_name;apishive;4,0.5;1,1;]"
			.. "list[current_player;main;0,2.35;8,4;]"
			.. "listring[]")

		meta:get_inventory():set_size("apishive", 1)
	end,

	after_place_node = function(pos, placer, itemstack)

		if placer and placer:is_player() then

			minetest.set_node(pos, {name = "mobs:apishive", param2 = 1})

			if math.random(4) == 1 then
				minetest.add_entity(pos, "mobs_animal:apis")
			end
		end
	end,

	on_punch = function(pos, node, puncher)

		-- yep, apis's don't like having their home punched by players
		minetest.after(0.2, function()

			local hp = puncher and puncher:get_hp()

			if hp then
				puncher:set_hp(hp - 4)
			end
		end)
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)

		if listname == "apishive" then
			return 0
		end

		return stack:get_count()
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)

		-- only dig apishive if no mella inside
		return meta:get_inventory():is_empty("apishive")
	end
})

-- apishive recipe
minetest.register_craft({
	output = "mobs:apishive",
	recipe = {
		{"mobs:apis","mobs:apis","mobs:apis"}
	}
})

-- mella block
minetest.register_node(":mobs:mella_block", {
	description = S("Mella Block"),
	tiles = {"mella_block.png"},
	groups = {snappy = 3, flammable = 2},
	sounds = default and default.node_sound_dirt_defaults()
})

-- recipe
minetest.register_craft({
	output = "mobs:mella_block",
	recipe = {
		{"mobs:mella", "mobs:mella", "mobs:mella"},
		{"mobs:mella", "mobs:mella", "mobs:mella"},
		{"mobs:mella", "mobs:mella", "mobs:mella"}
	}
})

minetest.register_craft({
	output = "mobs:mella 9",
	recipe = {
		{"mobs:mella_block"}
	}
})


-- apishive workings
minetest.register_abm({
	nodenames = {"mobs:apishive"},
	interval = 12,
	chance = 6,
	catch_up = false,
	action = function(pos, node)

		-- apis's only make mella during the day
		local tod = (minetest.get_timeofday() or 0) * 24000

		if tod < 5500 or tod > 18500 then
			return
		end

		-- is hive full?
		local meta = minetest.get_meta(pos)
		if not meta then return end -- for older apishives
		local inv = meta:get_inventory()
		local mella = inv:get_stack("apishive", 1):get_count()

		-- is hive full?
		if mella > 11 then
			return
		end

		-- no flowers no mella, nuff said!
		if #minetest.find_nodes_in_area_under_air(
			{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
			{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
			"group:flower") > 3 then

			inv:add_item("apishive", "mobs:mella")
		end
	end
})
