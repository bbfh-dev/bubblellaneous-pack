tag @s remove --local.flashlight.in_use
execute if entity @s[nbt={SelectedItem: {id: "minecraft:carrot_on_a_stick"}}] run item modify entity @s weapon.mainhand bubblellaneous:flashlight/disable
execute if entity @s[nbt={equipment: {offhand: {id: "minecraft:carrot_on_a_stick"}}}] run item modify entity @s weapon.offhand bubblellaneous:flashlight/disable
playsound ui.button.click block @s ~ ~ ~ 1 1 0
