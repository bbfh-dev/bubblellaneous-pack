#region Detect Server core
summon marker ~ ~ ~ {Tags: ["+bubblellaneous", "local.tmp"]}

execute store success score is_bukkit local.tmp run data get entity @e[type=marker,tag=local.tmp,limit=1] "Bukkit.updateLevel"
execute store success score is_paper local.tmp run data get entity @e[type=marker,tag=local.tmp,limit=1] "Paper.SpawnReason"
execute store success score is_forge local.tmp run data get entity @s Attributes[{Name: "forge:entity_gravity"}]
execute store success score is_fabric local.tmp run data get entity @e[type=marker,tag=local.tmp,limit=1] "fabric:attachments"

data modify storage bubblellaneous tmp.server set value "Vanilla"
execute if score is_bukkit local.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "Bukkit"
execute if score is_paper local.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "PaperMC (Not supported)"
execute if score is_fabric local.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "Fabric"
execute if score is_forge local.tmp matches 1 run data modify storage bubblellaneous tmp.server set value "Forge"
kill @e[type=marker,tag=local.tmp]
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
tellraw @s ["│ Installed packs: ", {"text":"[", "color":"gold", "extra":[{"translate":"ui.bubblellaneous.menu.click_to_show"}, "]"], "clickEvent":{"action":"run_command", "value":"/datapack list enabled"}}]
tellraw @s ["│ Detected server: ", {"nbt":"tmp.server", "storage":"bubblellaneous", "color":"yellow"}]
tellraw @s ["│ Player dimension: ", {"nbt":"Dimension", "entity":"@s", "color":"green"}]
function bubblellaneous:utils/debug/print_copy with storage bubblellaneous tmp.in
tellraw @s ["└──────"]
