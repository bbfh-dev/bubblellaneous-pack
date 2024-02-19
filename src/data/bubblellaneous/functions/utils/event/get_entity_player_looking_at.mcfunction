tag @e remove --local.target_entity

scoreboard players set limit local.tmp 50
execute anchored eyes positioned ^ ^ ^.1 run function bubblellaneous:utils/event/get_entity_player_looking_at/loop
