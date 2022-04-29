local modname = "pizza"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
local S = minetest.get_translator(minetest.get_current_modname())

-- Additional material for pizzas

minetest.register_craftitem("pizza:cheddar", {
    description = S("Cheddar"),
	inventory_image = "Cheddar.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
    output = "pizza:cheddar",
	recipe = {
	    {"wool:white","mobs:bucket_milk",""},
		{"farming:pot","farming:salt",""},
		{"","",""},
	},
	replacements = {
	    {"wool:white","wool:white"},
		{"mobs:bucket_milk","bucket:bucket_empty"},
	},
})

minetest.register_craftitem("pizza:mozarella", {
    description = S("Mozarella Ball"),
	inventory_image = "Mozarella.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
    output = "pizza:mozarella 3",
	recipe = {
	    {"mobs:bucket_milk","mobs:bucket_milk",""},
		{"bucket:bucket_river_water","farming:salt",""},
		{"","",""},
	},
	replacements = {
	    {"bucket:bucket_river_water", "bucket:bucket_empty"},
		{"mobs:bucket_milk","bucket:bucket_empty"},
	},
})

minetest.register_node("pizza:marinara", {
    description = S("Marinara Jar"),
	drawtype = "plantlike",
	tiles = {"Marinara.png"},
	inventory_image = "Marinara.png",
	wield_image = "Marinara.png",
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16},
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
       	attached_node = 1},
	on_use = minetest.item_eat(2, "vessels:glass_bottle"),
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
    output = "pizza:marinara",
	recipe = {
	    {"group:food_tomato","group:food_garlic_clove",""},
		{"farming:salt","farming:onion",""},
		{"vessels:glass_bottle","",""},
	},
})

minetest.register_craftitem("pizza:pepperoni", {
    description = S("Pepperoni"),
	inventory_image = "Pepperonimeat.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, flammable = 2},
})

minetest.register_craft({
    output = "pizza:pepperoni 3",
	recipe = {
	    {"farming:salt","mobs:meat_raw",""},
		{"","",""},
		{"","",""},
	},
})

-- Pizzas Finally

