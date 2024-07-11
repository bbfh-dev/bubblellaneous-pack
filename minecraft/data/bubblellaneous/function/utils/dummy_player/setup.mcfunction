summon interaction ~ ~-0.01 ~ {Tags: ["+bubblellaneous", "local.dummy_player", "local.armor_stand", "--local.new"], width: 0.51f, height: 2.02f, response: 1b}
execute store result score @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id store result score @s local.block.id run scoreboard players add armor_stand local.block.id 1
execute store result score @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.player.id run scoreboard players get @s local.player.id

item replace entity @s armor.feet with leather_boots[dyed_color=11161378]
item replace entity @s armor.legs with leather_leggings[dyed_color=2714347]
item replace entity @s armor.chest with leather_chestplate[dyed_color=4257061]
data modify entity @s CustomName set from entity @s ArmorItems[-1].components."minecraft:profile".name
tp @s ~ ~ ~ ~ ~
