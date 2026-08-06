rotate @s ~1 ~
execute if function bubblellaneous:block/surveillance_camera/camera/spin/should_stop_clockwise as @e[type=item_display,tag=--bbln.camera_stand,limit=1,x=0] run function bubblellaneous:block/surveillance_camera/camera/spin/switch
