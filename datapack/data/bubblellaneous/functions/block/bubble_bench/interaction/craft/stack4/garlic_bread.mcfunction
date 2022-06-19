execute store result score $Material1 bubblellaneous run clear @p bread 0
execute store result score $Material2 bubblellaneous run clear @p dried_kelp 0
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run clear @p bread 2
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run clear @p dried_kelp 1
execute if score $Material1 bubblellaneous matches 1.. if score $Material2 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1