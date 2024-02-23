summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.security_monitor", "--local.base", "--local.new"], width: 0.9f, height: 0.6f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^.2 ^-0.75 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

# ------

execute unless data entity @s item.tag.block_properties.link run function bubblellaneous:blocks/security_monitor/blockstate/set_off {rotate: 0}
execute if score cameras.disable local.settings matches 1 run function bubblellaneous:blocks/security_monitor/blockstate/set_disabled {rotate: 0}
