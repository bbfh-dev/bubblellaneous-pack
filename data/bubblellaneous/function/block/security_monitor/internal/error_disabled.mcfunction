playsound minecraft:block.note_block.bass block @a[tag=--bbln.event_player,limit=1,x=0] ~ ~ ~ 0.5 1 0
tellraw @a[tag=--bbln.event_player,limit=1,x=0] {"translate":"ui.bubblellaneous.camera.disabled", "color":"red"}
