summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.security_camera", "--local.base", "--local.new"], width: 0.6f, height: 0.6f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^0.2 ^ ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

function bubblellaneous:blocks/security_camera/blockstate/set_stand {rotate: 0}

# ------

tag @s add --local.this_entity
execute summon item_display run function bubblellaneous:blocks/security_camera/lens/place with entity @e[type=item_display,tag=--local.this_entity,limit=1] item.tag.block_data
tag @s remove --local.this_entity

execute as @e[type=item_display,tag=--local.new,limit=1] facing entity @p feet run tp @s ^ ^ ^ ~ 0
scoreboard players operation @e[type=item_display,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=item_display,tag=--local.new,limit=1] remove --local.new

# ------
summon cave_spider ~ ~.2 ~ {Tags: ["+bubblellaneous", "local.camera_mount_point", "--local.new"], Silent: 1b, NoAI: 1b, Invulnerable: 1b, Attributes: [{Name: "minecraft:generic.max_health", Base: 999999d}], Health: 999999f, active_effects: [{id: "invisibility", duration: -1, show_particles: 0b}], DeathLootTable: "bubblellaneous:util/empty"}

scoreboard players operation @e[type=cave_spider,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=cave_spider,tag=--local.new,limit=1] remove --local.new
