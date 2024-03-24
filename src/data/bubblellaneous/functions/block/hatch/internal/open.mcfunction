data modify entity @s transformation set value {translation: [0f, 0f, 0.875f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0.060f, 0f, 0f, 0.998f], right_rotation: [0f, 0f, 0f, 1f]}
data merge entity @s {start_interpolation: 0, interpolation_duration: 5}

scoreboard players set @e[type=item_display,tag=--local.this,limit=1] local.block.timer 5
fill ~ ~ ~ ~ ~ ~ air replace petrified_oak_slab[type=bottom]
playsound block.iron_trapdoor.open block @a ~ ~ ~ 1 1 0
