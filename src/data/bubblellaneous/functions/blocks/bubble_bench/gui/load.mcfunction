function bubblellaneous:utils/set_default {name: "@s", value: 1, objective: "local.block.page"}

execute store result score registry.max_entries local.tmp store result score registry.max_pages local.tmp store result score registry.size local.tmp run data get storage bubblellaneous bench_registry
scoreboard players operation registry.max_pages local.tmp /= 18 local.int
scoreboard players add registry.max_pages local.tmp 1

scoreboard players operation page local.tmp = @s local.block.page
scoreboard players operation page local.tmp *= 18 local.int

scoreboard players add registry.max_entries local.tmp 18
scoreboard players operation registry.max_entries local.tmp -= page local.tmp
execute if score registry.max_entries local.tmp matches 19.. run scoreboard players set registry.max_entries local.tmp 18

execute if score @s local.block.page > registry.max_pages local.tmp run scoreboard players operation @s local.block.page = registry.max_pages local.tmp
execute if score @s local.block.page matches ..0 run scoreboard players set @s local.block.page 1

#region Set placeholders
#!/repeat n=0..26 | item replace block ~ ~ ~ container.<n> with structure_void{CustomModelData: 370000, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}
#endregion

#region Menu
loot replace block ~ ~ ~ container.0 loot bubblellaneous:block/yellow_couch
item modify block ~ ~ ~ container.0 bubblellaneous:block/mark_as_gui
item replace block ~ ~ ~ container.1 with structure_void{CustomModelData: 370000, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}
item replace block ~ ~ ~ container.2 with structure_void{CustomModelData: 370001, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}

item replace block ~ ~ ~ container.9 with structure_void{CustomModelData: 370000, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}
item replace block ~ ~ ~ container.10 with structure_void{CustomModelData: 370000, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}
item replace block ~ ~ ~ container.11 with structure_void{CustomModelData: 370001, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}} 1
item modify block ~ ~ ~ container.11 bubblellaneous:block/set_page

item replace block ~ ~ ~ container.18 with structure_void{CustomModelData: 370002, display: {Name: '""'}, bubblellaneous: {is_gui: 1b, action: "previous_page"}} 1
item replace block ~ ~ ~ container.19 with structure_void{CustomModelData: 370004, display: {Name: '""'}, bubblellaneous: {is_gui: 1b, action: "next_page"}} 1
item replace block ~ ~ ~ container.20 with structure_void{CustomModelData: 370001, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}} 1
#endregion

#region Entries
scoreboard players set current_slot local.tmp 2
scoreboard players operation from local.tmp = page local.tmp
scoreboard players remove from local.tmp 19
execute if score registry.max_entries local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/gui/entry/loop
#endregion
