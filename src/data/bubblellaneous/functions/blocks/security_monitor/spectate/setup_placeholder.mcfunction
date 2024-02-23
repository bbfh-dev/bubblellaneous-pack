data merge entity @s {Tags: ["+bubblellaneous", "local.placeholder"], NoBasePlate: 1b, ShowArms: 1b, Pose: {LeftArm: [0f, 0f, 0f], RightArm: [0f, 0f, 0f]}, DisabledSlots: 4144959, CustomNameVisible: 1b, Invulnerable: 1b}
item replace entity @s armor.feet with leather_boots{display: {color: 11161378}}
item replace entity @s armor.legs with leather_leggings{display: {color: 2714347}}
item replace entity @s armor.chest with leather_chestplate{display: {color: 4257061}}
tag @s add --local.armor_stand
execute as @p[tag=--local.player] run loot replace entity @e[type=armor_stand,tag=--local.armor_stand,limit=1] armor.head loot bubblellaneous:util/get_player_head
tag @s remove --local.armor_stand
execute positioned as @p[tag=--local.player] run tp @s ~ ~ ~ ~ ~
data modify entity @s CustomName set from entity @s ArmorItems[-1].tag.SkullOwner.Name
scoreboard players operation @s local.player.id = @p[tag=--local.player] local.player.id

data modify storage bubblellaneous tmp.input set value {property: "location"}
execute store result storage bubblellaneous tmp.input.id int 1 run scoreboard players get @p[tag=--local.player] local.player.id
execute store result storage bubblellaneous tmp.input.data.x int 1 run data get entity @p[tag=--local.player] Pos[0]
execute store result storage bubblellaneous tmp.input.data.y int 1 run data get entity @p[tag=--local.player] Pos[1]
execute store result storage bubblellaneous tmp.input.data.z int 1 run data get entity @p[tag=--local.player] Pos[2]
execute store result storage bubblellaneous tmp.input.data.rx int 1 run data get entity @p[tag=--local.player] Rotation[0]
execute store result storage bubblellaneous tmp.input.data.ry int 1 run data get entity @p[tag=--local.player] Rotation[1]
execute store result storage bubblellaneous tmp.input.data.gamemode int 1 run data get entity @p[tag=--local.player] playerGameType
data modify storage bubblellaneous tmp.input.data.dimension set from entity @p[tag=--local.player] Dimension
function bubblellaneous:player/database/set_entry with storage bubblellaneous tmp.input
