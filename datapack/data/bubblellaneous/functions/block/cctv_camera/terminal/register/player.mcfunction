data modify entity @s ArmorItems[3].tag.Bubblellaneous.Owner set from entity @p UUID
playsound bubblellaneous:block.lock.register master @a ~ ~ ~
tellraw @p {"translate":"msg.bubblellaneous.registered", "color":"green", "with":[{"translate":"block.bubblellaneous.cctv_camera"}]}