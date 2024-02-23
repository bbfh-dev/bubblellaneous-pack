scoreboard players add @s local.block.state 1
scoreboard players set @s[scores={local.block.state=2..}] local.block.state 0

function bubblellaneous:blocks/curtains/toggle
playsound entity.horse.armor block @a ~ ~ ~ 0.5 1.5 0
