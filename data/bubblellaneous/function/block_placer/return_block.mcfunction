scoreboard players set #did_cancel bbln.tmp 1
playsound ui.stonecutter.take_result block @a[distance=..16] ~ ~ ~ 0.5 1 0
#execute align xyz run particle crit ~0.5 ~0.5 ~0.5 0.2 0.2 0.2 0.05 10 normal @a

execute if entity @a[tag=--bbln.event_player,limit=1,x=0,gamemode=creative] run return fail

$function spawn:bubblellaneous/$(id)
data modify entity @e[type=item,tag=!--bbln.item,nbt={Age: 0s},distance=..0.01,limit=1] Item.components."minecraft:entity_data".Item.components."minecraft:custom_data".bubblellaneous.block_properties set from storage bubblellaneous tmp.in.block_properties
execute if data storage bubblellaneous tmp.in.block_properties.items[0] run function bubblellaneous:block_placer/internal/items_to_container
