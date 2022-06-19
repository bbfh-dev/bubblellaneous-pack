summon item ~ ~ ~ {Item:{id:"minecraft:stone", Count:1b}, PickupDelay:20s, Tags:["buln.temp.item"]}
data modify entity @e[type=item, tag=buln.temp.item, limit=1] Item.id set from entity @s HandItems[0].id
data modify entity @e[type=item, tag=buln.temp.item, limit=1] Item.Count set from entity @s HandItems[0].Count
data modify entity @e[type=item, tag=buln.temp.item, limit=1] Item.tag set from entity @s HandItems[0].tag
tag @e[type=item, tag=buln.temp.item, limit=1] remove buln.temp.item