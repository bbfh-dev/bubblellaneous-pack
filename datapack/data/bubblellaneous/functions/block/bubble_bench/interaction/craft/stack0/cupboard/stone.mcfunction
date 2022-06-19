execute store result score $Material1 bubblellaneous run clear @p stone 0
execute store result score $Material2 bubblellaneous run clear @p leather 0
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. run clear @p stone 4
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. run clear @p leather 2
execute if score $Material1 bubblellaneous matches 4.. if score $Material2 bubblellaneous matches 2.. run scoreboard players set $Crafted bubblellaneous 1