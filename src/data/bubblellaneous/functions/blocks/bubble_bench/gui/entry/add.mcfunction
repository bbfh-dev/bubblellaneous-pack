$data modify storage bubblellaneous tmp.item set from storage bubblellaneous bench_registry[$(item_id)]
$data modify storage bubblellaneous tmp.item.slot set value $(block_slot)
function bubblellaneous:blocks/bubble_bench/gui/entry/insert with storage bubblellaneous tmp.item
