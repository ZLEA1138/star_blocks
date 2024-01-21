local S = mobs.intllib_npc

-- check for simple_dialogs mod and setup
local context = {}
local useDialogs = "N"

minetest.register_on_leaveplayer(function(player)
	context[player:get_player_name()] = nil
end)

if minetest.get_modpath("simple_dialogs") then

	useDialogs = "Y"

	simple_dialogs.register_varloader(function(npcself,playername)
		simple_dialogs.save_dialog_var(npcself, "NPCNAME", npcself.nametag, playername)
		simple_dialogs.save_dialog_var(npcself, "STATE", npcself.state, playername)
		simple_dialogs.save_dialog_var(npcself, "FOOD", npcself.food, playername)
		simple_dialogs.save_dialog_var(npcself, "HEALTH", npcself.health, playername)
		simple_dialogs.save_dialog_var(npcself, "owner", npcself.owner, playername)
	end)

	simple_dialogs.register_hook(function(npcself,playername,hook)

		if hook.func == "TELEPORT" then

			if npcself.owner then

				--check to see if the player has 'bring' teleport privliges
				local player_privs = minetest.get_player_privs(npcself.owner)

				if player_privs["bring"] then

					--validate x,y,z coords
					if hook.parm and hook.parmcount and hook.parmcount > 2 then

						local pos = {
							x = tonumber(hook.parm[1]),
							y = tonumber(hook.parm[2]),
							z = tonumber(hook.parm[3])
						}

						if pos.x and pos.y and pos.z
						and pos.x > -31500 and pos.x < 31500
						and pos.y > -31500 and pos.y < 31500
						and pos.z > -31500 and pos.z < 31500 then

							local player = minetest.get_player_by_name(playername)

							if player then
								player:set_pos(pos) end
						end
					end
				end
			end
			return "EXIT"
		end
	end)
end

human = {
	default_skins = {},
	--savanna_skins = {},
	--cold_skins = {},
	--tundra_skins = {},
	--desert_skins = {}
}

wookiee = {
	default_skins = {}
}

mobs.npc_drops = {
	{"ores:pick_ferrum", 2}, "mobs:meat_cooked", {"ores:sword_ferrum", 2},
	{"ores:shovel_ferrum", 2}, "farming:bread", "bucket:bucket_water",
	"mobs:leather", "default:clay", "ores:cuprum_lump",
	"default:permafrost_with_moss"
}

--Skin gen
--Human
local human_body_base = {
	'body_tan.png', 'body_dark.png', 'body_light.png',
	'body_medium.png'
}

local human_body_color = {
	'^[colorize:#eb9678:128', '^[colorize:#ebaa78:128', '^[colorize:#ebc178:128', -- pinkish, peach-ish, yellow-ish
	'^[colorize:#eb9678:64',  '^[colorize:#ffd2af:64',  '^[colorize:#ffd091:64',  -- pinkish, peach-ish, yellow-ish but more pale
	'^[colorize:#800000:128', '^[colorize:#c02000:128', '^[colorize:#c04000:128', -- dark red, reddish brown, brown tan
	'^[colorize:#804000:128', '^[colorize:#5f2705:128', '^[colorize:#46280c:128'  -- brown, dark reddish brown, dark brown
}

local human_eye_color = {
	'^[colorize:#000000:256', '^[colorize:#402000:256', '^[colorize:#402000:256', -- black and brown
	'^[colorize:#402000:256', '^[colorize:#000055:256', '^[colorize:#005500:256', -- brown, blue, green
	'^[colorize:#000000:256', '^[colorize:#402000:256', '^[colorize:#000055:256'  -- black, brown, blue
}

local human_male_hair_base = {
	'hair_male_01.png', 'hair_male_02.png', 'hair_male_03.png',
	'hair_male_04.png', 'hair_male_05.png', 'hair_male_06.png',
	'hair_male_07.png', 'hair_male_08.png', 'hair_male_09.png',
	'hair_male_10.png', 'hair_male_11.png', 'hair_male_12.png',
	'hair_male_13.png', 'hair_male_14.png', 'hair_male_15.png',
	'hair_male_16.png'
}

