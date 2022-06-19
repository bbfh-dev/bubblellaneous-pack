tellraw @p ["\n", {"text":"┌ Bubblellaneous\n"}]
tellraw @p ["     ", {"text":"[1]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 1"}}, "  ", {"text":"[2]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 2"}}, "  ", {"text":"[3]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 3"}}]
tellraw @p ["\n     ", {"text":"[4]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 4"}}, "  ", {"text":"[5]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 5"}}, "  ", {"text":"[6]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 6"}}]
tellraw @p ["\n     ", {"text":"[7]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 7"}}, "  ", {"text":"[8]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 8"}}, "  ", {"text":"[9]", "color":"aqua", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 9"}}]
tellraw @p ["\n       ", {"text":"  ", "bold":true}, {"text":"[OK]", "color":"yellow", "clickEvent":{"action":"run_command", "value":"/trigger buln.trigger set 10"}}, "\n"]

scoreboard players operation @p buln.registry = @s buln.registry
tag @p add -buln.input.pincode_lock
scoreboard players set @p buln.data0 0

execute store result score $Gamerule bubblellaneous run gamerule sendCommandFeedback
gamerule sendCommandFeedback false
schedule function bubblellaneous:misc/gamerule_reset 60s replace