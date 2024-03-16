#region Spin
execute if score camera.fixed local.settings matches 1 run return 0
execute if score @e[type=item_display,tag=--local.camera_stand,limit=1] local.block_state matches 0 run function bubblellaneous:block/surveillance_camera/camera/spin/clockwise
execute if score @e[type=item_display,tag=--local.camera_stand,limit=1] local.block_state matches 1 run function bubblellaneous:block/surveillance_camera/camera/spin/counter_clockwise
#endregion
