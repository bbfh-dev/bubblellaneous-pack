scoreboard players remove @s local.block.timer 1
execute if score @s local.block.timer matches 1.. run return 0

execute unless score @s local.block.state matches 1 run function bubblellaneous:blocks/security_camera/lens/spin_right
execute if score @s local.block.state matches 1 run function bubblellaneous:blocks/security_camera/lens/spin_left
