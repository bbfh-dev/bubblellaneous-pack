execute at @p[tag=--local.event_player] rotated as @s run tp @p[tag=--local.event_player] ~ ~ ~ ~ ~
ride @p[tag=--local.event_player] mount @e[type=interaction,tag=--local.target_entity,limit=1]
$playsound bubblellaneous:block.$(sound).sit block @a ~ ~ ~ 1 1 0
