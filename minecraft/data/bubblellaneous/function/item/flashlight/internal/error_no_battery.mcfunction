title @s actionbar {"translate":"ui.bubblellaneous.flashlight.no_battery", "color":"red", "with":[{"translate":"item.bubblellaneous.flashlight"}]}
execute store result score success local.tmp run clear @s firework_star[minecraft:custom_data={bubblellaneous: {item_data: {id: "battery"}}}] 1
execute if score success local.tmp matches 1.. run function bubblellaneous:item/flashlight/internal/recharge
