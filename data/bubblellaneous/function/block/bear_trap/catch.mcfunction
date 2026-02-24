tag @s[type=!#bubblellaneous:bear_trap_ignore] add --bbln.bear_trap.trapped
ride @s[type=!#bubblellaneous:bear_trap_ignore] mount @e[type=item_display,tag=--bbln.this,limit=1,x=0]

scoreboard players operation @e[type=item_display,tag=--bbln.this,limit=1,x=0] bbln.block.timer = #bear_trap.cooldown bbln.settings
scoreboard players set @e[type=item_display,tag=--bbln.this,limit=1,x=0] bbln.block_state 1
scoreboard players operation @s[type=!#bubblellaneous:bear_trap_ignore] bbln.block.id = @e[type=item_display,tag=--bbln.this,limit=1,x=0] bbln.block.id
execute as @e[type=item_display,tag=--bbln.this,limit=1,x=0] run function bubblellaneous:block_placer/internal/apply_blockstate {name: "closed", rotation: 0}
playsound bubblellaneous:block.bear_trap.close block @a ~ ~ ~ 1 1 0
function #bubblellaneous:block/bear_trap/on_catch
