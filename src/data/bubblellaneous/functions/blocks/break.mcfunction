kill @e[type=item,nbt={Age: 0s},distance=..2]
$execute as @p[gamemode=!spectator] if entity @s[gamemode=!creative] run function spawn:bubblellaneous/$(name)

scoreboard players set update_neighbors local.tmp 0
execute as @s[tag=--local.uses.blockstates] run scoreboard players set update_neighbors local.tmp 1

tag @s add --local.this
execute as @e[type=#bubblellaneous:entity,distance=..4] if score @s local.block.id = @e[type=item_display,tag=--local.this,limit=1] local.block.id run function bubblellaneous:utils/kill
kill @s

execute if score update_neighbors local.tmp matches 1 positioned ~ ~.1 ~ run function bubblellaneous:utils/block/placer/blockstates/update_neighbors with entity @s item.tag.block_data
