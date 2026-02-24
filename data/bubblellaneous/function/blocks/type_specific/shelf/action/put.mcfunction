scoreboard players operation #id_test bbln.tmp = @s bbln.block.id

scoreboard players set @s bbln.block_state 1

tag @s add --bbln.this

execute store result score #count bbln.tmp run data get entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.count
scoreboard players operation #iters bbln.tmp = #count bbln.tmp
scoreboard players operation #iters bbln.tmp /= #8 bbln.int
execute if score #iters bbln.tmp matches 3.. run scoreboard players set #iters bbln.tmp 2

function bubblellaneous:blocks/type_specific/shelf/internal/place_iter

item replace entity @a[tag=--bbln.event_player,gamemode=!creative,limit=1,x=0] weapon.mainhand with minecraft:air
playsound block.wood.step block @a[distance=..16] ~ ~ ~ 0.5 1 0

tag @s remove --bbln.this
