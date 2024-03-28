function bubblellaneous:utils/silent_feedback
tellraw @s ["\n", "┌─── [ Bubblellaneous: ", {"text":"⚁ ", "color":"yellow", "extra":[{"translate":"ui.bubblellaneous.menu.settings"}]}, " ]"]
tellraw @s ["│"]

execute if score global.increased_view_range local.settings matches 0 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.increased_view_range", "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.increased_view_range.0"}, "\n", {"translate":"ui.bubblellaneous.description.increased_view_range.1"}]}}, ": ", {"text":"[", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"global.increased_view_range local.settings 0\"}"}}, " ", {"text":"", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"global.increased_view_range local.settings 1\"}"}}]
execute if score global.increased_view_range local.settings matches 1 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.increased_view_range", "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.increased_view_range.0"}, "\n", {"translate":"ui.bubblellaneous.description.increased_view_range.1"}]}}, ": ", {"text":"", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"global.increased_view_range local.settings 0\"}"}}, " ", {"text":"[", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"global.increased_view_range local.settings 1\"}"}}]

execute if score bench.allow_crafting local.settings matches 0 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.allow_crafting", "with":[{"translate":"block.bubblellaneous.bubble_bench"}], "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.allow_crafting", "with":[{"translate":"item.minecraft.glass_bottle"}, {"translate":"block.minecraft.crafting_table"}, {"translate":"block.bubblellaneous.bubble_bench"}]}]}}, ": ", {"text":"[", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"bench.allow_crafting local.settings 0\"}"}}, " ", {"text":"", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"bench.allow_crafting local.settings 1\"}"}}]
execute if score bench.allow_crafting local.settings matches 1 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.allow_crafting", "with":[{"translate":"block.bubblellaneous.bubble_bench"}], "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.allow_crafting", "with":[{"translate":"item.minecraft.glass_bottle"}, {"translate":"block.minecraft.crafting_table"}, {"translate":"block.bubblellaneous.bubble_bench"}]}]}}, ": ", {"text":"", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"bench.allow_crafting local.settings 0\"}"}}, " ", {"text":"[", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"bench.allow_crafting local.settings 1\"}"}}]

execute if score camera.fixed local.settings matches 0 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.fixed_camera", "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.fixed_camera"}]}}, ": ", {"text":"[", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.fixed local.settings 0\"}"}}, " ", {"text":"", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.fixed local.settings 1\"}"}}]
execute if score camera.fixed local.settings matches 1 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.fixed_camera", "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.fixed_camera"}]}}, ": ", {"text":"", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.fixed local.settings 0\"}"}}, " ", {"text":"[", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.fixed local.settings 1\"}"}}]

execute if score camera.disabled local.settings matches 0 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.disabled_camera", "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.disabled_camera.0"}, "\n", {"translate":"ui.bubblellaneous.description.disabled_camera.1"}]}}, ": ", {"text":"[", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.disabled local.settings 0\"}"}}, " ", {"text":"", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.disabled local.settings 1\"}"}}]
execute if score camera.disabled local.settings matches 1 run tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.disabled_camera", "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.disabled_camera.0"}, "\n", {"translate":"ui.bubblellaneous.description.disabled_camera.1"}]}}, ": ", {"text":"", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.disabled local.settings 0\"}"}}, " ", {"text":"[", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"camera.disabled local.settings 1\"}"}}]

execute if score experimental local.settings matches 0 run tellraw @s ["│ ", {"translate":"selectWorld.experimental"}, ": ", {"text":"[", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"experimental local.settings 0\"}"}}, " ", {"text":"", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"experimental local.settings 1\"}"}}]
execute if score experimental local.settings matches 1 run tellraw @s ["│ ", {"translate":"selectWorld.experimental"}, ": ", {"text":"", "color":"red", "extra":[{"translate":"ui.bubblellaneous.menu.false"}, ""], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"experimental local.settings 0\"}"}}, " ", {"text":"[", "color":"green", "extra":[{"translate":"ui.bubblellaneous.menu.true"}, "]"], "clickEvent":{"action":"run_command", "value":"/function bubblellaneous:settings/update {setting: \"experimental local.settings 1\"}"}}]

tellraw @s ["│ ", {"translate":"ui.bubblellaneous.setting.bear_trap", "with":[{"translate":"block.bubblellaneous.bear_trap"}], "hoverEvent":{"action":"show_text", "contents":[{"translate":"ui.bubblellaneous.description.bear_trap", "with":[{"translate":"block.bubblellaneous.bear_trap"}]}]}}, ": (", {"score":{"name":"bear_trap.time", "objective":"local.settings"}}, ") ", {"text":"[", "color":"yellow", "extra":[{"translate":"ui.bubblellaneous.menu.set"}, "]"], "clickEvent":{"action":"suggest_command", "value":"/scoreboard players set bear_trap.time local.settings "}}]

tellraw @s ["└──────"]
function bubblellaneous:settings/update
