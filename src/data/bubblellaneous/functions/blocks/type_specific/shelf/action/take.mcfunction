scoreboard players set @s local.block_state 0

item replace entity @p[tag=--local.event_player] weapon.mainhand from entity @e[type=item_display,tag=local.display_item,limit=1,sort=nearest] container.0

scoreboard players operation id local.tmp = @s local.block.id
execute as @e[type=item_display,tag=local.display_item,distance=..0.1,limit=1,sort=nearest] if score @s local.block.id = id local.tmp run kill @s
execute as @e[type=item_display,tag=local.display,distance=..0.1,limit=2,sort=nearest] if score @s local.block.id = id local.tmp run kill @s
playsound entity.item.pickup block @a ~ ~ ~ 1 1 0
