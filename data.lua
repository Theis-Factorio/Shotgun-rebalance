--Enable shotgun without tech
data.raw.recipe["shotgun"].enabled = true
data.raw.recipe["shotgun-shell"].enabled = true

--Decrease magazine size of shotgun shells 
data.raw.ammo["shotgun-shell"].magazine_size = 6

--Decrease movement_slow_down_factor for shotguns
--data.raw.gun["pistol"].attack_parameters.movement_slow_down_factor = 0.1 --was 0.2
--data.raw.gun["shotgun"].attack_parameters.movement_slow_down_factor = 0.4 --was 0.6
data.raw.gun["shotgun"].attack_parameters.movement_slow_down_cooldown = 30 -- was default 60 ticks 
data.raw.gun["combat-shotgun"].attack_parameters.movement_slow_down_factor = 0.4 --was 0.5

data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = 10 -- was 8, however normal shotgun pellets are 8
data.raw.projectile["piercing-shotgun-pellet"].piercing_damage = 50 -- new
data.raw.ammo["piercing-shotgun-shell"].ammo_type.action[2].action_delivery.max_range = 17 -- Was 15, the same as normal shotgun pellets

--Remove shotgun unlocked from by military 1
data.raw.technology["military"].effects =
{
    { type = "unlock-recipe", recipe = "submachine-gun" }
}

--Move piercing-shotgun-shell to military 2
data.raw.technology["military-2"].effects =
{
    { type = "unlock-recipe", recipe = "piercing-rounds-magazine" },
    { type = "unlock-recipe", recipe = "grenade" },
    { type = "unlock-recipe", recipe = "piercing-shotgun-shell" }, -- new
}

--Ignore military 3

--Remove piercing-shotgun-shell from military 4 and add small damage and firing speed boost
data.raw.technology["military-4"].effects =
{
    { type = "unlock-recipe", recipe = "cluster-grenade" },
    { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.2 }, -- new
    { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.2 }, -- new
}
