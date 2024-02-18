scoreboard players set @s local.block.state 1

tag @s add --local.this
execute summon item_display run function bubblellaneous:blocks/type_specific/shelf/put_item_display
tag @s remove --local.this
