data modify storage bubblellaneous tmp.entry set value {}
$data modify storage bubblellaneous tmp.entry set from storage bubblellaneous stack.saved_players[{uuid: $(UUID)}]
$data remove storage bubblellaneous stack.saved_players[{uuid: $(UUID)}]
