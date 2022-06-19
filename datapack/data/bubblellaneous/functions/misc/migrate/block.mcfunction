# scoreboard players add $Temp bubblellaneous 1
# setblock ~ ~ ~ air

# execute if entity @s[tag=bw.bubble_bench] run summon item_frame ~ ~ ~ {Tags:["bubblellaneous", "buln.placer", "-buln.sound.industrial", "-buln.predicate.single", "-buln.base.container", "-buln.towards.player", "-buln.update", "-buln.update.bubble_bench"], Invisible:1b, Silent:1b, Fixed:1b, Item:{id:"minecraft:stone_button", Count:1b, tag:{CustomModelData:85001}}}
# execute if entity @s[tag=bw.table, tag=bw.oak] run 
# execute if entity @s[tag=bw.table, tag=bw.birch] run 
# execute if entity @s[tag=bw.table, tag=bw.spruce] run 
# execute if entity @s[tag=bw.table, tag=bw.jungle] run 
# execute if entity @s[tag=bw.table, tag=bw.acacia] run 
# execute if entity @s[tag=bw.table, tag=bw.dark_oak] run 
# execute if entity @s[tag=bw.table, tag=bw.crimson] run 
# execute if entity @s[tag=bw.table, tag=bw.warped] run 
# execute if entity @s[tag=bw.chair, tag=bw.oak] run 
# execute if entity @s[tag=bw.chair, tag=bw.birch] run 
# execute if entity @s[tag=bw.chair, tag=bw.spruce] run 
# execute if entity @s[tag=bw.chair, tag=bw.jungle] run 
# execute if entity @s[tag=bw.chair, tag=bw.acacia] run 
# execute if entity @s[tag=bw.chair, tag=bw.dark_oak] run 
# execute if entity @s[tag=bw.chair, tag=bw.crimson] run 
# execute if entity @s[tag=bw.chair, tag=bw.warped] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.oak] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.birch] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.spruce] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.jungle] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.acacia] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.dark_oak] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.crimson] run 
# execute if entity @s[tag=bw.nightstand, tag=bw.warped] run 
# execute if entity @s[tag=bw.box] run 
# execute if entity @s[tag=bw.bench, tag=bw.oak] run 
# execute if entity @s[tag=bw.bench, tag=bw.birch] run 
# execute if entity @s[tag=bw.bench, tag=bw.spruce] run 
# execute if entity @s[tag=bw.bench, tag=bw.jungle] run 
# execute if entity @s[tag=bw.bench, tag=bw.acacia] run 
# execute if entity @s[tag=bw.bench, tag=bw.dark_oak] run 
# execute if entity @s[tag=bw.bench, tag=bw.crimson] run 
# execute if entity @s[tag=bw.bench, tag=bw.warped] run 
# execute if entity @s[tag=bw.washer] run 
# execute if entity @s[tag=bw.fridge] run 
# execute if entity @s[tag=bw.toilet] run 
# execute if entity @s[tag=bw.combination_lock] run 
# execute if entity @s[tag=bw.safe] run tellraw @a ["",{"text":"[Error] The \""},{"text":"Safe","bold":true},{"text":"\" Block can't be replaced. No alternative"}]
# execute if entity @s[tag=bw.security_camera] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.white] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.orange] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.magenta] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.light_blue] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.yellow] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.lime] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.pink] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.gray] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.light_gray] run 
# execute if entity @s[tag=bw.office_chair, tag=bw.cyan] run 
# execute if entity @s[tag=bw.computer] run 
# execute if entity @s[tag=bw.bear_trap] run 
# execute if entity @s[tag=bw.armored_door] run tellraw @a ["",{"text":"[Error] The \""},{"text":"Armored Door","bold":true},{"text":"\" Block can't be replaced. No alternative"}]
# execute if entity @s[tag=bw.office_chair, tag=purple] run 
# execute if entity @s[tag=bw.office_chair, tag=blue] run 
# execute if entity @s[tag=bw.office_chair, tag=brown] run 
# execute if entity @s[tag=bw.office_chair, tag=green] run 
# execute if entity @s[tag=bw.office_chair, tag=red] run 
# execute if entity @s[tag=bw.office_chair, tag=black] run 
# kill @s