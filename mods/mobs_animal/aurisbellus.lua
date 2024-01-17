-- Translation support
local S = minetest.get_translator("mobs_animal")

-- Bunny by ExeterDad

mobs:register_mob("mobs_animal:aurisbellus", {
	type = "animal",
	passive = true,
	reach = 1,
	stepheight = 0.6,
	hp_min = 1,
	hp_max = 4,
	armor = 200,
	collisionbox = {-0.268, -0.5, -0.268, 0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "mobs_bunny.b3d",
	drawtype = "front",
	textures = {
		{"aurisbellus_grey.png"},
		{"aurisbellus_brown.png"},
		{"aurisbellus_white.png"}
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	runaway_from = {"mobs_animal:pumba", "player"},
	jump = true,
	jump_height = 6,
	drops = {
		{name = "mobs:aurisbellus_raw", chance = 1, min = 1, max = 1},
		{name = "mobs:aurisbellus_hide", chance = 1, min = 0, max = 1}
	},
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 15,
		stand_start = 1,
		stand_end = 15,
		walk_start = 16,
		walk_end = 24,
		punch_start = 16,
		punch_end = 24
	},
	--follow = {"farming:carrot", "farming_plus:carrot_item", "default:grass_1"},
	view_range = 8,
	replace_rate = 10,
	--replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end

		-- Monty Python tribute
		local item = clicker:get_wielded_item()
		local player_name = clicker:get_player_name()

		if self.owner == player_name
		and item:get_name() == "mobs:lava_orb" then

			-- take orb
			if not mobs.is_creative(clicker:get_player_name()) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			-- set special aurisbellus attributes
			local staticdata = minetest.serialize({
				type = "monster",
				attack_type = "dogfight",
				health = 20,
				damage = 5,
				run_velocity = 3,
				passive = false,
				runaway = false,
				runaway_from = {},
				runaway_timer = 0,
				tamed = false,
				base_texture = {"aurisbellus_killer.png"}
			})

			-- add killer aurisbellus
			local obj = minetest.add_entity(
					self.object:get_pos(), "mobs_animal:aurisbellus", staticdata)

			obj:set_properties({textures = {"aurisbellus_killer.png"}, hp_max = 20})

			-- remove old aurisbellus
			if obj:get_luaentity() then
				mobs:remove(self, true)
			end
		end
	end,

	on_spawn = function(self)

		local pos = self.object:get_pos() ; pos.y = pos.y - 1

		-- white snowy aurisbellus
		if minetest.find_node_near(pos, 1,
				{"default:snow", "default:snow_block", "ethereal:snow_dirt"}) then
			self.base_texture = {"aurisbellus_white.png"}
			self.object:set_properties({textures = self.base_texture})

		-- brown desert aurisbellus
		elseif minetest.find_node_near(pos, 1,
				{"default:desert_sand", "default:desert_stone"}) then
			self.base_texture = {"aurisbellus_brown.png"}
			self.object:set_properties({textures = self.base_texture})

		-- grey stone aurisbellus
		elseif minetest.find_node_near(pos, 1,
				{"default:stone", "default:gravel"}) then
			self.base_texture = {"aurisbellus_grey.png"}
			self.object:set_properties({textures = self.base_texture})
		end

		return true -- run only once, false/nil runs every activation
	end
})


local spawn_on = "ethereal:grass_dirt"

if minetest.get_modpath("ethereal") then
	spawn_on = "ethereal:prairie_dirt"
end

if not mobs.custom_spawn_animal then

	mobs:spawn({
		name = "mobs_animal:aurisbellus",
		nodes = {spawn_on},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	})
end


mobs:register_egg("mobs_animal:aurisbellus", S("Auris Bellus"), "aurisbellus_inv.png", 0)


mobs:alias_mob("mobs:aurisbellus", "mobs_animal:aurisbellus") -- compatibility


-- raw aurisbellus
minetest.register_craftitem(":mobs:aurisbellus_raw", {
	description = S("Raw Auris Bellus"),
	inventory_image = "aurisbellus_raw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, food_aurisbellus_raw = 1, flammable = 2}
})

-- cooked aurisbellus
minetest.register_craftitem(":mobs:aurisbellus_cooked", {
	description = S("Cooked Auris Bellus"),
	inventory_image = "aurisbellus_cooked.png",
	on_use = minetest.item_eat(5),
	groups = {food_meat = 1, food_aurisbellus = 1, flammable = 2}
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:aurisbellus_cooked",
	recipe = "mobs:aurisbellus_raw",
	cooktime = 5
})

-- aurisbellus hide
minetest.register_craftitem(":mobs:aurisbellus_hide", {
	description = S("Auris Bellus Hide"),
	inventory_image = "aurisbellus_hide.png",
	groups = {flammable = 2, pelt = 1}
})

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:aurisbellus_hide",
	burntime = 2
})

minetest.register_craft({
	output = "mobs:leather",
	recipe = {
		{"mobs:aurisbellus_hide", "mobs:aurisbellus_hide"},
		{"mobs:aurisbellus_hide", "mobs:aurisbellus_hide"}
	}
})
