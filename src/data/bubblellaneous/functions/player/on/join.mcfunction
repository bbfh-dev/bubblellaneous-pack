execute if score global.validate_resourcepack local.settings matches 1 run tellraw @s ["", {"translate": "root.bubblellaneous.validate_pack_v1", "fallback":"§c[Bubblellaneous ❌] Resource pack is not installed / wrong version is found§r", "color":"green", "with":["[Bubblellaneous ✔]"]}]