local trooper_types = {
	{
		nodes = {"default:desert_sand"},
		skins = {"trooper_desert.png"},
	},
}

--Stormtrooper
mobs:register_mob("mobs_trooper:trooper", {
	type = "npc",
	passive = false,
    group_attack = true,
	attack_type = "shoot",
	attack_npcs = false,
	pathfinding = true,
	--specific_attack = {"player", "mobs_npc:npc"},
	arrow = "mobs_trooper:laser_red",
	shoot_interval = 1.5,
	shoot_offset = 1.5,
	hp_min = 4,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	textures = {
		{"trooper.png"},
	},
	blood_texture = "blood.png",
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "laser1",
	},
	walk_velocity = 1.5,
	run_velocity = 4,
	view_range = 16,
	jump = true,
	floats = 0,
	drops = {
		--{name = "rangedweapons:e11", chance = 1, min = 0, max = 1}
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},

	-- check surrounding nodes and spawn a specific trooper
	on_spawn = function(self)

		local pos = self.object:get_pos() ; pos.y = pos.y - 1
		local tmp

		for n = 1, #trooper_types do

			tmp = trooper_types[n]

			if minetest.find_node_near(pos, 1, tmp.nodes) then

				self.base_texture = tmp.skins
				self.object:set_properties({textures = tmp.skins})

				if tmp.drops then
					self.drops = tmp.drops
				end

				return true
			end
		end

		return true -- run only once, false/nil runs every activation
	end
})

--mobs:spawn({
	--name = "mobs_trooper:trooper",
	--nodes = {"mobs_trooper:duracrete_trooper_spawner"},
	--interval = 1,
	--chance = 1,
	--active_object_count = 2,
--})

mobs:spawn({
	name = "mobs_trooper:trooper",
	nodes = {"ethereal:grass_dirt"},
	chance = 7000,
	active_object_count = 2,
	min_height = 0,
})

--minetest.register_node("mobs_trooper:duracrete_trooper_spawner", {
--	description = "Grey Duracrete (Stormtrooper Spawner)",
--	tiles = {"duracrete_grey.png^spawner_overlay.png"},
--	groups = {cracky = 1, bakedclay = 1},
--	sounds = default.node_sound_stone_defaults()
--})

mobs:register_egg("mobs_trooper:trooper", "Imperial Trooper", "baked_clay_black.png", 1)

mobs:alias_mob("mobs:trooper", "mobs_trooper:trooper") -- compatibility

mobs:register_arrow("mobs_trooper:laser_red", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"laser_red.png"},
	velocity = 60,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_mob = function(self, mob)
		mob:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	--hit_node = function(self, pos, node)
	--	mobs:boom(self, pos, 1, true)
	--end,

	tail = 1,
	tail_texture = "laser_red.png",
	tail_size = 3
})