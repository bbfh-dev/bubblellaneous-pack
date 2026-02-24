execute if entity @s[tag=--bbln.uses.timer] unless score @s bbln.block.timer matches -1 unless function bubblellaneous:blocks/uses/timer/tick run function bubblellaneous:blocks/uses/timer/fire
execute if entity @s[tag=--bbln.loaded] run function bubblellaneous:blocks/while_loaded
execute unless score prevent_copying bbln.var matches 1 if entity @s[tag=--bbln.copy_properties] run say 2
execute unless score prevent_copying bbln.var matches 1 if entity @s[tag=--bbln.copy_properties] run function bubblellaneous:blocks/copy_properties/run
execute if entity @s[tag=--bbln.uses.brightness_fix] positioned as @s run function bubblellaneous:blocks/uses/brightness_fix/tick
