execute unless score @s local.gui.page matches 1..2147483647 run scoreboard players set @s local.gui.page 1
playsound ui.button.click block @p ~ ~ ~ 1 1 0

#region Pages
scoreboard players operation page.as_index local.tmp = @s local.gui.page
scoreboard players remove page.as_index local.tmp 1
execute store result score i local.tmp run scoreboard players operation page.as_index local.tmp *= 18 local.int
#endregion

#region Set empty slots
item replace block ~ ~ ~ container.0 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.1 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.2 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.3 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.4 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.5 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.6 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.7 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.8 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.9 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.10 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.11 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.12 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.13 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.14 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.15 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.16 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.17 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.18 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.19 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.20 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.21 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.22 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.23 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.24 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.25 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
item replace block ~ ~ ~ container.26 with structure_void[minecraft:item_model="bubblellaneous:ui_air", minecraft:tooltip_display={hide_tooltip: true}, minecraft:custom_data={bubblellaneous:{is_gui: 1b}}]
#endregion

#region Render category list
loot replace block ~ ~ ~ container.0 loot bubblellaneous:block/red_couch
item modify block ~ ~ ~ container.0 bubblellaneous:bubble_bench/set_furniture

loot replace block ~ ~ ~ container.1 loot bubblellaneous:block/iron_ladder
item modify block ~ ~ ~ container.1 bubblellaneous:bubble_bench/set_technology

loot replace block ~ ~ ~ container.9 loot bubblellaneous:item/cheese
item modify block ~ ~ ~ container.9 bubblellaneous:bubble_bench/set_food

loot replace block ~ ~ ~ container.10 loot bubblellaneous:block/traffic_barrier
item modify block ~ ~ ~ container.10 bubblellaneous:bubble_bench/set_miscellaneous

# execute if data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties{category: "furniture"} run item modify block ~ ~ ~ container.0 bubblellaneous:bubble_bench/set_selected
# execute if data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties{category: "technology"} run item modify block ~ ~ ~ container.1 bubblellaneous:bubble_bench/set_selected
# execute if data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties{category: "food"} run item modify block ~ ~ ~ container.9 bubblellaneous:bubble_bench/set_selected
# execute if data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties{category: "miscellaneous"} run item modify block ~ ~ ~ container.10 bubblellaneous:bubble_bench/set_selected
#endregion

scoreboard players set gui.last_page local.tmp 1

#region Render main view
scoreboard players set container.i local.tmp 2
scoreboard players set container.i local.tmp 2

execute unless data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category run data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category set value "furniture"
execute if score @s local.block_state matches 0 run function bubblellaneous:block/bubble_bench/render_category
execute if score @s local.block_state matches 1 run function bubblellaneous:block/bubble_bench/render_variant
execute if score i local.tmp < size local.tmp run scoreboard players set gui.last_page local.tmp 0
#endregion

#region Controls
execute if score @s local.block_state matches 0 run item replace block ~ ~ ~ container.2 with structure_void[minecraft:item_model="bubblellaneous:ui_slot", minecraft:item_name="", minecraft:custom_data={bubblellaneous: {is_gui: 1b}}]
execute if score @s local.block_state matches 1 run item replace block ~ ~ ~ container.2 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_left",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"close_variant",is_gui:1b}}]

item replace block ~ ~ ~ container.11 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_compass",minecraft:lore=["",{"translate": "ui.bubblellaneous.jump_to_list_end_or_begin", "with":["≔"], "color":"gray", "italic": false},{"translate": "ui.bubblellaneous.craft_maximum", "with":["≔"], "color":"gray", "italic": false},{"translate": "ui.bubblellaneous.craft_documentation", "with":["≔", {"keybind": "key.drop"}], "color":"gray", "italic": false}],minecraft:item_name={"translate": "ui.bubblellaneous.navigation", "color": "aqua"},minecraft:custom_data={bubblellaneous:{is_gui:1b}}] 1
execute if score @s local.gui.page matches 2.. run item replace block ~ ~ ~ container.18 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_left",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"previous_page",is_gui:1b}}]
execute if score @s local.gui.page matches 1 run item replace block ~ ~ ~ container.18 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_left_inactive",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"none",is_gui:1b}}]

execute if score gui.last_page local.tmp matches 0 run item replace block ~ ~ ~ container.19 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_right",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"next_page",is_gui:1b}}]
execute if score gui.last_page local.tmp matches 1 run item replace block ~ ~ ~ container.19 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_right_inactive",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"none",is_gui:1b}}]

item replace block ~ ~ ~ container.20 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_slot",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{is_gui:1b}}]
item modify block ~ ~ ~ container.20 bubblellaneous:bubble_bench/set_page
#endregion

execute if score @s local.gui.page > max_pages local.tmp run function bubblellaneous:block/bubble_bench/go_to_latest_page
