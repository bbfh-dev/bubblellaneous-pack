advancement revoke @s only bubblellaneous:player/event/world/join

execute unless score @s bbln.player.id = @s bbln.player.id store result score @s bbln.player.id run scoreboard players add player bbln.player.id 1
