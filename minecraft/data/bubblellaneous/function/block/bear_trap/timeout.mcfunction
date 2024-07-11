scoreboard players set @s local.block_state 0
scoreboard players set @s local.block.timer 50

execute at @a[tag=--local.bear_trap.trapped] if score @s local.player.id = @p local.player.id run ride @p dismount
execute at @a[tag=--local.bear_trap.trapped] if score @s local.player.id = @p local.player.id run tag @p remove --local.bear_trap.trapped

scoreboard players reset @s local.player.id
function bubblellaneous:block/bear_trap/blockstates/apply/default {rotation: 0}
playsound block.iron_trapdoor.open block @a ~ ~ ~ 1 1 0
function #bubblellaneous:block/bear_trap/on_release
