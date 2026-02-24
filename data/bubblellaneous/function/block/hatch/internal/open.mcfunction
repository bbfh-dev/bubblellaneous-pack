data modify entity @s transformation set value {translation: [0f, 0f, 0.875f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0.060f, 0f, 0f, 0.998f], right_rotation: [0f, 0f, 0f, 1f]}
#data merge entity @s {start_interpolation: 0, interpolation_duration: 5}

#scoreboard players set @e[type=item_display,tag=--bbln.this,limit=1,x=0] bbln.block.timer 5
fill ~ ~ ~ ~ ~ ~ water replace petrified_oak_slab[type=bottom,waterlogged=true]
fill ~ ~ ~ ~ ~ ~ air replace petrified_oak_slab[type=bottom]
playsound block.iron_trapdoor.open block @a[distance=..16] ~ ~ ~ 0.5 1 0
