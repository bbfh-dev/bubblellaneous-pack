$execute as @p[tag=--local.player] run function give:bubblellaneous/$(item)
playsound entity.item.pickup player @a ~ ~ ~ 1 2 0
scoreboard players set showed_error local.tmp 1
