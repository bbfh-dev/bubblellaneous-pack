scoreboard players set @e[type=item_display,tag=--local.this] local.block_state 0
tag @p[tag=--local.player] remove --bbln.telescope.using

data modify storage bubblellaneous tmp.entry set value {}
$data modify storage bubblellaneous tmp.entry set from storage bubblellaneous stack.saved_players[{uuid: $(UUID)}]
$data remove storage bubblellaneous stack.saved_players[{uuid: $(UUID)}]

execute if data storage bubblellaneous tmp.entry{gamemode: 0} run gamemode survival @p[tag=--local.player]
execute if data storage bubblellaneous tmp.entry{gamemode: 1} run gamemode creative @p[tag=--local.player]
execute if data storage bubblellaneous tmp.entry{gamemode: 2} run gamemode adventure @p[tag=--local.player]
execute if data storage bubblellaneous tmp.entry{gamemode: 3} run gamemode spectator @p[tag=--local.player]

execute as @e[tag=local.dummy_player] if score @s local.player.id = @p[tag=--local.player] local.player.id at @s run function bubblellaneous:block/telescope/exit_to_dummy

execute at @s run forceload remove ~ ~
