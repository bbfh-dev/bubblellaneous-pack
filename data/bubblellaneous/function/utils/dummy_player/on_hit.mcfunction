scoreboard players operation #id_test bbln.tmp = @s bbln.player.id
execute as @a[predicate=bubblellaneous:check/player.id,limit=1] run function bubblellaneous:utils/dummy_player/player_case
tp @s ~ -1000 ~
kill @s
