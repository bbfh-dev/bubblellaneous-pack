advancement revoke @s only bubblellaneous:event/armor/nanoglasses/damage
execute store result score $Temp bubblellaneous run data get entity @s Inventory[{Slot:103b}].tag.Damage
execute if score $Temp bubblellaneous matches ..99 run function bubblellaneous:event_listener/armor/nanoglasses/remove_damage