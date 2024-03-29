local MODNAME = minetest.get_current_modname()
local MODPATH = minetest.get_modpath(MODNAME)
local S = minetest.get_translator(MODNAME)

local max_goo_range = get_setting("max_goo_range", 15)

minetest.register_node("uraniumstuff:goo_source", {
	description = S("Toxic Goo"),
	drawtype = "liquid",
	tiles = {
		{
			name = "goo_source_anim.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "goo_source_anim.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
    waving = 3,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	sunlight_propagates = true,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_range = 3,
	liquid_renewable = false,
	liquid_alternative_flowing = "uraniumstuff:goo_flowing",
	liquid_alternative_source = "uraniumstuff:goo_source",
	liquid_viscosity = WATER_VISC,
	damage_per_second = 5,
	post_effect_color = {a = 103, r = 40, g = 90, b = 30},
	groups = {liquid = 1, dig_by_piston=1},
	sounds = default.node_sound_water_defaults(),
    light_source = 5,
	_mcl_blast_resistance      = 100,
	_mcl_hardness              = -1,
})

minetest.register_node("uraniumstuff:goo_flowing", {
	description = S("Flowing Toxic Goo"),
	drawtype = "flowingliquid",
	tiles = {"goo.png"},
	special_tiles = {
		{
			name = "goo_flowing_anim.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "goo_flowing_anim.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	use_texture_alpha = "blend",
    waving = 3,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	sunlight_propagates = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_range = 3,
	liquid_renewable = false,
	liquid_alternative_flowing = "uraniumstuff:goo_flowing",
	liquid_alternative_source = "uraniumstuff:goo_source",
	liquid_viscosity = WATER_VISC,
	damage_per_second = 5,
	post_effect_color = {a = 103, r = 40, g = 90, b = 30},
	groups = {liquid = 1, not_in_creative_inventory = 1, dig_by_piston=1},
	sounds = default.node_sound_water_defaults(),
    light_source = 5,
	_mcl_blast_resistance      = 100,
	_mcl_hardness              = -1,
})

if minetest.get_modpath("bucket") then
    bucket.register_liquid(
        "uraniumstuff:goo_source",
        "uraniumstuff:goo_flowing",
        "uraniumstuff:bucket_goo",
        "bucket_goo.png",
        S("Goo Bucket"),
        {tool = 1}
    )
end

local function make_vector(pos_1, pos_2)
    local x_dif = pos_2.x - pos_1.x
    local y_dif = pos_2.y - pos_1.y
    local z_dif = pos_2.z - pos_1.z
    return {x = x_dif, y = y_dif, z = z_dif}
end

local function length_cb(vector)
    return vector.x*vector.x + vector.y*vector.y + vector.z*vector.z
end

local function distance_cb(pos_1, pos_2)
    local vector = make_vector(pos_1, pos_2)
    return length_cb(vector)
end

local function length(vector)
    return math.sqrt(length_cb(vector))
end
    
local function distance(pos_1, pos_2)
    return math.sqrt(distance_cb(pos_1, pos_2))
end

local function normalize(vector)
    local length = length(vector)
    vector.x = vector.x/length
    vector.y = vector.y/length
    vector.z = vector.z/length
    return vector
end

local function int_vector(vector)
    if vector.x < -0.5 then vector.x = -1 elseif vector.x > 0.5 then vector.x = 1 else vector.x = 0 end
    if vector.y < -0.5 then vector.y = -1 elseif vector.y > 0.5 then vector.y = 1 else vector.y = 0 end
    if vector.z < -0.5 then vector.z = -1 elseif vector.z > 0.5 then vector.z = 1 else vector.z = 0 end
    return vector
end

local empty_node_names = {
    "air",
    "default:water"
}

local goo_node_names = {
    "uraniumstuff:goo_source",
    "uraniumstuff:goo_flowing",
}

local function is_node_empty(node)
    for i, name in ipairs(empty_node_names) do
        if name == node.name then return true end
    end
    return false
end

local function is_node_goo(node)
    for i, name in ipairs(goo_node_names) do
        if name == node.name then return true end
    end
    return false
end
        
local function can_goo_go_to(pos, check_below)
    local node_at_pos = minetest.get_node(pos)
    local below_pos = {x = pos.x, y = pos.y - 1, z = pos.z}
    local node_below = minetest.get_node(below_pos)
    if not (is_node_empty(node_at_pos) or is_node_goo(node_at_pos)) then return false end
    if check_below and (is_node_empty(node_below) or is_node_goo(node_below)) then return false end
    return true
end

local function has_solid_neighbor(pos)
    local positions = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z + 1},
        {x = pos.x, y = pos.y, z = pos.z - 1},
    }
    for _, position in ipairs(positions) do
        local node = minetest.get_node(pos)
        if not is_node_empty(node) then return true end
    end
    return false
end

local function table_equals(t1, t2)
    for key, value in pairs(t1) do
        if t1[key] ~= t2[key] then return false end
    end
    return true
end

local function get_closest_entity(pos)
    local dist = 0
    local cl_entity = nil
    for name, entity in pairs(minetest.luaentities) do
        if entity.health and entity.health > 0 then
            local e_pos = entity.object:get_pos()
            if e_pos then 
                local dist_cb = distance_cb(pos, e_pos)
                if dist_cb < dist or cl_entity == nil then
                    dist = dist_cb
                    cl_entity = entity
                end
            end
        end
    end
    return cl_entity
end
