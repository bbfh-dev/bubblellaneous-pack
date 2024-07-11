$scoreboard players set amount local.tmp $(amount)
$execute if score amount local.tmp matches 1 positioned ~ ~$(offset) ~ run function bubblellaneous:blocks/type_specific/shelf/single
$execute if score amount local.tmp matches 2 positioned ~ ~$(offset) ~ run function bubblellaneous:blocks/type_specific/shelf/double
