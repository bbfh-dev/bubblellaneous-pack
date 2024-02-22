$tp @s ~ ~ ~ $(rotation) 0

execute if entity @s[tag=--local.uses.all_dimensions] if score @s local.block.facing matches 0 at @s run function bubblellaneous:utils/block/rotate/downwards
execute if entity @s[tag=--local.uses.all_dimensions] if score @s local.block.facing matches 1 at @s run function bubblellaneous:utils/block/rotate/upwards
