execute if score #iters bbln.tmp matches 0 summon minecraft:item_display run function bubblellaneous:blocks/type_specific/shelf/internal/place_item_display {transformation:{scale: [0.6f, 0.6f, 0.6f], left_rotation: [-0.707f, 0f, 0f, 0.707f], right_rotation: [0f, 0f, -0.150f, 0.989f], translation: [0f, 0.02f, 0f]}}
execute if score #iters bbln.tmp matches 1 summon minecraft:item_display run function bubblellaneous:blocks/type_specific/shelf/internal/place_item_display {transformation:{scale: [0.6f, 0.6f, 0.6f], left_rotation: [0.674f, 0f, 0f, 0.738f], right_rotation: [0f, 0f, 0.060f, 0.998f], translation: [-0.1f, 0.04f, -0.1f]}}
execute if score #iters bbln.tmp matches 2 summon minecraft:item_display run function bubblellaneous:blocks/type_specific/shelf/internal/place_item_display {transformation:{scale: [0.6f, 0.6f, 0.6f], left_rotation: [0.753f, 0f, 0f, 0.658f], right_rotation: [0f, -0.090f, 0.779f, 0.621f], translation: [0.1f, 0.04f, 0.15f]}}

scoreboard players remove #iters bbln.tmp 1
execute if score #iters bbln.tmp matches 0.. run function bubblellaneous:blocks/type_specific/shelf/internal/place_iter
