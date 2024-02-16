execute store success score is_gui local.tmp run data get entity @s Item.tag.bubblellaneous.is_gui
execute if score is_gui local.tmp matches 0 run return 0

scoreboard players set modifier.drop local.tmp 1
function bubblellaneous:player/gui/action/click

kill @s
