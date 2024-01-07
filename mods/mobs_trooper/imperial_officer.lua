officer = {
	imperial_skins = {}
}

--Skin gen
local human_skin = {
	'human_skin-1.png', 'human_skin-2.png', 'human_skin-3.png',
	'human_skin-4.png', 'human_skin-5.png', 'human_skin-6.png'
}

local human_male_hair = {
	'hair_male1-brown.png', 'hair_male1-blonde.png', 'hair_male1-red.png',
	'hair_male1-black.png'
}

local human_male_eyes = {
	'human_eyes_male-1.png', 'human_eyes_male-2.png', 'human_eyes_male-3.png'
}

local human_female_hair = {
	'hair_female1-brown.png', 'hair_female1-blonde.png', 'hair_female1-red.png',
	'hair_female1-black.png'
}

local human_female_eyes = {
	'human_eyes_female-1.png', 'human_eyes_female-2.png', 'human_eyes_female-3.png'
}

-- uniform
local imperial_uniform = {
	'imperial_uniform_1.png', 'imperial_uniform_2.png', 'imperial_uniform_3.png', 'imperial_uniform_4.png' --based on skin by vs260gaming https://www.minecraftskins.com/skin/21469033/imperial-navy---first-lieutenant/
}

local imperial_cap = {
	'imperial_cap_1.png', 'imperial_cap_1.png', 'imperial_cap_1.png', 'blank.png'
}

-- Imperial officer skin generation
for i = 1, 100 do
	if(i <= 50)
	then
		table.insert(officer.imperial_skins, {
			human_skin[math.random(6)] .. '^'
			.. human_male_eyes[math.random(3)] .. '^'
			.. imperial_uniform[math.random(4)] .. '^'
			.. human_male_hair[math.random(4)] .. '^'
			.. imperial_cap[math.random(4)]
		})
	else
		table.insert(officer.imperial_skins, {
			human_skin[math.random(6)] .. '^'
			.. human_female_eyes[math.random(3)] .. '^'
			.. imperial_uniform[math.random(4)] .. '^'
			.. human_female_hair[math.random(4)] .. '^'
			.. imperial_cap[math.random(4)]
		})
	end
end

--Imperial officer
mobs:register_mob("mobs_monster:imperial_officer", {
	type = "npc",
	passive = false,
    group_attack = true,
	attack_type = "shoot",
	attack_npcs = false,
	pathfinding = true,
	--specific_attack = {"player", "mobs_npc:npc"},
	arrow = "mobs_monster:blaster_red",
	shoot_interval = 1.5,
	shoot_offset = 1.5,
	hp_min = 4,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	textures = officer.imperial_skins,
	blood_texture = "blood.png",
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_blast_em",
		shoot_attack = "e11",
	},
	walk_velocity = 1.5,
	run_velocity = 4,
	view_range = 16,
	jump = true,
	floats = 0,
	drops = {
		{name = "rangedweapons:e11", chance = 1, min = 0, max = 1}
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
	--name = "mobs_monster:imperial_officer",
	--nodes = {"mobs_monster:duracrete_imperial_spawner"},
	--interval = 1,
	--chance = 1,
	--active_object_count = 2,
--})

minetest.register_node("mobs_monster:duracrete_imperial_spawner", {
	description = "Grey Duracrete (Imperial Officer Spawner)",
	tiles = {"duracrete_grey.png^spawner_overlay.png"},
	groups = {cracky = 1, bakedclay = 1},
	sounds = default.node_sound_stone_defaults()
})

mobs:register_egg("mobs_monster:imperial_officer", "Imperial Officer", "duracrete_blue.png", 1)

mobs:alias_mob("mobs:imperial_officer", "mobs_monster:imperial_officer") -- compatibility

mobs:register_arrow("mobs_monster:blaster_red", {
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

	hit_node = function(self, pos, node)
		mobs:boom(self, pos, 1, true)
	end,

	tail = 1,
	tail_texture = "laser_red.png",
	tail_size = 3
})