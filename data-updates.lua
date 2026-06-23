-- Update uranium shotgun shells 
if data.raw.recipe["uranium-shotgun-shell"]
then
    data.raw.recipe["uranium-shotgun-shell"].ingredients =
    {
        {name = "piercing-shotgun-shell", amount = 2, type = "item"}, --was 1
        {name = "uranium-238", amount = 2, type = "item"} -- was 2
    }
end

if data.raw.ammo["uranium-shotgun-shell"]
then

    data.raw.ammo["uranium-shotgun-shell"].magazine_size = 14 --was 10
    data.raw.ammo["uranium-shotgun-shell"].stack_size = 100 --was 200
    data.raw.ammo["uranium-shotgun-shell"].weight = 40*kg -- was default

    data.raw.ammo["uranium-shotgun-shell"].ammo_type.action[2].action_delivery.direction_deviation = 0.4 -- was 0.3
    data.raw.ammo["uranium-shotgun-shell"].ammo_type.action[2].action_delivery.max_range = 21 -- was 18
end

if data.raw.projectile["uranium-shotgun-pellet"]
then
    data.raw.projectile["uranium-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = 18 --was 12
    data.raw.projectile["uranium-shotgun-pellet"].piercing_damage = 150 -- new
end
