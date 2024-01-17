-- Translation support
local S = minetest.get_translator("mobs_animal")

-- Cow by sirrobzeroone

mobs:register_mob("mobs_animal:bovis", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.2, 0.4},
	visual = "mesh",
	mesh = "mobs_cow.b3d",
	textures = {
		{"bovis.png"},
		{"bovis2.png"}
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_bovis",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 0, max = 2}
	},
	water_damage = 0.01,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		stand_start = 0,
		stand_end = 30,
		stand_speed = 20,
		stand1_start = 35,
		stand1_end = 75,
		stand1_speed = 20,
		walk_start = 85,
		walk_end = 114,
		walk_speed = 20,
		run_start = 120,
		run_end = 140,
		run_speed = 30,
		punch_start = 145,
		punch_end = 160,
		punch_speed = 20,
		die_start = 165,
		die_end = 185,
		die_speed = 10,
		die_loop = false
	},
	follow = {
		"farming:wheat", "default:grass_1"
	},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"ethereal:grass_dirt", "default:dirt", -1}
	},
--	stay_near = {{"farming:straw", "group:grass"}, 10},
	fear_height = 2,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then

			-- if fed 7x wheat or grass then bovis can be milked again
			if self.food and self.food > 6 then
				self.gotten = false
			end

			return
		end

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		local tool = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		local item = tool:get_name()

		-- milk bovis with empty bucket
		if item == "bucket:bucket_empty"
		or item == "wooden_bucket:bucket_wood_empty"
		or item == "bucket_wooden:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then

				minetest.chat_send_player(name, S("Bovis already milked!"))

				return
			end

			local inv = clicker:get_inventory()

			tool:take_item()
			clicker:set_wielded_item(tool)

			-- which bucket are we using
			local ret_item = "mobs:bucket_milk_purple"

			if item == "wooden_bucket:bucket_wood_empty"
			or item == "bucket_wooden:bucket_empty" then
				ret_item = "mobs:wooden_bucket_milk_purple"
			end

			if inv:room_for_item("main", {name = ret_item}) then
				clicker:get_inventory():add_item("main", ret_item)
			else
				local pos = self.object:get_pos()

				pos.y = pos.y + 0.5

				minetest.add_item(pos, {name = ret_item})
			end

			self.gotten = true -- milked

			return
		end
	end,

	on_replace = function(self, pos, oldnode, newnode)

		self.food = (self.food or 0) + 1

		-- if bovis replaces 8x grass then it can be milked again
		if self.food >= 8 then
			self.food = 0
			self.gotten = false
		end
	end
})


if not mobs.custom_spawn_animal then

	mobs:spawn({
		name = "mobs_animal:bovis",
		nodes = {"ethereal:grass_dirt"},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	})
end


mobs:register_egg("mobs_animal:bovis", S("Bovis"), "bovis_inv.png")


mobs:alias_mob("mobs:bovis", "mobs_animal:bovis") -- compatibility


-- bucket of milk
minetest.register_craftitem(":mobs:bucket_milk_purple", {
	description = S("Bucket of Purple Milk"),
	inventory_image = "bucket_milk_purple.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, "bucket:bucket_empty"),
	groups = {food_milk = 1, flammable = 3, drink = 1}
})

-- glass of milk
minetest.register_craftitem(":mobs:glass_milk_purple", {
	description = S("Glass of Purple Milk"),
	inventory_image = "glass_milk_purple.png",
	on_use = minetest.item_eat(2, "vessels:drinking_glass"),
	groups = {food_milk_glass = 1, flammable = 3, vessel = 1, drink = 1}
})

minetest.register_craft({
	output = "mobs:glass_milk_purple 4",
	recipe = {
		{"vessels:drinking_glass", "vessels:drinking_glass"},
		{"vessels:drinking_glass", "vessels:drinking_glass"},
		{"mobs:bucket_milk_purple", ""}
	},
	replacements = {{"mobs:bucket_milk_purple", "bucket:bucket_empty"}}
})

