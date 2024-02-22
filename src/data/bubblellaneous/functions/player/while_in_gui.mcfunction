execute store success score has_gui_items local.tmp run clear @s #bubblellaneous:gui_item{bubblellaneous: {is_gui: 1b}} 0
execute if score has_gui_items local.tmp matches 1 run function bubblellaneous:player/on/click_gui_item
