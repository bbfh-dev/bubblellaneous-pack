summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.tmp"], item: {id: "stone", count: 1b}}
item replace entity @e[type=item_display,tag=local.tmp,limit=1] container.0 from entity @p[tag=--local.event_player] weapon.mainhand

#region Body
$data modify entity @e[type=item_display,tag=local.tmp,limit=1] item.tag.EntityTag.Item.tag.bubblellaneous.block_properties.camera set value {id: $(camera_id), name: '$(name)', location: {dimension: "$(dimension)", x: $(pos_x), y: $(pos_y), z: $(pos_z)}}
#endregion

item replace entity @p[tag=--local.event_player] weapon.mainhand from entity @e[type=item_display,tag=local.tmp,limit=1] container.0
kill @e[type=item_display,tag=local.tmp,limit=1]
