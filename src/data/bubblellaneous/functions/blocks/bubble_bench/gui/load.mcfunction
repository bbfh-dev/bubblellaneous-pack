#region Pages
function bubblellaneous:utils/set_default {name: "@s", value: 1, objective: "local.block.gui_page"}
execute if score @s local.block.gui_page matches ..0 run scoreboard players set @s local.block.gui_page 1
scoreboard players operation page.as_index local.tmp = @s local.block.gui_page
scoreboard players remove page.as_index local.tmp 1
execute store result score i local.tmp run scoreboard players operation page.as_index local.tmp *= 18 local.int
#endregion

playsound ui.button.click block @a ~ ~ ~ 1 1 0

#region Placeholders
#!/repeat n=0..26 | item replace block ~ ~ ~ container.<n> with structure_void{CustomModelData: 370000, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}
#endregion

#region Menu
# [x] [ ] [ ] ...
# [ ] [ ] [ ] ...
# [ ] [ ] [ ] ...
loot replace block ~ ~ ~ container.0 loot bubblellaneous:block/yellow_couch
item modify block ~ ~ ~ container.0 bubblellaneous:block/mark_as_icon

# [ ] [ ] [x] ...
# [ ] [ ] [ ] ...
# [ ] [ ] [ ] ...
item replace block ~ ~ ~ container.2 with structure_void{CustomModelData: 370001, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}}

# [ ] [ ] [ ] ...
# [ ] [ ] [x] ...
# [ ] [ ] [ ] ...
item replace block ~ ~ ~ container.11 with structure_void{CustomModelData: 370001, display: {Name: '""'}, bubblellaneous: {is_gui: 1b}} 1
item modify block ~ ~ ~ container.11 bubblellaneous:block/set_page

# [ ] [ ] [ ] ...
# [ ] [ ] [ ] ...
# [ ] [ ] [x] ...
item replace block ~ ~ ~ container.20 with structure_void{CustomModelData: 370006, display: {Name: '{"translate": "ui.bubblellaneous.navigation", "color": "aqua", "italic": false}', Lore: ['""', '{"translate": "ui.bubblellaneous.jump_to_list_end_or_begin", "with":["≔"], "color":"gray", "italic": false}', '{"translate": "ui.bubblellaneous.craft_maximum", "with":["≔"], "color":"gray", "italic": false}', '{"translate": "ui.bubblellaneous.craft_documentation", "with":["≔", {"keybind": "key.drop"}], "color":"gray", "italic": false}']}, bubblellaneous: {is_gui: 1b}} 1
#endregion

scoreboard players set bit.0 local.tmp 1
execute if score @s local.block.gui_page matches 1 run scoreboard players set bit.0 local.tmp 0
scoreboard players set bit.1 local.tmp 0

#region Render categories
scoreboard players set container.i local.tmp 2
execute if score @s local.block.state matches -1 run function bubblellaneous:blocks/bubble_bench/gui/load/variant/load
execute if score @s local.block.state matches 0 run function bubblellaneous:blocks/bubble_bench/gui/load/category/furniture
execute if score @s local.block.state matches 1 run function bubblellaneous:blocks/bubble_bench/gui/load/category/technology
execute if score @s local.block.state matches 2 run function bubblellaneous:blocks/bubble_bench/gui/load/category/food
execute if score @s local.block.state matches 3 run function bubblellaneous:blocks/bubble_bench/gui/load/category/miscellaneous
#endregion

#region Set navigation arrows
scoreboard players set @s local.block.predicate 0
execute if score bit.0 local.tmp matches 1 run scoreboard players add @s local.block.predicate 1
execute if score bit.1 local.tmp matches 1 run scoreboard players add @s local.block.predicate 2

execute if score @s local.block.predicate matches 0 run function bubblellaneous:blocks/bubble_bench/gui/load/ui/set_page_arrows {left: 370003, left_action: "none", right: 370005, right_action: "none"}
execute if score @s local.block.predicate matches 1 run function bubblellaneous:blocks/bubble_bench/gui/load/ui/set_page_arrows {left: 370002, left_action: "previous_page", right: 370005, right_action: "none"}
execute if score @s local.block.predicate matches 2 run function bubblellaneous:blocks/bubble_bench/gui/load/ui/set_page_arrows {left: 370003, left_action: "none", right: 370004, right_action: "next_page"}
execute if score @s local.block.predicate matches 3 run function bubblellaneous:blocks/bubble_bench/gui/load/ui/set_page_arrows {left: 370002, left_action: "previous_page", right: 370004, right_action: "next_page"}
#endregion
