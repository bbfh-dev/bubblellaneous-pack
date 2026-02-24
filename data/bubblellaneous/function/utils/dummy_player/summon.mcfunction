#> function bubblellaneous:utils/dummy_player/summon
$summon minecraft:mannequin ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.dummy_player","--bbln.new"], Rotation:$(temp)}
scoreboard players operation #id_test bbln.tmp = @s bbln.player.id
data modify storage minecraft:bubblellaneous temp set value {}
data modify storage minecraft:bubblellaneous temp2 set value {}
data modify storage minecraft:bubblellaneous temp set from entity @s equipment
data modify storage minecraft:bubblellaneous temp2 set from entity @s SelectedItem
loot replace entity @e[type=mannequin,tag=bbln.dummy_player,tag=--bbln.new,limit=1,distance=..1] weapon.mainhand loot bubblellaneous:util/get_player_head
execute as @e[type=mannequin,tag=bbln.dummy_player,tag=--bbln.new,limit=1,distance=..1] run function bubblellaneous:utils/dummy_player/setup
