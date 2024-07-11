function bubblellaneous:block/retina_scanner/blockstates/apply/open {rotation: 0}
setblock ~ ~ ~ redstone_block
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1 1 0

scoreboard players set @s local.block.timer 30
