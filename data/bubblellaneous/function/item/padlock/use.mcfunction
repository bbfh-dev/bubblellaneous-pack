data modify storage bubblellaneous tmp.raycast set value {block: "#doors[open=false]"}
function bubblellaneous:utils/raycast/init

#region Body
execute at @e[type=marker,tag=bbln.raycast_target,limit=1,x=0] run function bubblellaneous:item/padlock/internal/check_door_half
#endregion

kill @e[type=marker,tag=bbln.raycast_target,limit=1,x=0]
