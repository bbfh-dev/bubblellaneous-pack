#region Detect Server core
summon marker ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.tmp"]}

execute store success score #is_bukkit bbln.tmp run data get entity @e[type=marker,tag=bbln.tmp,limit=1,x=0] "Bukkit.updateLevel"
execute store success score #is_paper bbln.tmp run data get entity @e[type=marker,tag=bbln.tmp,limit=1,x=0] "Paper.SpawnReason"
execute store success score #is_forge bbln.tmp run data get entity @s attributes[{id: "forge:entity_gravity"}]
execute store success score #is_fabric bbln.tmp run function bubblellaneous:utils/debug/server/fabric
execute store success score #is_neoforge bbln.tmp run data get entity @s attributes[{id: "neoforge:entity_gravity"}]

data modify storage bubblellaneous tmp.server set value "Vanilla"
execute if score #is_bukkit bbln.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "Bukkit"
execute if score #is_paper bbln.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "PaperMC"
execute if score #is_fabric bbln.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "Fabric"
execute if score #is_forge bbln.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "Forge"
execute if score #is_neoforge bbln.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "NeoForge"
kill @e[type=marker,tag=bbln.tmp,x=0]
#endregion

data modify storage bubblellaneous tmp.in set value {}
data modify storage bubblellaneous tmp.in.datapack_version set from storage bubblellaneous version
data modify storage bubblellaneous tmp.in.client_version set from entity @s DataVersion
data modify storage bubblellaneous tmp.in.detected_server set from storage bubblellaneous tmp.server
data modify storage bubblellaneous tmp.in.player_dimension set from entity @s Dimension

tellraw @s ["\n", "┌─── [ Bubblellaneous: ", {"text":"✉ ", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.debug"}]}, " ]"]
tellraw @s ["│"]
tellraw @s ["│ Datapack version: ", {"nbt":"version", "storage":"bubblellaneous", "color":"green"}]
tellraw @s ["│ Client version: ", {"nbt":"DataVersion", "entity":"@s", "color":"green"}]
tellraw @s ["│ Installed packs: ", {"text":"[", "color":"gold", "extra":[{"translate":"ui.bubblellaneous.menu.click_to_show"}, "]"], "click_event":{"action":"run_command", "command":"/datapack list enabled"}}]
tellraw @s ["│ Detected server: ", {"nbt":"tmp.server", "storage":"bubblellaneous", "color":"yellow"}]
tellraw @s ["│ Player dimension: ", {"nbt":"Dimension", "entity":"@s", "color":"green"}]
function bubblellaneous:utils/debug/print_copy with storage bubblellaneous tmp.in
tellraw @s ["└──────"]
