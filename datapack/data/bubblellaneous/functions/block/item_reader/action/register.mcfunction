scoreboard players set @s buln.digit0 1
data modify entity @s ArmorItems[3].tag.Bubblellaneous.Lock set from entity @p SelectedItem
tellraw @p {"translate":"msg.bubblellaneous.registered", "color":"green", "with":[{"translate":"block.bubblellaneous.item_reader"}]}
function bubblellaneous:block/item_reader/lock
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1