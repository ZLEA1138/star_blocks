
local S = mobs.intllib_npc

-- define table containing names for use and shop items for sale

mobs.tavin_food = {
--	names = {
--		"Bob", "Duncan", "Bill", "Tom", "James", "Ian", "Lenny",
--		"Dylan", "Ethan"
--	},
	items = {
		--{item for sale, price, chance of appearing in trader's inventory}
		{"wood:tavifruit 10", "simplecoins:coin_federation 2", 10},
		{"farming:bread 10", "simplecoins:coin_federation 4", 5},
		{"farming:wheat 10", "simplecoins:coin_federation 2", 10},
		{"bonemeal:gelatin_powder 2", "simplecoins:coin_federation 2", 15},
		{"flowers:mushroom_red 2", "simplecoins:coin_federation 2", 10},
		{"flowers:mushroom_brown 2", "simplecoins:coin_federation 2", 10},
		{"ethereal:fern_tubers 2", "simplecoins:coin_federation 2", 15},
		{"farming:corn 2", "simplecoins:coin_federation 2", 10},
		{"farming:rice 2", "simplecoins:coin_federation 2", 10},
		{"farming:ruberberries 2", "simplecoins:coin_federation 2", 10},
		{"farming:sugar 2", "simplecoins:coin_federation 2", 15},
		{"farming:salt 2", "simplecoins:coin_federation 2", 15},
	}
}

mobs.tavin_weapon = {
	items = {
		--{item for sale, price, chance of appearing in trader's inventory}
		{"wood:tavifruit 10", "simplecoins:coin_federation 2", 10},
		{"farming:bread 10", "simplecoins:coin_federation 4", 5},
		{"default:clay 10", "simplecoins:coin_federation 2", 12},
		{"default:brick 10", "simplecoins:coin_federation 4", 17},
		{"default:glass 10", "simplecoins:coin_federation 4", 17},
		{"rangedweapons:fc37 1", "simplecoins:coin_federation 15", 20},
		{"farming:wheat 10", "simplecoins:coin_federation 2", 17},
		{"default:stone 10", "simplecoins:coin_federation 8", 17},
		{"default:desert_stone 10", "simplecoins:coin_federation 8", 27},
		{"default:cactus 2", "simplecoins:coin_federation 2", 40},
		{"default:reeds 2", "simplecoins:coin_federation 2", 40},
	}
}

mobs.tavin_antique = {
	items = {
		--{item for sale, price, chance of appearing in trader's inventory}
		{"wood:tavifruit 10", "simplecoins:coin_federation 2", 10},
		{"farming:bread 10", "simplecoins:coin_federation 4", 5},
		{"default:clay 10", "simplecoins:coin_federation 2", 12},
		{"default:brick 10", "simplecoins:coin_federation 4", 17},
		{"default:glass 10", "simplecoins:coin_federation 4", 17},
		{"rangedweapons:fc37 1", "simplecoins:coin_federation 15", 20},
		{"farming:wheat 10", "simplecoins:coin_federation 2", 17},
		{"default:stone 10", "simplecoins:coin_federation 8", 17},
		{"default:desert_stone 10", "simplecoins:coin_federation 8", 27},
		{"default:cactus 2", "simplecoins:coin_federation 2", 40},
		{"default:reeds 2", "simplecoins:coin_federation 2", 40},
	}
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
	'hair_female_25.png', 'hair_female_26.png', 'hair_female_27.png'
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
			.. human_female_hair_base[math.random(27)] .. human_hair_color[math.random(11)] .. ')'
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
			.. human_female_hair_base[math.random(27)] .. human_hair_color[math.random(11)] .. ')'
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

-- Trader ( same as NPC but with right-click shop )

mobs:register_mob("mobs_npc:trader_food", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	attack_animals = false,
	attack_npcs = false,
	pathfinding = false,
	hp_min = 20,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	textures = human.default_skins,
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = false,
	drops = {},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	follow = {"ores:aurem_ingot"},
	view_range = 15,
	owner = "",
	order = "stand",
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
		punch_end = 219,
	},

	on_rightclick = function(self, clicker)
		self.attack = nil
		mobs_trader(self, clicker, mobs.tavin_food)
	end,

	on_spawn = function(self)

		self.nametag = S("Food Trader")

		self.object:set_properties({
			nametag = self.nametag,
			nametag_color = "#FFFFFF"
		})

		return true -- return true so on_spawn is run once only
	end,
})

--This code comes almost exclusively from the trader and inventory of mobf, by Sapier.
--The copyright notice below is from mobf:
-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
--
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice.
-- And of course you are NOT allow to pretend you have written it.
--
--! @file inventory.lua
--! @brief component containing mob inventory related functions
--! @copyright Sapier
--! @author Sapier
--! @date 2013-01-02
--
--! @defgroup Inventory Inventory subcomponent
--! @brief Component handling mob inventory
--! @ingroup framework_int
--! @{
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

-- This code has been heavily modified by isaiah658.
-- Trades are saved in entity metadata so they always stay the same after
-- initially being chosen.  Also the formspec uses item image buttons instead of
-- inventory slots.

function mobs.add_goods(self, race)

	local trade_index = 1
	local trades_already_added = {}
	local trader_pool_size = 10
	local item_pool_size = #race.items -- get number of items on list

	self.trades = {}

	if item_pool_size < trader_pool_size then
		trader_pool_size = item_pool_size
	end

	for i = 1, trader_pool_size do

		-- If there are more trades than the amount being added, they are
		-- randomly selected.  If they are equal, there is no reason to randomly
		-- select them
		local random_trade = nil

		if item_pool_size == trader_pool_size then
			random_trade = i
		else
			while random_trade == nil do

				local num = math.random(item_pool_size)

				if trades_already_added[num] == nil then
					trades_already_added[num] = true
					random_trade = num
				end
			end
		end

		if math.random(0, 100) > race.items[random_trade][3] then

			self.trades[trade_index] = {
				race.items[random_trade][1],
				race.items[random_trade][2]
			}

			trade_index = trade_index + 1
		end
	end
end


function mobs_trader(self, clicker, race)

	if not self.id then
		self.id = (math.random(1, 1000) * math.random(1, 10000))
			.. self.name .. (math.random(1, 1000) ^ 2)
	end

	if not self.game_name then

--		self.game_name = tostring(race.names[math.random(1, #race.names)])
--		self.nametag = S("Trader @1", self.game_name)
		self.nametag = S("Food Trader")

		self.object:set_properties({
			nametag = self.nametag,
			nametag_color = "#00FF00"
		})
	end

	if self.trades == nil then
		mobs.add_goods(self, race)
	end

	local player = clicker:get_player_name() or ""

	minetest.chat_send_player(player,
		S("[NPC] <Food Trader> Hello, @1, you look hungry.", player))

	-- Make formspec trade list
	local formspec_trade_list = ""
	local x, y

	for i = 1, 10 do

		if self.trades[i] and self.trades[i] ~= "" then

			if i < 6 then
				x = 0.5
				y = i - 0.5
			else
				x = 4.5
				y = i - 5.5
			end

			formspec_trade_list = formspec_trade_list
			.. "item_image_button[".. x ..",".. y ..";1,1;"
				.. self.trades[i][2] .. ";prices#".. i .."#".. self.id ..";]"
			.. "item_image_button[".. x + 2 ..",".. y ..";1,1;"
				.. self.trades[i][1] .. ";goods#".. i .."#".. self.id ..";]"
			.. "image[".. x + 1 ..",".. y ..";1,1;gui_arrow_blank.png]"
		end
	end

	minetest.show_formspec(player, "mobs_npc:trade", "size[8,10]"
		.. default.gui_bg_img
		.. default.gui_slots
		.. "label[0.5,-0.1;" .. S("Food Trader's stock:") .. "]"
		.. formspec_trade_list
		.. "list[current_player;main;0,6;8,4;]"
	)
end


minetest.register_on_player_receive_fields(function(player, formname, fields)

	if formname ~= "mobs_npc:trade" then return end

	if fields then

		local trade = ""

		for k, v in pairs(fields) do
			trade = tostring(k)
		end

		local id = trade:split("#")[3]
		local self = nil

		if id ~= nil then

			for k, v in pairs(minetest.luaentities) do

				if v.object and v.id and v.id == id then
					self = v
					break
				end
			end
		end

		if self ~= nil then

			local trade_number = tonumber(trade:split("#")[2])

			if trade_number ~= nil and self.trades[trade_number] ~= nil then

				local price = self.trades[trade_number][2]
				local goods = self.trades[trade_number][1]
				local inv = player:get_inventory()

				if inv:contains_item("main", price) then

					inv:remove_item("main", price)

					local leftover = inv:add_item("main", goods)

					if leftover:get_count() > 0 then

						-- drop item(s) in front of player
						local droppos = player:get_pos()
						local dir = player:get_look_dir()

						droppos.x = droppos.x + dir.x
						droppos.z = droppos.z + dir.z

						minetest.add_item(droppos, leftover)
					end
				end
			end
		end
	end
end)

mobs:register_egg("mobs_npc:trader_food", S("Food Trader"), "sandstone.png", 1)

-- compatibility
mobs:alias_mob("mobs:trader_food", "mobs_npc:trader_food")
