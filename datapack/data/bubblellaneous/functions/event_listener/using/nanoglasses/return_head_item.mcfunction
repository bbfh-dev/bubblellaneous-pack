summon item ~ ~ ~ {Tags:["buln.item"], Item:{id:"minecraft:stone", Count:1b}, PickupDelay:1s}
data modify entity @e[type=item, tag=buln.item, limit=1] Item.id set from entity @s ArmorItems[3].id
data modify entity @e[type=item, tag=buln.item, limit=1] Item.Count set from entity @s ArmorItems[3].Count
data modify entity @e[type=item, tag=buln.item, limit=1] Item.tag set from entity @s ArmorItems[3].tag
tag @e[type=item, tag=buln.item, limit=1] remove buln.item