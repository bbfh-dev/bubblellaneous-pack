scoreboard players reset @s bbln.player.death_count

execute if entity @s[tag=--bbln.bear_trap.trapped] run function bubblellaneous:block/bear_trap/event/on_die
