function bubblellaneous:block/surveillance_camera/link/leave

function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 1}

execute at @s run playsound minecraft:block.note_block.bass block @s ~ ~ ~ 0.5 1 0
tellraw @s {"translate":"ui.bubblellaneous.camera.not_found", "color":"red"}
