execute if score #camera.disabled bbln.settings matches 1 run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "disabled", rotation: 0}
execute unless data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "off", rotation: 0}
function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
