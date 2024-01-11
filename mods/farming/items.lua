
-- add group function
local function add_groups(item, groups)

	local def = minetest.registered_items[item]

	if not def then return end

	local grp = def.groups

	for k, v in pairs(groups) do
		grp[k] = v
	end

	minetest.override_item(item, {groups = grp})
end

-- default recipe items
farming.recipe_items = {

	-- if utensils are disabled then use blank item
	saucepan = farming.use_utensils and "farming:saucepan" or "",
	pot = farming.use_utensils and "farming:pot" or "",
	baking_tray = farming.use_utensils and "farming:baking_tray" or "",
	skillet = farming.use_utensils and "farming:skillet" or "",
	mortar_pestle = farming.use_utensils and "farming:mortar_pestle" or "",
	cutting_board = farming.use_utensils and "farming:cutting_board" or "",
	juicer = farming.use_utensils and "farming:juicer" or "",
	mixing_bowl = farming.use_utensils and "farming:mixing_bowl" or "",

	water_source = "default:water_source",
	river_water_source = "default:river_water_source",
	bucket_empty = "bucket:bucket_empty",
	bucket_water = "bucket:bucket_water",
	bucket_river_water = "bucket:bucket_river_water",
	drinking_glass = "vessels:drinking_glass",
	glass_bottle = "vessels:glass_bottle",
	sugar = "farming:sugar",
	rose = "flowers:rose",
	dye_red = "dye:red",
	dye_pink = "dye:pink",
	dye_orange = "dye:orange",
	dye_green = "dye:green",
	dye_brown = "dye:brown",
	dye_blue = "dye:blue",
	dye_violet = "dye:violet",
	dye_yellow = "dye:yellow",
	bowl = "farming:bowl",
	flour = "group:food_flour",
	bread = "farming:bread",
	cactus = "default:cactus",
	paper = "default:paper",
	snow = "default:snow",
	string = "farming:string",
	wool = "wool:white",
	clay_brick = "default:clay_brick",
	stone = "default:stone",
	glass = "default:glass",
}

add_groups("wood:tavifruit", {food_tavifruit = 1})