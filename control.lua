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
	
	-- Setup kit presets
	local kits = {}
	
	kits["small"] = {}
	kits["small"]["quickbar"] = {
		{1, "transport-belt"},
		{2, "underground-belt"},
		{3, "splitter"},
		{4, "inserter"},
		{5, "medium-electric-pole"},
        {6, "burner-mining-drill"},
        {7, "stone-furnace"},
		{10, "car"}
	}
	kits["small"]["items"] = {
		{"iron-plate", 200},
		{"copper-plate", 200},
		{"iron-gear-wheel", 50},
		{"transport-belt", 500},
		{"splitter", 50},
		{"underground-belt", 50},
		{"burner-mining-drill", 20},
		{"stone-furnace", 20},
		{"coal", 100}
	}
		
	kits["medium"] = {}
	kits["medium"]["quickbar"] = {
		{1, "transport-belt"},
		{2, "underground-belt"},
		{3, "splitter"},
		{4, "inserter"},
		{5, "medium-electric-pole"},
        {6, "electric-mining-drill"},
        {7, "stone-furnace"},
		{10, "car"}
	}
	kits["medium"]["items"] = {
		{"iron-plate", 600},
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
		{"medium-electric-pole", 200},
		{"boiler", 10},
		{"steam-engine", 20},
		{"offshore-pump", 1},
		{"pipe-to-ground", 50},
		{"pipe", 50},
		{"car", 1},
		{"coal", 200},
		{"construction-robot", 50},
		{"lab", 10},
		{"power-armor", 1}
	}
	kits["medium"]["armorItems"] = {
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
	
	kits["big"] = {}
	kits["big"]["quickbar"] = {
		{1, "transport-belt"},
		{2, "underground-belt"},
		{3, "splitter"},
		{4, "inserter"},
		{5, "medium-electric-pole"},
		{10, "car"}
	}
	kits["big"]["items"] = {
		{"power-armor", 1},
		{"iron-plate", 600},
		{"copper-plate", 400},
		{"iron-gear-wheel", 200},
		{"electronic-circuit", 200},
		{"advanced-circuit", 200},
		{"transport-belt", 1500},
		{"underground-belt", 50},
		{"splitter", 50},
		{"steel-furnace", 100},
		{"assembling-machine-2", 100},
		{"inserter", 300},
		{"long-handed-inserter", 50},
		{"steel-chest", 50},
		{"electric-mining-drill", 50},
		{"medium-electric-pole", 400},
		{"big-electric-pole", 100},
		{"logistic-chest-requester", 100},
		{"logistic-chest-passive-provider", 100},
		{"boiler", 20},
		{"steam-engine", 40},
		{"offshore-pump", 10},
		{"pipe-to-ground", 100},
		{"pipe", 100},
		{"chemical-plant", 20},
		{"oil-refinery", 10}, 
		{"car", 1},
		{"coal", 50},
		{"roboport", 20},
		{"construction-robot", 50},
		{"logistic-robot", 300},
		{"lab", 10}
	}
	kits["big"]["armorItems"] = kits["medium"]["armorItems"]
	kits["big"]["technologies"] = {
		{"automation"},
		{"steel-processing"},
		{"automation-2"},
		{"oil-processing"},
		{"plastics"},
		{"advanced-electronics"},
		{"sulfur-processing"},
		{"battery"},
		{"electronics"},
		{"engine"},
		{"electric-engine"},
		{"logistic-science-pack"},
		{"fluid-handling"},
		{"lubricant"},
		{"robotics"},
		{"logistic-robotics"},
		{"construction-robotics"},
		{"utility-science-pack"},
		{"chemical-science-pack"},
		{"advanced-electronics-2"},
		{"low-density-structure"},
		{"advanced-material-processing"},
		{"logistic-system"}
	}
	
	local kitSetting = settings.startup["quick-start-kit"].value
	local kit = kits[kitSetting]
	if kit == nil then
		kit = kits["medium"]
	end
	
	-- Setup quickbar favorites
    for k,v in pairs(kit["quickbar"]) do
        player.set_quick_bar_slot(v[1], v[2])
    end
    
    -- Remove standard items
    local playerInventory = player.get_main_inventory()
    playerInventory.remove({name="iron-plate", count=8})
    playerInventory.remove({name="burner-mining-drill", count=1})
    playerInventory.remove({name="stone-furnace", count=1})
    playerInventory.remove({name="wood", count=1})
	
	-- Add items
	for k,v in pairs(kit["items"]) do
		player.insert{name = v[1], count = v[2]}
	end
	
	if kit["armorItems"] ~= nil then
		-- Find armor in one of the inventories
		-- Usually ends up in the armor slot. But that one does not exist in sandbox mode
		for k,v in pairs(inventories) do
			local inventory = player.get_inventory(v)
			if inventory ~= nil then
				local armor = inventory.find_item_stack("power-armor")
				if armor ~= nil then
					-- Add items to armor grid
					local grid = armor.grid
					for k,v in pairs(kit["armorItems"]) do
						grid.put{name = v[1]}
					end
					break
				end
			end
		end
	end
	
	-- Unlock technologies
	if kit["technologies"] ~= nil then
		for k,v in pairs(kit["technologies"]) do
			player.force.technologies[v[1]].researched = true
		end
	end
	
end)
