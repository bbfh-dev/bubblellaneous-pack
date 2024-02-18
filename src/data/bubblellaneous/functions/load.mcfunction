scoreboard objectives add local.tmp dummy
scoreboard objectives add local.var dummy
scoreboard objectives add local.int dummy

scoreboard objectives add local.on_drop custom:drop
scoreboard objectives add local.on_leave_game custom:leave_game

scoreboard objectives add local.settings dummy
function bubblellaneous:utils/set_default {name: "bubble_bench.allow_obtaining", value: 1, objective: "local.settings"}
function bubblellaneous:utils/set_default {name: "bubble_bench.blacklist_mode", value: 0, objective: "local.settings"}
function bubblellaneous:utils/set_default {name: "global.validate_resourcepack", value: 1, objective: "local.settings"}
function bubblellaneous:settings/load

scoreboard objectives add local.block.state dummy
scoreboard objectives add local.block.gui_page dummy
scoreboard objectives add local.block.predicate dummy
scoreboard objectives add local.block.id dummy

say LOADED
