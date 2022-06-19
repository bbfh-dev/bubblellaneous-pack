scoreboard players set $Crafted bubblellaneous 0

execute store result score $CustomModelData bubblellaneous run data get entity @p Inventory[{tag:{Bubblellaneous:{pack:1b}}}].tag.CustomModelData
execute if score $CustomModelData bubblellaneous matches 85002..85056 run function bubblellaneous:block/bubble_bench/interaction/craft/stack0
execute if score $CustomModelData bubblellaneous matches 85057..85099 run function bubblellaneous:block/bubble_bench/interaction/craft/stack1
execute if score $CustomModelData bubblellaneous matches 85100..85147 run function bubblellaneous:block/bubble_bench/interaction/craft/stack2
execute if score $CustomModelData bubblellaneous matches 85148..85193 run function bubblellaneous:block/bubble_bench/interaction/craft/stack3
execute if score $CustomModelData bubblellaneous matches 85194..85242 run function bubblellaneous:block/bubble_bench/interaction/craft/stack4

execute if score $Crafted bubblellaneous matches 1 run function bubblellaneous:block/bubble_bench/interaction/give