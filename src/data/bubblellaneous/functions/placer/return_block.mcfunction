scoreboard players set did_cancel local.tmp 1

execute as @p[gamemode=!spectator] if entity @s[gamemode=creative] run return 0

$function spawn:bubblellaneous/$(id)
data modify entity @e[type=item,nbt={Age: 0s},distance=..2,limit=1,sort=nearest] Item.tag.EntityTag.Item.tag.bubblellaneous.block_properties set from storage bubblellaneous tmp.in.block_properties
playsound ui.stonecutter.take_result block @a ~ ~ ~ 1 1 0
execute align xyz run particle crit ~.5 ~.5 ~.5 0.2 0.2 0.2 0.05 10 normal @a
