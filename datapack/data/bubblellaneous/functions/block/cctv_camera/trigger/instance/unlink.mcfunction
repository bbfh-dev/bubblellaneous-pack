execute store result score $Player1 bubblellaneous run data get entity @s UUID[0]
execute store result score $Player2 bubblellaneous run data get entity @s UUID[1]
execute store result score $Player3 bubblellaneous run data get entity @s UUID[2]
execute store result score $Player4 bubblellaneous run data get entity @s UUID[3]
scoreboard players set $Temp bubblellaneous 0
scoreboard players operation $Value bubblellaneous = @p buln.trigger
scoreboard players remove $Value bubblellaneous 100
execute as @e[type=armor_stand, tag=-buln.update.cctv_camera] run function bubblellaneous:block/cctv_camera/trigger/instance/unlink_camera
function bubblellaneous:event_listener/using/camera_terminal