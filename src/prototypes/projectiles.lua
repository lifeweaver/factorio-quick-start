local smoke_animations = require("__base__.prototypes.entity.demo-smoke-animations")
local trivial_smoke = smoke_animations.trivial_smoke

-- local trainProjectile = table.deepcopy(data.raw["projectile"]["rocket"])
-- trainProjectile.name = "train-launcher-projectile"
-- trainProjectile.acceleration = 0.00001
-- trainProjectile.action.action_delivery.target_effects =
-- {
	-- {
		-- type = "damage",
		-- damage = {
			-- type = "impact",
			-- amount = 1
		-- },
	-- },
-- }
-- trainProjectile.action.animation =
-- {
	-- filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-01.png",
	-- frame_count = 1,
	-- line_length = 1,
	-- width = 238,
	-- height = 230,
	-- shift = {0, 0},
	-- priority = "high"
-- }


-- G:\SteamLibrary\SteamApps\common\Factorio\data\base\prototypes\entity\demo-entities.lua ~ line 8260
    -- weight = 2000,
	    -- air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
	
	
	
-- TODO: get locomotive acceleration and use that, with rocket fuel I guess, or maybe the highest unlocked fuel?
-- TODO: add train tracks as the smoke trail?
local trainProjectile = 
{
    type = "projectile",
    name =  "train-launcher-projectile",
    acceleration = 0.005,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
	hit_collision_mask = { "item-layer", "object-layer", "player-layer", "water-tile"},
	collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
	hit_at_collision_position = true;
	direction_only = true; -- Trains are just going to go where you point, not homing
	max_speed = 0.05,
	action = 
	{
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 180, type = "impact"}
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1,
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 1.5 -- large radius for demostrative purposes
          },
		  -- TODO: spawn train remnants
        }
      }
	},
	animation =
	{
		filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-01.png",
		frame_count = 1,
		line_length = 1,
        -- line_length = 4,
        -- lines_per_file = 8,
		width = 238,
		height = 230,
		shift = {0, 0}, -- May have to adjust or make dynamic if we get hit_collision_mask working?
		priority = "high",
		-- allow_low_quality_rotation = true, -- might work?
	},
	working_sound = 
	{
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.7
      },
      max_sounds_per_type = 4
    },
	smoke =
	{
		{
			name = 'train-track-smoke',
			frequency = 0.02,
			deviation = {0, 0},
			position = {0, 1.5}
		}
        -- {
          -- name = "car-smoke",
          -- deviation = {0.25, 0.25},
          -- frequency = 0.01,
          -- position = {0, 1.5},
		  -- duration = 100,
          -- starting_frame = 0,
          -- starting_frame_deviation = 60
        -- }
		-- TODO: if you get tired of the train track smoke
		-- {
			-- name = "train-smoke"
		-- }
	}
}


-- data:extend
-- {
	-- trivial_smoke
	-- {
		-- name = "train-track-smoke",
		-- color = {r = 0.4, g = 0.4, b = 0.4, a = 0.4}
	-- }
-- }

data:extend
{
	{
		type = 'trivial-smoke',
		name = 'train-track-smoke',
		flags = {'not-on-map'},
		slow_down_factor = 1,
		duration = 1000,
		fade_in_duration = 0,
		fade_away_duration = 120,
		-- color = {r = 0, g = 0, b = 0, a = 0.3},
		cyclic = true,
		affected_by_wind = false,
		animation =
		{
		  width = 128,
		  height = 64,
		  frame_count = 1,
		  direction_count = 1,
		  shift = {0, 0},
		  priority = "high",
		  animation_speed = 0.1,
		  filename = "__base__/graphics/entity/straight-rail/straight-rail-vertical-ties.png",
		  flags = { "compressed" }
		}
		-- TODO: use straight-rail-vertical-metals.png to overlay or something?
	}
}

-- track_particle_triggers =
-- {
-- tiles = { "water-shallow" },

-- type = "create-particle",
-- repeat_count = 5,
-- particle_name = "shallow-water-vehicle-particle",
-- initial_height = 0.2,
-- speed_from_center = 0.01,
-- speed_from_center_deviation = 0.05,
-- initial_vertical_speed = 0.02,
-- offsets =
-- {
  -- {0.75, 1},
  -- {-0.75,1},
  -- {0.55, -0.8},
  -- {-0.55,-0.8}
-- },
-- offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
-- rotate_offsets = true
-- }


-- search on rail_pictures

-- TODO: use straight-rail entity?
-- {
-- type = "straight-rail",
-- name = "straight-rail",
-- icon = "__base__/graphics/icons/rail.png",
-- icon_size = 64, icon_mipmaps = 4,
-- flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
-- minable = {mining_time = 0.2, result = "rail"},
-- max_health = 100,
-- corpse = "straight-rail-remnants",
-- dying_explosion = "rail-explosion",
-- resistances =
-- {
  -- {
	-- type = "fire",
	-- percent = 100
  -- },
  -- {
	-- type = "acid",
	-- percent = 80
  -- }
-- },
---- collision box is hardcoded for rails as they need to be different for different orientations (diagonal or straight) and to
---- avoid unexpected changes in the way rail blocks are merged
-- selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
-- damaged_trigger_effect = hit_effects.wall(),
-- pictures = rail_pictures(),
-- walking_sound = sounds.rails
-- }




data:extend({trainProjectile})






