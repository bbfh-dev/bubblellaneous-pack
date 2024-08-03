$execute as @s[tag=--local.uses.$(name)] run tag @e[type=item_display,tag=--local.new,limit=1,sort=nearest] add --local.uses.$(name)
