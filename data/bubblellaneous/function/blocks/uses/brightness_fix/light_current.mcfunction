scoreboard players set #light bbln.tmp 0
scoreboard players set #light_count bbln.tmp 0
execute positioned ~ ~1 ~ if block ~ ~ ~ #bubblellaneous:light_pass run function bubblellaneous:blocks/uses/brightness_fix/block
execute positioned ~ ~-1 ~ if block ~ ~ ~ #bubblellaneous:light_pass run function bubblellaneous:blocks/uses/brightness_fix/block
execute positioned ~1 ~ ~ if block ~ ~ ~ #bubblellaneous:light_pass run function bubblellaneous:blocks/uses/brightness_fix/block
execute positioned ~-1 ~ ~ if block ~ ~ ~ #bubblellaneous:light_pass run function bubblellaneous:blocks/uses/brightness_fix/block
execute positioned ~ ~ ~1 if block ~ ~ ~ #bubblellaneous:light_pass run function bubblellaneous:blocks/uses/brightness_fix/block
execute positioned ~ ~ ~-1 if block ~ ~ ~ #bubblellaneous:light_pass run function bubblellaneous:blocks/uses/brightness_fix/block

scoreboard players operation #light bbln.tmp /= #light_count bbln.tmp
function bubblellaneous:blocks/uses/brightness_fix/tag

execute if entity @s[tag=bbln.can_see_sky,predicate=!bubblellaneous:check/can_see_sky] run function bubblellaneous:blocks/uses/brightness_fix/sky_light_f
execute if entity @s[tag=!bbln.can_see_sky,predicate=bubblellaneous:check/can_see_sky] run function bubblellaneous:blocks/uses/brightness_fix/sky_light_t
