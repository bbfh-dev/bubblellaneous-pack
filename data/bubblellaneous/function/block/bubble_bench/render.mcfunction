execute unless score @s bbln.gui.page matches 1..2147483647 run scoreboard players set @s bbln.gui.page 1

#region Pages
scoreboard players operation page.as_index bbln.tmp = @s bbln.gui.page
scoreboard players remove page.as_index bbln.tmp 1
execute store result score i bbln.tmp run scoreboard players operation page.as_index bbln.tmp *= #18 bbln.int
#endregion

#region Set empty slots
execute if items block ~ ~ ~ container.0 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.0"}
execute if items block ~ ~ ~ container.1 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.1"}
execute if items block ~ ~ ~ container.2 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.2"}
execute if items block ~ ~ ~ container.3 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.3"}
execute if items block ~ ~ ~ container.4 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.4"}
execute if items block ~ ~ ~ container.5 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.5"}
execute if items block ~ ~ ~ container.6 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.6"}
execute if items block ~ ~ ~ container.7 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.7"}
execute if items block ~ ~ ~ container.8 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.8"}
execute if items block ~ ~ ~ container.9 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.9"}
execute if items block ~ ~ ~ container.10 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.10"}
execute if items block ~ ~ ~ container.11 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.11"}
execute if items block ~ ~ ~ container.12 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.12"}
execute if items block ~ ~ ~ container.13 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.13"}
execute if items block ~ ~ ~ container.14 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.14"}
execute if items block ~ ~ ~ container.15 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.15"}
execute if items block ~ ~ ~ container.16 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.16"}
execute if items block ~ ~ ~ container.17 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.17"}
execute if items block ~ ~ ~ container.18 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.18"}
execute if items block ~ ~ ~ container.19 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.19"}
execute if items block ~ ~ ~ container.20 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.20"}
execute if items block ~ ~ ~ container.21 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.21"}
execute if items block ~ ~ ~ container.22 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.22"}
execute if items block ~ ~ ~ container.23 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.23"}
execute if items block ~ ~ ~ container.24 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.24"}
execute if items block ~ ~ ~ container.25 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.25"}
execute if items block ~ ~ ~ container.26 *[!custom_data~{bubblellaneous: {is_gui: true}}] run function bubblellaneous:block/bubble_bench/drop_item {slot:"container.26"}

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

loot replace block ~ ~ ~ container.1 loot bubblellaneous:block/computer
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

scoreboard players set gui.last_page bbln.tmp 1

#region Render main view
scoreboard players set container.i bbln.tmp 2
scoreboard players set container.i bbln.tmp 2

execute unless data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category run data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category set value "furniture"
execute if score @s bbln.block_state matches 0 run function bubblellaneous:block/bubble_bench/render_category
execute if score @s bbln.block_state matches 1 run function bubblellaneous:block/bubble_bench/render_variant
execute if score i bbln.tmp < size bbln.tmp run scoreboard players set gui.last_page bbln.tmp 0
#endregion

#region Controls
execute if score @s bbln.block_state matches 0 run item replace block ~ ~ ~ container.2 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_slot", minecraft:item_name="", minecraft:custom_data={bubblellaneous: {is_gui: 1b}},minecraft:tooltip_display={hide_tooltip: true}]
execute if score @s bbln.block_state matches 1 run item replace block ~ ~ ~ container.2 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_left",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"close_variant",is_gui:1b}},minecraft:tooltip_display={hide_tooltip: true}]

item replace block ~ ~ ~ container.11 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_compass",minecraft:lore=["",{"translate": "ui.bubblellaneous.jump_to_list_end_or_begin", "with":["≔"], "color":"gray", "italic": false},{"translate": "ui.bubblellaneous.craft_maximum", "with":["≔"], "color":"gray", "italic": false},{"translate": "ui.bubblellaneous.craft_documentation", "with":["≔", {"keybind": "key.drop"}], "color":"gray", "italic": false}],minecraft:item_name={"translate": "ui.bubblellaneous.navigation", "color": "aqua"},minecraft:custom_data={bubblellaneous:{is_gui:1b}}] 1
execute if score @s bbln.gui.page matches 2.. run item replace block ~ ~ ~ container.18 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_left",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"previous_page",is_gui:1b}},minecraft:tooltip_display={hide_tooltip: true}]
execute if score @s bbln.gui.page matches 1 run item replace block ~ ~ ~ container.18 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_left_inactive",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"none",is_gui:1b}},minecraft:tooltip_display={hide_tooltip: true}]

execute if score gui.last_page bbln.tmp matches 0 run item replace block ~ ~ ~ container.19 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_right",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"next_page",is_gui:1b}},minecraft:tooltip_display={hide_tooltip: true}]
execute if score gui.last_page bbln.tmp matches 1 run item replace block ~ ~ ~ container.19 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_arrow_right_inactive",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{action:"none",is_gui:1b}},minecraft:tooltip_display={hide_tooltip: true}]

item replace block ~ ~ ~ container.20 with minecraft:structure_void[minecraft:item_model="bubblellaneous:ui_slot",minecraft:item_name="",minecraft:custom_data={bubblellaneous:{is_gui:1b}},minecraft:tooltip_display={hide_tooltip: true}]
item modify block ~ ~ ~ container.20 bubblellaneous:bubble_bench/set_page
#endregion

execute if score @s bbln.gui.page > max_pages bbln.tmp run function bubblellaneous:block/bubble_bench/go_to_latest_page
