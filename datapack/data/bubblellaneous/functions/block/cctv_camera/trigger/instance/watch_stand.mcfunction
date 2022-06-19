summon armor_stand ~ ~ ~ {Tags:["buln.playerStandGraphical", "buln.notset"], NoGravity:1b, Marker:1b, Invulnerable:1b, ArmorItems:[{id:"leather_boots", Count:1b}, {id:"leather_leggings", Count:1b}, {id:"leather_chestplate", Count:1b}, {id:"player_head", Count:1b}]}
scoreboard players operation @e[type=armor_stand, tag=buln.playerStandGraphical, tag=buln.notset, limit=1] buln.data0 = @p buln.data2
execute store result entity @e[type=armor_stand, tag=buln.playerStandGraphical, tag=buln.notset, limit=1] NoBasePlate byte 1 run forceload query ~ ~
tag @e[type=armor_stand, tag=buln.playerStandGraphical, tag=buln.notset, limit=1] remove buln.notset
forceload add ~ ~