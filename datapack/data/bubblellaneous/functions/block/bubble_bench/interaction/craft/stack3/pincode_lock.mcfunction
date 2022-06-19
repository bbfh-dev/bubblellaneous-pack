execute store result score $Material1 bubblellaneous run clear @p iron_block 0
execute store result score $Material2 bubblellaneous run clear @p name_tag 0
execute store result score $Material3 bubblellaneous run clear @p redstone 0
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. if score $Material3 bubblellaneous matches 1.. run clear @p iron_block 8
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. if score $Material3 bubblellaneous matches 1.. run clear @p name_tag 1
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. if score $Material3 bubblellaneous matches 1.. run clear @p redstone 1
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. if score $Material3 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1