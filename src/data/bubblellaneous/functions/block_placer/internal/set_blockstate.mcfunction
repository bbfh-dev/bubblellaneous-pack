data modify storage bubblellaneous tmp.in.predicate set value {}
$data modify storage bubblellaneous tmp.in.predicate set from storage bubblellaneous tmp.states.$(bit0)$(bit1)$(bit2)$(bit3)$(bit4)$(bit5)
data modify storage bubblellaneous tmp.in.predicate.block set from storage bubblellaneous tmp.block

execute unless data storage bubblellaneous tmp.in.predicate.name run return run function bubblellaneous:block_placer/internal/default_blockstate with storage bubblellaneous tmp.in.predicate

function bubblellaneous:block_placer/internal/apply_blockstate with storage bubblellaneous tmp.in.predicate
