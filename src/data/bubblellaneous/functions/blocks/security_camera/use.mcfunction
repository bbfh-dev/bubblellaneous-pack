execute as @s[nbt={CustomName: '{"translate":"block.bubblellaneous.security_camera","italic":false}'}] run tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.camera.no_name", "color":"red", "with":[{"translate":"item.minecraft.name_tag"}]}
execute as @s[nbt={CustomName: '{"translate":"block.bubblellaneous.security_camera","italic":false}'}] run return 0

data modify storage bubblellaneous tmp.input set value {}
execute store result storage bubblellaneous tmp.input.id int 1 run scoreboard players get @s local.block.id
execute store result storage bubblellaneous tmp.input.x int 1 run data get entity @s Pos[0]
execute store result storage bubblellaneous tmp.input.y int 1 run data get entity @s Pos[1]
execute store result storage bubblellaneous tmp.input.z int 1 run data get entity @s Pos[2]
data modify storage bubblellaneous tmp.input.dimension set from entity @p[tag=--local.player] Dimension
item modify entity @p[tag=--local.player] weapon.mainhand bubblellaneous:block/security_camera/link_camera

tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.camera.linked", "color":"green"}
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1 1 0
