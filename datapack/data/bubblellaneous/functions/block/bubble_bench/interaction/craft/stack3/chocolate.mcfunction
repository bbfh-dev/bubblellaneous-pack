execute store result score $Material1 bubblellaneous run clear @p cocoa_beans 0
execute store result score $Material2 bubblellaneous run clear @p sugar 0
execute if score $Material1 bubblellaneous matches 3.. if score $Material2 bubblellaneous matches 1.. run clear @p cocoa_beans 3
execute if score $Material1 bubblellaneous matches 3.. if score $Material2 bubblellaneous matches 1.. run clear @p sugar 1
execute if score $Material1 bubblellaneous matches 3.. if score $Material2 bubblellaneous matches 1.. run scoreboard players set $Crafted bubblellaneous 1