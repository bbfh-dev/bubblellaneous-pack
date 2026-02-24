tag @s add --bbln.event_player
execute store result score #gametime bbln.tmp run time query gametime
$execute as @e[type=$(type),tag=bbln.$(tag),distance=..32] if function bubblellaneous:player/event/get_hurted/check if function bubblellaneous:player/event/get_hurted/time run function bubblellaneous:player/event/get_hurted/found
