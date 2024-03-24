execute if score feedback local.var matches -2147483648..2147483647 run return 0
execute store result score feedback local.var run gamerule sendCommandFeedback
gamerule sendCommandFeedback false

schedule function bubblellaneous:utils/restore_feedback 1t replace
