function bubblellaneous:utils/function/set_silent
tag @s add --local.delaying_connection
gamemode adventure @s
effect give @s resistance infinite 50 true
effect give @s fire_resistance infinite 50 true
effect give @s slow_falling infinite 50 true

schedule function bubblellaneous:player/cameras/connect_all 5t replace