local human_male_hair_old = {
	'hair_male_old_01.png', 'hair_male_old_02.png', 'hair_male_old_03.png',
	'hair_male_old_04.png', 'hair_male_old_05.png', 'hair_male_old_06.png'
}

local human_female_hair_base = {
	'hair_female_01.png', 'hair_female_02.png', 'hair_female_03.png',
	'hair_female_04.png', 'hair_female_05.png', 'hair_female_06.png',
	'hair_female_07.png', 'hair_female_08.png', 'hair_female_09.png',
	'hair_female_10.png', 'hair_female_11.png', 'hair_female_12.png',
	'hair_female_13.png', 'hair_female_14.png', 'hair_female_15.png',
	'hair_female_16.png', 'hair_female_17.png', 'hair_female_18.png',
	'hair_female_19.png', 'hair_female_20.png', 'hair_female_21.png',
	'hair_female_22.png', 'hair_female_23.png', 'hair_female_24.png',
	'hair_female_25.png', 'hair_female_26.png', 'hair_female_27.png',
	'hair_female_28.png'
}

local human_female_hair_old = {
	'hair_female_old_01.png', 'hair_female_old_02.png', 'hair_female_old_03.png',
	'hair_female_old_04.png', 'hair_female_old_05.png', 'hair_female_old_06.png'
}

local human_hair_color = {
	'^[colorize:#000000:128^[colorize:#804000:128', '^[colorize:#000000:192^[colorize:#804000:64', '^[colorize:#000000:192', '^[colorize:#000000:192^[colorize:#804000:64', --brown, dark brown, black, dark brown
	'^[colorize:#000000:128^[colorize:#804000:128', '^[colorize:#000000:192^[colorize:#804000:64', '^[colorize:#000000:192', '^[colorize:#000000:192^[colorize:#804000:64', --brown, dark brown, black, dark brown
	'^[colorize:#fff000:128', '^[colorize:#000000:128^[colorize:#ff4900:128', '^[colorize:#000000:128^[colorize:#804000:128' -- blonde, orange, brown
}

-- default clothes
local male_shirt_default_base = {
	'shirt_short_med_01.png', 'shirt_short_med_02.png', 'shirt_short_med_03.png', 
	'shirt_short_med_04.png', 'shirt_short_med_05.png',
	'shirt_short_med_01.png', 'shirt_short_med_02.png', 'shirt_short_med_03.png', 
	'shirt_short_med_04.png', 'shirt_short_med_05.png',
	'shirt_short_med_01.png', 'shirt_short_med_02.png', 'shirt_short_med_03.png', 
	'shirt_short_med_04.png', 'shirt_short_med_05.png',
	'shirt_long_med_01.png', 'shirt_long_med_02.png', 'shirt_long_med_03.png', 
	'shirt_long_med_04.png', 'shirt_long_med_05.png'
}

local male_shirt_default_color = {
	'^[colorize:#3d1500:128', '^[colorize:#804000:128', '^[colorize:#c8a53a:128', -- reddish, brown, yellow
	'^[colorize:#ffffff:128', '^[colorize:#5c0000:128' -- white, off reddish hue
}

local female_shirt_default_base = {
	'shirt_short_med_01.png', 'shirt_short_med_02.png', 'shirt_short_med_03.png', 
	'shirt_short_med_04.png', 'shirt_short_med_05.png', 'shirt_short_med_female_01.png',
	'shirt_short_med_female_01.png', 'shirt_short_med_female_01.png'
}

