execute store result score $Material1 bubblellaneous run clear @p bread 0
execute store result score $Material2 bubblellaneous run clear @p beetroot 0
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run clear @p bread 1
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run clear @p beetroot 1
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1