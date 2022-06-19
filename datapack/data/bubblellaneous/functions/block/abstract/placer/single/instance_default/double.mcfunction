tag @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] add -buln.lit
data merge entity @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] {Fire:32767s, Marker:1b}
setblock ~ ~ ~ petrified_oak_slab[type=double]