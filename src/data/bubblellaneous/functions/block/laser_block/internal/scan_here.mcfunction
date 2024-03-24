particle dust 1 0 0 1 ~ ~ ~ 0.1 0.1 0.1 1 1 force @a[tag=--local.nanoglasses.using]
execute positioned ~-0.55 ~-0.5 ~-0.55 as @p[gamemode=!spectator,gamemode=!creative,dx=1,dy=1,dz=1] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=1,dy=1,dz=1] as @e[type=item_display,tag=--local.this,limit=1] at @s run function bubblellaneous:block/laser_block/activate
