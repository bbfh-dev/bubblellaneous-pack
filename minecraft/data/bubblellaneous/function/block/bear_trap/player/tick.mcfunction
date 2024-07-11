tag @s add --local.this
execute as @e[type=item_display,tag=local.name.bear_trap,sort=nearest] if score @s local.player.id = @p[tag=--local.this] local.player.id run ride @p[tag=--local.this] mount @s
tag @s remove --local.this
