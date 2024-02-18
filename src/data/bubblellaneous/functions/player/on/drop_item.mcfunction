scoreboard players reset @s local.on_drop
tag @s add --local.player
execute as @e[type=item,nbt={Age: 0s},limit=1,sort=nearest] run function bubblellaneous:player/on/_drop_item/action
tag @s remove --local.player
