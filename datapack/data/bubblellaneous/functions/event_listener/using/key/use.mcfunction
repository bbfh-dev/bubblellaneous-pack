advancement revoke @s only bubblellaneous:event/using/key/blue
advancement revoke @s only bubblellaneous:event/using/key/green
advancement revoke @s only bubblellaneous:event/using/key/red
advancement revoke @s only bubblellaneous:event/using/key/yellow
scoreboard players reset @s buln.using_item
tag @s add -buln.player

scoreboard players set $Boolean bubblellaneous 0
execute anchored eyes align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 anchored eyes positioned ^ ^ ^1 align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 anchored eyes positioned ^ ^ ^2 align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 anchored eyes positioned ^ ^ ^3 align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 anchored eyes positioned ^ ^ ^1 align xyz positioned ~.5 ~-.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 anchored eyes positioned ^ ^ ^2 align xyz positioned ~.5 ~-.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 anchored eyes positioned ^ ^ ^3 align xyz positioned ~.5 ~-.5 ~.5 if entity @e[type=armor_stand, tag=buln.padlock_door, distance=..1] as @e[type=armor_stand, tag=buln.padlock_door, distance=..1] at @p[tag=-buln.player] run function bubblellaneous:event_listener/using/key/instance
execute if score $Boolean bubblellaneous matches 0 run title @p actionbar {"translate":"msg.bubblellaneous.key"}
tag @s remove -buln.player