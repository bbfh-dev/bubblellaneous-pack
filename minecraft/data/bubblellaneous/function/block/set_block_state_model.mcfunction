$data modify storage bubblellaneous tmp.block_states set value $(block_states)
$data modify storage bubblellaneous tmp.in.block_state set from storage bubblellaneous tmp.in.block_states[$(index)]
function bubblellaneous:block/_set_model with storage bubblellaneous tmp.in