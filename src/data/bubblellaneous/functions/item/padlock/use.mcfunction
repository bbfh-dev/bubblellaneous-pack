data modify storage bubblellaneous tmp.raycast set value {block: "#doors"}
function bubblellaneous:utils/raycast/init

#region Body
execute at @e[type=marker,tag=local.raycast_target,limit=1] run function bubblellaneous:item/padlock/internal/check_door_half
#endregion

kill @e[type=marker,tag=local.raycast_target]
