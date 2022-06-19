advancement revoke @s only bubblellaneous:event/tick
tag @e[type=minecraft:armor_stand, tag=buln.block, distance=..24] add buln.in_bubble
scoreboard players enable @s buln.trigger

execute if score @s buln.trigger matches 1.. run function bubblellaneous:player/trigger
execute as @s[tag=-buln.holding_speed_mining, nbt=!{SelectedItem:{tag:{Tags:["-buln.speed_mining"]}}}] run function bubblellaneous:event_listener/tick/holding_speed_mining_undo
execute if entity @s[nbt={SelectedItem:{tag:{Tags:["-buln.speed_mining"]}}}] run function bubblellaneous:event_listener/tick/holding_speed_mining


#  Bubble Bench crafting
execute if entity @e[type=minecraft:item, distance=..2, nbt={Item:{id:"minecraft:glass_bottle"}}] at @e[type=minecraft:item, distance=..2, nbt={Item:{id:"minecraft:glass_bottle"}}] if block ~ ~-1 ~ minecraft:crafting_table run function bubblellaneous:block/bubble_bench/craft

#! v1.2a Make sure player isn't holding carrot on a stick while sitting
execute if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run function bubblellaneous:player/v1.2a/player_holding_stick
execute if entity @s[nbt={Inventory:[{Slot:-106b, id:"minecraft:carrot_on_a_stick"}]}] run function bubblellaneous:player/v1.2a/player_holding_stick