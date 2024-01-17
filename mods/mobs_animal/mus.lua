-- Translation support
local S = minetest.get_translator("mobs_animal")

-- Rat by KPavel and PilzAdam (B3D model by sirrobzeroone)

mobs:register_mob("mobs_animal:mus", {
stepheight = 0.6,
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 4,
	armor = 200,
	collisionbox = {-0.2, -1, -0.2, 0.2, -0.8, 0.2},
	visual = "mesh",
	mesh = "mobs_rat.b3d",
	textures = {
		{"mus.png"},
		{"mus2.png"}
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_mus"
	},
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	jump = true,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,

	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 50, 90, 0, true, "mobs_animal:mus")
	end,
--[[
	do_custom = function(self, dtime)

		self.mus_timer = (self.mus_timer or 0) + dtime

		if self.mus_timer < 1 then return end -- every 1 second

		self.mus_timer = 0

		local pos = self.object:get_pos()

		print("mus pos", pos.x, pos.y, pos.z, dtime)

		return false -- return but skip doing rest of API
	end,
]]
--[[
	on_blast = function(obj, damage)
		print ("--- damage is", damage)
		print ("---    mob is", obj.object:get_luaentity().name)
		-- return's do_damage, do_knockback and drops
		return false, true, {"default:mese"}
	end,
]]
})


-- example on_spawn function
local function mus_spawn(self, pos)
	self = self:get_luaentity()
	print (self.name, pos.x, pos.y, pos.z)
	self.hp_max = 100
	self.health = 100
end


if not mobs.custom_spawn_animal then

	mobs:spawn({
		name = "mobs_animal:mus",
		nodes = {"default:stone"},
		min_light = 3,
		max_light = 9,
		interval = 60,
		chance = 8000,
		max_height = 0,
	--	on_spawn = mus_spawn,
	})
end


mobs:register_egg("mobs_animal:mus", S("Mus"), "mus_inv.png")


mobs:alias_mob("mobs:mus", "mobs_animal:mus") -- compatibility


-- cooked mus, yummy!
minetest.register_craftitem(":mobs:mus_cooked", {
	description = S("Cooked Mus"),
	inventory_image = "cooked_mus.png",
	on_use = minetest.item_eat(3),
	groups = {food_mus = 1, flammable = 2}
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:mus_cooked",
	recipe = "mobs_animal:mus",
	cooktime = 5
})
