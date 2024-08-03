scoreboard players set @s local.block_state 1

tag @s add --local.this
execute summon item_display run function bubblellaneous:blocks/type_specific/shelf/internal/place_item_display
playsound block.wood.step block @a ~ ~ ~ 1 1 0
tag @s remove --local.this
