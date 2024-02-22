scoreboard players set fn.no_drop local.tmp 1
function bubblellaneous:blocks/break with entity @s item.tag.block_data
scoreboard players set fn.no_drop local.tmp 0
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1 1 0
