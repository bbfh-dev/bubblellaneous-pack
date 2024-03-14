execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.bubble_bench,limit=1,sort=nearest] at @s run data modify storage bubblellaneous tmp.items set from block ~ ~ ~ Items

#!/repeat n=0..26 | execute unless data storage bubblellaneous tmp.items[{Slot: <n>b}] run return <n>
