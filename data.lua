--Enable shotgun without tech
data.raw.recipe["shotgun"].enabled = true
data.raw.recipe["shotgun-shell"].enabled = true

--Decrease magazine size of shotgun shells 
data.raw.ammo["shotgun-shell"].magazine_size = 8

data.raw.character.character.running_speed = -0.01
--Decrease movement_slow_down_factor for shotguns
data.raw.gun["pistol"].attack_parameters.movement_slow_down_factor = -50 --was 0.6
data.raw.gun["shotgun"].attack_parameters.movement_slow_down_factor = 0.5 --was 0.6
data.raw.gun["combat-shotgun"].attack_parameters.movement_slow_down_factor = 0.3 --was 0.5

--Remove shotgun from unlocked by military 1
data.raw.technology["military"].effects =
{
    {
        type = "unlock-recipe",
        recipe = "submachine-gun"
    }
}

--Move piercing-shotgun-shell to military 2
data.raw.technology["military-2"].effects =
{
    {
        type = "unlock-recipe",
        recipe = "piercing-rounds-magazine"
    },
    {
        type = "unlock-recipe",
        recipe = "piercing-shotgun-shell"
    },
    {
        type = "unlock-recipe",
        recipe = "grenade"
    }
}

--Ignore military 3

--Remove piercing-shotgun-shell to military 4 and add small damage and firing speed to military 3
data.raw.technology["military-4"].effects =
{
    {
        type = "unlock-recipe",
        recipe = "cluster-grenade"
    },
    {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.1
    },
    {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.1
    }
}
