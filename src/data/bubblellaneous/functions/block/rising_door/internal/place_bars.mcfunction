execute store result score rotation local.tmp run data get entity @s item.tag.bubblellaneous.block_properties.rotation
execute if score rotation local.tmp matches -90 run setblock ~ ~ ~ light_gray_stained_glass_pane[north=true,south=true]
execute if score rotation local.tmp matches 90 run setblock ~ ~ ~ light_gray_stained_glass_pane[north=true,south=true]
execute if score rotation local.tmp matches 0 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true]
execute if score rotation local.tmp matches 180 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true]
execute if score rotation local.tmp matches -180 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true]
