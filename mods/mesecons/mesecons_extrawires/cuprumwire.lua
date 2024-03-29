local S = minetest.get_translator(minetest.get_current_modname())

local cuprum_nodename = minetest.registered_aliases["mesecons_gamecompat:cuprum"]
if cuprum_nodename then
	-- Convert placeholders.
	minetest.register_alias("mesecons_extrawires:wire", cuprum_nodename)
else
	-- Register placeholder.
	cuprum_nodename = "mesecons_extrawires:wire"
	minetest.register_node("mesecons_extrawires:wire", {
		description = S("Cuprum Wire"),
		tiles = {"wire.png"},
		paramtype = "light",
		light_source = 3,
		groups = {cracky = 1},
		sounds = mesecon.node_sound.stone,
	})
end

local cuprumwire_rules =
{
	{x = 1, y = 0, z = 0},
	{x =-1, y = 0, z = 0},
	{x = 0, y = 1, z = 0},
	{x = 0, y =-1, z = 0},
	{x = 0, y = 0, z = 1},
	{x = 0, y = 0, z =-1},
}

minetest.override_item(cuprum_nodename, {
	mesecons = {conductor = {
		state = mesecon.state.off,
		onstate = "mesecons_extrawires:wire_powered",
		rules = cuprumwire_rules
	}}
})

-- Copy node definition of powered cuprum from normal cuprum
-- and brighten texture tiles to indicate cuprum is powered
local unpowered_def = minetest.registered_nodes[cuprum_nodename]
local powered_def = mesecon.merge_tables(unpowered_def, {
	drop = cuprum_nodename,
	paramtype = "light",
	light_source = math.min(unpowered_def.light_source + 2, minetest.LIGHT_MAX),
	mesecons = {conductor = {
		state = mesecon.state.on,
		offstate = cuprum_nodename,
		rules = cuprumwire_rules
	}},
	groups = mesecon.merge_tables(unpowered_def.groups or {}, {not_in_creative_inventory = 1}),
	on_blast = mesecon.on_blastnode,
})

for i, v in pairs(powered_def.tiles) do
	powered_def.tiles[i] = v .. "^[brighten"
end

minetest.register_node("mesecons_extrawires:wire_powered", powered_def)
