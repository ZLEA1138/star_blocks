
-- language support
local S = ethereal.intllib

-- stair mods active
local stairs_mod = minetest.get_modpath("stairs")
local stairs_redo = stairs_mod and stairs.mod and stairs.mod == "redo"
local stairs_plus = minetest.global_exists("stairsplus")

-- stair selection function
local do_stair = function(description, name, node, groups, texture, sound)

	if stairs_redo then

		stairs.register_all(name, node,	groups, texture, S(description), sound)

	elseif stairs_plus then

		local mod = "ethereal"

		stairsplus:register_all(mod, name, node, {
			description = S(description),
			tiles = texture,
			groups = groups,
			sounds = sound,
		})

		-- aliases need to be set for previous stairs to avoid unknown nodes
		minetest.register_alias_force("stairs:stair_" .. name,
				mod .. ":stair_" .. name)

		minetest.register_alias_force("stairs:stair_outer_" .. name,
				mod .. ":stair_" .. name .. "_outer")

		minetest.register_alias_force("stairs:stair_inner_" .. name,
				mod .. ":stair_" .. name .. "_inner")

		minetest.register_alias_force("stairs:slab_"  .. name,
				mod .. ":slab_"  .. name)

	else

		stairs.register_stair_and_slab(name, node, groups, texture,
				S(description .. " Stair"), S(description .. " Slab"), sound)
	end
end


-- Register Stairs (stair mod will be auto-selected)

do_stair(
	"Ice Brick",
	"ice_brick",
	"ethereal:ice_brick",
	{cracky = 3, puts_out_fire = 1, cools_lava = 1},
	{"ice_brick.png"},
	default.node_sound_glass_defaults())

do_stair(
	"Snow Brick",
	"snow_brick",
	"ethereal:snow_brick",
	{crumbly = 3, puts_out_fire = 1, cools_lava = 1},
	{"snow_brick.png"},
	default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.25},
		dug = {name = "default_snow_footstep", gain = 0.75},
	}))

do_stair(
	"Dried Dirt",
	"dry_dirt",
	"ethereal:dry_dirt",
	{crumbly = 3},
	{"dry_dirt.png"},
	default.node_sound_dirt_defaults())

do_stair(
	"Charred Dirt",
	"charred_dirt",
	"ethereal:charred_dirt",
	{crumbly = 3},
	{"charred_dirt.png"},
	default.node_sound_dirt_defaults())

do_stair(
	"Mushroom Trunk",
	"mushroom_trunk",
	"ethereal:mushroom_trunk",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"mushroom_trunk.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Mushroom Cap",
	"mushroom_cap",
	"ethereal:mushroom_cap",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"mushroom_cap.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Jogan Wood",
	"jogan_wood",
	"ethereal:jogan_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"jogan_wood.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Pine Wood",
	"pine_wood",
	"ethereal:pine_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"pine_wood.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Palm Wood",
	"palm_wood",
	"ethereal:palm_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"palm_wood.png"},
	default.node_sound_wood_defaults())

--do_stair(
--	"Wroshyr Wood",
--	"wroshyr_wood",
--	"ethereal:wroshyr_wood",
--	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
--	{"wroshyr_wood.png"},
--	default.node_sound_wood_defaults())

do_stair(
	"Brylark Wood",
	"brylark_wood",
	"ethereal:brylark_wood",
	{cracky = 1, level = 2},
	{"brylark_wood.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Uneti Wood",
	"uneti_wood",
	"ethereal:uneti_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	{"uneti_wood.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Gnarltree Wood",
	"gnarltree_wood",
	"ethereal:gnarltree_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"gnarltree_wood.png"},
	default.node_sound_wood_defaults())

do_stair(
	"Bamboo",
	"bamboo",
	"ethereal:bamboo_block",
	{snappy = 3, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"bamboo_floor.png"},
	default.node_sound_wood_defaults())