minetest.register_craft({
	output = "mobs:bucket_milk_purple",
	recipe = {
		{"mobs:glass_milk_purple", "mobs:glass_milk_purple"},
		{"mobs:glass_milk_purple", "mobs:glass_milk_purple"},
		{"bucket:bucket_empty", ""}
	},
	replacements = {
		{"mobs:glass_milk_purple", "vessels:drinking_glass 4"}
	}
})


-- butter
minetest.register_craftitem(":mobs:butter_purple", {
	description = S("Purple Butter"),
	inventory_image = "butter_purple.png",
	on_use = minetest.item_eat(1),
	groups = {food_butter = 1, flammable = 2}
})

local salt_item = "default:sapling" -- some saplings are high in sodium

if minetest.get_modpath("farming") and farming and farming.mod then
	salt_item = "farming:salt"
end

minetest.register_craft({
	output = "mobs:butter_purple",
	recipe = {{"mobs:bucket_milk_purple", salt_item}},
	replacements = {{"mobs:bucket_milk_purple", "bucket:bucket_empty"}}
})

-- cheese wedge
minetest.register_craftitem(":mobs:cheese_purple", {
	description = S("Purple Cheese"),
	inventory_image = "cheese_purple.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2}
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:cheese_purple",
	recipe = "mobs:bucket_milk_purple",
	cooktime = 5,
	replacements = {{"mobs:bucket_milk_purple", "bucket:bucket_empty"}}
})

-- cheese block
minetest.register_node(":mobs:cheese_purple_block", {
	description = S("Purple Cheese Block"),
	tiles = {"cheese_purple_block.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 3},
	sounds = default and default.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "mobs:cheese_purple_block",
	recipe = {
		{"group:food_cheese_purple", "group:food_cheese_purple", "group:food_cheese_purple"},
		{"group:food_cheese_purple", "group:food_cheese_purple", "group:food_cheese_purple"},
		{"group:food_cheese_purple", "group:food_cheese_purple", "group:food_cheese_purple"}
	}
})

minetest.register_craft({
	output = "mobs:cheese_purple 9",
	recipe = {{"mobs:cheese_purple_block"}}
})


-- check for either of the wood bucket mods and add compatibility
local wb = minetest.get_modpath("wooden_bucket")
local bw = minetest.get_modpath("bucket_wooden")

if wb or bw then

	local return_item = wb and "wooden_bucket:bucket_wood_empty"
			or "bucket_wooden:bucket_empty"

	minetest.register_craftitem(":mobs:wooden_bucket_milk_purple", {
		description = S("Wooden Bucket of Purple Milk"),
		inventory_image = "wooden_bucket_milk_purple.png",
		stack_max = 1,
		on_use = minetest.item_eat(8, return_item),
		groups = {food_milk = 1, flammable = 3, drink = 1}
	})

	minetest.register_craft({
		output = "mobs:glass_milk_purple 4",
		recipe = {
			{"vessels:drinking_glass_purple", "vessels:drinking_glass_purple"},
			{"vessels:drinking_glass_purple", "vessels:drinking_glass_purple"},
			{"mobs:wooden_bucket_milk_purple", ""}
		},
		replacements = {{"mobs:wooden_bucket_milk_purple", return_item}}
	})

	minetest.register_craft({
		output = "mobs:wooden_bucket_milk_purple",
		recipe = {
			{"mobs:glass_milk_purple", "mobs:glass_milk_purple"},
			{"mobs:glass_milk_purple", "mobs:glass_milk_purple"},
			{return_item, ""}
		},
		replacements = {
			{"group:food_milk_glass", "vessels:drinking_glass 4"}
		}
	})

	minetest.register_craft({
		output = "mobs:butter_purple",
		recipe = {{"mobs:wooden_bucket_milk_purple", salt_item}},
		replacements = {{"mobs:wooden_bucket_milk_purple", return_item}}
	})
end
