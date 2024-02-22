execute store result score facing local.tmp run data get entity @s Facing
schedule function bubblellaneous:utils/block/placer/clean_up 1t replace
execute as @s[tag=--local.size.single] run function bubblellaneous:utils/block/placer/check/single
kill @s
