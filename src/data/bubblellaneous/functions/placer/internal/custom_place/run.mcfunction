$execute if entity @s[nbt={item:{tag:{bubblellaneous:{block_data:{block_type: {name: "none"}}}}}}] run return run function bubblellaneous:block/id/$(name)/place
function bubblellaneous:placer/internal/custom_place/type_specific with entity @s item.tag.bubblellaneous.block_data.block_type
