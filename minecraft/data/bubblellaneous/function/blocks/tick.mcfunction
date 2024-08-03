execute as @s[tag=--local.uses.timer] run function bubblellaneous:blocks/uses/timer/tick
execute as @s[tag=--local.loaded] run function bubblellaneous:blocks/while_loaded
execute unless score prevent_copying local.var matches 1 as @s[tag=--local.copy_properties] run function bubblellaneous:blocks/copy_properties/run
