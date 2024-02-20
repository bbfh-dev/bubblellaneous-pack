execute as @e[type=armor_stand,tag=local.keystrokes] if score @s local.player.id = @p[tag=--local.player] local.player.id at @s run function bubblellaneous:blocks/ladder/climb/down
execute unless score @s local.player.sound matches 1.. run scoreboard players set @s local.player.sound 10
