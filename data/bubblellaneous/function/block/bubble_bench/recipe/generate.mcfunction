data modify storage bubblellaneous tmp.out.recipe set value []
execute store result score #length bbln.tmp run data get storage bubblellaneous tmp.in.recipe
execute if score #length bbln.tmp matches 0 run return 0

function ./loop
	data modify storage bubblellaneous tmp.i set from storage bubblellaneous tmp.in.recipe[0]
	data remove storage bubblellaneous tmp.in.recipe[0]

	execute unless data storage bubblellaneous tmp.i.texture run function ./set_assumed_texture with storage bubblellaneous tmp.i
		$data modify storage bubblellaneous tmp.i.texture_atlas set value "minecraft:$(unit)s"
		$data modify storage bubblellaneous tmp.i.texture set value "$(unit)/$(id)"

	function ./insert with storage bubblellaneous tmp.i
		$data modify storage bubblellaneous tmp.out.recipe append value [ \
			{"text": "› ","color": "gray","italic": false}, \
			{"atlas": "$(texture_atlas)", "sprite": "$(texture)", "color": "white"}, \
			" ", \
			{"translate": "$(unit).minecraft.$(id)","color": "white"}, \
			{"translate": " × $(count)","color": "gold"} \
		]

	scoreboard players remove #length bbln.tmp 1
	execute if score #length bbln.tmp matches 1.. run function ./loop
