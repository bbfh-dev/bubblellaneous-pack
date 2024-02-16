item replace block ~ ~ ~ container.2 with structure_void{CustomModelData: 370002, display: {Name: '""'}, bubblellaneous: {is_gui: 1b, action: "close_variant"}} 1

execute store result score size local.tmp run data get entity @s item.tag.items
function bubblellaneous:blocks/bubble_bench/gui/load/variant/loop
execute if score i local.tmp < size local.tmp run scoreboard players set bit.1 local.tmp 1
