-- Translation support
local S = minetest.get_translator("mobs_animal")

-- Warthog originally by KrupnoPavel, B3D model by sirrobzeroone

mobs:register_mob("mobs_animal:porcus", {
	stepheight = 0.6,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	hp_min = 5,
	hp_max = 15,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.95, 0.4},
	visual = "mesh",
	mesh = "mobs_pumba.b3d",
	textures = {
		{"porcus.png"}
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_porcus",
		attack = "mobs_porcus_angry"
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	jump_height = 6,
	pushable = true,
	follow = {"default:tavifruit"},
	view_range = 10,
	drops = {
		{name = "mobs:suilla_raw", chance = 1, min = 1, max = 3}
	},
	water_damage = 0.01,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 15,
		stand_start = 25,
		stand_end = 55,
		walk_start = 70,
		walk_end = 100,
		punch_start = 70,
		punch_end = 100,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true
	},

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end
})


local spawn_on = {"ethereal:grass_dirt"}
local spawn_by = {"group:grass"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"ethereal:savanna_dirt"}
	spawn_by = {"group:dry_grass"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:fungus_dirt"}
	spawn_by = {"flowers:mushroom_brown", "flowers:mushroom_red"}
end

if not mobs.custom_spawn_animal then

	mobs:spawn({
		name = "mobs_animal:porcus",
		nodes = spawn_on,
		neighbors = spawn_by,
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 0,
		max_height = 200,
		day_toggle = true
	})
end


-- spawn egg
mobs:register_egg("mobs_animal:porcus", S("Porcus"), "porcus_inv.png")


mobs:alias_mob("mobs:porcus", "mobs_animal:porcus") -- compatibility


-- raw suilla
minetest.register_craftitem(":mobs:suilla_raw", {
	description = S("Raw Suilla"),
	inventory_image = "suilla_raw.png",
	on_use = minetest.item_eat(4),
	groups = {food_meat_raw = 1, food_suilla_raw = 1, flammable = 2}
})

-- cooked suilla
minetest.register_craftitem(":mobs:suilla_cooked", {
	description = S("Cooked Suilla"),
	inventory_image = "suilla_cooked.png",
	on_use = minetest.item_eat(8),
	groups = {food_meat = 1, food_suilla = 1, flammable = 2}
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:suilla_cooked",
	recipe = "mobs:suilla_raw",
	cooktime = 5
})
