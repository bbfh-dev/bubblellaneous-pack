execute if score showed_error bbln.tmp matches 1 run return 0
scoreboard players set showed_error bbln.tmp 1

$tellraw @p[tag=--bbln.player] {"translate":"ui.bubblellaneous.crafting_not_enough_items", "color":"red", "with":[{"translate":"$(group).bubblellaneous.$(item)","fallback":"$(item)"}]}
playsound block.anvil.land block @p[tag=--bbln.player] ~ ~ ~ 0.2 1 0
