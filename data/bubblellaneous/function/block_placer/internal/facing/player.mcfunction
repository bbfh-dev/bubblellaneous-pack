rotate @s ~ 0
execute if entity @s[y_rotation=-45..45] run return 0
execute if entity @s[y_rotation=45..135] run return 90
execute if entity @s[y_rotation=135..-135] run return 180
return -90
