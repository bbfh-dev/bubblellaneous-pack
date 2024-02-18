scoreboard players set @s local.block.state 0

item replace entity @p[tag=--local.player] weapon.mainhand from entity @e[type=item_display,tag=local.display_item,limit=1,sort=nearest] container.0
kill @e[type=item_display,tag=local.display_item,limit=1,sort=nearest]
playsound entity.item.pickup block @a ~ ~ ~ 1 1 0
