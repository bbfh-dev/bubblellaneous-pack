execute store success score modifier.shift local.tmp run data get entity @s Inventory[{tag: {bubblellaneous: {is_gui: 1b}}}]

execute if score modifier.shift local.tmp matches 0 run function bubblellaneous:player/gui/action/click
execute if score modifier.shift local.tmp matches 1 run function bubblellaneous:player/gui/action/shift_click

function bubblellaneous:player/on/open_container
clear @s #bubblellaneous:gui_item{bubblellaneous: {is_gui: 1b}}
