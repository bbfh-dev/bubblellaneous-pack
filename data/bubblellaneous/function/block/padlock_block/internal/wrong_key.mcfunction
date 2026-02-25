$title @a[tag=--bbln.event_player,limit=1,x=0] actionbar {"translate":"ui.bubblellaneous.item_required", "with":[{"translate":"item.bubblellaneous.$(name)_key", "color":"yellow"}]}
$title @a[tag=--bbln.event_player,limit=1,x=0] subtitle {"atlas": "minecraft:items", "sprite": "bubblellaneous:item/key/$(name)", "shadow_color": 0}
title @a[tag=--bbln.event_player,limit=1,x=0] title ""
playsound block.chest.locked block @a[distance=..16] ~ ~ ~ 0.25 1 0

return 0
