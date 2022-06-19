item replace block ~ ~ ~ container.0 with item_frame{display:{Name:'{"translate":"category.bubblellaneous.furniture", "color":"#eecf77", "bold":true, "italic":false}'}, CustomModelData:85079, Bubblellaneous:{pack:1b, action:"controller.furniture"}} 1
item replace block ~ ~ ~ container.1 with item_frame{display:{Name:'{"translate":"category.bubblellaneous.security", "color":"#7696ed", "bold":true, "italic":false}'}, CustomModelData:85167, Bubblellaneous:{pack:1b, action:"controller.security"}} 1
item replace block ~ ~ ~ container.9 with item_frame{display:{Name:'{"translate":"category.bubblellaneous.miscellaneous", "color":"#cd76ed", "bold":true, "italic":false}'}, CustomModelData:85208, Bubblellaneous:{pack:1b, action:"controller.miscellaneous"}} 1
item replace block ~ ~ ~ container.10 with item_frame{display:{Name:'{"translate":"category.bubblellaneous.food", "color":"#96ed76", "bold":true, "italic":false}'}, CustomModelData:85182, Bubblellaneous:{pack:1b, action:"controller.food"}} 1
execute if score @s buln.data0 matches 0 run function bubblellaneous:block/bubble_bench/gui/controller/update/furniture
execute if score @s buln.data0 matches 1 run function bubblellaneous:block/bubble_bench/gui/controller/update/security
execute if score @s buln.data0 matches 2 run function bubblellaneous:block/bubble_bench/gui/controller/update/miscellaneous
execute if score @s buln.data0 matches 3 run function bubblellaneous:block/bubble_bench/gui/controller/update/food


execute if score @s buln.data1 matches 1 run item replace block ~ ~ ~ container.18 with item_frame{display:{Name:'""'}, CustomModelData:8402, Bubblellaneous:{pack:1b, action:"none"}}
execute if score @s buln.data1 matches 2.. run item replace block ~ ~ ~ container.18 with item_frame{display:{Name:'""'}, CustomModelData:8403, Bubblellaneous:{pack:1b, action:"gui.previous"}}


execute if score @s buln.data0 matches 0 store result score $GUI.Length bubblellaneous run data get storage bubblellaneous:crafting Furniture
execute if score @s buln.data0 matches 1 store result score $GUI.Length bubblellaneous run data get storage bubblellaneous:crafting Security
execute if score @s buln.data0 matches 2 store result score $GUI.Length bubblellaneous run data get storage bubblellaneous:crafting Miscellaneous
execute if score @s buln.data0 matches 3 store result score $GUI.Length bubblellaneous run data get storage bubblellaneous:crafting Food
scoreboard players operation $GUI.Page bubblellaneous = @s buln.data1
scoreboard players operation $GUI.Page bubblellaneous *= 21 bubblellaneous
scoreboard players operation $GUI.Length bubblellaneous -= $GUI.Page bubblellaneous

execute if score $GUI.Length bubblellaneous matches ..0 run item replace block ~ ~ ~ container.19 with item_frame{display:{Name:'""'}, CustomModelData:8404, Bubblellaneous:{pack:1b, action:"none"}}
execute if score $GUI.Length bubblellaneous matches 1.. run item replace block ~ ~ ~ container.19 with item_frame{display:{Name:'""'}, CustomModelData:8405, Bubblellaneous:{pack:1b, action:"gui.next"}}