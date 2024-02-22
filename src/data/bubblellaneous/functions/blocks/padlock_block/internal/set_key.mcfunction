scoreboard players set @s local.block.state 1
execute store result score model local.tmp run data get entity @s item.tag.block_data.custom_model_data
execute store result score material_count local.tmp run data get entity @s item.tag.block_data.material_count
execute store result score index local.tmp run data get entity @p[tag=--local.player] SelectedItem.tag.item_data.params.key.index

execute if block ~ ~ ~ #doors[hinge=left] run scoreboard players operation index local.tmp += material_count local.tmp

execute store result entity @s item.tag.CustomModelData int 1 run scoreboard players operation model local.tmp += index local.tmp
data modify entity @s item.tag.block_data.key_color set from entity @p[tag=--local.player] SelectedItem.tag.item_data.params.key.name
playsound block.chest.locked block @a ~ ~ ~ 1 1 0
