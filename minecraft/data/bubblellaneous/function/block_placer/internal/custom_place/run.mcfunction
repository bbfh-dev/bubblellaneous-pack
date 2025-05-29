execute unless entity @s[nbt={item:{components:{"minecraft:custom_data": {bubblellaneous:{block_data:{block_type: {name: "default"}}}}}}}] run return run function bubblellaneous:block_placer/internal/custom_place/type_specific with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.block_type
$function bubblellaneous:block/$(name)/place
