scoreboard players set is_cancelled local.tmp 1
playsound ui.stonecutter.take_result block @a ~ ~.5 ~ 1 1 0
particle crit ~ ~.5 ~ 0.2 0.2 0.2 0.2 10
$execute positioned ~ ~.5 ~ run function spawn:bubblellaneous/$(name)

kill @s
