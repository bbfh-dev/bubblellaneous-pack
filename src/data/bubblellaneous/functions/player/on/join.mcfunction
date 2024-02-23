execute if score global.validate_resourcepack local.settings matches 1 run tellraw @s ["", {"translate": "root.bubblellaneous.validate_pack_v1", "fallback":"§c[Bubblellaneous ❌] Resource pack is not installed / wrong version is found§r", "color":"green", "with":["[Bubblellaneous ✔]"]}, "\n› ", {"translate":"root.bubblellaneous.translation_author", "fallback":"", "color":"gray"}]

execute unless score @s local.player.id matches -2147483648..2147483647 store result score @s local.player.id run scoreboard players add i local.player.id 1
execute store result storage bubblellaneous tmp.input.id int 1 run scoreboard players get @s local.player.id
execute store result score has_entry local.tmp run function bubblellaneous:player/database/check_if_exists with storage bubblellaneous tmp.input
execute if score has_entry local.tmp matches 0 run function bubblellaneous:player/database/new_entry with storage bubblellaneous tmp.input
