function bubblellaneous:utils/function/set_silent
scoreboard players set success local.tmp 1

gamemode spectator @p[tag=--local.player]
spectate @s @p[tag=--local.player]
execute at @s run title @p[tag=--local.player] actionbar {"translate":"ui.bubblellaneous.camera.spectating", "color":"yellow", "with":[{"selector":"@e[type=item_display,tag=--local.name.security_camera,limit=1,sort=nearest]"}]}
scoreboard players operation @s local.player.id = @p[tag=--local.player] local.player.id
execute at @p[tag=--local.player] run playsound ui.button.click block @p[tag=--local.player] ~ ~ ~ 1 1 1
