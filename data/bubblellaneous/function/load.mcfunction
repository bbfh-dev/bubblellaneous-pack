scoreboard objectives add bbln.int dummy
scoreboard objectives add bbln.tmp dummy
scoreboard objectives add bbln.var dummy

scoreboard objectives add bbln.block.id dummy
scoreboard objectives add bbln.block.model dummy
scoreboard objectives add bbln.block.timer dummy
scoreboard objectives add bbln.block_state dummy
scoreboard objectives add bbln.block.light_level dummy

scoreboard objectives add bbln.gui.previous_page dummy
scoreboard objectives add bbln.gui.page dummy

scoreboard objectives add bbln.player.id dummy
scoreboard objectives add bbln.player.sound dummy
scoreboard objectives add bbln.player.leave custom:leave_game
scoreboard objectives add bbln.player.sneak custom:sneak_time
scoreboard objectives add bbln.player.right_click used:carrot_on_a_stick
scoreboard objectives add bbln.player.drop custom:drop
scoreboard objectives add bbln.player.death_count deathCount
scoreboard objectives add bbln.player.gamemode dummy

#region Settings
scoreboard objectives add bbln.settings dummy

function bubblellaneous:utils/settings/set_default {name: "global.increased_view_range", value: 1}
function bubblellaneous:utils/settings/set_default {name: "bench.allow_crafting", value: 1}
function bubblellaneous:utils/settings/set_default {name: "camera.fixed", value: 0}
function bubblellaneous:utils/settings/set_default {name: "camera.disabled", value: 0}
function bubblellaneous:utils/settings/set_default {name: "bear_trap.cooldown", value: 50}
function bubblellaneous:utils/settings/set_default {name: "bear_trap.time", value: 200}
function bubblellaneous:utils/settings/set_default {name: "experimental", value: 0}
function bubblellaneous:settings/load
#endregion

forceload add 0 0
data modify storage minecraft:bubblellaneous registry set value {furniture: {}, miscellaneous: {}, technology: {}, food: {}}
title @a actionbar "Bubblellaneous Loaded"

scoreboard players set #100 bbln.int 100
scoreboard players set #18 bbln.int 18
scoreboard players set #10 bbln.int 10
scoreboard players set #8 bbln.int 8
scoreboard players set #7 bbln.int 7
scoreboard players set #5 bbln.int 5
scoreboard players set #2 bbln.int 2
scoreboard players set #1 bbln.int 1
scoreboard players set #-1 bbln.int -1
