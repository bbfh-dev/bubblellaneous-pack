summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.camera", "--local.new_child"], item: {id: "item_frame", Count: 1b}}

data modify entity @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] item.tag set from entity @s item.tag
#!/overlay 1.20.2-LATEST | data modify entity @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] teleport_duration set value 3
execute as @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] at @s run function bubblellaneous:block/surveillance_camera/blockstates/apply/camera {rotation: 0}
execute facing entity @p[gamemode=!spectator] feet run tp @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] ~ ~ ~ ~ 0
scoreboard players operation @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] remove --local.new_child

function bubblellaneous:block/surveillance_camera/blockstates/apply/stand {rotation: 0}
