function bubblellaneous:block/retina_scanner/blockstates/apply/error {rotation: 0}
setblock ~ ~ ~ barrel[facing=up]
playsound minecraft:block.note_block.bass block @a ~ ~ ~ 1 1 0

scoreboard players set @s local.block.timer 30
