if data.raw.technology["uranium-shotgun-shell"] then
    data.raw.recipe["uranium-shotgun-shell"].ingredients =
    {
        {"piercing-shotgun-shell", 2}, --was 1
        {"uranium-238", 2}
    }
    data.raw.ammo["uranium-shotgun-shell"].magazine_size = 14 --was 10
    data.raw.projectile["uranium-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = 18 --was 12
end
