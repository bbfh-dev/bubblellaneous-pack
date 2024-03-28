particle dust 1 0 0 1 ~ ~ ~ 0.1 0.1 0.1 1 1 force @a[tag=--local.nanoglasses.using]
execute positioned ~-0.3 ~-0.25 ~-0.3 as @p[gamemode=!spectator,dx=0.5,dy=0.5,dz=0.5] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0.5,dy=0.5,dz=0.5] as @e[type=item_display,tag=--local.this,limit=1] at @s run function bubblellaneous:block/laser_block/activate
