summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.tmp"], item: {id: "stone", count: 1b}}
item replace entity @e[type=item_display,tag=local.tmp,limit=1] contents from entity @p[tag=--local.event_player] weapon.mainhand

#region Body
$data modify entity @e[type=item_display,tag=local.tmp,limit=1] item.components."minecraft:entity_data".Item.components.minecraft:custom_data.bubblellaneous.block_properties.camera set value {id: $(camera_id), name: "$(name)", location: {dimension: "$(dimension)", x: $(pos_x), y: $(pos_y), z: $(pos_z)}}
#endregion

item replace entity @p[tag=--local.event_player] weapon.mainhand from entity @e[type=item_display,tag=local.tmp,limit=1] contents
kill @e[type=item_display,tag=local.tmp,limit=1]
