summon armor_stand ~ ~ ~ {Tags: ["+bubblellaneous", "local.dummy_player"], ShowArms: 1b, NoBasePlate: 1b, Invulnerable: 1b, CustomName: "", CustomNameVisible: 1b, DisabledSlots: 4144959, Pose: {LeftArm: [0f, 0f, 0f], RightArm: [0f, 0f, 0f]}}
scoreboard players operation @e[type=armor_stand,tag=local.dummy_player,limit=1,sort=nearest] local.player.id = @s local.player.id
loot replace entity @e[type=armor_stand,tag=local.dummy_player,limit=1,sort=nearest] armor.head loot bubblellaneous:util/get_player_head
execute as @e[type=armor_stand,tag=local.dummy_player,limit=1,sort=nearest] run function bubblellaneous:utils/dummy_player/setup
