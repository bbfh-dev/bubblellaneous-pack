advancement revoke @s only bubblellaneous:event/using/padlock
scoreboard players reset @s buln.using_item

scoreboard players set $Temp bubblellaneous 0
execute anchored eyes if block ~ ~ ~ #doors run function bubblellaneous:event_listener/using/padlock/init
execute if score $Temp bubblellaneous matches 0 anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #doors run function bubblellaneous:event_listener/using/padlock/init
execute if score $Temp bubblellaneous matches 0 anchored eyes positioned ^ ^ ^2 if block ~ ~ ~ #doors run function bubblellaneous:event_listener/using/padlock/init
execute if score $Temp bubblellaneous matches 0 anchored eyes positioned ^ ^ ^3 if block ~ ~ ~ #doors run function bubblellaneous:event_listener/using/padlock/init
execute if score $Temp bubblellaneous matches 0 run title @p actionbar {"translate":"msg.bubblellaneous.put_on_door", "with":[{"keybind":"key.sneak"}]}