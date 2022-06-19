execute store result score $Material1 bubblellaneous run clear @p quartz 0
execute store result score $Material2 bubblellaneous run clear @p glass_pane 0
execute if score $Material1 bubblellaneous matches 2.. if score $Material2 bubblellaneous matches 4.. run clear @p quartz 2
execute if score $Material1 bubblellaneous matches 2.. if score $Material2 bubblellaneous matches 4.. run clear @p glass_pane 4
execute if score $Material1 bubblellaneous matches 2.. if score $Material2 bubblellaneous matches 4.. run scoreboard players set $Crafted bubblellaneous 1