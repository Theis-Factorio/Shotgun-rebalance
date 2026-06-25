--Decrease magazine size of shotgun shells 
data.raw.ammo["shotgun-shell"].magazine_size = 6 -- was 10

-- Add piercing to piercing shotgun shells
data.raw.projectile["piercing-shotgun-pellet"].piercing_damage = 50 -- new

local function remove_tech_effect(at, what)
    for id, effect in pairs(data.raw.technology[at].effects) do
        if effect.recipe == what then
            table.remove( data.raw.technology[at].effects, id )
        end
    end
end

--Enable shotgun without tech
data.raw.recipe["shotgun"].enabled = true
data.raw.recipe["shotgun-shell"].enabled = true

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
