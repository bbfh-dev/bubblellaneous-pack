execute store result score $Material1 bubblellaneous run clear @p glass_pane 0
execute store result score $Material2 bubblellaneous run clear @p ender_eye 0
execute store result score $Material3 bubblellaneous run clear @p redstone 0
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. if score $Material3 bubblellaneous matches 1.. run clear @p glass_pane 4
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. if score $Material3 bubblellaneous matches 1.. run clear @p ender_eye 2
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. if score $Material3 bubblellaneous matches 1.. run clear @p redstone 1
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. if score $Material3 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1