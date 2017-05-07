script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	local inventories = {
		defines.inventory.player_armor,
		defines.inventory.player_main,
		defines.inventory.player_quickbar,
		defines.inventory.player_guns,
		defines.inventory.player_ammo,
		defines.inventory.player_tools,
		defines.inventory.player_vehicle,
		defines.inventory.player_player_trash
	}
	
	local items = {
		{"steel-axe", 10},
		{"iron-plate", 592},
		{"copper-plate", 400},
		{"iron-gear-wheel", 200},
		{"electronic-circuit", 200},
		{"transport-belt", 1100},
		{"underground-belt", 50},
		{"splitter", 50},
		{"stone-furnace", 100},
		{"assembling-machine-1", 20},
		{"inserter", 300},
		{"long-handed-inserter", 50},
		{"steel-chest", 50},
		{"electric-mining-drill", 50},
		{"small-electric-pole", 200},
		{"boiler", 10},
		{"steam-engine", 20},
		{"offshore-pump", 1},
		{"pipe-to-ground", 50},
		{"pipe", 50},
		{"car", 1},
		{"coal", 200},
		{"construction-robot", 50},
		{"lab", 10},
		{"deconstruction-planner", 1},
		{"power-armor", 1}
	}
	
	local armorItems = {
		{"fusion-reactor-equipment"},
		{"personal-roboport-equipment"},
		{"personal-roboport-equipment"},
		{"personal-roboport-equipment"},
		{"personal-roboport-equipment"},
		{"personal-roboport-equipment"},
		{"battery-equipment"},
		{"battery-equipment"},
		{"battery-equipment"}
	}
	
	-- Find quickbar (usually player_quickbar, but god_quickbar in sandbox mode)
	local quickbar = player.get_inventory(defines.inventory.player_quickbar)
	if quickbar ~= nil and not quickbar.can_set_filter(1, "transport-belt") then
		quickbar = player.get_inventory(defines.inventory.god_quickbar)
	end
	
	-- Setup quickbar favorites
	if quickbar ~= nil and quickbar.can_set_filter(1, "transport-belt") ~= nil then
		quickbar.clear()
		quickbar.set_filter(1, "transport-belt")
		quickbar.set_filter(2, "underground-belt")
		quickbar.set_filter(3, "splitter")
		quickbar.set_filter(4, "inserter")
		quickbar.set_filter(5, "small-electric-pole")
		quickbar.set_filter(6, "deconstruction-planner")
		quickbar.set_filter(10, "car")
	end
	
	-- Add items
	for k,v in pairs(items) do
		player.insert{name = v[1], count = v[2]}
	end
	
	-- Find armor in one of the inventories
	-- Usually ends up in the armor slot. But that one does not exist in sandbox mode
	for k,v in pairs(inventories) do
		local inventory = player.get_inventory(v)
		if inventory ~= nil then
			local armor = inventory.find_item_stack("power-armor")
			if armor ~= nil then
				-- Add items to armor grid
				local grid = armor.grid
				for k,v in pairs(armorItems) do
					grid.put{name = v[1]}
				end
				break
			end
		end
	end
end)