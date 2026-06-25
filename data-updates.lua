--Verify that uranium shotgun shells are available from the mod https://mods.factorio.com/mod/UraniumShotgunShell
local uranium_shotgun_shell = data.raw.recipe["uranium-shotgun-shell"] ~= nil
    and data.raw.ammo["uranium-shotgun-shell"] ~= nil
    and data.raw.projectile["uranium-shotgun-pellet"] ~= nil

--Verify that tungsten shotgun shells are available from the mod https://mods.factorio.com/mod/tungsten-shells
local tungsten_shotgun_shell = data.raw.recipe["tungsten-shotgun-shell"] ~= nil
    and data.raw.ammo["tungsten-shotgun-shell"] ~= nil
    and data.raw.projectile["tungsten-shotgun-pellet"] ~= nil

-- Update uranium shotgun shells 
if uranium_shotgun_shell
then
    data.raw.recipe["uranium-shotgun-shell"].ingredients =
    {
        {name = "piercing-shotgun-shell", amount = 2, type = "item"}, --was 1
        {name = "uranium-238", amount = 2, type = "item"} -- was 2
    }

    data.raw.ammo["uranium-shotgun-shell"].magazine_size = 14 --was 10
    data.raw.ammo["uranium-shotgun-shell"].stack_size = 100 --was 200
    data.raw.ammo["uranium-shotgun-shell"].weight = 40*kg -- was default

    --data.raw.ammo["uranium-shotgun-shell"].ammo_type.action[2].action_delivery.direction_deviation = 0.4 -- was 0.3

    --data.raw.projectile["uranium-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = 18 --was 12
    data.raw.projectile["uranium-shotgun-pellet"].piercing_damage = 150 -- new
end

-- Update tungsten shotgun shells 
if tungsten_shotgun_shell
then
    data.raw.recipe["tungsten-shotgun-shell"].ingredients =
    {
        {type = "item", name = "piercing-shotgun-shell", amount = 2}, -- was 1
        {type = "item", name = "tungsten-plate", amount = 2},
        {type = "item", name = "explosives", amount = 1}
    }

    data.raw.ammo["tungsten-shotgun-shell"].magazine_size = 14 --was 10
    data.raw.ammo["tungsten-shotgun-shell"].stack_size = 100 --was 200
    data.raw.ammo["tungsten-shotgun-shell"].weight = 40*kg -- was default


    --data.raw.projectile["tungsten-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = 18 --was 12
    data.raw.projectile["tungsten-shotgun-pellet"].piercing_damage = 150 -- was 12

    data.raw.ammo["tungsten-shotgun-shell"].order = "b[shotgun]-d[tungsten]" -- was "b[shotgun]-c[tungsten]"
end

-- Both tungsten and uranium shotgun shells are available
if tungsten_shotgun_shell and uranium_shotgun_shell
then
    data.raw.recipe["tungsten-shotgun-shell"].ingredients =
    {
        {type = "item", name = "uranium-shotgun-shell", amount = 2}, -- was 1
        {type = "item", name = "tungsten-plate", amount = 2},
        {type = "item", name = "explosives", amount = 1}
    }

    data.raw.ammo["tungsten-shotgun-shell"].magazine_size = 20 --was 14
    data.raw.ammo["tungsten-shotgun-shell"].weight = 80*kg -- was 40kg
    data.raw.ammo["tungsten-shotgun-shell"].ammo_type.action[2].repeat_count = 30 -- was 20
    --data.raw.projectile["tungsten-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = 24 --was 18
end
