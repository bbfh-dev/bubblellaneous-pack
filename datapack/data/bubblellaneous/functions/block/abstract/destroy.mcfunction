kill @e[type=item, distance=..1, nbt={Item:{tag:{Bubblellaneous:{pack:1b}}}, Age:0s}]
execute as @s[tag=-buln.update] run kill @e[type=item, distance=..1, nbt={Item:{Count:1b, id:"minecraft:redstone_block"}, Age:0s}]
execute as @s[tag=-buln.base.double] run kill @e[type=item, distance=..1, nbt={Item:{Count:2b}, Age:0s}]
execute as @s[tag=-buln.base.top] run kill @e[type=item, distance=..1, nbt={Item:{Count:1b}, Age:0s}]
execute as @s[tag=-buln.base.bottom] run kill @e[type=item, distance=..1, nbt={Item:{Count:1b}, Age:0s}]
execute as @s[tag=-buln.base.container] run kill @e[type=item, distance=..1, nbt={Item:{Count:1b, id:"minecraft:barrel"}, Age:0s}]
execute as @s[tag=-buln.base.middle] run kill @e[type=item, distance=..1, nbt={Item:{id:"minecraft:petrified_oak_slab"}, Age:0s}]
execute unless entity @p[gamemode=creative, distance=..6] run function bubblellaneous:loot/summon
execute at @s as @e[tag=buln.child] if score @s buln.registry = @e[type=armor_stand, tag=buln.block, limit=1, sort=nearest] buln.registry at @s run function bubblellaneous:block/abstract/child/destroy
execute at @s run particle crit ~ ~.5 ~ 0.2 0.2 0.2 0.25 10
execute at @s run playsound minecraft:ui.stonecutter.take_result block @a ~ ~ ~ 0.5
kill @s