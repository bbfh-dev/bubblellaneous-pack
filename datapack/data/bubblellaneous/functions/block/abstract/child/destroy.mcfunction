execute if data entity @s HandItems[{}].id run function bubblellaneous:block/abstract/child/drop_item
tp @s ~ -128 ~
execute as @a[distance=..2] at @s run tp @s ~ ~ ~ ~ ~
kill @s