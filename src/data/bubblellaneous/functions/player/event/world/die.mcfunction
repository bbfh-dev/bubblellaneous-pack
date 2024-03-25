scoreboard players reset @s local.player.death_count

execute as @s[tag=--local.bear_trap.trapped] run function bubblellaneous:block/bear_trap/event/on_die
