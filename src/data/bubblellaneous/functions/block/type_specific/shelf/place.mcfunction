$scoreboard players set amount local.tmp $(amount)
execute if score amount local.tmp matches 1 run function bubblellaneous:block/type_specific/shelf/single
execute if score amount local.tmp matches 2 run function bubblellaneous:block/type_specific/shelf/double
