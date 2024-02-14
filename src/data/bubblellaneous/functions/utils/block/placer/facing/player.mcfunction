tp @s ~ ~ ~ ~ 0
execute store result score rotation local.tmp run data get entity @s Rotation[0]

execute if score rotation local.tmp matches 135.. run return 180
execute if score rotation local.tmp matches ..-135 run return 180
execute if score rotation local.tmp matches 45.. if score rotation local.tmp matches ..135 run return 90
execute if score rotation local.tmp matches -45.. if score rotation local.tmp matches ..45 run return 0
execute if score rotation local.tmp matches -135.. run return -90
execute if score rotation local.tmp matches ..-45 run return -90
