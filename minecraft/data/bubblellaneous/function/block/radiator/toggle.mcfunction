setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]

scoreboard players add @s local.block.timer 1
scoreboard players add @s local.block_state 1
scoreboard players set @s[scores={local.block_state=2..}] local.block_state 0

execute if score @s local.block_state matches 0 run function bubblellaneous:block/radiator/blockstates/apply/off {rotation: 0}
execute if score @s local.block_state matches 1 run function bubblellaneous:block/radiator/blockstates/apply/on {rotation: 0}
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1 1 0
