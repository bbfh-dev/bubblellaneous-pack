execute store result score @s local.player.pos_y run data get entity @s Pos[1]
data modify entity @s item.tag.bubblellaneous.block_properties.owner set from entity @p[gamemode=!spectator] UUID
