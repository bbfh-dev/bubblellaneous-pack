$data modify storage bubblellaneous players append value {id: $(id), properties: {}}
loot spawn ~ ~ ~ loot bubblellaneous:util/get_player_head
data modify storage bubblellaneous players[-1].name set from entity @e[type=item,nbt={Age: 0s},distance=..5,limit=1,sort=nearest] Item.tag.SkullOwner.Name
data modify storage bubblellaneous players[-1].uuid set from entity @s UUID
kill @e[type=item,nbt={Age: 0s},distance=..5,limit=1,sort=nearest]
