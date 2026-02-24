execute if entity @e[type=item_display,tag=--bbln.this,tag=--bbln.triggered,limit=1,x=0] run return fail

data modify storage bubblellaneous tmp.compare set value {}
data modify storage bubblellaneous tmp.compare set from entity @e[type=item_display,tag=--bbln.this,limit=1,x=0] item.components."minecraft:custom_data".bubblellaneous.block_properties.owner
execute store success score #success bbln.tmp run data modify storage bubblellaneous tmp.compare set from entity @s UUID
execute if score #success bbln.tmp matches 0 run return 0

scoreboard players set #limit bbln.tmp 24
scoreboard players set #has_obsticle bbln.tmp 0
execute positioned as @s facing entity @e[type=item_display,tag=--bbln.this,limit=1,x=0] feet run function bubblellaneous:block/motion_sensor/internal/raycast
execute if score #has_obsticle bbln.tmp matches 1 run return 0

tag @e[type=item_display,tag=--bbln.this,tag=!--bbln.triggered,limit=1,x=0] add --bbln.triggered