minetest.register_node("pizza:margherita", {
    description = S("Margharita Pizza"),
	tiles = {"Margherite.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0.3125},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0.3125, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1},
    on_use = minetest.item_eat(8),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:margherita_6"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_craft({
    output = "pizza:margherita",
	recipe = {
	    {"group:food_flour","group:food_tomato",""},
		{"pizza:marinara","pizza:mozarella",""},
		{"","",""},
	},
	replacements = {
	    {"pizza:marinara","vessels:glass_bottle"},
	},
})

minetest.register_node("pizza:pepperonipizza", {
    description = S("Pepperoni Pizza"),
	tiles = {"Pepperoni.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0.3125},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0.3125, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1},
    on_use = minetest.item_eat(8),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:pepperonipizza_6"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_craft({
    output = "pizza:pepperonipizza",
	recipe = {
	    {"group:food_flour","group:food_cheese",""},
		{"pizza:marinara","pizza:pepperoni",""},
		{"","",""},
	},
	replacements = {
	    {"pizza:marinara","vessels:glass_bottle"},
	},
})

minetest.register_node("pizza:hawaiian", {
    description = S("Pineapple Pizza"),
	tiles = {"Hawaiian.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0.3125},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0.3125, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1},
    on_use = minetest.item_eat(8),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:hawaiian_6"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_craft({
    output = "pizza:hawaiian",
	recipe = {
	    {"group:food_flour","farming:pineapple_ring",""},
		{"mobs:meat","group:food_cheese",""},
		{"","",""},
	},
	replacements = {
	    {"pizza:marinara","vessels:glass_bottle"},
	},
})

minetest.register_node("pizza:cheese_pizza", {
    description = S("Cheese Pizza"),
	tiles = {"CheesePizza.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0.3125},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0.3125, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1},
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:cheese_pizza_6"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_craft({
    output = "pizza:cheese_pizza",
	recipe = {
	    {"group:food_flour","pizza:mozarella",""},
		{"mobs:cheese","pizza:cheddar",""},
		{"","",""},
	},
	replacements = {
	    {"pizza:marinara","vessels:glass_bottle"},
	},
})

-- pizza slices

minetest.register_craftitem("pizza:margherita_slice", {
    description = S("Margharita Pizza Slice"),
	inventory_image = "Marghariteslice.png",
	on_use = minetest.item_eat(1),
	groups = {food_pizza = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza:margherita_slice 8",
	recipe = {
	    "pizza:margherita",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

minetest.register_craftitem("pizza:pepperoni_slice", {
    description = S("Pepperoni Pizza Slice"),
	inventory_image = "Pepperonislice.png",
	on_use = minetest.item_eat(1),
	groups = {food_pizza = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza:pepperoni_slice 8",
	recipe = {
	    "pizza:pepperonipizza",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

minetest.register_craftitem("pizza:hawaiian_slice", {
    description = S("Pineapple Pizza Slice"),
	inventory_image = "Hawaiianslice.png",
	on_use = minetest.item_eat(1),
	groups = {food_pizza = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza:hawaiian_slice 8",
	recipe = {
	    "pizza:hawaiian",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

minetest.register_craftitem("pizza:cheesepizza_slice", {
    description = S("Cheese Pizza Slice"),
	inventory_image = "Cheesepizzaslice.png",
	on_use = minetest.item_eat(1),
	groups = {food_pizza = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza:cheesepizza_slice 8",
	recipe = {
	    "pizza:cheese_pizza",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

-- Packing pizza slices

minetest.register_craft({
	type = "shapeless",
    output = "pizza:margherita",
	recipe = {
	    "pizza:margherita_slice",
		"pizza:margherita_slice",
		"pizza:margherita_slice",
		"pizza:margherita_slice",
		"pizza:margherita_slice",
		"pizza:margherita_slice",
		"pizza:margherita_slice",
		"pizza:margherita_slice",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "pizza:pepperonipizza",
	recipe = {
	    "pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
		"pizza:pepperoni_slice",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "pizza:hawaiian",
	recipe = {
	    "pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
		"pizza:hawaiian_slice",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "pizza:cheese_pizza",
	recipe = {
	    "pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
		"pizza:cheesepizza_slice",
	},
})

-- Ate pizza

minetest.register_node("pizza:cheese_pizza_6", {
    description = S("Cheese Pizza"),
	tiles = {"CheesePizza.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			{0.3125, -0.56, -0, 0, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(6),
	visual_scale = 0.9,
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:cheese_pizza_4"
			minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end
	end
})

minetest.register_node("pizza:cheese_pizza_4", {
    description = S("Cheese Pizza"),
	tiles = {"CheesePizza.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(4),
	visual_scale = 0.9,
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:cheese_pizza_2"
			minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end
	end
})

minetest.register_node("pizza:cheese_pizza_2", {
    description = S("Cheese Pizza"),
	tiles = {"CheesePizza.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			
			{0, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(2),
	visual_scale = 0.9,
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "air"
			minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end
	end
})

minetest.register_node("pizza:hawaiian_6", {
    description = S("Pineapple Pizza"),
	tiles = {"Hawaiian.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			{0.3125, -0.56, -0, 0, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(6),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:hawaiian_4"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:hawaiian_4", {
    description = S("Pineapple 4"),
	tiles = {"Hawaiian.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(4),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:hawaiian_2"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:hawaiian_2", {
    description = S("Pineapple Pizza"),
	tiles = {"Hawaiian.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			
			{0, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(2),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "air"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:pepperonipizza_6", {
    description = S("Pepperoni Pizza"),
	tiles = {"Pepperoni.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			{0.3125, -0.56, -0, 0, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(6),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:pepperonipizza_4"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:pepperonipizza_4", {
    description = S("Pepperoni Pizza"),
	tiles = {"Pepperoni.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(4),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:pepperonipizza_2"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:pepperonipizza_2", {
    description = S("Pepperoni Pizza"),
	tiles = {"Pepperoni.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			
			{0, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(2),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "air"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:margherita_6", {
    description = S("Margharita Pizza"),
	tiles = {"Margherite.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			{0.3125, -0.56, -0, 0, -0.375, 0.3125},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0.3125, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
			{-0, -0.56, 0.5, 0.3125, -0.25, 0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(6),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:margherita_4"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:margherita_4", {
    description = S("Margharita Pizza"),
	tiles = {"Margherite.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0.3125, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			{0.3125, -0.56, 0, 0.5, -0.25, -0.3125},
			
			{0.3125, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(4),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "pizza:margherita_2"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})

minetest.register_node("pizza:margherita_2", {
    description = S("Margharita Pizza"),
	tiles = {"Margherite.png", "pizzabottom.png", "pizzabottom.png"},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	buildable = false,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.56, -0.3125, 0, -0.375, 0},
			
			{-0.3125, -0.56, -0.3125, -0.5, -0.25, 0},
			
			{0, -0.56, -0.5, -0.3125, -0.25, -0.3125},
		},
	},
	selection_box = {
	    type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.45, 0.45, -0.225, 0.45},
		},
	},
	groups = {snappy = 3, food_pizza = 1, not_in_creative_inventory = 1},
    on_use = minetest.item_eat(2),
	visual_scale = 0.9,
	
	on_punch = function(pos, node, puncher, pointed_thing)
	    node.name = "air"
		minetest.swap_node(pos,node)
		if minetest.get_modpath("stamina") ~= nil then

		    stamina.change(puncher, 2)

		    minetest.sound_play("stamina_eat", {
			    pos = pos, gain = 0.7, max_hear_distance = 5})
		end

	end
})