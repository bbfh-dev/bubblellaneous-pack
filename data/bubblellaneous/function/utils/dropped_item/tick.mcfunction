execute if items entity @s contents *[minecraft:custom_data~{bubblellaneous: {is_gui: true}}] run return run function bubblellaneous:utils/delete_entity
tag @s add --bbln.item
