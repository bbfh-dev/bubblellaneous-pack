execute if score #send_command_feedback bbln.var = #send_command_feedback bbln.var run return 0
execute store result score #send_command_feedback bbln.var run gamerule send_command_feedback
gamerule send_command_feedback false

schedule function bubblellaneous:utils/restore_feedback 1t replace
