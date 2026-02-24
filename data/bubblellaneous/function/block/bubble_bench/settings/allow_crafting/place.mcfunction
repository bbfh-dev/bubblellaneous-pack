execute positioned ~ ~-1 ~ run function place:bubblellaneous/bubble_bench
execute if items entity @s contents *[count=1] run return run kill @s
item modify entity @s contents bubblellaneous:blocks/container/remove_item