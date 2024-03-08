scoreboard objectives add local.int dummy
scoreboard objectives add local.tmp dummy
scoreboard objectives add local.var dummy

scoreboard objectives add local.block.id dummy
scoreboard objectives add local.block_state dummy

scoreboard objectives add local.gui.page dummy

#region Settings
scoreboard objectives add local.settings dummy

function bubblellaneous:utils/settings/set_default {name: "global.increased_view_range", value: 1}
#endregion

say LOADED
