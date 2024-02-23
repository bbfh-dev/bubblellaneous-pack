tag @s add --local.this
kill @e[type=item,nbt={Age: 0s},distance=..2]

$execute unless score fn.no_drop local.tmp matches 1 as @p[gamemode=!spectator] if entity @s[gamemode=!creative] run function spawn:bubblellaneous/$(name)
execute unless score fn.no_drop local.tmp matches 1 as @p[gamemode=!spectator] if entity @s[gamemode=!creative] as @e[type=item,nbt={Age: 0s},distance=..5,limit=1,sort=nearest] run data modify entity @s Item.tag.EntityTag.Item.tag.block_properties set from entity @e[type=item_display,tag=--local.this,limit=1] item.tag.block_properties
execute as @s[tag=--local.uses.custom_base] run setblock ~ ~ ~ air

scoreboard players set update_neighbors local.tmp 0
execute as @s[tag=--local.uses.blockstates] run scoreboard players set update_neighbors local.tmp 1

execute as @e[type=#bubblellaneous:entity,distance=..4] if score @s local.block.id = @e[type=item_display,tag=--local.this,limit=1] local.block.id run function bubblellaneous:utils/kill
kill @s

execute as @s[tag=--local.name.pipe] run function bubblellaneous:blocks/pipe/break
execute if score update_neighbors local.tmp matches 1 positioned ~ ~.1 ~ run function bubblellaneous:utils/block/placer/blockstates/update_neighbors with entity @s item.tag.block_data
$particle item item_frame{CustomModelData: $(custom_model_data)} ~ ~.75 ~ 0.25 0.25 0.25 0.1 20
