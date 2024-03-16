function bubblellaneous:block/surveillance_camera/player/leave

playsound minecraft:block.note_block.bass block @s ~ ~ ~ 1 1 0
tellraw @s {"translate":"ui.bubblellaneous.camera.not_found", "color":"red"}
