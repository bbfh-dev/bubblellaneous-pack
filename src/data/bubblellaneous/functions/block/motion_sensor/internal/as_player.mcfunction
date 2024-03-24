scoreboard players operation y local.tmp = @s local.player.pos_y
scoreboard players operation y local.tmp -= @e[type=item_display,tag=--local.this,limit=1] local.player.pos_y
execute unless score y local.tmp matches -1..1 run return 0

data modify storage bubblellaneous tmp.compare set value {}
data modify storage bubblellaneous tmp.compare set from entity @e[type=item_display,tag=--local.this,limit=1] item.tag.bubblellaneous.block_properties.owner
execute store success score success local.tmp run data modify storage bubblellaneous tmp.compare set from entity @s UUID
execute if score success local.tmp matches 0 run return 0

scoreboard players set limit local.tmp 24
scoreboard players set has_obsticle local.tmp 0
execute at @s facing entity @e[type=item_display,tag=--local.this,limit=1] feet run function bubblellaneous:block/motion_sensor/internal/raycast
execute if score has_obsticle local.tmp matches 1 run return 0

execute as @e[type=item_display,tag=--local.this,limit=1] at @s run function bubblellaneous:block/motion_sensor/trigger
