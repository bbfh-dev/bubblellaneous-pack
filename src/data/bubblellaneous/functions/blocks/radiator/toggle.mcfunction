setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]

scoreboard players add @s local.block.state 1
scoreboard players set @s[scores={local.block.state=2..}] local.block.state 0

execute if score @s local.block.state matches 0 run function bubblellaneous:blocks/radiator/blockstate/set_off {rotate: 0}
execute if score @s local.block.state matches 1 run function bubblellaneous:blocks/radiator/blockstate/set_on {rotate: 0}
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1 1 0
