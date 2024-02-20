execute unless data storage bubblellaneous tmp.entry.tag.bubblellaneous.category run return 0
execute store result score @s local.block.state run data get storage bubblellaneous tmp.entry.tag.bubblellaneous.category
scoreboard players set @s local.block.gui_page 0
function bubblellaneous:blocks/bubble_bench/gui/load
