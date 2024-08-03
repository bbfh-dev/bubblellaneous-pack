#region Put onto head
summon armor_stand ~ ~ ~ {Tags: ["local.tmp"], Marker: 1b, Invisible: 1b}
item replace entity @e[type=armor_stand,tag=local.tmp,limit=1] weapon.mainhand from entity @s armor.head
item replace entity @s armor.head from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @e[type=armor_stand,tag=local.tmp,limit=1] weapon.mainhand
kill @e[type=armor_stand,tag=local.tmp]
#endregion

playsound item.armor.equip_iron player @s ~ ~ ~ 1 1 0
function bubblellaneous:item/nanoglasses/event/inventory_changed
