summon armor_stand ^ ^ ^0.5 {Tags: ["+bubblellaneous", "local.keystrokes", "--local.new"], Small: 1b, NoBasePlate: 1b, Silent: 1b, NoGravity: 1b, Invisible: 1b, Marker: 1b}

scoreboard players operation @e[type=armor_stand,tag=--local.new,limit=1] local.player.id = @p[tag=--local.event_player] local.player.id
ride @p[tag=--local.event_player] mount @e[type=armor_stand,tag=--local.new,limit=1]
tp @e[type=armor_stand,tag=--local.new,limit=1] ^ ^ ^0.5 ~180 ~
tag @e[type=armor_stand,tag=--local.new,limit=1] remove --local.new

tag @p[tag=--local.event_player] add --local.ladder.attached
