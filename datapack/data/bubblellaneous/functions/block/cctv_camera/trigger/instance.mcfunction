execute if score @s buln.trigger matches 1001 run function bubblellaneous:block/cctv_camera/trigger/instance/register
execute if score @s buln.trigger matches 1002 run function bubblellaneous:event_listener/using/camera_terminal
execute if score @s buln.trigger matches 1..12 run function bubblellaneous:block/cctv_camera/trigger/instance/watch
execute if score @s buln.trigger matches 101..112 run function bubblellaneous:block/cctv_camera/trigger/instance/unlink
playsound minecraft:ui.button.click master @a ~ ~ ~
playsound bubblellaneous:block.industrial.hit master @a ~ ~ ~