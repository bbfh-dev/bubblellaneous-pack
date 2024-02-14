tag @s add --local.tmp
execute positioned ~.5 ~ ~.5 summon item_frame run function bubblellaneous:utils/block/copy_nbt with entity @e[type=item,tag=--local.tmp,limit=1] Item.tag
kill @s
