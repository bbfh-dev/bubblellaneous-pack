function bubblellaneous:player/event/generic/begin
$execute anchored eyes positioned ^ ^ ^2 run tag @e[type=$(type),tag=local.$(tag),distance=..4] add --local.query_entity
function bubblellaneous:utils/event/get_entity_player_looking_at
