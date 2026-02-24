data modify entity @s transformation set value {translation: [0f, 0f, 0f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}

scoreboard players set @e[type=item_display,tag=--bbln.this,limit=1,x=0] bbln.block.timer 6
playsound block.iron_trapdoor.close block @a[distance=..16] ~ ~ ~ 0.5 1 0
