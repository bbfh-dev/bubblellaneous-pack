execute if entity @s[tag=-buln.base.top] unless block ~ ~ ~ petrified_oak_slab[type=top] run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.bottom] unless block ~ ~ ~ petrified_oak_slab[type=bottom] run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.double] unless block ~ ~ ~ petrified_oak_slab[type=double] unless block ~ ~ ~ redstone_block run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.container] unless block ~ ~ ~ barrel unless block ~ ~ ~ redstone_block run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.auto] unless block ~ ~ ~ petrified_oak_slab unless block ~ ~ ~ structure_void run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.hopper] unless block ~ ~ ~ hopper run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.void] unless block ~ ~ ~ structure_void run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.fence] unless block ~ ~ ~ spruce_fence run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.lamp] unless block ~ ~ ~ redstone_lamp run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.custom.bottom, tag=-buln.broken] unless block ~ ~ ~ tripwire run function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.low] unless block ~ ~ ~ tripwire run function bubblellaneous:block/abstract/destroy