$setblock ~ ~ ~ barrel[facing=up]{CustomName: '$(display_name)'}
data modify block ~ ~ ~ Items set from entity @s item.tag.bubblellaneous.block_properties.items

function bubblellaneous:block/safe_block/blockstates/apply/open {rotation: 0}
playsound bubblellaneous:block.safe_block.open block @a ~ ~ ~ 1 1 0

scoreboard players set @s local.block_state 1
scoreboard players set @s local.block.timer 30
