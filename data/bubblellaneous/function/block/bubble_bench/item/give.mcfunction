$execute as @p[tag=--bbln.player] run function give:bubblellaneous/$(item)
playsound entity.item.pickup player @a ~ ~ ~ 0.5 2 0
scoreboard players set showed_error bbln.tmp 1
