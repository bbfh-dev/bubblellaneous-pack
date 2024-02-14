kill @e[type=item,nbt={Age: 0s},distance=..2]
$execute as @p[gamemode=!spectator] if entity @s[gamemode=!creative] run function spawn:bubblellaneous/$(name)

tag @s add --local.this
execute as @e[type=#bubblellaneous:entity,distance=..4] if score @s local.block.id = @e[type=item_display,tag=--local.this,limit=1] local.block.id run function bubblellaneous:utils/kill
kill @s
