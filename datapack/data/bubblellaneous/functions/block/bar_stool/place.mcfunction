summon pig ~ ~ ~ {Tags:["bubblellaneous","buln.child","-buln.spin","buln.notset"], Invulnerable:1b, NoAI:1b, Silent:1b, ActiveEffects:[{Id:14b, Duration:2147483647, ShowParticles:0b}], DeathLootTable:"minecraft:empty", Age:-2147483648, Saddle:1b}
scoreboard players operation @e[type=pig, tag=buln.child, tag=buln.notset, limit=1] buln.registry = $Score buln.registry
team join bubblellaneous @e[type=pig, tag=buln.child, tag=buln.notset, limit=1]
tag @e[type=pig, tag=buln.child, tag=buln.notset, limit=1] add -buln.sound.wool
tag @e[type=pig, tag=buln.child, tag=buln.notset] remove buln.notset