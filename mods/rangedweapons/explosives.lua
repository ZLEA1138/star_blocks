local he_boom = {
	name = "rangedweapons:he_explosion",
	--description = "DuN mInD mEh...",
	radius = 2,
	tiles = {
		side = "blank.png",
		top = "blank.png",
		bottom = "blank.png",
		burning = "blank.png"
	},
}
tnt.register_tnt(he_boom)

local rocket_boom = {
	name = "rangedweapons:rocket_explosion",
	--description = "DuN mInD mEh...",
	radius = 3,
	tiles = {
		side = "blank.png",
		top = "blank.png",
		bottom = "blank.png",
		burning = "blank.png"
	},
}
tnt.register_tnt(rocket_boom)

local rangedweapons_rocket = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.0, y=0.0},
	textures = {"blank.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_rocket.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)
	if self.timer >= 0.002 then
	minetest.add_particle({
		pos = pos,
		velocity = 0,
          acceleration = {x=0, y=0, z=0},
		expirationtime = 0.04,
		size = 7,
		collisiondetection = false,
		vertical = false,
		texture = "rocket_fly.png",
		glow = 15,
	})
	minetest.add_particle({
		pos = pos,
		velocity = 0,
          	acceleration = {x=0, y=6, z=0},
		expirationtime = 0.4,
		size = 4,
		collisiondetection = false,
		vertical = false,
		texture = "smoke.png",
		glow = 5,
	})
	tiem = tiem + 0.002 
	end
	if self.timer >= 0.375 then
	local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)
		for k, obj in pairs(objs) do
		if obj:get_luaentity() ~= nil then
		if obj:get_luaentity().name ~= "rangedweapons:rocket" and obj:get_luaentity().name ~= "__builtin:item" then
		tnt.boom(pos, rocket_boom)
		self.object:remove()
			end
		end
	end
end
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
		tnt.boom(pos, rocket_boom)
		self.object:remove()
			end
		if self.timer >= 7.5 then
		tnt.boom(pos, rocket_boom)
		self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

minetest.register_entity("rangedweapons:rocket", rangedweapons_rocket)


local rangedweapons_he_grenade = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.0, y=0.0},
	textures = {"blank.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_he_grenade.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)
	if self.timer >= 0.002 then
	minetest.add_particle({
		pos = pos,
		velocity = 0,
          acceleration = {x=0, y=0, z=0},
		expirationtime = 0.04,
		size = 7,
		collisiondetection = false,
		vertical = false,
		texture = "rocket_fly.png",
		glow = 15,
	})
	minetest.add_particle({
		pos = pos,
		velocity = 0,
          	acceleration = {x=0, y=16, z=0},
		expirationtime = 0.4,
		size = 4,
		collisiondetection = false,
		vertical = false,
		texture = "smoke.png",
		glow = 5,
	})
	tiem = tiem + 0.002 
	end
	if self.timer >= 0.4 then
	local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)
		for k, obj in pairs(objs) do
		if obj:get_luaentity() ~= nil then
		if obj:get_luaentity().name ~= "rangedweapons:he_grenade" and obj:get_luaentity().name ~= "__builtin:item" then
		tnt.boom(pos, rocket_boom)
		self.object:remove()
			end
		end
	end
end
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
		tnt.boom(pos, he_boom)
		self.object:remove()
			end
		if self.timer >= 7.5 then
		tnt.boom(pos, he_boom)
		self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

minetest.register_entity("rangedweapons:he_grenade", rangedweapons_he_grenade)


local barrel_boom = {
	name = "rangedweapons:explosion",
	--description = "DuN mInD mEh...",
	radius = 3,
	tiles = {
		side = "blank.png",
		top = "blank.png",
		bottom = "blank.png",
		burning = "blank.png"
	},
}
tnt.register_tnt(barrel_boom)

minetest.register_node("rangedweapons:barrel", {
		description = "Fuel Barrel\n"
						.. core.colorize("#B0C4DE", "It will explode if shot by a gun"),
	tiles = {
		"barrel_top.png",
		"barrel_top.png",
		"barrel_side.png",
		"barrel_side.png",
		"barrel_side.png",
		"barrel_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {choppy = 3, oddly_breakable_by_hand = 3},
	on_blast = function(pos)
		tnt.boom(pos, {radius = 3})
	end,
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- NodeBox2
			{-0.4375, -0.5, -0.3125, 0.4375, 0.5, 0.3125}, -- NodeBox3
			{-0.3125, -0.5, -0.4375, 0.3125, 0.5, 0.4375}, -- NodeBox4
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox5
		}
	}
})