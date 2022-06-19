tellraw @a ["",{"text":"BubbleWaves","strikethrough":true,"color":"yellow"},{"text":" -> ","color":"yellow"},{"text":"Bubblellaneous","bold":true,"color":"yellow"},{"text":" migration started...","color":"yellow"}]

scoreboard players set $Temp bubblellaneous 0
execute as @e[tag=bubblewaves, tag=bw.block] at @s run function bubblellaneous:misc/migrate/block
tellraw @a ["",{"text":"["},{"text":"BULN Migration Master","color":"green"},{"text":"] "},{"score":{"name":"$Temp","objective":"bubblellaneous"}},{"text":" blocks processed."}]