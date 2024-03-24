tag @s add --local.bear_trap.trapped
ride @e[type=item_display,tag=--local.this,limit=1] mount @s

scoreboard players set @e[type=item_display,tag=--local.this,limit=1] local.block_state 1
scoreboard players operation @e[type=item_display,tag=--local.this,limit=1] local.player.id = @s local.player.id
execute as @e[type=item_display,tag=--local.this,limit=1] run function bubblellaneous:block/bear_trap/blockstates/apply/closed {rotation: 0}
scoreboard players operation @e[type=item_display,tag=--local.this,limit=1] local.block.timer = bear_trap.time local.settings
playsound bubblellaneous:block.bear_trap.close block @a ~ ~ ~ 1 1 0
