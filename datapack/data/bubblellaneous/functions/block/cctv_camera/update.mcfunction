tag @s add -btemp.camera
execute as @e[type=armor_stand, tag=buln.child, tag=!-buln.vision] if score @s buln.registry = @e[tag=-btemp.camera, limit=1] buln.registry at @s run function bubblellaneous:block/cctv_camera/update/child
tag @s remove -btemp.camera