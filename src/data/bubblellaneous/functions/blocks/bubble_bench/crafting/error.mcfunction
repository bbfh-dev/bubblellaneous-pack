$tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.crafting_not_enough_items", "color":"red", "with":[{"translate":"$(group).bubblellaneous.$(name)"}]}
playsound block.anvil.land block @p[tag=--local.player] ~ ~ ~ 0.2 1 0
