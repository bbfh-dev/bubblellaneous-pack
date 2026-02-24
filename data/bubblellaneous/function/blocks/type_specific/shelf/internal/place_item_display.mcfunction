scoreboard players operation @s bbln.block.id = #id_test bbln.tmp
$data merge entity @s {Tags: ["+bubblellaneous", "bbln.display", "bbln.display_item"], item: {id: "stone", count: 1b}, transformation: $(transformation), item_display: "gui"}
execute if entity @e[type=item_display,tag=bbln.block,predicate=bubblellaneous:check/block.id,tag=--bbln.uses.brightness_fix,limit=1,x=0] run function bubblellaneous:blocks/type_specific/shelf/internal/brightness_fix_item_display
item replace entity @s contents from entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand
#item modify entity @s contents bubblellaneous:blocks/container/set_1_item

