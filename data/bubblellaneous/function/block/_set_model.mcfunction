$execute if data storage bubblellaneous tmp.in{block_state: "default"} run return run data modify entity @s item.components."minecraft:item_model" set value "bubblellaneous:$(item_model)"
$data modify entity @s item.components."minecraft:item_model" set value "bubblellaneous:$(item_model)__$(block_state)"
