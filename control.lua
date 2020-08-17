function on_init()
	if not remote.interfaces["freeplay"] then return end
	
	-- Setup kit presets
	local kits = {}
	
	kits["small"] = {}
	kits["small"]["items"] = {
		["iron-plate"] = 200,
		["copper-plate"] = 200,
		["iron-gear-wheel"] = 50,
		["transport-belt"] = 500,
		["splitter"] = 50,
		["underground-belt"] = 50,
		["burner-mining-drill"] = 20,
		["stone-furnace"] = 20,
		["coal"] = 100
	}
		
	kits["medium"] = {}
	kits["medium"]["items"] = {
		["iron-plate"] = 600,
		["copper-plate"] = 400,
		["iron-gear-wheel"] = 200,
		["electronic-circuit"] = 200,
		["transport-belt"] = 1100,
		["underground-belt"] = 50,
		["splitter"] = 50,
		["stone-furnace"] = 100,
		["assembling-machine-1"] = 20,
		["inserter"] = 300,
		["long-handed-inserter"] = 50,
		["steel-chest"] = 50,
		["electric-mining-drill"] = 50,
		["medium-electric-pole"] = 200,
		["boiler"] = 10,
		["steam-engine"] = 20,
		["offshore-pump"] = 1,
		["pipe-to-ground"] = 50,
		["pipe"] = 50,
		["car"] = 1,
		["coal"] = 200,
		["construction-robot"] = 50,
		["lab"] = 10,
		["power-armor"] = 1,
		["fusion-reactor-equipment"] = 1,
		["personal-roboport-equipment"] = 5,
		["battery-equipment"] = 3,
	}
	
	kits["big"] = {}
	kits["big"]["items"] = {
		["power-armor"] = 1,
		["iron-plate"] = 600,
		["copper-plate"] = 400,
		["iron-gear-wheel"] = 200,
		["electronic-circuit"] = 200,
		["advanced-circuit"] = 200,
		["transport-belt"] = 1500,
		["underground-belt"] = 50,
		["splitter"] = 50,
		["steel-furnace"] = 100,
		["assembling-machine-2"] = 100,
		["inserter"] = 300,
		["long-handed-inserter"] = 50,
		["steel-chest"] = 50,
		["electric-mining-drill"] = 50,
		["medium-electric-pole"] = 400,
		["medium-electric-pole"] = 100,
		["logistic-chest-requester"] =  100,
		["logistic-chest-passive-provider"] =  100,
		["boiler"] = 20,
		["steam-engine"] = 40,
		["offshore-pump"] = 10,
		["pipe-to-ground"] = 100,
		["pipe"] = 100,
		["chemical-plant"] = 20,
		["oil-refinery"] = 10,
		["car"] = 1,
		["coal"] = 50,
		["roboport"] = 20,
		["construction-robot"] = 50,
		["logistic-robot"] = 200,
		["lab"] = 10,
		["power-armor"] = 1,
		["fusion-reactor-equipment"] = 1,
		["personal-roboport-equipment"] = 5,
		["battery-equipment"] = 3,
	}
	
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
	
	local kitSetting = settings.startup["crash-quick-start-kit"].value
	local kit = kits[kitSetting]
	if kit == nil then
		kit = kits["medium"]
	end

	-- Add items
	local created_items = remote.call("freeplay", "get_created_items")
	for k,v in pairs(kit["items"]) do
		created_items[k] = v
	end
	remote.call("freeplay", "set_created_items", created_items)
end

script.on_init(on_init)