local ammoCategory = "locomotive-rocket"

data:extend(
{
	{
		type = "ammo-category",
		name= ammoCategory
	}
})


local ammoName = "train-launcher-ammo" 

-- data.raw.item["train-stop"]
-- local trainAmmo = table.deepcopy(data.raw["projectile"]["rocket"])
-- trainAmmo.name = ammoName
-- trainAmmo.category = "locomotive-rocket"

-- trainAmmo.action.action_delivery = 
-- {
	-- type = "projectile",
	-- projectile = "train-launcher-projectile",
	-- starting_speed = 1
-- }

local trainAmmo =
{
	type = "ammo",
	name = ammoName,
	icon = "__base__/graphics/icons/rocket.png",
	icon_size = 64,
	icon_mipmaps = 4,
	ammo_type =
	{
		category = ammoCategory,
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "projectile",
				projectile = "train-launcher-projectile",
				starting_speed = 0.0001,
				-- source_effects =
				-- {
					-- type = "create-entity",
					-- entity_name = "explosion-hit"
				-- }
			}
		}
	},
	subgroup = "ammo",
	order = "d[rocket-launcher]-c[" .. ammoCategory .. "]",
	stack_size = 200
}




-- local trainLauncherAmmoRecipe = table.deepcopy(data.raw["recipe"]["rocket"])
-- trainLauncherAmmoRecipe.enabled = true
-- trainLauncherAmmoRecipe.name = "train-launcher-ammo"
-- trainLauncherAmmoRecipe.ingredients = {{"copper-plate", 1}, {"steel-plate", 1}}
-- trainLauncherAmmoRecipe.requester_paste_multiplier = 1
-- trainLauncherAmmoRecipe.result = name


local trainLauncherAmmoRecipe =
{
	type = "recipe",
	name = ammoName,
	enabled = true,
	energy_required = 0.1,
	ingredients = {{"steel-plate", 1}},
	result = ammoName,
	requester_paste_multiplier = 1
}



data:extend({trainAmmo, trainLauncherAmmoRecipe})