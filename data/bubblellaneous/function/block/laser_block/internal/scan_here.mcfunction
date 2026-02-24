execute as @a[distance=..48] if items entity @s armor.head *[custom_data~{bubblellaneous:{item_data:{id:"nanoglasses"}}}] run particle dust{color:[1f, 0f, 0f], scale:1f} ~ ~ ~ 0.1 0.1 0.1 1 1 force
execute if function bubblellaneous:block/laser_block/internal/entity_hitbox positioned as @s run function bubblellaneous:block/laser_block/activate
