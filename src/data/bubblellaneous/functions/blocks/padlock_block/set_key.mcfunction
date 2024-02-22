execute store success score has_key local.tmp run data get entity @p[tag=--local.player] SelectedItem.tag.item_data.params.key
execute if score has_key local.tmp matches 0 run playsound block.wooden_door.close block @a ~ ~ ~ 1 1 0
execute if score has_key local.tmp matches 1 run function bubblellaneous:blocks/padlock_block/internal/set_key
