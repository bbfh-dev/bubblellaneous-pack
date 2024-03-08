tag @e[type=item_display,tag=local.block,distance=..32] add --local.loaded

#region GUI
execute if entity @e[type=item_display,tag=local.name.bubble_bench,distance=..5] run function bubblellaneous:block/id/bubble_bench/as_player/tick
#endregion
