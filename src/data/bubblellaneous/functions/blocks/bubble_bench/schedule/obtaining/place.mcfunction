playsound entity.firework_rocket.launch block @a ~ ~ ~ 1 1 0
playsound entity.firework_rocket.blast block @a ~ ~ ~ 1 1 0
execute align xyz run particle firework ~.5 ~-.5 ~.5 0 0 0 0.1 50

execute positioned ~ ~-1 ~ run function place:bubblellaneous/bubble_bench
kill @s
