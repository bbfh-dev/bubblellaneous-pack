execute store result score rotation bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.rotation
execute if score rotation bbln.tmp matches -90 run setblock ~ ~ ~ light_gray_stained_glass_pane[north=true,south=true,east=false,west=false]
execute if score rotation bbln.tmp matches 90 run setblock ~ ~ ~ light_gray_stained_glass_pane[north=true,south=true,east=false,west=false]
execute if score rotation bbln.tmp matches 0 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true,north=false,south=false]
execute if score rotation bbln.tmp matches 180 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true,north=false,south=false]
execute if score rotation bbln.tmp matches -180 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true,north=false,south=false]
setblock ~ ~ ~ air
execute if score rotation bbln.tmp matches -90 run setblock ~ ~ ~ light_gray_stained_glass_pane[north=true,south=true,east=false,west=false] strict
execute if score rotation bbln.tmp matches 90 run setblock ~ ~ ~ light_gray_stained_glass_pane[north=true,south=true,east=false,west=false] strict
execute if score rotation bbln.tmp matches 0 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true,north=false,south=false] strict
execute if score rotation bbln.tmp matches 180 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true,north=false,south=false] strict
execute if score rotation bbln.tmp matches -180 run setblock ~ ~ ~ light_gray_stained_glass_pane[east=true,west=true,north=false,south=false] strict
