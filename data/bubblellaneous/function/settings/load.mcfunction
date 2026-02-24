
execute if score #camera.disabled bbln.settings matches 0 as @e[type=item_display,tag=bbln.name.security_monitor] run function bubblellaneous:block/security_monitor/blockstates/enabled
execute if score #camera.disabled bbln.settings matches 1 as @e[type=item_display,tag=bbln.name.security_monitor] run function bubblellaneous:block_placer/internal/apply_blockstate {name: "disabled", rotation: 0}

execute if score #experimental bbln.settings matches 0 run function bubblellaneous:blocks/type_specific/experimental/exclude
execute if score #experimental bbln.settings matches 1 run function bubblellaneous:blocks/type_specific/experimental/include
function #bubblellaneous:settings/on_load
