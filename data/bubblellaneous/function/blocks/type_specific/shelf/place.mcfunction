$scoreboard players set amount bbln.tmp $(amount)
$execute if score amount bbln.tmp matches 1 positioned ~ ~$(offset) ~ run function bubblellaneous:blocks/type_specific/shelf/single
$execute if score amount bbln.tmp matches 2 positioned ~ ~$(offset) ~ run function bubblellaneous:blocks/type_specific/shelf/double
