
-- Override grasses to drop seeds

if minetest.registered_nodes["default:grass_1"] then

	for i = 4, 5 do

		minetest.override_item("default:grass_" .. i, {
			drop = {
				max_items = 1,
				items = {
					{items = {"farming:seed_wheat"}, rarity = 5},
					{items = {"default:grass_1"}}
				}
			}
		})
	end
end

if minetest.registered_nodes["default:jungle_grass"] then

	minetest.override_item("default:jungle_grass", {
		drop = {
			max_items = 1,
			items = {
				{items = {"farming:seed_cotton"}, rarity = 8},
				{items = {"farming:seed_rice"}, rarity = 8},
				{items = {"default:jungle_grass"}}
			}
		}
	})
end