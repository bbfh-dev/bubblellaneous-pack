execute store result score $Material1 bubblellaneous run clear @p dark_oak_planks 0
execute store result score $Material2 bubblellaneous run clear @p dark_oak_slab 0
execute if score $Material1 bubblellaneous matches 6.. if score $Material2 bubblellaneous matches 1.. run clear @p dark_oak_planks 6
execute if score $Material1 bubblellaneous matches 6.. if score $Material2 bubblellaneous matches 1.. run clear @p dark_oak_slab 1
execute if score $Material1 bubblellaneous matches 6.. if score $Material2 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1