local female_shirt_default_color = {
	'^[colorize:#3d1500:128', '^[colorize:#804000:128', '^[colorize:#c8a53a:128', -- reddish, brown, yellow
	'^[colorize:#ffffff:128', '^[colorize:#5c0000:128', '^[colorize:#402000:128', -- white, off reddish hue, brown
	'^[colorize:#c00000:128', '^[colorize:#005c00:128', '^[colorize:#000080:128', -- red, green, blue
	'^[colorize:#c0c000:128', '^[colorize:#800080:128' -- yellow, purple
}

local male_pants_default_base = {
	'pants_dark_01.png', 'pants_dark_02.png'
}

local male_pants_default_color = {
	'^[colorize:#46280c:128', '^[colorize:#5f2705:128', '^[colorize:#ff8040:128' -- darkest brown, dark brown, light brown
}

local female_pants_default_base = {
	'skirt_long_dark_01.png', 'skirt_long_dark_01.png',
	'skirt_long_dark_01.png', 'skirt_long_dark_01.png',
	'skirt_long_dark_01.png', 'skirt_short_dark_01.png',
	'skirt_short_dark_01.png', 'skirt_short_dark_01.png',
	'pants_dark_01.png', 'pants_dark_02.png',
}

local female_pants_default_color = {
	'^[colorize:#46280c:128', '^[colorize:#5f2705:128', '^[colorize:#ff8040:128', -- darkest brown, dark brown, light brown
	'^[colorize:#46280c:128', '^[colorize:#804000:128', '^[colorize:#800000:128', -- dark brown, light brown, dark red
	'^[colorize:#004000:128', '^[colorize:#400040:128' -- dark green, dark purple
}

local female_dress_default_base = {
	'dress_shortsleeves_med2_01.png', 'dress_longsleeves_med2_01.png'
}

local female_dress_default_color = {
	'^[colorize:#402000:128', '^[colorize:#c00000:128', '^[colorize:#005c00:128', -- brown, red, green
	'^[colorize:#000080:128', '^[colorize:#c0c000:128', '^[colorize:#800080:128'  -- blue, yellow, purple
}

local shoes_default_base = {
	'shoes_01.png', 'shoes_02.png', 'boots_dark_01.png'
}

local shoes_default_color = {
	'^[colorize:#804000:128', '^[colorize:#5f2705:128', '^[colorize:#46280c:128', -- brown, dark reddish brown, dark brown
	'^[colorize:#804000:128', '^[colorize:#5f2705:128', '^[colorize:#46280c:128', -- brown, dark reddish brown, dark brown
	'^[colorize:#804000:128', '^[colorize:#5f2705:128', '^[colorize:#46280c:128', -- brown, dark reddish brown, dark brown
	'^[colorize:#5c0000:128', '^[colorize:#004000:128' -- dark red and dark green
}

