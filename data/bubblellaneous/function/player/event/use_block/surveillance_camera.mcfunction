advancement revoke @s only bubblellaneous:player/event/use_block/surveillance_camera

# For some reason this cannot be part of the advancement predicate in 26.3
execute unless data entity @s SelectedItem.components.minecraft:entity_data.Item.components.minecraft:custom_data.bubblellaneous.block_data{id: "security_monitor"} run return fail

function bubblellaneous:player/event/get_interacted/main {type: "interaction", tag: "base.surveillance_camera"}

scoreboard players operation #id_test bbln.tmp = @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] bbln.block.id
execute as @e[type=item_display,tag=bbln.block,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function bubblellaneous:block/surveillance_camera/interact

function bubblellaneous:player/event/generic/end
