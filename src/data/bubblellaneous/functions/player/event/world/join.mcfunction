advancement revoke @s only bubblellaneous:player/event/world/join

execute unless score @s local.player.id matches -2147483648..2147483647 store result score @s local.player.id run scoreboard players add player local.player.id 1
