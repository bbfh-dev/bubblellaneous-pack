execute store result score $Material1 bubblellaneous run clear @p brick 0
execute store result score $Material2 bubblellaneous run clear @p green_dye 0
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run clear @p brick 1
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run clear @p green_dye 1
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1