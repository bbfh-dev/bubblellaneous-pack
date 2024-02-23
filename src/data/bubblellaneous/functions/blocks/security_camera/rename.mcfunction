data modify entity @s CustomName set from entity @p[tag=--local.player] SelectedItem.tag.display.Name
tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.camera.renamed", "color":"green", "with":[{"entity":"@p[tag=--local.player]", "nbt":"SelectedItem.tag.display.Name", "interpret": true}]}
playsound ui.cartography_table.take_result block @a ~ ~ ~ 1 1 0