-- default skin generation
for i = 1, 1000 do
	if(i <= 450) -- 45% of all humans, 90% of males
	then -- Human male
		table.insert(human.default_skins, {
			human_body_base[math.random(4)] .. human_body_color[math.random(12)] .. '^'
			.. 'eyes_whites_sm.png^(eyes_iris_sm.png' .. human_eye_color[math.random(9)] .. ')^('
			.. male_pants_default_base[math.random(2)] .. male_pants_default_color[math.random(3)] .. ')^('
			.. shoes_default_base[math.random(3)] .. shoes_default_color[math.random(11)] .. ')^('
			.. male_shirt_default_base[math.random(20)] .. male_shirt_default_color[math.random(5)] .. ')^('
			.. human_male_hair_base[math.random(16)] .. human_hair_color[math.random(11)] .. ')'
		})
	elseif(i > 950) -- 5% of all humans, 10% of males
	then -- Human male old
		table.insert(human.default_skins, {
			human_body_base[math.random(4)] .. human_body_color[math.random(12)] .. '^'
			.. 'eyes_whites_sm.png^(eyes_iris_sm.png' .. human_eye_color[math.random(9)] .. ')^('
			.. male_pants_default_base[math.random(2)] .. male_pants_default_color[math.random(3)] .. ')^('
			.. shoes_default_base[math.random(3)] .. shoes_default_color[math.random(11)] .. ')^('
			.. male_shirt_default_base[math.random(20)] .. male_shirt_default_color[math.random(5)] .. ')^('
			.. human_male_hair_old[math.random(6)] .. ')'
		})
	elseif(i > 725) -- 22.5% of all humans, 45% of females
	then -- Human female, pants or skirt
		table.insert(human.default_skins, {
			human_body_base[math.random(4)] .. human_body_color[math.random(12)] .. '^'
			.. 'eyes_whites_med.png^(eyes_iris_med.png' .. human_eye_color[math.random(9)] .. ')^('
			.. female_pants_default_base[math.random(10)] .. female_pants_default_color[math.random(8)] .. ')^('
			.. shoes_default_base[math.random(3)] .. shoes_default_color[math.random(11)] .. ')^('
			.. female_shirt_default_base[math.random(8)] .. female_shirt_default_color[math.random(11)] .. ')^('
			.. human_female_hair_base[math.random(28)] .. human_hair_color[math.random(11)] .. ')'
		})
	elseif(i > 700) -- 2.5% of all humans, 5% of females
	then -- Human female old, pants or skirt
		table.insert(human.default_skins, {
			human_body_base[math.random(4)] .. human_body_color[math.random(12)] .. '^'
			.. 'eyes_whites_med.png^(eyes_iris_med.png' .. human_eye_color[math.random(9)] .. ')^('
			.. female_pants_default_base[math.random(10)] .. female_pants_default_color[math.random(8)] .. ')^('
			.. shoes_default_base[math.random(3)] .. shoes_default_color[math.random(11)] .. ')^('
			.. female_shirt_default_base[math.random(8)] .. female_shirt_default_color[math.random(11)] .. ')^('
			.. human_female_hair_old[math.random(6)] .. ')'
		})
	elseif(i > 475) -- 22.5% of all humans, 45% of females
	then -- Human female, dress
		table.insert(human.default_skins, {
			human_body_base[math.random(4)] .. human_body_color[math.random(12)] .. '^'
			.. 'eyes_whites_med.png^(eyes_iris_med.png' .. human_eye_color[math.random(9)] .. ')^('
			.. shoes_default_base[math.random(3)] .. shoes_default_color[math.random(11)] .. ')^('
			.. female_dress_default_base[math.random(2)] .. female_dress_default_color[math.random(6)] .. ')^('
			.. human_female_hair_base[math.random(28)] .. human_hair_color[math.random(11)] .. ')'
		})
	else -- Human female old, dress, 2.5% of all humans, 5% of females
		table.insert(human.default_skins, {
			human_body_base[math.random(4)] .. human_body_color[math.random(12)] .. '^'
			.. 'eyes_whites_med.png^(eyes_iris_med.png' .. human_eye_color[math.random(9)] .. ')^('
			.. shoes_default_base[math.random(3)] .. shoes_default_color[math.random(11)] .. ')^('
			.. female_dress_default_base[math.random(2)] .. female_dress_default_color[math.random(6)] .. ')^('
			.. human_female_hair_old[math.random(6)] .. ')'
		})
	end
end

-- Human (default)
mobs:register_mob("mobs_npc:human_default", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = true,
	hp_min = 20,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	drawtype = "front",
	textures = human.default_skins,
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "wood:tavifruit_wood", chance = 1, min = 1, max = 3},
		{name = "wood:tavifruit", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1}
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"farming:bread", "mobs:meat_cooked", "ores:ferrum_ingot"},
	view_range = 15,
	owner = "",
	order = "follow",
	fear_height = 3,
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
		punch_end = 219
	},

	on_rightclick = function(self, clicker)

		self.id = set_npc_id(self)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "ores:aurodium_lump" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()
			local drops = self.npc_drops or mobs.npc_drops
			local drop = drops[math.random(#drops)]
			local chance = 1

			if type(drop) == "table" then
				chance = drop[2]
				drop = drop[1]
			end

			if not minetest.registered_items[drop]
			or math.random(chance) > 1 then
				drop = "default:clay_lump"
			end

			local obj = minetest.add_item(pos, {name = drop})
			local dir = clicker:get_look_dir()

			obj:set_velocity({x = -dir.x, y = 1.5, z = -dir.z})

			return
		end

		-- by right-clicking owner can switch npc between follow, wander and stand
		if self.owner and self.owner == name then

			minetest.show_formspec(name, "mobs_npc:controls",
					get_npc_controls_formspec(name, self))

		elseif useDialogs == "Y" then
			simple_dialogs.show_dialog_formspec(name, self)
		end
	end
})

