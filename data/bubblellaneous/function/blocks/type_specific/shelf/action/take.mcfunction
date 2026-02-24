scoreboard players operation #id_test bbln.tmp = @s bbln.block.id

scoreboard players set @s bbln.block_state 0

item replace entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand from entity @e[type=item_display,tag=bbln.display_item,limit=1,x=0] contents
playsound entity.item.pickup block @a[distance=..16] ~ ~ ~ 0.5 1 0

kill @e[type=item_display,tag=bbln.display,predicate=bubblellaneous:check/block.id,distance=..0.1,limit=3]
