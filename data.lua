--Enable shotgun without tech
data.raw.recipe["shotgun"].enabled = true
data.raw.recipe["shotgun-shell"].enabled = true

--Decrease magazine size of shotgun shells 
data.raw.ammo["shotgun-shell"].magazine_size = 6

--Decrease movement_slow_down_factor for shotguns - removed in 2.1 so wube agreed
--data.raw.gun["shotgun"].attack_parameters.movement_slow_down_factor = 0.4 --was 0.6
--data.raw.gun["shotgun"].attack_parameters.movement_slow_down_cooldown = 30 -- was default 60 ticks 
--data.raw.gun["combat-shotgun"].attack_parameters.movement_slow_down_factor = 0.4 --was 0.5

data.raw.projectile["piercing-shotgun-pellet"].piercing_damage = 50 -- new

--error(serpent.block(data.raw.technology["military"].effects))

local function remove_tech_effect(at, what)
    for id, effect in pairs(data.raw.technology[at].effects) do
        if effect.recipe == what then
            table.remove( data.raw.technology[at].effects, id )
        end
    end
end

--Remove shotgun unlocked from by military 1
remove_tech_effect("military", "shotgun")
remove_tech_effect("military", "shotgun-shell")

--Move piercing-shotgun-shell to military 2
table.insert(data.raw.technology["military-2"].effects, { type = "unlock-recipe", recipe = "piercing-shotgun-shell" })
remove_tech_effect("military-3", "piercing-shotgun-shell")

--Move combat shotgun to military 3
table.insert(data.raw.technology["military-3"].effects, { type = "unlock-recipe", recipe = "combat-shotgun" })
remove_tech_effect("military-4", "combat-shotgun")

--Add bonus damage and shooting speed to shotguns with military 4
table.insert(data.raw.technology["military-4"].effects, { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.2 })
table.insert(data.raw.technology["military-4"].effects, { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.2 })
