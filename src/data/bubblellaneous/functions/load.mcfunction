scoreboard objectives add local.tmp dummy
scoreboard objectives add local.int dummy

scoreboard objectives add local.settings dummy
function bubblellaneous:utils/set_default {name: "bubble_bench.allow_obtaining", value: 1, objective: "local.settings"}
function bubblellaneous:settings/load

scoreboard objectives add local.block.state dummy
scoreboard objectives add local.block.id dummy
