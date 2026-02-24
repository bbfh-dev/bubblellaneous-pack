# Save player data to return later
data modify storage minecraft:bubblellaneous temp set from entity @a[tag=--bbln.event_player,limit=1,x=0]
data modify storage bubblellaneous stack.saved_players append value {uuid: [I;], x: 0d, y: 0d, z: 0d, dimension: "", gamemode: 0}
data modify storage bubblellaneous stack.saved_players[-1].uuid set from storage minecraft:bubblellaneous temp.UUID
data modify storage bubblellaneous stack.saved_players[-1].x set from storage minecraft:bubblellaneous temp.Pos[0]
data modify storage bubblellaneous stack.saved_players[-1].y set from storage minecraft:bubblellaneous temp.Pos[1]
data modify storage bubblellaneous stack.saved_players[-1].z set from storage minecraft:bubblellaneous temp.Pos[2]
data modify storage bubblellaneous stack.saved_players[-1].dimension set from storage minecraft:bubblellaneous temp.Dimension
data modify storage bubblellaneous stack.saved_players[-1].gamemode set from storage minecraft:bubblellaneous temp.playerGameType
data modify storage bubblellaneous tmp.temp set from storage minecraft:bubblellaneous temp.Rotation

function bubblellaneous:utils/dummy_player/summon with storage bubblellaneous tmp
