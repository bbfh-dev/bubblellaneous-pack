execute store result score $Temp bubblellaneous run data get entity @s Pose.Head[1]
execute if score $Temp bubblellaneous matches -90 at @s run setblock ~ ~ ~ warped_door[facing=west, half=lower, hinge=left]
execute if score $Temp bubblellaneous matches -90 at @s run setblock ~ ~1 ~ warped_door[facing=west, half=upper, hinge=left]

execute if score $Temp bubblellaneous matches 0 at @s run setblock ~ ~ ~ warped_door[facing=north, half=lower, hinge=left]
execute if score $Temp bubblellaneous matches 0 at @s run setblock ~ ~1 ~ warped_door[facing=north, half=upper, hinge=left]

execute if score $Temp bubblellaneous matches 90 at @s run setblock ~ ~ ~ warped_door[facing=east, half=lower, hinge=left]
execute if score $Temp bubblellaneous matches 90 at @s run setblock ~ ~1 ~ warped_door[facing=east, half=upper, hinge=left]

execute if score $Temp bubblellaneous matches 180 at @s run setblock ~ ~ ~ warped_door[facing=south, half=lower, hinge=left]
execute if score $Temp bubblellaneous matches 180 at @s run setblock ~ ~1 ~ warped_door[facing=south, half=upper, hinge=left]