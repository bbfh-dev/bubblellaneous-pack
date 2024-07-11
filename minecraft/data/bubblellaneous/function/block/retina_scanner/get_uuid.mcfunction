execute if entity @p[tag=--local.event_player,nbt={Inventory: [{Slot: 103b, id: "minecraft:player_head"}]}] run function bubblellaneous:block/retina_scanner/internal/copy_uuid/from_head
execute unless entity @p[tag=--local.event_player,nbt={Inventory: [{Slot: 103b, id: "minecraft:player_head"}]}] run function bubblellaneous:block/retina_scanner/internal/copy_uuid/from_player
