tp @a[predicate=bubblellaneous:check/block.id,tag=--bbln.player,limit=1,x=0] ^ ^-1.75 ^0.5 ~ 20
spectate @s @a[predicate=bubblellaneous:check/block.id,tag=--bbln.player,limit=1,x=0]

execute as @e[type=item_display,tag=bbln.name.surveillance_camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] \
    if score @s bbln.var matches 1 \
    as @a[predicate=bubblellaneous:check/block.id,tag=--bbln.player,tag=--bbln.camera.just_entered_camera,limit=1,x=0] \
    run function ./notify_about_manual_mode
    #region Lambda
    tag @s remove --bbln.camera.just_entered_camera
    execute if score @s bbln.player.notification_cooldown matches 1.. run return 0
    tellraw @s {"translate":"ui.bubblellaneous.camera.manual_mode", "color":"#fcd78d", "with": [{"keybind": "key.left", "bold":true}, {"keybind": "key.right", "bold":true}, {"keybind": "key.jump", "bold":true}]}
    scoreboard players set @s bbln.player.notification_cooldown 600
    #endregion
