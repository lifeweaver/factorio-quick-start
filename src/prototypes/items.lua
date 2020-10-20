local trainLauncher = table.deepcopy(data.raw["gun"]["rocket-launcher"])

trainLauncher.name = "train-launcher"

trainLauncher.icons = {
  {
    icon = trainLauncher.icon,
	tint = {r=1,g=0,b=0,a=0.3}
  },
}

trainLauncher.attack_parameters = 
{
	type = "projectile",
	ammo_category = "locomotive-rocket",
	movement_slow_down_factor = 0.8,
	cooldown = 1.0,
	projectile_creation_distance = 0.6,
	range = 100,
	projectile_center = {-0.17, 0},
}


local trainLauncherRecipe = table.deepcopy(data.raw["recipe"]["rocket-launcher"])
trainLauncherRecipe.enabled = true
trainLauncherRecipe.name = "train-launcher"
trainLauncherRecipe.ingredients = {{"copper-plate", 5}, {"steel-plate", 5}}
trainLauncherRecipe.result = "train-launcher"





data:extend({trainLauncher, trainLauncherRecipe})