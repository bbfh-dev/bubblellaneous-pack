#  Update
execute if entity @s[tag=-buln.update] run function bubblellaneous:block/abstract/update


#  Destroy
execute if entity @s[tag=-buln.predicate.single] run function bubblellaneous:block/abstract/instance/single
execute if entity @s[tag=-buln.predicate.wide] run function bubblellaneous:block/abstract/instance/wide
execute if entity @s[tag=-buln.predicate.tall] run function bubblellaneous:block/abstract/instance/tall


#  Unload
execute unless entity @p[distance=..28] run tag @s remove buln.in_bubble