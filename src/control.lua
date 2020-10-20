--control.lua


-- local knownNames

-- script.on_event(defines.events.on_player_changed_position,
    -- function(event)
        -- local player = game.get_player(event.player_index) -- get the player that moved
        -- if they're wearing our armor
        -- if player.character and player.get_inventory(defines.inventory.character_armor).get_item_count("fire-armor") >= 1 then
            -- create the fire where they're standing
            -- player.surface.create_entity{name="fire-flame", position=player.position, force="neutral"}
        -- end
    -- end
-- )







-- local surface = game.players[1].surface
-- surface.create_entity{
  -- name='locomotive',
  -- position={x=x,y=y},
  -- force=game.players[1].force
-- }











-- get current player
-- game.players[event.player_index]

-- function give(player, itemName, amount)
  -- local items = game.item_prototypes
  -- if items[itemName] then
    -- local item = {name = itemName, count = amount}
    -- if player.can_insert(item) then
      -- local amount = player.insert(item)
    -- end
  -- end
-- end

-- function take(player, itemName, amount)
  -- local items = game.item_prototypes
  -- if items[itemName] then
    -- local item = {name = itemName, count = amount}
    -- local main = player.get_inventory(defines.inventory.player_main)
    -- local bar = player.get_inventory(defines.inventory.player_quickbar)
    -- if main.find_item_stack(itemName) or bar.find_item_stack(itemName) then
      -- local amount = player.remove_item(item)
    -- end
  -- end
-- end




-- function setupTrainLauncherExplosion(position, surface)
  -- local train = {}
  
  -- train.origin = position
  -- train.surface = surface
  -- train.surface.create_entity({name = "locomotive-explosion", position = position})
-- end

-- script.on_event(defines.events.on_trigger_created_entity, function(event)
  -- if knownNames[event.entity.name] then
    -- script.on_event(defines.events.on_tick, ticker)
    -- knownNames[event.entity.name](event.entity.position, event.entity.surface)
    -- event.entity.destroy()
  -- end
-- end)

-- function jtest(train)
  -- train.surface.find_entities_filtered {
    -- area = {
	  -- {
	    -- x = train.origin.x + radius,
	    -- y = train.origin.y + radius,
      -- },
	  -- {
	    -- x = train.origin.x + radius,
	    -- y = train.origin.y + radius,
      -- }
	-- },
	-- type = ""
  -- }


  -- train.surface.create_entity {
    -- name = "explosion",
	-- position = '',
	-- force = game.forces.player
  -- }
-- end


-- knownNames = {
  -- ["train-launcher-explosion"] = setupTrainLauncherExplosion
-- }








