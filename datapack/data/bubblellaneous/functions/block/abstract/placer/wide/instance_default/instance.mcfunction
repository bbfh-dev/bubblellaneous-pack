execute if entity @s[tag=-buln.base.double] run function bubblellaneous:block/abstract/placer/single/instance_default/double
execute if entity @s[tag=-buln.base.container] run function bubblellaneous:block/abstract/placer/single/instance_default/container
execute if entity @s[tag=-buln.base.bottom] run setblock ~ ~ ~ petrified_oak_slab[type=bottom]
execute if entity @s[tag=-buln.base.top] run setblock ~ ~ ~ petrified_oak_slab[type=top]
execute if entity @s[tag=-buln.base.auto] run function bubblellaneous:block/abstract/placer/single/instance_default/auto
execute if entity @s[tag=-buln.base.low] run setblock ~ ~ ~ oak_trapdoor[half=bottom]