if not mobs.custom_spawn_npc then
mobs:spawn({
	name = "mobs_npc:human_default",
	nodes = {"default:brick"},
	neighbors = {"default:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true
})
end

mobs:register_egg("mobs_npc:human_default", S("Human (default)"), "brick.png", 1)


-- Kilarin's formspec functions
function get_npc_controls_formspec(name,self)

	local currentordermode = self.order
	local npcId = self.id
	local orderArray = {"wander", "stand", "follow"}
	local currentorderidx = 1

	for i = 1, 3 do  --this seems like a clumsy way to do this
		if orderArray[i] == currentordermode then
			currentorderidx = i
			break
		end
	end

	-- Make npc controls formspec
	local text = "NPC Controls"
	local size = useDialogs == "Y" and "size[15,10]" or "size[3.85,2.8]"
	local formspec = {
		size,
		"label[0.375,0.5;", minetest.formspec_escape(text), "]",
		"dropdown[0.375,1.25; 3,0.6;ordermode;wander,stand,follow;", currentorderidx, "]",
		"button[0.375,2;3,0.8;exit;Exit]"
	}

	if useDialogs == "Y" then
		simple_dialogs.add_dialog_control_to_formspec(name, self, formspec, 0.375, 3.4)
	end

	table.concat(formspec, "")

	--store npc id in local context so we can use it when the form is returned
	context[name] = npcId

	return table.concat(formspec, "")
end


minetest.register_on_player_receive_fields(function(player, formname, fields)

	local pname = player:get_player_name()

	if formname ~= "mobs_npc:controls" then

		if context[pname] then context[pname] = nil end

		return
	end

	local npcId = context[pname] or nil --get the npc id from local context
	local npcself = get_npcself_from_id(npcId)

	if npcself ~= nil then

		if fields["exit"] then

			minetest.close_formspec(pname, "mobs_npc:controls")

		elseif fields["ordermode"] then

--			minetest.chat_send_all("received ordermode")

			local pname = player:get_player_name()

			npcself.order = fields["ordermode"]

			if npcself.order == "wander" then

				minetest.chat_send_player(pname, S("NPC will wander."))

			elseif npcself.order == "stand" then

				npcself.state = "stand"
				npcself.attack = nil
				npcself:set_animation("stand")
				npcself:set_velocity(0)

				minetest.chat_send_player(pname, S("NPC stands still."))

			elseif npcself.order == "follow" then
				minetest.chat_send_player(pname, S("NPC will follow you."))
			end
		end

		if useDialogs == "Y" then
			simple_dialogs.process_simple_dialog_control_fields(pname, npcself, fields)
		end
	end
end)


-- check if npc has id set otherwise create one
function set_npc_id(npcself)

	if not npcself.id then
		npcself.id = (math.random(1, 1000) * math.random(1, 10000))
			.. npcself.name .. (math.random(1, 1000) ^ 2)
	end

	return npcself.id
end


--this function finds an npcself in the luaentities list given an npcId
function get_npcself_from_id(npcId)

	if npcId == nil then return nil end

	for k, v in pairs(minetest.luaentities) do

		if v.object and v.id and v.id == npcId then
			return v
		end
	end
end