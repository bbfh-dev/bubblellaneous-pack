advancement revoke @s only bubblellaneous:event/using/nanoglasses
scoreboard players reset @s buln.using_item

summon armor_stand ~ ~ ~ {Tags:["buln.nanoglassesStand"], Silent:1b, Invisible:1b}
item replace entity @e[type=armor_stand, tag=buln.nanoglassesStand, limit=1] armor.head from entity @s armor.head
execute unless entity @s[nbt={SelectedItem:{tag:{CustomModelData:85169}}}] run item replace entity @s armor.head from entity @s weapon.offhand
execute unless entity @s[nbt={SelectedItem:{tag:{CustomModelData:85169}}}] run item replace entity @s weapon.offhand with air
execute if entity @s[nbt={SelectedItem:{tag:{CustomModelData:85169}}}] run item replace entity @s armor.head from entity @s weapon.mainhand
execute if entity @s[nbt={SelectedItem:{tag:{CustomModelData:85169}}}] run item replace entity @s weapon.mainhand with air
execute as @e[type=armor_stand, tag=buln.nanoglassesStand, limit=1] if data entity @s ArmorItems[3].id run function bubblellaneous:event_listener/using/nanoglasses/return_head_item
kill @e[type=armor_stand, tag=buln.nanoglassesStand, limit=1]