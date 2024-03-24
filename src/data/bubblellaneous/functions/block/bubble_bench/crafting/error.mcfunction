execute if score showed_error local.tmp matches 1 run return 0
scoreboard players set showed_error local.tmp 1

$tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.crafting_not_enough_items", "color":"red", "with":["$(item)"]}
playsound block.anvil.land block @p[tag=--local.player] ~ ~ ~ 0.2 1 0
