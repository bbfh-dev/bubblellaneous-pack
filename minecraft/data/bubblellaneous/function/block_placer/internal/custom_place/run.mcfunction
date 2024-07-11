$execute if entity @s[nbt={item:{tag:{bubblellaneous:{block_data:{block_type: {name: "default"}}}}}}] run return run function bubblellaneous:block/$(name)/place
function bubblellaneous:block_placer/internal/custom_place/type_specific with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.block_type
