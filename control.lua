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

kits["big"] = {}
kits["big"]["items"] = {
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
	["big-electric-pole"] = 100,
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
kits["big"]["quickbar"] = {
	{1, "transport-belt"},
	{2, "underground-belt"},
	{3, "splitter"},
	{4, "inserter"},
	{5, "medium-electric-pole"},
	{6, "electric-mining-drill"},
	{7, "steel-furnace"},
	{10, "car"}
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

function on_init()
	if not remote.interfaces["freeplay"] then return end

	
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

function on_player_created(event)
	if not remote.interfaces["freeplay"] then return end
	
	local kitSetting = settings.startup["crash-quick-start-kit"].value
	local kit = kits[kitSetting]
	if kit == nil then
		kit = kits["medium"]
	end
	
	local player = game.players[event.player_index]
	-- Unlock technologies
	if kit["technologies"] ~= nil then
		for k,v in pairs(kit["technologies"]) do
			player.force.technologies[v[1]].researched = true
		end
	end
	
	-- Setup quickbar favorites
    for k,v in pairs(kit["quickbar"]) do
        player.set_quick_bar_slot(v[1], v[2])
    end
	
end

script.on_init(on_init)
script.on_event(defines.events.on_player_created, on_player_created)
