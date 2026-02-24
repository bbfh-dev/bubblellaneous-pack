scoreboard players set @s bbln.block_state 0
scoreboard players operation @s bbln.block.timer = #bear_trap.cooldown bbln.settings

execute on passengers run function bubblellaneous:block/bear_trap/player/dismount
scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=#bubblellaneous:living,type=!#bubblellaneous:bear_trap_ignore,tag=--bbln.bear_trap.trapped,predicate=bubblellaneous:check/block.id,limit=1] run function bubblellaneous:block/bear_trap/player/remove

function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
playsound block.iron_trapdoor.open block @a[distance=..16] ~ ~ ~ 0.5 1 0
function #bubblellaneous:block/bear_trap/on_release
