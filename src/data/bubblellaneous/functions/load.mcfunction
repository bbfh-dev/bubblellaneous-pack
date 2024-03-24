scoreboard objectives add local.int dummy
scoreboard objectives add local.tmp dummy
scoreboard objectives add local.var dummy

scoreboard objectives add local.block.id dummy
scoreboard objectives add local.block.model dummy
scoreboard objectives add local.block.timer dummy
scoreboard objectives add local.block_state dummy

scoreboard objectives add local.gui.previous_page dummy
scoreboard objectives add local.gui.page dummy

scoreboard objectives add local.player.id dummy
scoreboard objectives add local.player.sound dummy
scoreboard objectives add local.player.leave custom:leave_game
scoreboard objectives add local.player.sneak custom:sneak_time
scoreboard objectives add local.player.right_click used:carrot_on_a_stick
scoreboard objectives add local.player.drop custom:drop
scoreboard objectives add local.player.pos_y dummy

#region Settings
scoreboard objectives add local.settings dummy

function bubblellaneous:utils/settings/set_default {name: "global.increased_view_range", value: 1}
function bubblellaneous:utils/settings/set_default {name: "bench.allow_crafting", value: 1}
function bubblellaneous:utils/settings/set_default {name: "camera.fixed", value: 0}
function bubblellaneous:utils/settings/set_default {name: "camera.disabled", value: 0}
function bubblellaneous:utils/settings/set_default {name: "bear_trap.time", value: 200}
function bubblellaneous:settings/load
#endregion

forceload add 0 0
say LOADED
