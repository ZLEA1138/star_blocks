replacements_group['wood'] = {}

-- this contains a list of all found/available nodenames that may act as a replacement for default:wood
replacements_group['wood'].found = {};
-- contains a list of *all* known wood names - even of mods that may not be installed
replacements_group['wood'].all   = {};

-- contains information about how a particular node is called if a particular wood is used;
replacements_group['wood'].data  = {};

-- names of traders for the diffrent wood types
replacements_group['wood'].traders = {};


------------------------------------------------------------------------------
-- external function; call it in order to replace old_wood with new_wood;
-- other nodes (trees, saplings, fences, doors, ...) are replaced accordingly,
-- depending on what new_wood has to offer
------------------------------------------------------------------------------
replacements_group['wood'].replace_material = function( replacements, old_wood, new_wood )

	if(  not( old_wood ) or not( replacements_group['wood'].data[ old_wood ])
	  or not( new_wood ) or not( replacements_group['wood'].data[ new_wood ])
	  or old_wood == new_wood ) then
		return replacements;
	end

	local old_nodes = replacements_group['wood'].data[ old_wood ];
	local new_nodes = replacements_group['wood'].data[ new_wood ];
	for i=3,#old_nodes do
		local old = old_nodes[i];
		local new = old;
		if( old and new_nodes[i] and handle_schematics.node_defined( new_nodes[i])) then
			new = new_nodes[i];
			local found = false;
			for i,v in ipairs(replacements) do
				if( v and v[1]==old ) then
					v[2] = new;
					found = true;
				end
			end
			if( not( found )) then
				table.insert( replacements, { old, new });
			end
		end
	end
	return replacements;		
end


---------------------
-- internal functions
---------------------
-- wood (and its corresponding tree trunk) is a very good candidate for replacement in most houses
-- helper function for replacements_group['wood'].get_wood_type_list
replacements_group['wood'].add_material = function( candidate_list, mod_prefix, w_pre, w_post, t_pre, t_post, l_pre, l_post,
					s_pre, s_post, stair_pre, stair_post, slab_pre, slab_post,
					fence_pre, fence_post, gate_pre, gate_post )
	if( not( candidate_list )) then
		return;
	end
	for _,v in ipairs( candidate_list ) do
		local is_loaded = false;
		local wood_name = mod_prefix..w_pre..v..w_post;
		-- create a complete list of all possible wood names
		table.insert( replacements_group['wood'].all, wood_name );
		-- create a list of all *installed* wood types
		if( handle_schematics.node_defined( wood_name )) then
			table.insert( replacements_group['wood'].found, wood_name );
			is_loaded = true;
		end
			
		-- there is no check if the node names created here actually exist
		local data = { v,                             -- 1. base name of the node
				mod_prefix,                   -- 2. mod name
				wood_name,                    -- 3. replacement for default:wood
				mod_prefix..t_pre..v..t_post, -- 4.     "  "    for default:tree
				mod_prefix..l_pre..v..l_post, -- 5.     "  "    for default:leaves
				mod_prefix..s_pre..v..s_post, -- 6.     "  "    for default:sapling
				stair_pre..v..stair_post,     -- 7.     "  "    for stairs:stair_wood
				slab_pre..v..slab_post,       -- 8.     "  "    for stairs:slab_wood
				fence_pre..v..fence_post,     -- 9.     "  "    for default:fence_wood
				gate_pre..v..gate_post..'_open',  -- 10.  "  "    for cottages:gate_open
				gate_pre..v..gate_post..'_closed',-- 11.  "  "    for cottages:gate_closed
		};
		data[24] = stair_pre.."inner_"..v..stair_post; -- 24. "  "  for stairs:stair_inner_wood
		data[25] = stair_pre.."outer_"..v..stair_post; -- 25. "  "  for stairs:stair_outer_wood

		-- normal wood does have a number of nodes which might get replaced by more specialized wood types
		if( mod_prefix=='default:' and v=='' ) then
			local w = 'wood';
			data[10] = 'doors:gate_wood_open';
			data[11] = 'doors:gate_wood_closed';
			data[12] = 'wood:ladder_wood';
			data[13] = 'doors:door_'..w..'_t_1';
			data[14] = 'doors:door_'..w..'_t_2';
			data[15] = 'doors:door_'..w..'_b_1';
			data[16] = 'doors:door_'..w..'_b_2';
			data[17] = 'default:bookshelf';
			data[18] = 'wood:chest_wood';
			data[19] = 'wood:chest_wood_locked';
			data[20] = 'stairs:stair_'..w..'upside_down';
			data[21] = 'stairs:slab_'..w..'upside_down';
			data[22] = 'wood:trapdoor_wood_open';
			data[23] = 'wood:trapdoor_wood';
			data[24] = 'stairs:stair_inner_'..w;
			data[25] = 'stairs:stair_outer_'..w;
			data[26] = 'doors:door_wood_a';
			data[27] = 'doors:door_wood_b';
			data[28] = 'doors:hidden';
		end
		replacements_group['wood'].data[ wood_name ] = data;

		-- none of the wood nodes counts as ground
		handle_schematics.set_node_is_ground(data, false);

	end
end

-- TODO: there are also upside-down variants sometimes
-- TODO: moreblocks - those may be installed and offer further replacements

-- create a list of all available wood types
replacements_group['wood'].construct_wood_type_list = function()

	-- https://github.com/minetest/minetest_game
	-- default:pine_needles instead of leaves; no gates available
	replacements_group['wood'].add_material( {'pine' },           'wood:', '','_wood','', '_trunk',  '','_needles','','_sapling',
		'stairs:stair_', 'wood', 'stairs:slab_', 'wood',   'wood:fence_','_wood',  'doors:gate_','_wood' );
	
	-- https://github.com/tenplus1/ethereal
	-- ethereal does not have a common naming convention for leaves
	replacements_group['wood'].add_material( {'ferrumwood','marshtree','oki','palm','sana','tavifruit'},'wood:',  '','_wood',   '','_trunk', '','_leaves', '','_sapling',
		'stairs:stair_','_wood', 'stairs:slab_','_wood',   'wood:fence_','',     'wood:fence_gate_','');
	-- mushroom has its own name; it works quite well as a wood replacement; the red cap is used as leaves
	-- the stairs are also called slightly diffrently (end in _trunk instead of _wood)
	replacements_group['wood'].add_material( {'mushroom'},        'ethereal:',  '','_pore',   '','_trunk', '','',        '','_sapling',
		'stairs:stair_','_trunk', 'stairs:slab_','_trunk', 'ethereal:fence_', '',    'wood:fence_gate_','' );
	-- note: big tree and orange tree do not have their own wood
end

-- actually construct the data structure once
replacements_group['wood'].construct_wood_type_list();

-- needed by handle_schematics.generate_building_translate_nodenames
-- in order to identify saplings that need to be grown
handle_schematics.is_sapling = {}
for k,v in pairs(replacements_group['wood'].data) do
	-- if tree trunk and sapling exist in this game
	if(   minetest.registered_nodes[v[6]]) then
		-- both the name of the sapling..
		handle_schematics.is_sapling[v[6]] = true
		-- ..and its content_id are saplings
		handle_schematics.is_sapling[minetest.get_content_id(v[6])] = true
	end
end
