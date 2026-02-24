scoreboard players reset @s bbln.player.drop


tag @s add --bbln.player
execute as @e[type=item,distance=..5] if items entity @s contents *[minecraft:custom_data~{bubblellaneous: {is_gui: 1b}}] if data entity @s {Age: 0s} if function bubblellaneous:player/event/check_origin/main run tag @s add --bbln.cached
execute as @e[type=item,distance=..5,tag=--bbln.cached,limit=1] run function bubblellaneous:player/event/item/drop/gui_action
tag @e[type=item,distance=..5,tag=--bbln.cached] remove --bbln.cached
tag @s remove --bbln.player
