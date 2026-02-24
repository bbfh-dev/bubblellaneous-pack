tag @s remove --bbln.new
scoreboard players operation @s bbln.player.id = #id_test bbln.tmp
data modify entity @s profile set from entity @s equipment.mainhand.components."minecraft:profile"
data modify entity @s equipment set from storage minecraft:bubblellaneous temp
data modify entity @s equipment.mainhand set from storage minecraft:bubblellaneous temp2

#summon interaction ~ ~-0.01 ~ {Tags: ["+bubblellaneous", "bbln.dummy_player", "bbln.armor_stand", "--bbln.new"], width: 0.51f, height: 2.02f, response: 1b}
#execute store result score @e[type=interaction,tag=--bbln.new,limit=1,sort=nearest] bbln.block.id store result score @s bbln.block.id run scoreboard players add armor_stand bbln.block.id 1
#execute store result score @e[type=interaction,tag=--bbln.new,limit=1,sort=nearest] bbln.player.id run scoreboard players get @s bbln.player.id

#item replace entity @s armor.feet with leather_boots[dyed_color=11161378]
#item replace entity @s armor.legs with leather_leggings[dyed_color=2714347]
#item replace entity @s armor.chest with leather_chestplate[dyed_color=4257061]
#data modify entity @s CustomName set from entity @s ArmorItems[-1].components."minecraft:profile".name
tp @s ~ ~ ~

