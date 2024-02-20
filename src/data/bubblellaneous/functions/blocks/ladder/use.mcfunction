summon armor_stand ^ ^ ^1 {Tags: ["+bubblellaneous", "local.keystrokes", "--local.new"], Small: 1b, NoBasePlate: 1b, Silent: 1b, NoGravity: 1b, Invisible: 1b, Marker: 1b}
scoreboard players operation @e[type=armor_stand,tag=--local.new,limit=1] local.player.id = @p[tag=--local.player] local.player.id
tp @e[type=armor_stand,tag=--local.new,limit=1] ^ ^ ^1 ~180 ~
ride @p[tag=--local.player] mount @e[type=armor_stand,tag=--local.new,limit=1]
tag @e[type=armor_stand,tag=--local.new,limit=1] remove --local.new
