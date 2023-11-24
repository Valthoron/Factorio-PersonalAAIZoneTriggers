local zone_name = "zone-logistics-enable"
local zone_localised_name = "Enable logistics"

data:extend {
    {
        type = "item-subgroup",
        name = "zone-logistics",
        group = "zones",
        order = "z",
    },
    {
        type = "virtual-signal",
        name = "zone-logistics-enable",
        icon = "__aai-zones__/graphics/icons/zone/zone-plus-green.png",
        icon_size = 32,
        subgroup = "zone-logistics",
        order = "a",
        localised_name = "Zone Enable Logistics"
    },
    {
        type = "virtual-signal",
        name = "zone-logistics-disable",
        icon = "__aai-zones__/graphics/icons/zone/zone-plus-red.png",
        icon_size = 32,
        subgroup = "zone-logistics",
        order = "b",
        localised_name = "Zone Disable Logistics"
    },
    {
        type = "simple-entity",
        name = zone_name,
        flags = { "placeable-neutral" },
        icon = "__aai-zones__/graphics/icons/zone/zone-plus-green.png",
        icon_size = 32,
        subgroup = "grass",
        order = "b[decorative]-b[zone]",
        collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        collision_mask = { "doodad-layer" },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        selectable_in_game = false,
        destructible = false,
        max_health = 10000,
        heal_per_tick = 10000,
        render_layer = "floor",
        pictures = {
            {
                filename = "__aai-zones__/graphics/entity/zone/zone-plus-green.png",
                width = 32,
                height = 32,
                offset = { 2, 4 }
            }
        },
        resistances = {
            { type = "physical",  percent = 100 },
            { type = "impact",    percent = 100 },
            { type = "poison",    percent = 100 },
            { type = "explosion", percent = 100 },
            { type = "fire",      percent = 100 },
            { type = "laser",     percent = 100 },
            { type = "acid",      percent = 100 },
            { type = "electric",  percent = 100 }
        },
        localised_name = zone_localised_name
    }
}
