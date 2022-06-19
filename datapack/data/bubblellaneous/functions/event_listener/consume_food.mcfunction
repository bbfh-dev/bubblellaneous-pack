advancement revoke @s only bubblellaneous:event/consume_food
scoreboard players set $Temp bubblellaneous 0
execute if entity @s[nbt={SelectedItem:{tag:{Tags:["buln.food"]}}}] run function bubblellaneous:event_listener/consume_food/mainhand
execute if score $Temp bubblellaneous matches 0 store result score $Value bubblellaneous run data get entity @s Inventory[{Slot:-106b}].tag.Bubblellaneous.FoodValue
execute if score $Value bubblellaneous matches 1..10 run function bubblellaneous:event_listener/consume_food/low
execute if score $Value bubblellaneous matches 11..20 run function bubblellaneous:event_listener/consume_food/high