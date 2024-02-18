execute store success score modifier.shift local.tmp run data get entity @s Inventory[{tag: {bubblellaneous: {is_gui: 1b}}}]

function bubblellaneous:player/gui/action/click

clear @s #bubblellaneous:gui_item{bubblellaneous: {is_gui: 1b}}
