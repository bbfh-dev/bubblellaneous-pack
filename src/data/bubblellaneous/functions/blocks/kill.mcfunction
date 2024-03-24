scoreboard players operation this local.tmp = @s local.block.id
execute as @e[type=#bubblellaneous:entity,distance=..3] if score @s local.block.id = this local.tmp run kill @s
