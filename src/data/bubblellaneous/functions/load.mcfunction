scoreboard objectives add local.tmp dummy

#region Settings
scoreboard objectives add local.settings dummy

function bubblellaneous:utils/settings/set_default {name: "global.increased_view_range", value: 1}
#endregion

say LOADED
