$playsound bubblellaneous:$(sound).place block @a ~ ~ ~ 1 1 0
$setblock ~ ~ ~ $(base)
$execute if block ~ ~ ~ #bubblellaneous:container run data modify block ~ ~ ~ CustomName set value '$(display_name)'

tag @s add --local.this
execute summon item_display run function bubblellaneous:utils/block/placer/place/generic with entity @e[type=item_frame,tag=--local.this,limit=1] Item.tag.block_data
