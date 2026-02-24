execute positioned ^ ^ ^0.25 positioned ~-0.25 ~-0.25 ~-0.25 as @a[gamemode=!spectator,limit=1,dx=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run return 1
execute positioned ^ ^ ^-0.25 positioned ~-0.25 ~-0.25 ~-0.25 as @a[gamemode=!spectator,limit=1,dx=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run return 1
return fail
