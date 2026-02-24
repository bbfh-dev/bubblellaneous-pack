summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:structure_void"},Tags:["--bbln.new_item"],PickupDelay:0s}
$item replace entity @e[type=minecraft:item,tag=--bbln.new_item,limit=1,distance=..0.1] contents from block ~ ~ ~ $(slot)
tp @e[type=minecraft:item,tag=--bbln.new_item,limit=1,distance=..0.1] @a[tag=--bbln.player,limit=1,distance=..16]
tp @e[type=minecraft:item,tag=--bbln.new_item,limit=1,distance=..0.1] ~ ~1 ~
tag @e[type=minecraft:item,tag=--bbln.new_item,limit=1,x=0] remove --bbln.new_item
