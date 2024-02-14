execute store result score facing local.tmp run data get entity @s Facing
execute as @s[tag=--local.size.single] run function bubblellaneous:utils/block/placer/check/single
kill @s
