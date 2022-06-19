execute store result score $Material1 bubblellaneous run clear @p quartz 0
execute store result score $Material2 bubblellaneous run clear @p bucket 0
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. run clear @p quartz 8
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. run clear @p bucket 1
execute if score $Material1 bubblellaneous matches 8.. if score $Material2 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1